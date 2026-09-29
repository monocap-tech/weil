#!/usr/bin/env python3
"""Discovery/verifier for SZ-RETURN-COCYCLE-38.

Types the fourth nu-tier seam at
    e = 5*kappa + 2*chi + rho + sigma + 4*tau + omega + 3*nu
and probes the chamber immediately above it:
    e = seam + delta, 0 < delta < nu.

The pass reconstructs the source orbit directly and tests the next
tier-indexed stabilized-body recurrence:
    N3 = N2 disjoint-union (3*nu + U).

It verifies the new-band graph, inherited N2/O0 relabelings, and preserves
    omega = 18*nu + lambda, 0 < lambda < nu.

No invertibility claim for N3 is made here.
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
# Exact topology certificate for canonical N3 band
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0); QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE38),1,0)
VLIN=(add3(sub3(Q3,J3),BASE38),1,0)
WLIN=(add3(mul3(2,Q3),BASE38),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE38)),mul3(az,offset3))
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
n1_second_offsets={add3(o,NU3) for o in omega_offsets}
n1_offsets=nu_offsets|n1_second_offsets
n2_third_offsets={add3(o,mul3(2,NU3)) for o in omega_offsets}
n2_offsets=n1_offsets|n2_third_offsets
n3_fourth_offsets={add3(o,mul3(3,NU3)) for o in omega_offsets}
n3_offsets=n2_offsets|n3_fourth_offsets

assert len(s0_offsets)==295
assert len(t0_offsets)==463
assert len(t1_offsets)==758
assert len(t2_offsets)==1053
assert len(t3_offsets)==1348
assert len(omega_offsets)==1643
assert len(t3_nu_offsets)==1348
assert len(nu_offsets)==2991
assert len(n1_second_offsets)==1643
assert len(n1_offsets)==4634
assert len(n2_third_offsets)==1643
assert len(n2_offsets)==6277
assert len(n3_fourth_offsets)==1643
assert len(n3_offsets)==7920
assert not (nu_offsets & n1_second_offsets)
assert not (n1_offsets & n2_third_offsets)
assert not (n2_offsets & n3_fourth_offsets)

# ---------------------------------------------------------------------------
# Fourth nu-tier seam and chamber
# ---------------------------------------------------------------------------

# At the seam the generic species are N2 and O0.
assert len(orbit(base38f,nuf/2))==404108
assert len(orbit(base38f,3*nuf+(omegaf-3*nuf)/2))==105768

DELTA=nuf/3
E=base38f+DELTA

LOW=orbit(E,DELTA/2)
assert len(LOW)==509886
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE38,(0,0,0))

# Representative from the newly shifted O0-anchor family 3*nu + O0.
rep3=min(n3_fourth_offsets,key=eval3)
O3=orbit(E,eval3(rep3)+DELTA/2)
G3=graph(O3,E,eval3(rep3)+DELTA/2,BASE38,rep3)
assert G3==GNEW

# Constant sets and row census.
constsets={+1:set(),-1:set()}; rc=Counter()
for t in LOW:
    cc,o=graph_key(t,BASE38,(0,0,0))
    constsets[o].add(cc)
    rc[(o,region_rep(t,E,DELTA/2))]+=1
assert constsets[+1]==constsets[-1]==N3
NEWSET=constsets[+1]
assert len(NEWSET)==254943
for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(49394,49394,49395,106760)

# Tier-indexed stabilized-body recurrence.
assert N2 <= NEWSET
DIFF=NEWSET-N2
assert DIFF==SHIFT3U
assert len(DIFF)==52889
BACK_3NU={sub3(x,mul3(3,NU3)) for x in DIFF}
assert BACK_3NU==UBODY
assert UBODY==O0|TOPNU2
assert not (O0 & TOPNU2)

# Equivalent nested form: N3 = N2 union (nu+N2).
assert NEWSET==(N2 | SHIFTN2)

# The per-orientation census increment is exactly the U census again.
assert tuple(
    y-x for x,y in zip(
        (39147,39147,39148,84612),
        (49394,49394,49395,106760),
    )
)==(10247,10247,10247,22148)

# Exact atlas count.
assert len(n3_offsets)==7920
assert 7920+6277+1643==15840

# Inherited N2: reflected orientation +nu relative to COCYCLE-36.
D0=nuf/3
E36=base36f+D0
ON2=orbit(E36,D0/2)
GN2=graph(ON2,E36,D0/2,BASE36,(0,0,0))
Ocur=orbit(E,(DELTA+nuf)/2)
Gcur=graph(Ocur,E,(DELTA+nuf)/2,BASE38,(0,0,0))
assert Gcur==shift_graph(GN2,(0,0,0),NU3)

# Inherited O0: positive orientation +nu relative to the third nu chamber.
zOprev=2*nuf+(D0+(omegaf-2*nuf))/2
OO0=orbit(E36,zOprev)
GO0=graph(OO0,E36,zOprev,BASE36,mul3(2,NU3))
zcur=3*nuf+(DELTA+(omegaf-3*nuf))/2
OcurO=orbit(E,zcur)
GcurO=graph(OcurO,E,zcur,BASE38,mul3(3,NU3))
assert GcurO==shift_graph(GO0,NU3,(0,0,0))

# Next seam: N2 centers collapse; O0 loses one further nu-width.
assert abs((omegaf-4*nuf)-(14*nuf+lambdaf))<1e-15
assert 0<lambdaf<nuf

print("PASS: fourth nu seam has 6277 N2/404108 and 1643 O0/105768 generic bands")
print("PASS: third-chamber N1 centers have collapsed")
print("PASS: fourth nu chamber counts = N3/509886 x7920, N2/404108 x6277, O0/105768 x1643")
print("PASS: total generic bands = 15840")
print("PASS: checked new-anchor families normalize to one N3 source graph")
print("PASS: N3 per orientation = N2 disjoint-union (3nu+U), |U|=52889")
print("PASS: equivalently N3 = N2 union (nu+N2)")
print("PASS: tier-indexed U-body recurrence survives the fourth nu tier")
print("PASS: |N3| per orientation = 254943; full size = 509886")
print("PASS: N3 census per orientation = A49394/B49394/D49395/T106760")
print("PASS: U contribution repeats = A10247/B10247/D10247/T22148")
print("PASS: inherited N2 is reflected-orientation +nu relabeling")
print("PASS: inherited O0 is positive-orientation +nu relabeling")
print("PASS: omega = 18*nu + lambda with 0<lambda<nu")
print("PASS: next seam delta=nu collapses N2; O0 width becomes 14nu+lambda")
print("NOTE: N3/509886 invertibility is not claimed in this seam pass")
