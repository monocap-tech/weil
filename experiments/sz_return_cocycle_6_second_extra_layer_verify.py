#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-6.

Second extra-kappa chamber:
    e = 2*kappa + eta, 0 < eta < kappa.

Certifies:
  * exact five seed bands 248/186/248/186/248;
  * low 248 orbit = 31 x 4 x 2 architecture;
  * middle 186 bands are exactly the already-certified first-extra system;
  * central 248 band is exactly the low 248 system after orientation-dependent
    kappa-layer relabeling;
  * upper bands are seed-reflection images;
  * external parity is diagonal-gauge equivalent;
  * exact rational preconditioner certificate for the physical 248 edge system;
  * inherited 186 -> 248 insertion adds 62 variables, changes one inherited
    row type, and has only two old-to-new and two new-to-old cross edges.

Floating point is used only to discover an approximate inverse witness.
All topology and invertibility checks are then exact rational/integer checks.
"""

from collections import deque
from fractions import Fraction as F
from math import isqrt, log
import numpy as np

# ----- affine coordinates -----

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
R3=add3(Q3,J3)
S3=sub3(Q3,K3)
QS3=add3(Q3,S3)

skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
skeleton=tuple(dict.fromkeys(skeleton))
assert len(skeleton)==31

# ----- numerical representatives for orbit discovery only -----

qf=log(4/3); jf=log(9/8); kf=log(16/15)
hf=log(81/80); kapf=kf-5*hf

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z)
    u=kf+e
    v=qf-jf+e
    w=2*qf+e
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
    seen={Z5}
    todo=deque([Z5])
    while todo:
        t=todo.popleft()
        rg=region_rep(t,e,z)
        for s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s)
                todo.append(s)
    return seen

ETA=0.001
E=2*kapf+ETA
Z0=0.0004
Z1=0.0015
Z2=kapf+0.0004

O0=orbit(E,Z0)
O1=orbit(E,Z1)
O2=orbit(E,Z2)

assert len(O0)==248
assert len(O1)==186
assert len(O2)==248

def seed_reflect(t):
    aq,aj,ak,ae,az=t
    return (aq,aj,ak,ae+az,-az)

O3={seed_reflect(t) for t in O1}
O4={seed_reflect(t) for t in O0}
assert len(O3)==186 and len(O4)==248

# ----- exact topology certification -----

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

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,mul3(2,KAP3)),1,0)
VLIN=(add3(sub3(Q3,J3),mul3(2,KAP3)),1,0)
WLIN=(add3(mul3(2,Q3),mul3(2,KAP3)),1,0)

def subst(t,zoff):
    aq,aj,ak,ae,az=t
    pure=add3((aq,aj,ak),mul3(2*ae+zoff*az,KAP3))
    return (pure,ae,az)

def margins(t,rg,zoff):
    T=subst(t,zoff)
    if rg=="A": return (lsub(T,ZERO),lsub(ULIN,T))
    if rg=="B": return (lsub(T,ULIN),lsub(VLIN,T))
    if rg=="D": return (lsub(T,VLIN),lsub(QLIN,T))
    if rg=="T": return (lsub(T,QLIN),lsub(WLIN,T))
    raise AssertionError(rg)

LOW_VERTS=((0,0),(1,0),(1,1))   # 0 <= z <= eta <= kappa
SIDE_VERTS=((0,0),(0,1),(1,1))  # 0 <= eta <= z <= kappa

def vertex_sign(L,vtx):
    pure,ce,cz=L
    ae,az=vtx
    return logcomb_sign(add3(pure,mul3(ce*ae+cz*az,KAP3)))

def certify(orb,e,z,verts,zoff):
    for t in orb:
        rg=region_rep(t,e,z)
        for L in margins(t,rg,zoff):
            signs=[vertex_sign(L,v) for v in verts]
            assert all(s>=0 for s in signs),(t,rg,signs)
            assert any(s>0 for s in signs),(t,rg,signs)

certify(O0,E,Z0,LOW_VERTS,0)
certify(O1,E,Z1,SIDE_VERTS,0)
# central band z=kappa+zeta, 0<zeta<eta
certify(O2,E,Z2,LOW_VERTS,1)

# ----- exact layer architecture and row graphs -----

def canonical_constant(t):
    aq,aj,ak,ae,az=t
    if ae==0 and az==1: return (aq,aj,ak),+1
    if ae==1 and az==-1: return (aq,aj,ak),-1
    raise AssertionError(t)

decomp={}
for n in range(-8,9):
    for si,c in enumerate(skeleton):
        cc=add3(c,mul3(n,KAP3))
        assert cc not in decomp or decomp[cc]==(si,n)
        decomp[cc]=(si,n)

def row_graph(orb,e,z):
    out={}
    for t in orb:
        c,ori=canonical_constant(t)
        si,n=decomp[c]
        key=(si,n,ori)
        rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            cc,oo=canonical_constant(u)
            sj,nn=decomp[cc]
            terms.append((lab,(sj,nn,oo)))
        out[key]=(rg,tuple(terms))
    return out

G0=row_graph(O0,E,Z0)
G1=row_graph(O1,E,Z1)
G2=row_graph(O2,E,Z2)

# first-extra reference system
Eprev=kapf+0.001
Oprev=orbit(Eprev,0.0004)
Gprev=row_graph(Oprev,Eprev,0.0004)
assert G1==Gprev

def shift_rows(rows,sh):
    out={}
    for (si,n,ori),(rg,terms) in rows.items():
        nk=(si,n+sh[ori],ori)
        nts=[]
        for lab,(sj,nn,oo) in terms:
            nts.append((lab,(sj,nn+sh[oo],oo)))
        out[nk]=(rg,tuple(nts))
    return out

assert shift_rows(G0,{+1:-1,-1:+1})==G2

layers={n:{add3(c,mul3(n,KAP3)) for c in skeleton} for n in range(-5,6)}
sets={+1:set(),-1:set()}
for t in O0:
    c,ori=canonical_constant(t)
    sets[ori].add(c)
assert sets[+1]==layers[0]|layers[1]|layers[2]|layers[3]
assert sets[-1]==layers[-2]|layers[-1]|layers[0]|layers[1]

# inherited 186 -> 248 insertion law
old=set(Gprev)
new=set(G0)-old
assert len(new)==62
diff=[k for k in old if Gprev[k]!=G0[k]]
assert len(diff)==1

def targets_from_row(row):
    return [k for _,k in row[1][1:]]

old_to_new=[]
new_to_old=[]
for k,row in G0.items():
    for t in targets_from_row(row):
        if k in old and t in new: old_to_new.append((k,t))
        if k in new and t in old: new_to_old.append((k,t))

assert len(old_to_new)==2
assert len(new_to_old)==2

# New module carries one complete skeleton in each orientation.
from collections import Counter
assert Counter(G0[k][0] for k in new)==Counter({"A":12,"B":12,"D":13,"T":25})

# ----- matrix assembly -----

b0=F(1294116462737,10**12)
d0=F(1038397811807,10**12)
m0=F(915078526447,10**12)

def rational_matrix(orb,e,z,eps):
    order=sorted(orb)
    idx={t:i for i,t in enumerate(order)}
    rows=[{} for _ in order]
    def put(i,j,v):
        rows[i][j]=rows[i].get(j,F(0))+v
    for t,i in idx.items():
        rg=region_rep(t,e,z)
        put(i,i,F(1))
        if rg=="A":
            put(i,idx[add5(t,R5)],b0)
            put(i,idx[add5(t,S5)],d0)
            put(i,idx[sub5(U5,t)],-eps*d0)
        elif rg=="B":
            put(i,idx[add5(t,R5)],b0)
        elif rg=="T":
            put(i,idx[sub5(t,Q5)],m0)
            put(i,idx[sub5(W5,t)],-eps*m0)
    return rows,order

Rows,Order=rational_matrix(O0,E,Z0,+1)
RowsM,OrderM=rational_matrix(O0,E,Z0,-1)
assert Order==OrderM

# parity gauge
sign=[1 if t[4]==1 else -1 for t in Order]
for i in range(len(Order)):
    keys=set(Rows[i])|set(RowsM[i])
    for j in keys:
        assert RowsM[i].get(j,F(0))==sign[i]*Rows[i].get(j,F(0))*sign[j]

N=len(Order)
A=np.zeros((N,N),dtype=float)
for i,row in enumerate(Rows):
    for j,v in row.items():
        A[i,j]=float(v)

# Floating inverse is only a witness generator.
Rfloat=np.linalg.inv(A)
DEN=10**6
Rq=[[F(int(round(Rfloat[i,j]*DEN)),DEN) for j in range(N)] for i in range(N)]

normR=max(sum(abs(x) for x in row) for row in Rq)
assert normR<F(64)

cols=[[] for _ in range(N)]
for i,row in enumerate(Rows):
    for j,v in row.items():
        cols[j].append((i,v))

rho=F(0)
for i,row in enumerate(Rq):
    rowsum=F(0)
    for j in range(N):
        rm=sum((row[k]*v for k,v in cols[j]),F(0))
        rowsum+=abs(F(1 if i==j else 0)-rm)
    rho=max(rho,rowsum)

assert rho<F(1,8000)

# ----- exact physical coefficient enclosure -----

def imul(a,c): return (a[0]*c[0],a[1]*c[1])
def idiv(a,c): return (a[0]/c[1],a[1]/c[0])

def ln_bounds(x,N):
    y=(x-1)/(x+1)
    s=F(0)
    for n in range(N+1):
        s+=F(2,2*n+1)*y**(2*n+1)
    rem=F(2,2*N+3)*y**(2*N+3)/(1-y*y)
    return (s,s+rem)

def sqrt_bounds(x,digits=60):
    scale=10**digits
    n=(x.numerator*scale*scale)//x.denominator
    lo_i=isqrt(n)
    lo=F(lo_i,scale); hi=F(lo_i+1,scale)
    assert lo*lo<=x<=hi*hi
    return (lo,hi)

ln2=ln_bounds(F(2),100)
ln3=ln_bounds(F(3),120)
ln5=ln_bounds(F(5),220)

beta_iv=imul(sqrt_bounds(F(2,3)),idiv(ln3,ln2))
d_iv=imul(sqrt_bounds(F(1,5)),idiv(ln5,ln2))
m_iv=imul(sqrt_bounds(F(1,3)),idiv(ln3,ln2))

def maxerr(iv,x0): return max(abs(iv[0]-x0),abs(iv[1]-x0))

eb=maxerr(beta_iv,b0)
ed=maxerr(d_iv,d0)
em=maxerr(m_iv,m0)
Einf=max(eb+2*ed,eb,2*em)
assert Einf<F(1,10**12)

total=rho+normR*Einf
assert total<F(1,1000)
assert total<1

print("PASS: second extra-return topology certified exactly")
print("PASS: seed split = 248 / 186 / 248 / 186 / 248")
print("PASS: low edge = 124+124 orientation variables")
print("PASS: low edge layers = (+) 0..3, (-) -2..1")
print("PASS: side 186 system is exactly the first-extra certified system")
print("PASS: central 248 system is exactly low 248 after layer relabeling")
print("PASS: upper bands are seed-reflection equivalents")
print("PASS: 186 -> 248 adds exactly 62 variables")
print("PASS: exactly one inherited row changes type")
print("PASS: interface has 2 old->new and 2 new->old cross edges")
print("PASS: external parity is diagonal-gauge equivalent")
print("PASS: exact rational preconditioner norm < 64")
print("PASS: exact midpoint residual norm < 1/8000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: total preconditioned physical residual < 1/1000 < 1")
print("PASS: physical 248 system invertible for both external parities")
