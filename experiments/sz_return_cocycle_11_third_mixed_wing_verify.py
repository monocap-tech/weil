#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-11.

Third mixed-wing chamber:
    e = lambda_ret + 2*eta_star + delta,
    0 < delta < eta_star.

Certifies:
  * exact 39-band pattern:
      1332/1012/1332/1012/1332/1012/1332/310
    repeated across four full kappa cells, ending
      1332/1012/1332/1012/1332/1012/1332;
  * all twenty 1332 bands are one exact graph species;
  * all fifteen 1012 bands are exact relabelings of the previously certified
    1012 species;
  * all four long 310 bands are exact relabelings of the certified 310 species;
  * the new 1332 species has 666 variables per orientation;
  * its constant set is the first mixed 346-site set plus two
    eta_star-shifted copies of the same 160-site backward wing;
  * external parity is diagonal-gauge equivalent;
  * an exact rational preconditioner certificate proves the physical
    1332 species invertible.

Floating point is used only to choose representatives and generate a rounded
inverse witness. All topology and invertibility inequalities used by the
certificate are exact thereafter.
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
BASE1=add3(LAM3,ETA3)
BASE2=add3(LAM3,mul3(2,ETA3))
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
assert logcomb_sign(sub3(KAP3,mul3(4,ETA3)))>0

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

# First mixed body / wing decomposition.
PSET=set()
for n in range(0,6):
    PSET |= {add3(c,mul3(n,KAP3)) for c in SSET}

WING=set()
for n in range(-5,0):
    WING |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    WING |= {add3(c,mul3(n,KAP3)) for c in caps}

MSET=PSET|WING
N1SET=MSET|{add3(c,ETA3) for c in WING}
N2SET=N1SET|{add3(c,mul3(2,ETA3)) for c in WING}

assert len(PSET)==186
assert len(WING)==160
assert len(MSET)==346
assert len(N1SET)==506
assert len(N2SET)==666

# ---------------------------------------------------------------------------
# Numerical representatives for orbit discovery only
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
base1f=lamf+etaf
base2f=lamf+2*etaf
assert 4*etaf<kapf

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
E=base2f+DELTA

# ---------------------------------------------------------------------------
# Exact topology certification
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ca,za=a; pb,cb,zb=b
    return (sub3(pa,pb),ca-cb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE2),1,0)
VLIN=(add3(sub3(Q3,J3),BASE2),1,0)
WLIN=(add3(mul3(2,Q3),BASE2),1,0)

def margins(L,rg):
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

NEW_VERTS=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),(ETA3,ETA3)]
OLD_VERTS=[((0,0,0),(0,0,0)),(ETA3,(0,0,0)),((0,0,0),ETA3)]
G_VERTS=[
    ((0,0,0),(0,0,0)),
    (ETA3,(0,0,0)),
    (ETA3,sub3(KAP3,mul3(4,ETA3))),
    ((0,0,0),sub3(KAP3,mul3(3,ETA3))),
]

def vertex_sign(L,dv,xv):
    pure,cd,cx=L
    return logcomb_sign(add3(add3(pure,mul3(cd,dv)),mul3(cx,xv)))

def subst(t,offset3,mode):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE2)),mul3(az,offset3))
    if mode=="NEW":
        return (pure,ae,az)
    if mode in ("OLD","G"):
        return (pure,ae+az,az)
    raise AssertionError(mode)

def certify(orb,e,z,offset3,mode):
    verts={"NEW":NEW_VERTS,"OLD":OLD_VERTS,"G":G_VERTS}[mode]
    for t in orb:
        rg=region_rep(t,e,z)
        L=subst(t,offset3,mode)
        for M in margins(L,rg):
            signs=[vertex_sign(M,dv,xv) for dv,xv in verts]
            assert all(s>=0 for s in signs),(mode,t,rg,signs)
            assert any(s>0 for s in signs),(mode,t,rg,signs)

def graph_key(t,base3,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,base3)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

def graph(orb,e,z,base3,offset3):
    out={}
    for t in orb:
        key=graph_key(t,base3,offset3); rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            terms.append((lab,graph_key(u,base3,offset3)))
        out[key]=(rg,tuple(terms))
    return out

sizes=[]; newgraphs=[]; oldgraphs=[]; ggraphs=[]
Nrep=None

