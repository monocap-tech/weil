#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-7.

Third extra-kappa chamber:
    e = 3*kappa + eta, 0 < eta < kappa.

Certifies:
  * seven seed bands 310/248/310/248/310/248/310;
  * low 310 orbit = 31 x 5 x 2 architecture;
  * every 248 side band is an exact relabeling of the certified n=2 system;
  * every 310 edge band is an exact relabeling/reflection of one 310 system;
  * 248 -> 310 repeats the same 62-variable module insertion law:
        one inherited row changes type,
        two old->new and two new->old cross edges;
  * external parity is diagonal-gauge equivalent;
  * exact rational preconditioner certificate for the physical 310 system.

Floating point is used only to discover a rounded inverse witness.
All chamber topology and invertibility checks are exact thereafter.
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
R3=add3(Q3,J3); S3=sub3(Q3,K3); QS3=add3(Q3,S3)

skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
skeleton=tuple(dict.fromkeys(skeleton))
assert len(skeleton)==31

qf=log(4/3); jf=log(9/8); kf=log(16/15)
hf=log(81/80); kapf=kf-5*hf

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

# Representative seven bands.
ETA=0.0008
E=3*kapf+ETA
bounds=[0,ETA,kapf,kapf+ETA,2*kapf,2*kapf+ETA,3*kapf,E]
reps=[(bounds[i]+bounds[i+1])/2 for i in range(7)]
orbs=[orbit(E,z) for z in reps]
assert [len(o) for o in orbs]==[310,248,310,248,310,248,310]

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

def subst(t,m,side):
    aq,aj,ak,ae,az=t
    # e=3*kappa+eta.
    # edge band: z=m*kappa+zeta.
    # side band: z=m*kappa+eta+zeta.
    pure=add3((aq,aj,ak),mul3(3*ae+m*az,KAP3))
    return (pure,ae+(az if side else 0),az)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,mul3(3,KAP3)),1,0)
VLIN=(add3(sub3(Q3,J3),mul3(3,KAP3)),1,0)
WLIN=(add3(mul3(2,Q3),mul3(3,KAP3)),1,0)

def margins(t,rg,m,side):
    T=subst(t,m,side)
    if rg=="A": return (lsub(T,ZERO),lsub(ULIN,T))
    if rg=="B": return (lsub(T,ULIN),lsub(VLIN,T))
    if rg=="D": return (lsub(T,VLIN),lsub(QLIN,T))
    if rg=="T": return (lsub(T,QLIN),lsub(WLIN,T))
    raise AssertionError(rg)

EDGE_VERTS=((0,0),(1,0),(1,1))  # 0<=zeta<=eta<=kappa
SIDE_VERTS=((0,0),(1,0),(0,1))  # eta,zeta>=0, eta+zeta<=kappa

def vertex_sign(L,v):
    pure,ce,cz=L; ae,az=v
    return logcomb_sign(add3(pure,mul3(ce*ae+cz*az,KAP3)))

def certify_band(orb,e,z,m,side):
    verts=SIDE_VERTS if side else EDGE_VERTS
    for t in orb:
        rg=region_rep(t,e,z)
        for L in margins(t,rg,m,side):
            signs=[vertex_sign(L,v) for v in verts]
            assert all(s>=0 for s in signs),(t,rg,signs)
            assert any(s>0 for s in signs),(t,rg,signs)

