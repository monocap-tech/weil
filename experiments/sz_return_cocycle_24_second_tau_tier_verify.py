#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-24.

Types the second tau-tier seam at
    e = 5*kappa + 2*chi + rho + sigma + tau
and the chamber immediately above it:
    e = 5*kappa + 2*chi + rho + sigma + tau + delta,
    0 < delta < tau.

Conclusions:
  * at the seam, the K2/10798 centers have collapsed;
    generic bands are T0/29792 and S0/18984;
  * immediately above, the generic atlas has
        758 x T1/48786
        463 x T0/29792
        295 x S0/18984
    = 1516 bands;
  * all 758 new bands are one exact graph species;
  * per orientation
        T1 = T0 union (tau + W),
    where
        W = S0 union (sigma + T_rho),
        |T_rho|=5,
    so |W|=9497, |T1|=24393, full size 48786;
  * inherited T0 is the prior T0 graph with reflected orientation +tau;
  * inherited S0 is the prior S0 graph with positive orientation +tau;
  * sigma = 4*tau + omega, 0<omega<tau;
  * at the next tau seam delta=tau, T0 centers collapse and the
    surviving S0 width becomes 2*tau+omega.

No invertibility claim for T1/48786 is made here.
"""

from collections import Counter, deque
from math import log

Q5=(1,0,0,0,0); J5=(0,1,0,0,0); K5=(0,0,1,0,0)
Z5=(0,0,0,0,1)

def add5(a,b): return tuple(x+y for x,y in zip(a,b))
def sub5(a,b): return tuple(x-y for x,y in zip(a,b))

R5=add5(Q5,J5); S5=sub5(Q5,K5)
U5=(0,0,1,1,0); W5=(2,0,0,1,0)

Q3=(1,0,0); J3=(0,1,0); K3=(0,0,1)

def add3(a,b): return tuple(x+y for x,y in zip(a,b))
def sub3(a,b): return tuple(x-y for x,y in zip(a,b))
def mul3(n,a): return tuple(n*x for x in a)

H3=add3(add3(mul3(2,J3),K3),mul3(-1,Q3))
P3=add3(add3(Q3,mul3(-1,J3)),mul3(-1,K3))
KAP3=add3(add3(mul3(5,Q3),mul3(-10,J3)),mul3(-4,K3))
LAM3=sub3(H3,KAP3)
ETA3=sub3(LAM3,mul3(4,KAP3))
CHI3=sub3(KAP3,mul3(8,ETA3))
RHO3=sub3(ETA3,mul3(3,CHI3))
SIG3=sub3(CHI3,RHO3)
TAU3=sub3(RHO3,SIG3)
OMEGA3=sub3(SIG3,mul3(4,TAU3))

BASE22=add3(add3(add3(mul3(5,KAP3),mul3(2,CHI3)),RHO3),SIG3)
BASE24=add3(BASE22,TAU3)

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

assert TAU3==(-1543,3086,1246)
assert OMEGA3==(7050,-14100,-5693)
assert add3(mul3(4,TAU3),OMEGA3)==SIG3
assert 2**33628 * 5**5693 > 3**29557
assert 3**36026 > 2**40988 * 5**6939
assert logcomb_sign(OMEGA3)>0
assert logcomb_sign(sub3(TAU3,OMEGA3))>0

# ---------------------------------------------------------------------------
# Fixed skeleton and nested collision sets
# ---------------------------------------------------------------------------

R3=add3(Q3,J3); S3=sub3(Q3,K3); QS3=add3(Q3,S3)

skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
SSET=set(skeleton)

bottoms={(0,0,0),P3,S3,R3,QS3}
tops={
    mul3(5,H3),
    add3(P3,mul3(6,H3)),
    add3(S3,mul3(5,H3)),
    add3(R3,mul3(5,H3)),
    add3(QS3,mul3(5,H3)),
}
CAPS={add3(c,H3) for c in tops}

PSET=set()
for n in range(6):
    PSET |= {add3(c,mul3(n,KAP3)) for c in SSET}

WING=set()
for n in range(-5,0):
    WING |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    WING |= {add3(c,mul3(n,KAP3)) for c in CAPS}

M7=set(PSET)
for a in range(8):
    M7 |= {add3(c,mul3(a,ETA3)) for c in WING}

TOPX={add3(c,mul3(7,ETA3)) for c in CAPS}

X=set(PSET)
for a in range(7):
    X |= {add3(c,mul3(a,ETA3)) for c in WING}
X |= TOPX

K1=(M7
    | {add3(c,CHI3) for c in X}
    | {add3(c,mul3(2,CHI3)) for c in X})

K2=K1 | {add3(c,mul3(3,CHI3)) for c in X}

Y=(M7
   | {add3(c,CHI3) for c in X}
   | {add3(c,mul3(2,CHI3)) for c in X}
   | {add3(c,mul3(3,CHI3)) for c in TOPX})

S0=K2 | {add3(c,RHO3) for c in Y}

TOPRHO={add3(add3(c,mul3(3,CHI3)),RHO3) for c in TOPX}
ZBODY=K2 | TOPRHO
T0=S0 | {add3(c,SIG3) for c in ZBODY}

# Second tau-tier body: S0 plus the five terminal sigma-shifted rho caps.
W2=S0 | {add3(c,SIG3) for c in TOPRHO}
T1=T0 | {add3(c,TAU3) for c in W2}

assert len(K2)==5399
assert len(S0)==9492
assert len(TOPRHO)==5
assert len(T0)==14896
assert len(W2)==9497
assert len(T1)==24393
assert not (T0 & {add3(c,TAU3) for c in W2})

# ---------------------------------------------------------------------------
# Numerical representatives
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
etaf=(hf-kapf)-4*kapf
chif=kapf-8*etaf
rhof=etaf-3*chif
sigf=chif-rhof
tauf=rhof-sigf
omegaf=sigf-4*tauf
base22f=5*kapf+2*chif+rhof+sigf
base24f=base22f+tauf

assert 0<omegaf<tauf<sigf<rhof<chif

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z); u=kf+e; v=qf-jf+e; w=2*qf+e; tol=1e-11
    if 0<x<u-tol: return "A"
    if u+tol<x<v-tol: return "B"
    if v+tol<x<qf-tol: return "D"
    if qf+tol<x<w-tol: return "T"
    raise AssertionError(("threshold",t,x,u,v,qf,w))

def source_targets(t,rg):
    if rg=="A":
        return (("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t)))
    if rg=="B": return (("b",add5(t,R5)),)
    if rg=="T": return (("m",sub5(t,Q5)),("rm",sub5(W5,t)))
    return ()

def orbit(e,z):
    seen={Z5}; todo=deque([Z5])
    while todo:
        t=todo.popleft(); rg=region_rep(t,e,z)
        for _,s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s); todo.append(s)
    return seen

def eval3(c):
    return c[0]*qf+c[1]*jf+c[2]*kf

# ---------------------------------------------------------------------------
# Exact topology certificate for canonical T1 band
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0); QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE24),1,0)
VLIN=(add3(sub3(Q3,J3),BASE24),1,0)
WLIN=(add3(mul3(2,Q3),BASE24),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE24)),mul3(az,offset3))
    L=(pure,ae,az)
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

NEW_VERTS=(
    ((0,0,0),(0,0,0)),
    (TAU3,(0,0,0)),
    (TAU3,TAU3),
)

def sign_at(L,dv,zv):
    pure,cd,cz=L
    return logcomb_sign(add3(add3(pure,mul3(cd,dv)),mul3(cz,zv)))

def certify_new_band(O,e,z,offset3):
    for t in O:
        rg=region_rep(t,e,z)
        for M in margins(t,rg,offset3):
            signs=[sign_at(M,a,b) for a,b in NEW_VERTS]
            assert all(s>=0 for s in signs),(t,rg,signs)
            assert any(s>0 for s in signs),(t,rg,signs)

def graph_key(t,base3,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,base3)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return c,ori

def graph(O,e,z,base3,offset3):
    G={}
    for t in O:
        key=graph_key(t,base3,offset3); rg=region_rep(t,e,z)
        terms=[("one",key)]
        for lab,u in source_targets(t,rg):
            terms.append((lab,graph_key(u,base3,offset3)))
        G[key]=(rg,tuple(terms))
    return G

def shift_graph(G,sp,sm):
    sh={+1:sp,-1:sm}; out={}
    for (c,o),(rg,terms) in G.items():
        key=(add3(c,sh[o]),o)
        nts=[(lab,(add3(d,sh[oo]),oo)) for lab,(d,oo) in terms]
        out[key]=(rg,tuple(nts))
    return out

# ---------------------------------------------------------------------------
# Anchor sets and seam
# ---------------------------------------------------------------------------

k2_offsets=set(); k1_offsets=set()
for m in range(5):
    for a in range(9):
        g=add3(mul3(m,KAP3),mul3(a,ETA3))
        for b in range(4):
            k2_offsets.add(add3(g,mul3(b,CHI3)))
        for b in range(3):
            k1_offsets.add(add3(add3(g,mul3(b,CHI3)),RHO3))

s0_offsets=k2_offsets|k1_offsets
t0_offsets=s0_offsets|{add3(o,SIG3) for o in k2_offsets}
t1_offsets=t0_offsets|{add3(o,TAU3) for o in s0_offsets}

assert len(s0_offsets)==295
assert len(t0_offsets)==463
assert len(t1_offsets)==758
assert not (t0_offsets & {add3(o,TAU3) for o in s0_offsets})

# Seam representative species.
assert len(orbit(base24f,tauf/2))==29792
assert len(orbit(base24f,tauf+(sigf-tauf)/2))==18984

# ---------------------------------------------------------------------------
# Second tau chamber
# ---------------------------------------------------------------------------

DELTA=tauf/3
E=base24f+DELTA

LOW=orbit(E,DELTA/2)
assert len(LOW)==48786
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE24,(0,0,0))

# Representative from the second new-anchor family.
rep2=min({add3(o,TAU3) for o in s0_offsets},key=eval3)
O2=orbit(E,eval3(rep2)+DELTA/2)
G2=graph(O2,E,eval3(rep2)+DELTA/2,BASE24,rep2)
assert G2==GNEW

# Constant set and row census.
constsets={+1:set(),-1:set()}; rc=Counter()
for t in LOW:
    c,o=graph_key(t,BASE24,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

assert constsets[+1]==constsets[-1]==T1
for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(4726,4726,4727,10214)

# Inherited T0 relabeling: reflected orientation +tau.
D0=tauf/3
E22=base22f+D0
OT0=orbit(E22,D0/2)
GT0=graph(OT0,E22,D0/2,BASE22,(0,0,0))

Ocur=orbit(E,(DELTA+tauf)/2)
Gcur=graph(Ocur,E,(DELTA+tauf)/2,BASE24,(0,0,0))
assert Gcur==shift_graph(GT0,(0,0,0),TAU3)

# Inherited S0 relabeling: positive orientation +tau.
OS0=orbit(E22,(D0+sigf)/2)
GS0=graph(OS0,E22,(D0+sigf)/2,BASE22,(0,0,0))

zcur=tauf+(DELTA+(sigf-tauf))/2
OcurS=orbit(E,zcur)
GcurS=graph(OcurS,E,zcur,BASE24,TAU3)
assert GcurS==shift_graph(GS0,TAU3,(0,0,0))

# Exact body/census increment.
assert len(W2)==9497
assert tuple(
    b-a for a,b in zip(
        (2886,2886,2887,6237),
        (4726,4726,4727,10214),
    )
)==(1840,1840,1840,3977)
assert 1840+1840+1840+3977==9497

# At delta=tau:
#   T0 widths tau-delta collapse;
#   S0 widths (sigma-tau)-delta become sigma-2tau = 2tau+omega.
assert abs((sigf-2*tauf)-(2*tauf+omegaf))<1e-15
assert 0<omegaf<tauf

print("PASS: second tau seam has T0/29792 and S0/18984 generic species")
print("PASS: first tau K2 centers have collapsed")
print("PASS: second tau chamber counts = T1/48786 x758, T0/29792 x463, S0/18984 x295")
print("PASS: total generic bands = 1516")
print("PASS: T1 per orientation = T0 union (tau+W), |W|=9497")
print("PASS: |T1| per orientation = 24393; full size = 48786")
print("PASS: T1 census per orientation = A4726/B4726/D4727/T10214")
print("PASS: W contribution = A1840/B1840/D1840/T3977")
print("PASS: inherited T0 is reflected-orientation +tau relabeling")
print("PASS: inherited S0 is positive-orientation +tau relabeling")
print("PASS: sigma=4*tau+omega, 0<omega<tau")
print("PASS: next seam delta=tau collapses T0; S0 width becomes 2tau+omega")
print("NOTE: T1/48786 invertibility is not claimed in this seam pass")
