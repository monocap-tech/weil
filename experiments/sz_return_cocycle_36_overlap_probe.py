#!/usr/bin/env python3
"""Discovery/verifier for SZ-RETURN-COCYCLE-36.

Types the third nu-tier seam at
    e = 5*kappa + 2*chi + rho + sigma + 4*tau + omega + 2*nu
and probes the chamber immediately above it:
    e = seam + delta, 0 < delta < nu.

The pass reconstructs the new source orbit directly and tests the first
nontrivial stabilization claim in the nu ladder:
    N2 = N1 disjoint-union (nu + U),
with exactly the same return body U found at the second tier.

It also verifies inherited N1/O0 relabelings and preserves
    omega = 18*nu + lambda, 0 < lambda < nu.

No invertibility claim for the new N2 species is made here.
"""

from collections import Counter, deque
from functools import lru_cache
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
NU3=sub3(TAU3,OMEGA3)
LAMBDA3=sub3(OMEGA3,mul3(18,NU3))

BASE22=add3(add3(add3(mul3(5,KAP3),mul3(2,CHI3)),RHO3),SIG3)
BASE24=add3(BASE22,TAU3)
BASE26=add3(BASE24,TAU3)
BASE28=add3(BASE26,TAU3)
BASE30=add3(BASE28,TAU3)
BASE32=add3(BASE30,OMEGA3)
BASE34=add3(BASE32,NU3)
BASE36=add3(BASE34,NU3)

@lru_cache(maxsize=None)
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
assert NU3==(-8593,17186,6939)
assert LAMBDA3==(161724,-323448,-130595)
assert add3(mul3(4,TAU3),OMEGA3)==SIG3
assert 2**33628 * 5**5693 > 3**29557
assert 3**36026 > 2**40988 * 5**6939
assert logcomb_sign(OMEGA3)>0
# nu = log(3^36026/(2^40988 5^6939)) > 0.
assert 3**36026 > 2**40988 * 5**6939
# omega-nu = log(2^74616 5^12632 / 3^65583) > 0.
assert 2**74616 * 5**12632 > 3**65583
assert logcomb_sign(NU3)>0
assert logcomb_sign(sub3(OMEGA3,NU3))>0
assert logcomb_sign(LAMBDA3)>0
assert logcomb_sign(sub3(NU3,LAMBDA3))>0

# ---------------------------------------------------------------------------
# Fixed skeleton and collision sets
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

# Stabilized tau body.
WBODY=S0 | {add3(c,SIG3) for c in TOPRHO}
T1=T0 | {add3(c,TAU3) for c in WBODY}
T2=T1 | {add3(c,mul3(2,TAU3)) for c in WBODY}
T3=T2 | {add3(c,mul3(3,TAU3)) for c in WBODY}
O0=T3 | {add3(c,mul3(4,TAU3)) for c in WBODY}

# Nu-collision truncation: T3 plus the five terminal sites of the fourth W copy.
TOPNU={add3(add3(c,mul3(4,TAU3)),SIG3) for c in TOPRHO}
VBODY=T3 | TOPNU
N0=O0 | {add3(c,OMEGA3) for c in VBODY}

# Second-nu truncation: O0 plus the omega-shifted five-site nu cap.
TOPNU2={add3(c,OMEGA3) for c in TOPNU}
UBODY=O0 | TOPNU2
N1=N0 | {add3(c,NU3) for c in UBODY}
SHIFTU={add3(c,NU3) for c in UBODY}
N2_CAND=N1 | SHIFTU

assert len(K2)==5399
assert len(S0)==9492
assert len(TOPRHO)==5
assert len(T0)==14896
assert len(WBODY)==9497
assert len(T1)==24393
assert len(T2)==33890
assert len(T3)==43387
assert len(O0)==52884
assert len(TOPNU)==5
assert len(VBODY)==43392
assert len(N0)==96276
assert len(TOPNU2)==5
assert len(UBODY)==52889
assert len(N1)==149165
assert not (O0 & TOPNU2)
assert not (N0 & {add3(c,NU3) for c in UBODY})
print("MEASURE: |shift(nu+U)| =",len(SHIFTU))
print("MEASURE: |N1 intersect (nu+U)| =",len(N1 & SHIFTU))
print("MEASURE: |N1 union (nu+U)| =",len(N2_CAND))
assert not (O0 & {add3(c,OMEGA3) for c in VBODY})
assert not (T3 & {add3(c,mul3(4,TAU3)) for c in WBODY})
assert not (T2 & {add3(c,mul3(3,TAU3)) for c in WBODY})


# ---------------------------------------------------------------------------
# Fast overlap probe for the failed disjoint fixed-U hypothesis
# ---------------------------------------------------------------------------

OV=N1 & SHIFTU
BACK_OV={sub3(x,NU3) for x in OV}

print("MEASURE: |O0| =",len(O0))
print("MEASURE: |TOPNU2| =",len(TOPNU2))
print("MEASURE: |U| =",len(UBODY))
print("MEASURE: |N1| =",len(N1))
print("MEASURE: |shift(nu+U)| =",len(SHIFTU))
print("MEASURE: |N1 intersect shift(nu+U)| =",len(OV))
print("MEASURE: |N1 union shift(nu+U)| =",len(N2_CAND))
print("MEASURE: |back overlap| =",len(BACK_OV))

families={
    "O0":O0,
    "T3":T3,
    "N0":N0,
    "VBODY":VBODY,
    "UBODY":UBODY,
    "TOPNU2":TOPNU2,
    "WBODY":WBODY,
}
for name,S in families.items():
    print("MEASURE: back-overlap intersect",name,"=",len(BACK_OV & S))
    print("MEASURE: back-overlap minus",name,"=",len(BACK_OV-S))
    print("MEASURE:",name,"minus back-overlap =",len(S-BACK_OV))
    print("MEASURE: back-overlap equals",name,"=",BACK_OV==S)

# Test obvious translated/truncated candidates.
cands={
    "nu+O0":{add3(x,NU3) for x in O0},
    "omega+T3":{add3(x,OMEGA3) for x in T3},
    "omega+TOPNU":{add3(x,OMEGA3) for x in TOPNU},
    "O0_without_T3":O0-T3,
    "O0_without_WBODY4":O0-{add3(x,mul3(4,TAU3)) for x in WBODY},
}
for name,S in cands.items():
    print("MEASURE: back-overlap intersect",name,"=",len(BACK_OV & S))
    print("MEASURE: back-overlap equals",name,"=",BACK_OV==S)

print("DONE: fast overlap probe")
