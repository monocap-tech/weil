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
nuf=tauf-omegaf
lambdaf=omegaf-18*nuf
base22f=5*kapf+2*chif+rhof+sigf
base24f=base22f+tauf
base26f=base24f+tauf
base28f=base26f+tauf
base30f=base28f+tauf
base32f=base30f+omegaf
base34f=base32f+nuf
base36f=base34f+nuf

assert 0<lambdaf<nuf<omegaf<tauf<sigf<rhof<chif

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
# Fast direct-orbit probe: third nu tier
# ---------------------------------------------------------------------------

DELTA=nuf/3
E=base36f+DELTA
LOW=orbit(E,DELTA/2)
print("MEASURE: full orbit size =",len(LOW))

def const_key(t):
    aq,aj,ak,ae,az=t
    c=add3((aq,aj,ak),mul3(ae,BASE36))
    if (ae,az)==(0,1): return c,+1
    if (ae,az)==(1,-1): return c,-1
    raise AssertionError((ae,az))

constsets={+1:set(),-1:set()}
rc=Counter()
for t in LOW:
    c,o=const_key(t)
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

print("MEASURE: orientation sizes =",len(constsets[+1]),len(constsets[-1]))
print("MEASURE: orientations equal =",constsets[+1]==constsets[-1])
assert constsets[+1]==constsets[-1]
NEW=constsets[+1]
print("MEASURE: per-orientation size =",len(NEW))
print("MEASURE: census plus =",tuple(rc[(+1,x)] for x in ("A","B","D","T")))
print("MEASURE: census minus =",tuple(rc[(-1,x)] for x in ("A","B","D","T")))

print("MEASURE: N1 subset =",N1 <= NEW)
print("MEASURE: N1 missing from orbit =",len(N1-NEW))
DIFF=NEW-N1
print("MEASURE: increment beyond N1 =",len(DIFF))

shifts={
    "minus_nu":NU3,
    "minus_2nu":mul3(2,NU3),
    "minus_omega":OMEGA3,
    "minus_omega_plus_nu":add3(OMEGA3,NU3),
    "minus_tau":TAU3,
}
families={
    "O0":O0,
    "T3":T3,
    "N0":N0,
    "N1":N1,
    "UBODY":UBODY,
    "VBODY":VBODY,
    "WBODY":WBODY,
    "TOPNU":TOPNU,
    "TOPNU2":TOPNU2,
}
for sn,sh in shifts.items():
    B={sub3(x,sh) for x in DIFF}
    print("MEASURE:",sn,"back size =",len(B))
    for fn,S in families.items():
        inter=len(B&S)
        if inter or len(B)==len(S):
            print("MEASURE:",sn,"intersect",fn,"=",inter,
                  "missing_from_family=",len(S-B),
                  "extra_over_family=",len(B-S),
                  "equals=",B==S)

# Also test whether the new set itself is generated by obvious union candidates.
candidates={
    "N1":N1,
    "N1_union_shift_nu_U":N1|SHIFTU,
    "N1_union_shift_nu_N0":N1|{add3(x,NU3) for x in N0},
    "N1_union_shift_nu_N1":N1|{add3(x,NU3) for x in N1},
    "N1_union_shift_2nu_O0":N1|{add3(x,mul3(2,NU3)) for x in O0},
}
for name,S in candidates.items():
    print("MEASURE: candidate",name,"size=",len(S),
          "equals_orbit=",S==NEW,
          "candidate_only=",len(S-NEW),
          "orbit_only=",len(NEW-S))

print("DONE: fast direct-orbit probe")
