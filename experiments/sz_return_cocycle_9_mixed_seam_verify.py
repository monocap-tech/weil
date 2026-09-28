#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-9.

First mixed-scale chamber:
    e = lambda_ret + delta,
    0 < delta < eta_star,
where
    lambda_ret = h-kappa,
    eta_star = lambda_ret-4*kappa = h-5*kappa.

Main conclusions:
  * lambda_ret + kappa = h, so modulo h the two internal return lengths
    are opposite directions of one kappa rotation, not independent generators;
  * the first mixed chamber has exact seed pattern
      M/G4/M/G3 repeated by kappa, ending in M,
    with sizes
      692/372/692/310/.../692;
  * all ten M bands are one exact 692 graph species;
  * the old 372 and 310 bands are exact layer relabelings of G4 and G3;
  * the 692 graph uses the old 31-site h-chain skeleton plus only five cap sites;
  * the physical 692 matrix is invertible for both external parities by an
    exact rational preconditioner certificate.

Floating point is used only to discover representative orbits and a rounded
inverse witness. All chamber typing and invertibility inequalities used by the
certificate are checked with exact integer/rational arithmetic.
"""

from collections import Counter, deque
from fractions import Fraction as F
from math import isqrt, log
import numpy as np

# ---------------------------------------------------------------------------
# Exact affine coordinates
# ---------------------------------------------------------------------------

Q5=(1,0,0,0,0); J5=(0,1,0,0,0); K5=(0,0,1,0,0)
E5=(0,0,0,1,0); Z5=(0,0,0,0,1)

def add5(a,b): return tuple(x+y for x,y in zip(a,b))
def sub5(a,b): return tuple(x-y for x,y in zip(a,b))
def mul5(n,a): return tuple(n*x for x in a)

R5=add5(Q5,J5)
S5=sub5(Q5,K5)
U5=add5(K5,E5)
W5=add5(mul5(2,Q5),E5)

Q3=(1,0,0); J3=(0,1,0); K3=(0,0,1)

def add3(a,b): return tuple(x+y for x,y in zip(a,b))
def sub3(a,b): return tuple(x-y for x,y in zip(a,b))
def mul3(n,a): return tuple(n*x for x in a)

H3=add3(add3(mul3(2,J3),K3),mul3(-1,Q3))
P3=add3(add3(Q3,mul3(-1,J3)),mul3(-1,K3))
KAP3=add3(add3(mul3(5,Q3),mul3(-10,J3)),mul3(-4,K3))
LAM3=sub3(H3,KAP3)
ETA3=sub3(LAM3,mul3(4,KAP3))
R3=add3(Q3,J3)
S3=sub3(Q3,K3)
QS3=add3(Q3,S3)

assert add3(LAM3,KAP3)==H3

def logcomb_sign(c):
    """Exact sign of aq*q+aj*j+ak*k by prime-power comparison."""
    aq,aj,ak=c
    # q=2log2-log3; j=-3log2+2log3; k=4log2-log3-log5
    e2=2*aq-3*aj+4*ak
    e3=-aq+2*aj-ak
    e5=-ak
    num=den=1
    for prime,expo in ((2,e2),(3,e3),(5,e5)):
        if expo>=0: num*=prime**expo
        else: den*=prime**(-expo)
    return (num>den)-(num<den)

assert logcomb_sign(ETA3)>0
assert logcomb_sign(sub3(KAP3,ETA3))>0
assert logcomb_sign(sub3(KAP3,mul3(2,ETA3)))>0

# Old 31-site skeleton = five finite h-chains.
skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
skeleton=tuple(dict.fromkeys(skeleton))
assert len(skeleton)==31
SSET=set(skeleton)

bottoms={(0,0,0),P3,S3,R3,QS3}
tops={
    mul3(5,H3),
    add3(P3,mul3(6,H3)),
    add3(S3,mul3(5,H3)),
    add3(R3,mul3(5,H3)),
    add3(QS3,mul3(5,H3)),
}
caps={add3(c,H3) for c in tops}
assert len(bottoms)==len(caps)==5

# ---------------------------------------------------------------------------
# Numerical representatives for orbit discovery only
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
assert 0<etaf<kapf

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z)
    u=kf+e; v=qf-jf+e; w=2*qf+e
    tol=1e-11
    if 0<x<u-tol: return "A"
    if u+tol<x<v-tol: return "B"
    if v+tol<x<qf-tol: return "D"
    if qf+tol<x<w-tol: return "T"
    raise AssertionError(("threshold",t,x,u,v,qf,w))

def source_targets(t,rg):
    if rg=="A":
        return (add5(t,R5),add5(t,S5),sub5(U5,t))
    if rg=="B":
        return (add5(t,R5),)
    if rg=="T":
        return (sub5(t,Q5),sub5(W5,t))
    return ()

def orbit(e,z):
    seen={Z5}; todo=deque([Z5])
    while todo:
        t=todo.popleft(); rg=region_rep(t,e,z)
        for s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s); todo.append(s)
    return seen

DELTA=etaf/2
EMIX=lamf+DELTA

# ---------------------------------------------------------------------------
# Exact topology certification for the 19 open seed bands
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ca,za=a; pb,cb,zb=b
    return (sub3(pa,pb),ca-cb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,LAM3),1,0)
VLIN=(add3(sub3(Q3,J3),LAM3),1,0)
WLIN=(add3(mul3(2,Q3),LAM3),1,0)

def margins(L,rg):
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

def vertex_sign(L,delta3,xi3):
    pure,cd,cx=L
    return logcomb_sign(add3(add3(pure,mul3(cd,delta3)),mul3(cx,xi3)))

def certify_orbit(orb,e,z,offset3,mode):
    """Certify one discovered orbit over its entire parameter polygon.

    mode M:
       e=lambda+delta, z=offset+xi, 0<=xi<=delta<=eta*
    mode G4:
       z=offset+delta+xi, delta,xi>=0, delta+xi<=eta*
    mode G3:
       z=offset+eta*+delta+xi,
       0<=delta<=eta*, 0<=xi<=kappa-eta*-delta
    """
    if mode=="M":
        verts=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),(ETA3,ETA3)]
    elif mode=="G4":
        verts=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),((0,0,0),ETA3)]
    elif mode=="G3":
        verts=[
            ((0,0,0),(0,0,0)),
            (ETA3,(0,0,0)),
            (ETA3,sub3(KAP3,mul3(2,ETA3))),
            ((0,0,0),sub3(KAP3,ETA3)),
        ]
    else:
        raise AssertionError(mode)

    for t in orb:
        aq,aj,ak,ae,az=t
        if mode=="M":
            pure=add3(add3((aq,aj,ak),mul3(ae,LAM3)),mul3(az,offset3))
            L=(pure,ae,az)
        elif mode=="G4":
            pure=add3(add3((aq,aj,ak),mul3(ae,LAM3)),mul3(az,offset3))
            L=(pure,ae+az,az)
        else:
            pure=add3(add3(add3((aq,aj,ak),mul3(ae,LAM3)),mul3(az,offset3)),mul3(az,ETA3))
            L=(pure,ae+az,az)

        rg=region_rep(t,e,z)
        for M in margins(L,rg):
            signs=[vertex_sign(M,dv,xv) for dv,xv in verts]
            assert all(s>=0 for s in signs),(mode,t,rg,signs)
            assert any(s>0 for s in signs),(mode,t,rg,signs)

# Canonical graph for a mixed band.
def mixed_key(t,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,LAM3)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

def mixed_graph(orb,e,z,offset3):
    out={}
    for t in orb:
        key=mixed_key(t,offset3); rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            terms.append((lab,mixed_key(u,offset3)))
        out[key]=(rg,tuple(terms))
    return out

band_sizes=[]
mixed_graphs=[]
for m0 in range(5):
    # M band at m*kappa
    a=m0*kapf; b=a+DELTA
    z=(a+b)/2
    O=orbit(EMIX,z)
    assert len(O)==692
    off=mul3(m0,KAP3)
    certify_orbit(O,EMIX,z,off,"M")
    mixed_graphs.append(mixed_graph(O,EMIX,z,off))
    band_sizes.append(692)

    # old G4 band
    a=m0*kapf+DELTA; b=m0*kapf+etaf
    z=(a+b)/2
    O=orbit(EMIX,z)
    assert len(O)==372
    certify_orbit(O,EMIX,z,mul3(m0,KAP3),"G4")
    band_sizes.append(372)

    # M band at m*kappa+eta*
    a=m0*kapf+etaf; b=a+DELTA
    z=(a+b)/2
    O=orbit(EMIX,z)
    assert len(O)==692
    off=add3(mul3(m0,KAP3),ETA3)
    certify_orbit(O,EMIX,z,off,"M")
    mixed_graphs.append(mixed_graph(O,EMIX,z,off))
    band_sizes.append(692)

    if m0<4:
        # old G3 band
        a=m0*kapf+etaf+DELTA; b=(m0+1)*kapf
        z=(a+b)/2
        O=orbit(EMIX,z)
        assert len(O)==310
        certify_orbit(O,EMIX,z,mul3(m0,KAP3),"G3")
        band_sizes.append(310)

assert band_sizes==[
    692,372,692,310,
    692,372,692,310,
    692,372,692,310,
    692,372,692,310,
    692,372,692,
]

Gmix=mixed_graphs[0]
assert all(G==Gmix for G in mixed_graphs)

# ---------------------------------------------------------------------------
# Old-band graph species are exactly G4/G3 up to layer relabeling
# ---------------------------------------------------------------------------

def old_key(t):
    aq,aj,ak,ae,az=t
    if (ae,az)==(0,1): return ((aq,aj,ak),+1)
    if (ae,az)==(1,-1): return ((aq,aj,ak),-1)
    raise AssertionError(t)

decomp={}
for n in range(-12,13):
    for si,c in enumerate(skeleton):
        cc=add3(c,mul3(n,KAP3))
        assert cc not in decomp or decomp[cc]==(si,n)
        decomp[cc]=(si,n)

def layer_graph(orb,e,z):
    out={}
    for t in orb:
        c,ori=old_key(t); si,n=decomp[c]
        key=(si,n,ori); rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            cc,oo=old_key(u); sj,nn=decomp[cc]
            terms.append((lab,(sj,nn,oo)))
        out[key]=(rg,tuple(terms))
    return out

def shift_rows(rows,sp,sm):
    sh={+1:sp,-1:sm}; out={}
    for (si,n,ori),(rg,terms) in rows.items():
        key=(si,n+sh[ori],ori)
        nts=[]
        for lab,(sj,nn,oo) in terms:
            nts.append((lab,(sj,nn+sh[oo],oo)))
        out[key]=(rg,tuple(nts))
    return out

# Reference certified G4 and G3 species.
E4=4*kapf+etaf/2; Z4=etaf/4
E3=3*kapf+etaf/2; Z3=etaf/4
G4=layer_graph(orbit(E4,Z4),E4,Z4)
G3=layer_graph(orbit(E3,Z3),E3,Z3)
assert len(G4)==372 and len(G3)==310

for m0 in range(5):
    z=(m0*kapf+DELTA + m0*kapf+etaf)/2
    assert layer_graph(orbit(EMIX,z),EMIX,z)==shift_rows(G4,-m0,+m0)
    if m0<4:
        z=(m0*kapf+etaf+DELTA + (m0+1)*kapf)/2
        assert layer_graph(orbit(EMIX,z),EMIX,z)==shift_rows(G3,-m0,+m0)

# ---------------------------------------------------------------------------
# Exact 692 mixed architecture: old skeleton plus five caps
# ---------------------------------------------------------------------------

LOW_MIX=orbit(EMIX,DELTA/2)
assert len(LOW_MIX)==692

constsets={+1:set(),-1:set()}
for t in LOW_MIX:
    c,ori=mixed_key(t,(0,0,0))
    constsets[ori].add(c)

assert constsets[+1]==constsets[-1]
assert len(constsets[+1])==346

formula=set()
for n in range(0,6):
    formula |= {add3(c,mul3(n,KAP3)) for c in SSET}
for n in range(-5,0):
    formula |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    formula |= {add3(c,mul3(n,KAP3)) for c in caps}

assert len(formula)==346
assert constsets[+1]==formula

rc=Counter((mixed_key(t,(0,0,0))[1],region_rep(t,EMIX,DELTA/2)) for t in LOW_MIX)
assert rc==Counter({
    (+1,"A"):67,(+1,"B"):67,(+1,"D"):68,(+1,"T"):144,
    (-1,"A"):67,(-1,"B"):67,(-1,"D"):68,(-1,"T"):144,
})

# lambda = h-kappa: away from a chain top, one lambda step is
# one h-chain successor plus one kappa-layer down.
for c in SSET-tops:
    assert add3(c,H3) in SSET
    assert add3(c,LAM3)==add3(add3(c,H3),mul3(-1,KAP3))

# At the five chain tops, the h-successor is exactly one cap site.
assert {add3(t,H3) for t in tops}==caps

# ---------------------------------------------------------------------------
# 692 matrix and exact external-parity gauge
# ---------------------------------------------------------------------------

b0=F(1294116462737,10**12)
d0=F(1038397811807,10**12)
m0=F(915078526447,10**12)
DA=10**12

def integer_rows(orb,e,z,eps):
    order=sorted(orb); idx={t:i for i,t in enumerate(order)}
    rows=[{} for _ in order]
    def put(row,j,v): row[j]=row.get(j,0)+v
    for i,t in enumerate(order):
        rg=region_rep(t,e,z); row=rows[i]
        put(row,i,DA)
        if rg=="A":
            put(row,idx[add5(t,R5)],b0.numerator)
            put(row,idx[add5(t,S5)],d0.numerator)
            put(row,idx[sub5(U5,t)],-eps*d0.numerator)
        elif rg=="B":
            put(row,idx[add5(t,R5)],b0.numerator)
        elif rg=="T":
            put(row,idx[sub5(t,Q5)],m0.numerator)
            put(row,idx[sub5(W5,t)],-eps*m0.numerator)
    return rows,order

Rows,Order=integer_rows(LOW_MIX,EMIX,DELTA/2,+1)
RowsM,OrderM=integer_rows(LOW_MIX,EMIX,DELTA/2,-1)
assert Order==OrderM

sgn=[+1 if t[4]==1 else -1 for t in Order]
for i in range(len(Order)):
    keys=set(Rows[i])|set(RowsM[i])
    for j in keys:
        assert RowsM[i].get(j,0)==sgn[i]*Rows[i].get(j,0)*sgn[j]

# ---------------------------------------------------------------------------
# Exact rational preconditioner certificate
# ---------------------------------------------------------------------------

N=len(Order)
A=np.zeros((N,N),dtype=float)
for i,row in enumerate(Rows):
    for j,v in row.items(): A[i,j]=v/DA

Rfloat=np.linalg.inv(A)
DR=10**7
Rint=np.rint(Rfloat*DR).astype(np.int64)

norm_num=max(sum(abs(int(x)) for x in Rint[i]) for i in range(N))
assert norm_num < 65*DR

cols=[[] for _ in range(N)]
for i,row in enumerate(Rows):
    for j,v in row.items(): cols[j].append((i,v))

DEN=DR*DA
rho_num=0
for i in range(N):
    rs=0
    for j in range(N):
        num=sum(int(Rint[i,k])*v for k,v in cols[j])
        if i==j: num=DEN-num
        else: num=-num
        rs += abs(num)
    rho_num=max(rho_num,rs)

assert F(rho_num,DEN) < F(1,30000)

# Physical coefficient enclosure.
def imul(a,c): return (a[0]*c[0],a[1]*c[1])
def idiv(a,c): return (a[0]/c[1],a[1]/c[0])
def ln_bounds(x,N0):
    y=(x-1)/(x+1); s=F(0)
    for n in range(N0+1): s+=F(2,2*n+1)*y**(2*n+1)
    rem=F(2,2*N0+3)*y**(2*N0+3)/(1-y*y)
    return (s,s+rem)
def sqrt_bounds(x,digits=60):
    scale=10**digits
    n=(x.numerator*scale*scale)//x.denominator
    lo_i=isqrt(n); lo=F(lo_i,scale); hi=F(lo_i+1,scale)
    assert lo*lo<=x<=hi*hi
    return (lo,hi)

ln2=ln_bounds(F(2),100); ln3=ln_bounds(F(3),120); ln5=ln_bounds(F(5),220)
beta_iv=imul(sqrt_bounds(F(2,3)),idiv(ln3,ln2))
d_iv=imul(sqrt_bounds(F(1,5)),idiv(ln5,ln2))
m_iv=imul(sqrt_bounds(F(1,3)),idiv(ln3,ln2))

def maxerr(iv,x0): return max(abs(iv[0]-x0),abs(iv[1]-x0))
eb=maxerr(beta_iv,b0); ed=maxerr(d_iv,d0); em=maxerr(m_iv,m0)
Einf=max(eb+2*ed,eb,2*em)
assert Einf<F(1,10**12)

total=F(rho_num,DEN)+F(norm_num,DR)*Einf
assert total<F(1,29000)
assert total<1

print("PASS: lambda_ret+kappa=h exactly; mixed return is bidirectional kappa modulo h")
print("PASS: 0<eta_star<kappa and first mixed chamber is lambda_ret<e<lambda_ret+eta_star")
print("PASS: exact 19-band pattern certified")
print("PASS: all ten mixed bands are one 692 graph species")
print("PASS: all old bands are exact G4/G3 layer relabelings")
print("PASS: mixed graph = 346+346 orientation variables")
print("PASS: old 31-site skeleton survives with exactly five h-chain cap sites")
print("PASS: external parity is diagonal-gauge equivalent")
print("PASS: exact rational preconditioner norm < 65")
print("PASS: exact midpoint residual norm < 1/30000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: total preconditioned physical residual < 1/29000 < 1")
print("PASS: physical 692 mixed system invertible for both external parities")
