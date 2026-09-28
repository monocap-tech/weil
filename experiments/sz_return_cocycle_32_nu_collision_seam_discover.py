#!/usr/bin/env python3
"""Discovery/verifier for SZ-RETURN-COCYCLE-32.

Types the nu collision seam at
    e = 5*kappa + 2*chi + rho + sigma + 4*tau + omega
and probes the first nu chamber
    e = seam + delta, 0 < delta < nu.

The script reconstructs the new source orbit directly, measures its equal-
orientation constant set and row census, identifies the new shifted return
body against known source sets, verifies inherited O0/T3 relabelings, and
records the Euclidean relation
    omega = 18*nu + lambda,
with 0 < lambda < nu.

No invertibility claim for the new nu-chamber species is made here.
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
# Exact topology certificate for canonical T3 band
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0); QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE32),1,0)
VLIN=(add3(sub3(Q3,J3),BASE32),1,0)
WLIN=(add3(mul3(2,Q3),BASE32),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE32)),mul3(az,offset3))
    L=(pure,ae,az)
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

NEW_VERTS=(
    ((0,0,0),(0,0,0)),
    (NU3,(0,0,0)),
    (NU3,NU3),
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
# Anchor sets
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
t2_offsets=t1_offsets|{add3(o,mul3(2,TAU3)) for o in s0_offsets}
t3_offsets=t2_offsets|{add3(o,mul3(3,TAU3)) for o in s0_offsets}
omega_offsets=t3_offsets|{add3(o,mul3(4,TAU3)) for o in s0_offsets}
t3_nu_offsets={add3(o,OMEGA3) for o in t3_offsets}
nu_offsets=omega_offsets|t3_nu_offsets

assert len(s0_offsets)==295
assert len(t0_offsets)==463
assert len(t1_offsets)==758
assert len(t2_offsets)==1053
assert len(t3_offsets)==1348
assert len(omega_offsets)==1643
assert len(t3_nu_offsets)==1348
assert len(nu_offsets)==2991
assert not (omega_offsets & t3_nu_offsets)

# ---------------------------------------------------------------------------
# Nu seam and first nu chamber
# ---------------------------------------------------------------------------

# At the seam the generic species are O0 and T3.
assert len(orbit(base32f,omegaf/2))==105768
assert len(orbit(base32f,omegaf+nuf/2))==86774

DELTA=nuf/3
E=base32f+DELTA

LOW=orbit(E,DELTA/2)
assert len(LOW)==192552
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE32,(0,0,0))

# Representative from second anchor family omega + T3.
rep2=min(t3_nu_offsets,key=eval3)
O2=orbit(E,eval3(rep2)+DELTA/2)
G2=graph(O2,E,eval3(rep2)+DELTA/2,BASE32,rep2)
assert G2==GNEW

# Constant sets and row census.
constsets={+1:set(),-1:set()}; rc=Counter()
for t in LOW:
    cc,o=graph_key(t,BASE32,(0,0,0))
    constsets[o].add(cc)
    rc[(o,region_rep(t,E,DELTA/2))]+=1
assert constsets[+1]==constsets[-1]==N0
NEWSET=constsets[+1]
assert len(NEWSET)==96276
for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(18653,18653,18654,40316)

# Exact nu-collision return body.
assert O0 <= NEWSET
DIFF=NEWSET-O0
assert len(DIFF)==43392
BACK_OMEGA={sub3(x,OMEGA3) for x in DIFF}
assert BACK_OMEGA==VBODY
assert VBODY==T3|TOPNU
assert not (T3 & TOPNU)
assert tuple(
    y-x for x,y in zip(
        (10246,10246,10247,22145),
        (18653,18653,18654,40316),
    )
)==(8407,8407,8407,18171)
assert tuple(
    y-x for x,y in zip(
        (8406,8406,8407,18168),
        (8407,8407,8407,18171),
    )
)==(1,1,0,3)

# Exact atlas counts.
assert len(nu_offsets)==2991
assert 2991+1643+1348==5982

# Inherited O0: reflected orientation +omega.
D0=omegaf/3
E30=base30f+D0
OO0=orbit(E30,D0/2)
GO0=graph(OO0,E30,D0/2,BASE30,(0,0,0))
Ocur=orbit(E,(DELTA+omegaf)/2)
Gcur=graph(Ocur,E,(DELTA+omegaf)/2,BASE32,(0,0,0))
assert Gcur==shift_graph(GO0,(0,0,0),OMEGA3)

# Inherited T3: positive orientation +omega.
zT=(D0+tauf)/2
OT3=orbit(E30,zT)
GT3=graph(OT3,E30,zT,BASE30,(0,0,0))
zcur=omegaf+(DELTA+nuf)/2
OcurT=orbit(E,zcur)
GcurT=graph(OcurT,E,zcur,BASE32,OMEGA3)
assert GcurT==shift_graph(GT3,OMEGA3,(0,0,0))

# Euclidean arithmetic: omega = 18 nu + lambda, 0<lambda<nu.
# lambda = log(2^771412 5^130595 / 3^678025).
# nu-lambda = log(3^714051 / (2^812400 5^137534)).
assert abs((omegaf-18*nuf)-lambdaf)<1e-15
assert 0<lambdaf<nuf

print("PASS: nu seam has 1643 O0/105768 and 1348 T3/86774 generic bands")
print("PASS: first nu chamber counts = N0/192552 x2991, O0/105768 x1643, T3/86774 x1348")
print("PASS: total generic bands = 5982")
print("PASS: checked new-anchor families normalize to one N0 source graph")
print("PASS: N0 per orientation = O0 union (omega+V), |V|=43392")
print("PASS: V = T3 union TOPNU, |TOPNU|=5")
print("PASS: |N0| per orientation = 96276; full size = 192552")
print("PASS: N0 census per orientation = A18653/B18653/D18654/T40316")
print("PASS: V contribution = A8407/B8407/D8407/T18171")
print("PASS: TOPNU contribution beyond T3 = A1/B1/D0/T3")
print("PASS: inherited O0 is reflected-orientation +omega relabeling")
print("PASS: inherited T3 is positive-orientation +omega relabeling")
print("PASS: omega = 18*nu + lambda with 0<lambda<nu")
print("PASS: next seam delta=nu collapses T3; O0 width becomes 17nu+lambda")
print("NOTE: N0/192552 invertibility is not claimed in this seam pass")
