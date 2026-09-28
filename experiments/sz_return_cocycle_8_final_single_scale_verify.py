#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-8.

Final admissible single-scale chamber:
    e = 4*kappa + eta,
    0 < eta < eta_max := lambda_ret - 4*kappa = h - 5*kappa.

Uses the n-independent architecture theorem from SZ-RETURN-COCYCLE-7
and certifies the only new graph species G_4:
    372 = 31 x 6 x 2.

Checks:
  * eta_max is exactly positive and strictly below kappa;
  * representative source orbit has the predicted nine-band alternation
        372/310/372/310/372/310/372/310/372;
  * low edge has (+) layers 0..5 and (-) layers -4..1;
  * G_4 contains G_3 plus exactly 62 variables;
  * one inherited row changes D->T;
  * interface has two old->new and two new->old edges;
  * external parity is diagonal-gauge equivalent;
  * exact rational preconditioner certificate proves physical G_4 invertible.

Floating point is used only to choose a representative and generate a rounded
inverse witness. All arithmetic used by the invertibility certificate is exact.
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
EMAX3=sub3(H3,mul3(5,KAP3))  # eta_max = h - 5 kappa

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

assert logcomb_sign(EMAX3)>0
assert logcomb_sign(sub3(KAP3,EMAX3))>0

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
lamret=hf-kapf
etamax=lamret-4*kapf
assert 0<etamax<kapf

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

# Representative within the actual truncated final chamber.
ETA=etamax/2
E=4*kapf+ETA
bounds=[0,ETA,kapf,kapf+ETA,2*kapf,2*kapf+ETA,
        3*kapf,3*kapf+ETA,4*kapf,E]
reps=[(bounds[i]+bounds[i+1])/2 for i in range(9)]
orbs=[orbit(E,z) for z in reps]
assert [len(o) for o in orbs]==[372,310,372,310,372,310,372,310,372]

def seed_reflect(t):
    aq,aj,ak,ae,az=t
    return (aq,aj,ak,ae+az,-az)

assert {seed_reflect(t) for t in orbs[0]}==orbs[8]
assert {seed_reflect(t) for t in orbs[1]}==orbs[7]

def canonical_constant(t):
    aq,aj,ak,ae,az=t
    if ae==0 and az==1: return (aq,aj,ak),+1
    if ae==1 and az==-1: return (aq,aj,ak),-1
    raise AssertionError(t)

decomp={}
for n in range(-12,13):
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
G372=graphs[0]; G310=graphs[1]

# Exact low-edge layer architecture.
layers={n:{add3(c,mul3(n,KAP3)) for c in skeleton} for n in range(-7,8)}
sets={+1:set(),-1:set()}
for t in orbs[0]:
    c,ori=canonical_constant(t); sets[ori].add(c)
assert sets[+1]==set().union(*(layers[n] for n in range(0,6)))
assert sets[-1]==set().union(*(layers[n] for n in range(-4,2)))
assert len(sets[+1])==len(sets[-1])==186

# Compare with an independently generated n=3 G_3 graph.
E3=3*kapf+min(0.0008,kapf/3)
O310ref=orbit(E3,min(0.0004,(E3-3*kapf)/2))
G310ref=row_graph(O310ref,E3,min(0.0004,(E3-3*kapf)/2))
assert len(G310ref)==310
assert G310==G310ref

old=set(G310ref); new=set(G372)-old
assert len(new)==62
changed=[k for k in old if G310ref[k]!=G372[k]]
assert len(changed)==1
assert changed[0][0]==18

def targets(row): return [k for _,k in row[1][1:]]
old_to_new=[]; new_to_old=[]
for k,row in G372.items():
    for t in targets(row):
        if k in old and t in new: old_to_new.append((k,t))
        if k in new and t in old: new_to_old.append((k,t))
assert len(old_to_new)==2
assert len(new_to_old)==2
assert Counter(G372[k][0] for k in new)==Counter({"A":12,"B":12,"D":13,"T":25})

# Rational midpoint coefficients.
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

# External parity gauge.
sgn=[1 if t[4]==1 else -1 for t in Order]
for i in range(len(Order)):
    keys=set(Rows[i])|set(RowsM[i])
    for j in keys:
        assert RowsM[i].get(j,F(0))==sgn[i]*Rows[i].get(j,F(0))*sgn[j]

N=len(Order)
A=np.zeros((N,N),dtype=float)
for i,row in enumerate(Rows):
    for j,v in row.items(): A[i,j]=float(v)

# Floating inverse only generates a rational witness.
Rfloat=np.linalg.inv(A)
DEN=10**7
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
assert rho<F(1,50000)

# Exact physical coefficient enclosure.
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
assert total<F(1,49000)
assert total<1

print("PASS: eta_max=h-5*kappa satisfies 0<eta_max<kappa exactly")
print("PASS: final seed split = 372/310/372/310/372/310/372/310/372")
print("PASS: G4 low edge = 186+186 orientation variables")
print("PASS: G4 layers = (+) 0..5, (-) -4..1")
print("PASS: G3 side species recovered exactly")
print("PASS: G3 -> G4 adds exactly 62 variables")
print("PASS: exactly one inherited row changes type")
print("PASS: interface has 2 old->new and 2 new->old cross edges")
print("PASS: new module census = A12/B12/D13/T25")
print("PASS: external parity is diagonal-gauge equivalent")
print("PASS: exact rational preconditioner norm < 64")
print("PASS: exact midpoint residual norm < 1/50000")
print("PASS: physical coefficient perturbation norm < 1e-12")
print("PASS: total preconditioned physical residual < 1/49000 < 1")
print("PASS: physical 372 system invertible for both external parities")