for i,(orb,z) in enumerate(zip(orbs,reps)):
    certify_band(orb,E,z,i//2,bool(i%2))

# ----- canonical layer graph -----

def canonical_constant(t):
    aq,aj,ak,ae,az=t
    if ae==0 and az==1: return (aq,aj,ak),+1
    if ae==1 and az==-1: return (aq,aj,ak),-1
    raise AssertionError(t)

decomp={}
for n in range(-10,11):
    for si,c in enumerate(skeleton):
        cc=add3(c,mul3(n,KAP3))
        assert cc not in decomp or decomp[cc]==(si,n)
        decomp[cc]=(si,n)

def row_graph(orb,e,z):
    out={}
    for t in orb:
        c,ori=canonical_constant(t); si,n=decomp[c]
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
            cc,oo=canonical_constant(u); sj,nn=decomp[cc]
            terms.append((lab,(sj,nn,oo)))
        out[key]=(rg,tuple(terms))
    return out

graphs=[row_graph(o,E,z) for o,z in zip(orbs,reps)]

# low 310 layer architecture
sets={+1:set(),-1:set()}
for t in orbs[0]:
    c,ori=canonical_constant(t); sets[ori].add(c)
layers={n:{add3(c,mul3(n,KAP3)) for c in skeleton} for n in range(-6,7)}
assert sets[+1]==set().union(*(layers[n] for n in range(0,5)))
assert sets[-1]==set().union(*(layers[n] for n in range(-3,2)))
assert len(sets[+1])==len(sets[-1])==155

def shift_rows(rows,sp,sm):
    sh={+1:sp,-1:sm}; out={}
    for (si,n,ori),(rg,terms) in rows.items():
        nk=(si,n+sh[ori],ori)
        nts=[]
        for lab,(sj,nn,oo) in terms:
            nts.append((lab,(sj,nn+sh[oo],oo)))
        out[nk]=(rg,tuple(nts))
    return out

G310=graphs[0]
G248=graphs[1]
# all new and side bands are relabelings of the first two types
assert graphs[2]==shift_rows(G310,-1,+1)
assert graphs[3]==shift_rows(G248,-1,+1)
assert graphs[4]==shift_rows(G310,-2,+2)
assert graphs[5]==shift_rows(G248,-2,+2)
assert graphs[6]==shift_rows(G310,-3,+3)

# compare with the independently generated n=2 low 248 graph
E2=2*kapf+0.0008
O248ref=orbit(E2,0.0004)
G248ref=row_graph(O248ref,E2,0.0004)
assert G248==G248ref

old=set(G248ref); new=set(G310)-old
assert len(new)==62
changed=[k for k in old if G248ref[k]!=G310[k]]
assert len(changed)==1
assert changed[0][0]==18  # skeleton site s+5h=q-kappa

def targets(row):
    return [k for _,k in row[1][1:]]

old_to_new=[]; new_to_old=[]
for k,row in G310.items():
    for t in targets(row):
        if k in old and t in new: old_to_new.append((k,t))
        if k in new and t in old: new_to_old.append((k,t))
assert len(old_to_new)==2
assert len(new_to_old)==2
assert Counter(G310[k][0] for k in new)==Counter({"A":12,"B":12,"D":13,"T":25})

# ----- rational midpoint matrix and exact preconditioner -----

b0=F(1294116462737,10**12)
d0=F(1038397811807,10**12)
m0=F(915078526447,10**12)

def rational_rows(orb,e,z,eps):
    order=sorted(orb); idx={t:i for i,t in enumerate(order)}
    rows=[{} for _ in order]
    def put(i,j,v): rows[i][j]=rows[i].get(j,F(0))+v
    for t,i in idx.items():
        rg=region_rep(t,e,z); put(i,i,F(1))
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

Rows,Order=rational_rows(orbs[0],E,reps[0],+1)
RowsM,OrderM=rational_rows(orbs[0],E,reps[0],-1)
assert Order==OrderM

# exact parity gauge
sgn=[1 if t[4]==1 else -1 for t in Order]
for i in range(len(Order)):
    keys=set(Rows[i])|set(RowsM[i])
    for j in keys:
        assert RowsM[i].get(j,F(0))==sgn[i]*Rows[i].get(j,F(0))*sgn[j]

N=len(Order)
A=np.zeros((N,N),dtype=float)
for i,row in enumerate(Rows):
    for j,v in row.items(): A[i,j]=float(v)

# approximate inverse only generates a rational witness
Rfloat=np.linalg.inv(A)
DEN=10**6
Rq=[[F(int(round(Rfloat[i,j]*DEN)),DEN) for j in range(N)] for i in range(N)]
normR=max(sum(abs(x) for x in row) for row in Rq)
assert normR<F(64)

cols=[[] for _ in range(N)]
for i,row in enumerate(Rows):
    for j,v in row.items(): cols[j].append((i,v))

rho=F(0)
for i,row in enumerate(Rq):
    rs=F(0)
    for j in range(N):
        rm=sum((row[k]*v for k,v in cols[j]),F(0))
        rs+=abs(F(1 if i==j else 0)-rm)
    rho=max(rho,rs)
assert rho<F(1,7000)

# ----- exact physical coefficient enclosure -----

def imul(a,c): return (a[0]*c[0],a[1]*c[1])
def idiv(a,c): return (a[0]/c[1],a[1]/c[0])
def ln_bounds(x,N):
    y=(x-1)/(x+1); s=F(0)
    for n in range(N+1): s+=F(2,2*n+1)*y**(2*n+1)
    rem=F(2,2*N+3)*y**(2*N+3)/(1-y*y)
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

total=rho+normR*Einf
assert total<F(1,6000)
assert total<1

print("PASS: third extra-return topology certified exactly")
print("PASS: seed split = 310 / 248 / 310 / 248 / 310 / 248 / 310")
print("PASS: low edge = 155+155 orientation variables")
print("PASS: low edge layers = (+) 0..4, (-) -3..1")
print("PASS: all 248 side bands are certified n=2 relabelings")
print("PASS: all 310 edge bands are one certified graph up to layer shift/reflection")
print("PASS: 248 -> 310 adds exactly 62 variables")
print("PASS: exactly one inherited row changes type")
print("PASS: interface has 2 old->new and 2 new->old cross edges")
print("PASS: new module census = A12/B12/D13/T25")
print("PASS: external parity is diagonal-gauge equivalent")
print("PASS: exact rational preconditioner norm < 64")
print("PASS: exact midpoint residual norm < 1/7000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: total preconditioned physical residual < 1/6000 < 1")
print("PASS: physical 310 system invertible for both external parities")
