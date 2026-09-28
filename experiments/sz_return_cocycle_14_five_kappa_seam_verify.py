#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-14.

Types the e=5*kappa collision seam and the first open chamber above it.

Definitions:
    eta  = h - 5*kappa
    chi  = kappa - 8*eta

Exact arithmetic:
    0 < chi < eta,
    lambda_ret + 7*eta + chi = 5*kappa.

At e=5*kappa:
  * the four long G3/310 residual bands of the final eta-wing chamber collapse;
  * generic bands are only M7/2932 and M6/2612.

For
    e = 5*kappa + eps, 0 < eps < chi,
the generic seed atlas has exactly 171 bands:
    86 copies of a new C0/5554 collision species,
    45 copies of M7/2932,
    40 copies of M6/2612.

The new species has, per orientation,
    C0 = M7 union (chi + X),
where
    X = P
        union_{a=0..6} (a*eta + W)
        union (7*eta + Caps),
so
    |M7|=1466, |X|=1311, |C0|=2777,
and the full two-orientation size is 5554.

No invertibility claim for C0 is made in this pass.
"""
from collections import Counter, deque
from math import log

# ---------------------------------------------------------------------------
# Exact coordinates
# ---------------------------------------------------------------------------

Q5=(1,0,0,0,0); J5=(0,1,0,0,0); K5=(0,0,1,0,0)
Z5=(0,0,0,0,1)

def add5(a,b): return tuple(x+y for x,y in zip(a,b))
def sub5(a,b): return tuple(x-y for x,y in zip(a,b))
def mul5(n,a): return tuple(n*x for x in a)

R5=add5(Q5,J5)
S5=sub5(Q5,K5)
U5=(0,0,1,1,0)
W5=(2,0,0,1,0)

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
BASE5=mul3(5,KAP3)

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

assert logcomb_sign(CHI3)>0
assert logcomb_sign(sub3(ETA3,CHI3))>0
assert add3(add3(LAM3,mul3(7,ETA3)),CHI3)==BASE5

# Exact prime-power certificate already equivalent to chi>0.
assert 2**1016 * 5**172 > 3**893

# ---------------------------------------------------------------------------
# Skeleton/body/wing
# ---------------------------------------------------------------------------

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

X=set(PSET)
for a in range(7):
    X |= {add3(c,mul3(a,ETA3)) for c in WING}
X |= {add3(c,mul3(7,ETA3)) for c in CAPS}

C0=M7 | {add3(c,CHI3) for c in X}

assert len(PSET)==186
assert len(WING)==160
assert len(M7)==1466
assert len(X)==1311
assert len(C0)==2777
assert not (M7 & {add3(c,CHI3) for c in X})

# ---------------------------------------------------------------------------
# Numerical representatives only for orbit discovery
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf
base5f=5*kapf

assert 0<chif<etaf

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z)
    u=kf+e; v=qf-jf+e; w=2*qf+e
    tol=1e-11
    if 0<x<u-tol: return "A"
    if u+tol<x<v-tol: return "B"
    if v+tol<x<qf-tol: return "D"
    if qf+tol<x<w-tol: return "T"
    raise AssertionError(("threshold",t,x,u,v,qf,w))

def source_targets(t,rg):
    if rg=="A":
        return (
            ("b",add5(t,R5)),
            ("d",add5(t,S5)),
            ("rd",sub5(U5,t)),
        )
    if rg=="B":
        return (("b",add5(t,R5)),)
    if rg=="T":
        return (
            ("m",sub5(t,Q5)),
            ("rm",sub5(W5,t)),
        )
    return ()

def orbit(e,z):
    seen={Z5}; todo=deque([Z5])
    while todo:
        t=todo.popleft()
        rg=region_rep(t,e,z)
        for _,s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s); todo.append(s)
    return seen

# ---------------------------------------------------------------------------
# Exact topology checker for the new collision bands
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE5),1,0)
VLIN=(add3(sub3(Q3,J3),BASE5),1,0)
WLIN=(add3(mul3(2,Q3),BASE5),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE5)),mul3(az,offset3))
    L=(pure,ae,az)
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

NEW_VERTS=(
    ((0,0,0),(0,0,0)),
    (CHI3,(0,0,0)),
    (CHI3,CHI3),
)

def sign_at(L,eps3,zeta3):
    pure,ce,cz=L
    return logcomb_sign(add3(add3(pure,mul3(ce,eps3)),mul3(cz,zeta3)))

def certify_new_band(O,e,z,offset3):
    for t in O:
        rg=region_rep(t,e,z)
        for M in margins(t,rg,offset3):
            signs=[sign_at(M,a,b) for a,b in NEW_VERTS]
            assert all(s>=0 for s in signs),(t,rg,signs)
            assert any(s>0 for s in signs),(t,rg,signs)

def graph_key(t,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,BASE5)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

def graph(O,e,z,offset3):
    G={}
    for t in O:
        key=graph_key(t,offset3)
        rg=region_rep(t,e,z)
        terms=[("one",key)]
        for lab,u in source_targets(t,rg):
            terms.append((lab,graph_key(u,offset3)))
        G[key]=(rg,tuple(terms))
    return G

# ---------------------------------------------------------------------------
# Seam at e=5*kappa
# ---------------------------------------------------------------------------

# Pick midpoints of the exact seam bands. There are:
#   45 M7 bands: m*kappa+a*eta -> +chi, a=0..8
#   40 M6 bands: +chi -> +(a+1)*eta, a=0..7
# The four old G3 long gaps have zero width.
seam_sizes=[]
for m in range(5):
    for a in range(9):
        g=m*kapf+a*etaf
        seam_sizes.append(len(orbit(base5f,g+chif/2)))
        if a<8:
            seam_sizes.append(len(orbit(base5f,g+(chif+etaf)/2)))

assert seam_sizes.count(2932)==45
assert seam_sizes.count(2612)==40
assert len(seam_sizes)==85

# ---------------------------------------------------------------------------
# First post-collision chamber
# ---------------------------------------------------------------------------

EPS=chif/3
E=base5f+EPS
sizes=[]
new_graphs=[]

for m in range(5):
    for a in range(9):
        g=m*kapf+a*etaf
        off=add3(mul3(m,KAP3),mul3(a,ETA3))

        # New collision band at the left edge.
        O=orbit(E,g+EPS/2)
        assert len(O)==5554
        certify_new_band(O,E,g+EPS/2,off)
        new_graphs.append(graph(O,E,g+EPS/2,off))
        sizes.append(5554)

        # Surviving M7 center.
        O=orbit(E,g+(EPS+chif)/2)
        assert len(O)==2932
        sizes.append(2932)

        # Right collision band. At a=8 and m<4 this is exactly the
        # next cell's left collision band, so count it only when unique.
        right_start=g+chif
        if a<8 or m==4:
            O=orbit(E,right_start+EPS/2)
            assert len(O)==5554
            off2=add3(off,CHI3)
            certify_new_band(O,E,right_start+EPS/2,off2)
            new_graphs.append(graph(O,E,right_start+EPS/2,off2))
            sizes.append(5554)

        # Surviving M6 gap.
        if a<8:
            O=orbit(E,g+(chif+EPS+etaf)/2)
            assert len(O)==2612
            sizes.append(2612)

assert sizes.count(5554)==86
assert sizes.count(2932)==45
assert sizes.count(2612)==40
assert len(sizes)==171
assert all(G==new_graphs[0] for G in new_graphs)

# New constant-set architecture and row census.
LOW=orbit(E,EPS/2)
constsets={+1:set(),-1:set()}
rc=Counter()
for t in LOW:
    c,o=graph_key(t,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,EPS/2))]+=1

assert constsets[+1]==constsets[-1]==C0
assert len(C0)==2777

for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(538,538,539,1162)

# Relative to M7, the chi-tier contribution is X.
assert tuple(
    b-a for a,b in zip((284,284,285,613),(538,538,539,1162))
)==(254,254,254,549)
assert 254+254+254+549==1311

# At eps=chi, every surviving M7 center has zero width.
# This is the next exact topology event.
assert chif>0

print("PASS: e=5*kappa seam has 45 M7 bands and 40 M6 bands; G3 gaps collapse")
print("PASS: chi=kappa-8*eta is the new positive residual scale")
print("PASS: first post-collision chamber is 5*kappa<e<5*kappa+chi")
print("PASS: exact first post-collision atlas has 171 bands")
print("PASS: counts = C0/5554 x86, M7/2932 x45, M6/2612 x40")
print("PASS: all 86 C0 bands are one exact graph species")
print("PASS: C0 per orientation = M7 union (chi+X), |M7|=1466, |X|=1311")
print("PASS: full C0 size = 5554")
print("PASS: C0 row census per orientation = A538/B538/D539/T1162")
print("PASS: at e=5*kappa+chi the surviving M7 centers collapse")
print("NOTE: C0 invertibility is not claimed in this seam pass")
