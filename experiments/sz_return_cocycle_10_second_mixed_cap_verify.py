#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-10.

Second mixed-cap chamber:
    e = (lambda_ret + eta_star) + delta,
    0 < delta < eta_star.

Certifies:
  * exact 29-band pattern:
      1012/692/1012/692/1012/310
    repeated across four full kappa cells, ending
      1012/692/1012/692/1012;
  * all fifteen 1012 bands are one exact graph species;
  * all ten 692 bands are one exact graph species;
  * all four 310 bands are one exact graph species;
  * the 1012 species has 506 variables per orientation;
  * its constant set is the old 346-site mixed set plus an
    eta_star-shifted copy of the 160-site backward wing;
  * external parity is diagonal-gauge equivalent;
  * exact rational preconditioner certificates prove all three species
    physically invertible.

Floating point is used only to select representatives and generate rounded
inverse witnesses. All topology and invertibility inequalities used by the
certificate are checked with exact integer/rational arithmetic.
"""
from collections import Counter, deque
from fractions import Fraction as F
from math import isqrt, log
import numpy as np

Q5=(1,0,0,0,0); J5=(0,1,0,0,0); K5=(0,0,1,0,0)
E5=(0,0,0,1,0); Z5=(0,0,0,0,1)

def add5(a,b): return tuple(x+y for x,y in zip(a,b))
def sub5(a,b): return tuple(x-y for x,y in zip(a,b))
def mul5(n,a): return tuple(n*x for x in a)

R5=add5(Q5,J5); S5=sub5(Q5,K5)
U5=add5(K5,E5); W5=add5(mul5(2,Q5),E5)

Q3=(1,0,0); J3=(0,1,0); K3=(0,0,1)

def add3(a,b): return tuple(x+y for x,y in zip(a,b))
def sub3(a,b): return tuple(x-y for x,y in zip(a,b))
def mul3(n,a): return tuple(n*x for x in a)

H3=add3(add3(mul3(2,J3),K3),mul3(-1,Q3))
P3=add3(add3(Q3,mul3(-1,J3)),mul3(-1,K3))
KAP3=add3(add3(mul3(5,Q3),mul3(-10,J3)),mul3(-4,K3))
LAM3=sub3(H3,KAP3)
ETA3=sub3(LAM3,mul3(4,KAP3))
BASE3=add3(LAM3,ETA3)
R3=add3(Q3,J3); S3=sub3(Q3,K3); QS3=add3(Q3,S3)

def logcomb_sign(c):
    aq,aj,ak=c
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
assert logcomb_sign(sub3(KAP3,mul3(3,ETA3)))>0

# Old 31-site h-chain skeleton.
skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
skeleton=tuple(dict.fromkeys(skeleton))
SSET=set(skeleton)
assert len(SSET)==31

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

# First mixed constant set M=P union W.
PSET=set()
for n in range(0,6):
    PSET |= {add3(c,mul3(n,KAP3)) for c in SSET}

WING=set()
for n in range(-5,0):
    WING |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    WING |= {add3(c,mul3(n,KAP3)) for c in caps}

MSET=PSET|WING
assert len(PSET)==186
assert len(WING)==160
assert len(MSET)==346
assert not (PSET & WING)

NSET=MSET | {add3(c,ETA3) for c in WING}
assert len(NSET)==506

# ---------------------------------------------------------------------------
# Representative discovery
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
basef=lamf+etaf
assert 0<etaf<kapf
assert 3*etaf<kapf

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z); u=kf+e; v=qf-jf+e; w=2*qf+e
    tol=1e-11
    if 0<x<u-tol: return "A"
    if u+tol<x<v-tol: return "B"
    if v+tol<x<qf-tol: return "D"
    if qf+tol<x<w-tol: return "T"
    raise AssertionError(("threshold",t,x,u,v,qf,w))

def source_targets(t,rg):
    if rg=="A": return (add5(t,R5),add5(t,S5),sub5(U5,t))
    if rg=="B": return (add5(t,R5),)
    if rg=="T": return (sub5(t,Q5),sub5(W5,t))
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
E=basef+DELTA

# ---------------------------------------------------------------------------
# Exact topology certification
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ca,za=a; pb,cb,zb=b
    return (sub3(pa,pb),ca-cb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE3),1,0)
VLIN=(add3(sub3(Q3,J3),BASE3),1,0)
WLIN=(add3(mul3(2,Q3),BASE3),1,0)

def margins(L,rg):
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

N_VERTS=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),(ETA3,ETA3)]
M_VERTS=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),((0,0,0),ETA3)]
G_VERTS=[
    ((0,0,0),(0,0,0)),
    (ETA3,(0,0,0)),
    (ETA3,sub3(KAP3,mul3(3,ETA3))),
    ((0,0,0),sub3(KAP3,mul3(2,ETA3))),
]

def vertex_sign(L,dv,xv):
    pure,cd,cx=L
    return logcomb_sign(add3(add3(pure,mul3(cd,dv)),mul3(cx,xv)))

def subst(t,offset3,mode):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE3)),mul3(az,offset3))
    if mode=="N":
        return (pure,ae,az)
    if mode in ("M","G"):
        return (pure,ae+az,az)
    raise AssertionError(mode)

def certify(orb,e,z,offset3,mode):
    verts={"N":N_VERTS,"M":M_VERTS,"G":G_VERTS}[mode]
    for t in orb:
        rg=region_rep(t,e,z)
        L=subst(t,offset3,mode)
        for M in margins(L,rg):
            signs=[vertex_sign(M,dv,xv) for dv,xv in verts]
            assert all(s>=0 for s in signs),(mode,t,rg,signs)
            assert any(s>0 for s in signs),(mode,t,rg,signs)

def graph_key(t,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,BASE3)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

def graph(orb,e,z,offset3):
    out={}
    for t in orb:
        key=graph_key(t,offset3); rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            terms.append((lab,graph_key(u,offset3)))
        out[key]=(rg,tuple(terms))
    return out

sizes=[]
Ngraphs=[]; Mgraphs=[]; Ggraphs=[]
Nrep=Mrep=Grep=None

for mm in range(5):
    for rr in range(3):
        off=add3(mul3(mm,KAP3),mul3(rr,ETA3))

        z=mm*kapf+rr*etaf+DELTA/2
        O=orbit(E,z)
        assert len(O)==1012
        certify(O,E,z,off,"N")
        Ngraphs.append(graph(O,E,z,off))
        sizes.append(1012)
        if Nrep is None: Nrep=(O,z)

        if rr<2:
            z=mm*kapf+rr*etaf+(DELTA+etaf)/2
            O=orbit(E,z)
            assert len(O)==692
            certify(O,E,z,off,"M")
            Mgraphs.append(graph(O,E,z,off))
            sizes.append(692)
            if Mrep is None: Mrep=(O,z)

    if mm<4:
        off=add3(mul3(mm,KAP3),mul3(2,ETA3))
        z=mm*kapf+2*etaf+(DELTA+kapf-2*etaf)/2
        O=orbit(E,z)
        assert len(O)==310
        certify(O,E,z,off,"G")
        Ggraphs.append(graph(O,E,z,off))
        sizes.append(310)
        if Grep is None: Grep=(O,z)

expected=( [1012,692,1012,692,1012,310]*4
          +[1012,692,1012,692,1012] )
assert sizes==expected
assert len(Ngraphs)==15 and all(g==Ngraphs[0] for g in Ngraphs)
assert len(Mgraphs)==10 and all(g==Mgraphs[0] for g in Mgraphs)
assert len(Ggraphs)==4 and all(g==Ggraphs[0] for g in Ggraphs)

# ---------------------------------------------------------------------------
# New 1012 architecture
# ---------------------------------------------------------------------------

Norb,Nz=Nrep
constsets={+1:set(),-1:set()}
for t in Norb:
    c,ori=graph_key(t,(0,0,0))
    constsets[ori].add(c)

assert constsets[+1]==constsets[-1]==NSET
assert len(NSET)==506

rc=Counter((graph_key(t,(0,0,0))[1],region_rep(t,E,Nz)) for t in Norb)
assert rc==Counter({
    (+1,"A"):98,(+1,"B"):98,(+1,"D"):99,(+1,"T"):211,
    (-1,"A"):98,(-1,"B"):98,(-1,"D"):99,(-1,"T"):211,
})

# ---------------------------------------------------------------------------
# Exact physical coefficient bounds
# ---------------------------------------------------------------------------

b0=F(1294116462737,10**12)
d0=F(1038397811807,10**12)
m0=F(915078526447,10**12)
DA=10**12

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

# ---------------------------------------------------------------------------
# Matrix / parity / exact rational preconditioner helper
# ---------------------------------------------------------------------------

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

def certify_matrix(orb,e,z,DR,residual_bound,total_bound):
    Rows,Order=integer_rows(orb,e,z,+1)
    RowsM,OrderM=integer_rows(orb,e,z,-1)
    assert Order==OrderM

    sgn=[+1 if t[4]==1 else -1 for t in Order]
    for i in range(len(Order)):
        keys=set(Rows[i])|set(RowsM[i])
        for j in keys:
            assert RowsM[i].get(j,0)==sgn[i]*Rows[i].get(j,0)*sgn[j]

    N=len(Order)
    A=np.zeros((N,N),dtype=float)
    for i,row in enumerate(Rows):
        for j,v in row.items(): A[i,j]=v/DA

    # Floating inverse only generates a rational witness.
    Rfloat=np.linalg.inv(A)
    Rint=np.rint(Rfloat*DR).astype(np.int64)

    norm_num=max(sum(abs(int(x)) for x in Rint[i]) for i in range(N))
    assert norm_num<65*DR

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
            rs+=abs(num)
        rho_num=max(rho_num,rs)

    rho=F(rho_num,DEN)
    assert rho<residual_bound

    total=rho+F(norm_num,DR)*Einf
    assert total<total_bound
    assert total<1
    return (F(norm_num,DR),rho,total)

Nstats=certify_matrix(Nrep[0],E,Nrep[1],10**7,F(1,26000),F(1,25000))
Mstats=certify_matrix(Mrep[0],E,Mrep[1],10**7,F(1,30000),F(1,29000))
Gstats=certify_matrix(Grep[0],E,Grep[1],10**7,F(1,69000),F(1,68000))

print("PASS: second mixed-cap chamber topology certified exactly")
print("PASS: exact 29-band pattern =", expected)
print("PASS: all 15 new bands are one 1012 graph species")
print("PASS: all 10 intermediate bands are one 692 graph species")
print("PASS: all 4 long bands are one 310 graph species")
print("PASS: new 1012 graph = 506+506 orientation variables")
print("PASS: 506 = old 346 mixed set + eta_star-shifted 160-site backward wing")
print("PASS: new per-orientation census = A98/B98/D99/T211")
print("PASS: external parity gauge verified for all three species")
print("PASS: 1012 rational preconditioner norm < 65, residual < 1/26000")
print("PASS: 692 rational preconditioner norm < 65, residual < 1/30000")
print("PASS: 310 rational preconditioner norm < 65, residual < 1/69000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: all three physical species invertible")
