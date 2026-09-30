#!/usr/bin/env python3
"""Fast direct-orbit probe for SZ-RETURN-COCYCLE-44.

Tests the seventh nu-tier seam at
    e = 5*kappa + 2*chi + rho + sigma + 4*tau + omega + 6*nu
and the chamber immediately above it.

The sole purpose is to test, from the source orbit, whether the next
tier-indexed fixed-body increment is exactly 6*nu + U.
No invertibility claim is made here.
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
BASE38=add3(BASE36,NU3)
BASE40=add3(BASE38,NU3)
BASE42=add3(BASE40,NU3)
BASE44=add3(BASE42,NU3)

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
SHIFT2U={add3(c,mul3(2,NU3)) for c in UBODY}
SHIFTN1={add3(c,NU3) for c in N1}
N2=N1 | SHIFT2U
SHIFT3U={add3(c,mul3(3,NU3)) for c in UBODY}
SHIFTN2={add3(c,NU3) for c in N2}
N3=N2 | SHIFT3U
SHIFT4U={add3(c,mul3(4,NU3)) for c in UBODY}
SHIFTN3={add3(c,NU3) for c in N3}
N4=N3 | SHIFT4U
SHIFT5U={add3(c,mul3(5,NU3)) for c in UBODY}
SHIFTN4={add3(c,NU3) for c in N4}
N5=N4 | SHIFT5U
SHIFT6U={add3(c,mul3(6,NU3)) for c in UBODY}
SHIFTN5={add3(c,NU3) for c in N5}
N6=N5 | SHIFT6U

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
assert SHIFTU <= N1
assert len(N2)==202054
assert not (N1 & SHIFT2U)
assert N2==(N1 | SHIFTN1)
assert len(N3)==254943
assert not (N2 & SHIFT3U)
assert N3==(N2 | SHIFTN2)
assert len(N4)==307832
assert not (N3 & SHIFT4U)
assert N4==(N3 | SHIFTN3)
assert len(N5)==360721
assert not (N4 & SHIFT5U)
assert N5==(N4 | SHIFTN4)
assert len(N6)==413610
assert not (N5 & SHIFT6U)
assert N6==(N5 | SHIFTN5)
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
base38f=base36f+nuf
base40f=base38f+nuf
base42f=base40f+nuf
base44f=base42f+nuf

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
# Seventh nu-tier fast direct-orbit probe
# ---------------------------------------------------------------------------

DELTA=nuf/3
E=base44f+DELTA
LOW=orbit(E,DELTA/2)
print("MEASURE: full orbit size =",len(LOW))

def const_key(t):
    aq,aj,ak,ae,az=t
    cc=add3((aq,aj,ak),mul3(ae,BASE44))
    if (ae,az)==(0,1): return cc,+1
    if (ae,az)==(1,-1): return cc,-1
    raise AssertionError((ae,az))

constsets={+1:set(),-1:set()}
rc=Counter()
for t in LOW:
    cc,o=const_key(t)
    constsets[o].add(cc)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

print("MEASURE: orientation sizes =",len(constsets[+1]),len(constsets[-1]))
print("MEASURE: orientations equal =",constsets[+1]==constsets[-1])
assert constsets[+1]==constsets[-1]
NEW=constsets[+1]
print("MEASURE: per-orientation size =",len(NEW))
print("MEASURE: census plus =",tuple(rc[(+1,x)] for x in ("A","B","D","T")))
print("MEASURE: census minus =",tuple(rc[(-1,x)] for x in ("A","B","D","T")))

print("MEASURE: N5 subset =",N5 <= NEW)
print("MEASURE: increment beyond N5 =",len(NEW-N5))
print("MEASURE: expected 6nu+U size =",len(SHIFT6U))
print("MEASURE: increment equals 6nu+U =",(NEW-N5)==SHIFT6U)
print("MEASURE: N6 candidate equals orbit =",NEW==N6)
print("MEASURE: nested candidate N5 union (nu+N5) equals orbit =",NEW==(N5|SHIFTN5))

assert len(LOW)==827220
assert NEW==N6
assert len(NEW)==413610
assert (NEW-N5)==SHIFT6U
assert NEW==(N5|SHIFTN5)

for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(80135,80135,80136,173204)

print("PASS: seventh-tier direct orbit confirms N6 = N5 disjoint-union (6nu+U)")
print("PASS: equivalently N6 = N5 union (nu+N5)")
print("PASS: |N6| per orientation = 413610; full size = 827220")
print("PASS: N6 census per orientation = A80135/B80135/D80136/T173204")