for mm in range(5):
    for rr in range(4):
        off=add3(mul3(mm,KAP3),mul3(rr,ETA3))

        z=mm*kapf+rr*etaf+DELTA/2
        O=orbit(E,z)
        assert len(O)==1332
        certify(O,E,z,off,"NEW")
        newgraphs.append(graph(O,E,z,BASE2,off))
        sizes.append(1332)
        if Nrep is None: Nrep=(O,z)

        if rr<3:
            z=mm*kapf+rr*etaf+(DELTA+etaf)/2
            O=orbit(E,z)
            assert len(O)==1012
            certify(O,E,z,off,"OLD")
            oldgraphs.append(graph(O,E,z,BASE2,off))
            sizes.append(1012)

    if mm<4:
        off=add3(mul3(mm,KAP3),mul3(3,ETA3))
        z=mm*kapf+3*etaf+(DELTA+kapf-3*etaf)/2
        O=orbit(E,z)
        assert len(O)==310
        certify(O,E,z,off,"G")
        ggraphs.append(graph(O,E,z,BASE2,off))
        sizes.append(310)

expected=([1332,1012,1332,1012,1332,1012,1332,310]*4
          +[1332,1012,1332,1012,1332,1012,1332])
assert sizes==expected
assert len(newgraphs)==20 and all(g==newgraphs[0] for g in newgraphs)
assert len(oldgraphs)==15 and all(g==oldgraphs[0] for g in oldgraphs)
assert len(ggraphs)==4 and all(g==ggraphs[0] for g in ggraphs)

# ---------------------------------------------------------------------------
# Exact relabeling to previously certified 1012 and 310 species
# ---------------------------------------------------------------------------

def shift_graph_const(G,sp,sm):
    shifts={+1:sp,-1:sm}; out={}
    for (c,o),(rg,terms) in G.items():
        key=(add3(c,shifts[o]),o)
        nts=[]
        for lab,(d,oo) in terms:
            nts.append((lab,(add3(d,shifts[oo]),oo)))
        out[key]=(rg,tuple(nts))
    return out

# Previous 1012 species from the second mixed chamber.
E1=base1f+DELTA
O1012=orbit(E1,DELTA/2)
G1012=graph(O1012,E1,DELTA/2,BASE1,(0,0,0))
assert len(G1012)==1012
assert shift_graph_const(G1012,(0,0,0),ETA3)==oldgraphs[0]

# Previous 310 long-gap species.
z310=2*etaf+(DELTA+kapf-2*etaf)/2
O310=orbit(E1,z310)
G310=graph(O310,E1,z310,BASE1,mul3(2,ETA3))
assert len(G310)==310
assert shift_graph_const(G310,ETA3,(0,0,0))==ggraphs[0]

# ---------------------------------------------------------------------------
# New 1332 architecture
# ---------------------------------------------------------------------------

Norb,Nz=Nrep
constsets={+1:set(),-1:set()}
for t in Norb:
    c,o=graph_key(t,BASE2,(0,0,0))
    constsets[o].add(c)

assert constsets[+1]==constsets[-1]==N2SET
assert len(N2SET)==666

rc=Counter((graph_key(t,BASE2,(0,0,0))[1],region_rep(t,E,Nz)) for t in Norb)
assert rc==Counter({
    (+1,"A"):129,(+1,"B"):129,(+1,"D"):130,(+1,"T"):278,
    (-1,"A"):129,(-1,"B"):129,(-1,"D"):130,(-1,"T"):278,
})

# Additive correction to the previous mixed-tier census:
# each eta_star-shifted wing contributes A31/B31/D31/T67 = 160
old_census=(98,98,99,211)
new_census=(129,129,130,278)
assert tuple(b-a for a,b in zip(old_census,new_census))==(31,31,31,67)

# ---------------------------------------------------------------------------
# Matrix and exact rational preconditioner
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

Rows,Order=integer_rows(Norb,E,Nz,+1)
RowsM,OrderM=integer_rows(Norb,E,Nz,-1)
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

Rfloat=np.linalg.inv(A)
DR=10**7
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
assert rho<F(1,26000)

# Exact physical coefficient enclosure.
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

total=rho+F(norm_num,DR)*Einf
assert total<F(1,25000)
assert total<1

print("PASS: third mixed-wing chamber topology certified exactly")
print("PASS: exact 39-band pattern =", expected)
print("PASS: all 20 new bands are one 1332 graph species")
print("PASS: all 15 intermediate bands are exact 1012 relabelings")
print("PASS: all 4 long bands are exact 310 relabelings")
print("PASS: new 1332 graph = 666+666 orientation variables")
print("PASS: 666 = 346 mixed base + eta_star*W + 2*eta_star*W")
print("PASS: each new wing tier contributes A31/B31/D31/T67")
print("PASS: external parity gauge verified")
print("PASS: exact rational preconditioner norm < 65")
print("PASS: exact midpoint residual norm < 1/26000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: total preconditioned physical residual < 1/25000 < 1")
print("PASS: physical 1332 species invertible for both external parities")
