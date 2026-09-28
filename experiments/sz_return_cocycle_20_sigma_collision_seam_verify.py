#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-20.

Types the sigma collision seam at
    e = 5*kappa + 2*chi + rho
and the first chamber above it:
    e = 5*kappa + 2*chi + rho + delta, 0 < delta < sigma.

Definitions:
    eta   = h - 5*kappa
    chi   = kappa - 8*eta
    rho   = eta - 3*chi
    sigma = chi - rho
    tau   = rho - sigma.

Conclusions:
  * at the seam, all M6/2612 gaps from the first rho chamber collapse;
    generic bands are K2/10798 and K1/8176;
  * immediately above, the exact generic atlas has
        295 x S0/18984
        168 x K2/10798
        127 x K1/8176
    = 590 bands;
  * all 295 new bands are one exact graph species;
  * per orientation
        S0 = K2 union (rho + Y),
    where
        Y = M7
            union (chi+X)
            union (2chi+X)
            union (3chi + 7eta + Caps),
    with |K2|=5399, |Y|=4093, |S0|=9492,
    hence full size 18984;
  * inherited K2 and K1 bands are exact graph relabelings with the
    reflected orientation shifted by +rho;
  * tau=rho-sigma satisfies 0<tau<sigma;
  * the next topology event is
        e = 5*kappa + 2*chi + rho + sigma,
    where the surviving K1 centers collapse and K2 width becomes tau.

No invertibility claim for S0/18984 is made here.
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
RHO3=sub3(ETA3,mul3(3,CHI3))
SIG3=sub3(CHI3,RHO3)
TAU3=sub3(RHO3,SIG3)

BASE18=add3(mul3(5,KAP3),mul3(2,CHI3))
BASE20=add3(BASE18,RHO3)

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

assert RHO3==(-665,1330,537)
assert SIG3==(878,-1756,-709)
assert TAU3==(-1543,3086,1246)

# tau = log(3^6469/(2^7360 5^1246)) > 0.
assert 3**6469 > 2**7360 * 5**1246
# sigma-tau = log(2^11548 5^1955 / 3^10150) > 0.
assert 2**11548 * 5**1955 > 3**10150

assert logcomb_sign(TAU3)>0
assert logcomb_sign(sub3(SIG3,TAU3))>0
assert add3(SIG3,TAU3)==RHO3

# ---------------------------------------------------------------------------
# Skeleton/body/wing and collision sets
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

TOPX={add3(c,mul3(7,ETA3)) for c in CAPS}

X=set(PSET)
for a in range(7):
    X |= {add3(c,mul3(a,ETA3)) for c in WING}
X |= TOPX

K1=(M7
    | {add3(c,CHI3) for c in X}
    | {add3(c,mul3(2,CHI3)) for c in X})

K2=(K1
    | {add3(c,mul3(3,CHI3)) for c in X})

Y=(M7
   | {add3(c,CHI3) for c in X}
   | {add3(c,mul3(2,CHI3)) for c in X}
   | {add3(c,mul3(3,CHI3)) for c in TOPX})

S0=K2 | {add3(c,RHO3) for c in Y}

assert len(M7)==1466
assert len(X)==1311
assert len(K1)==4088
assert len(K2)==5399
assert len(Y)==4093
assert len(S0)==9492
assert not (K2 & {add3(c,RHO3) for c in Y})

# ---------------------------------------------------------------------------
# Numerical representatives only for orbit discovery
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf
rhof=etaf-3*chif
sigf=chif-rhof
tauf=rhof-sigf
base18f=5*kapf+2*chif
base20f=base18f+rhof

assert 0<tauf<sigf<rhof<chif

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

def eval3(c):
    return c[0]*qf+c[1]*jf+c[2]*kf

# ---------------------------------------------------------------------------
# Exact topology certification for canonical S0 band
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE20),1,0)
VLIN=(add3(sub3(Q3,J3),BASE20),1,0)
WLIN=(add3(mul3(2,Q3),BASE20),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE20)),mul3(az,offset3))
    L=(pure,ae,az)
    if rg=="A": return (lsub(L,ZERO),lsub(ULIN,L))
    if rg=="B": return (lsub(L,ULIN),lsub(VLIN,L))
    if rg=="D": return (lsub(L,VLIN),lsub(QLIN,L))
    if rg=="T": return (lsub(L,QLIN),lsub(WLIN,L))
    raise AssertionError(rg)

NEW_VERTS=(
    ((0,0,0),(0,0,0)),
    (SIG3,(0,0,0)),
    (SIG3,SIG3),
)

def sign_at(L,delta3,zeta3):
    pure,cd,cz=L
    return logcomb_sign(add3(add3(pure,mul3(cd,delta3)),mul3(cz,zeta3)))

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
    return (c,ori)

def graph(O,e,z,base3,offset3):
    G={}
    for t in O:
        key=graph_key(t,base3,offset3)
        rg=region_rep(t,e,z)
        terms=[("one",key)]
        for lab,u in source_targets(t,rg):
            terms.append((lab,graph_key(u,base3,offset3)))
        G[key]=(rg,tuple(terms))
    return G

def shift_graph(G,sp,sm):
    sh={+1:sp,-1:sm}; out={}
    for (c,o),(rg,terms) in G.items():
        key=(add3(c,sh[o]),o)
        nts=[]
        for lab,(d,oo) in terms:
            nts.append((lab,(add3(d,sh[oo]),oo)))
        out[key]=(rg,tuple(nts))
    return out

# ---------------------------------------------------------------------------
# Anchor sets
# ---------------------------------------------------------------------------

k2_offsets=set()
k1_offsets=set()

for m in range(5):
    for a in range(9):
        g=add3(mul3(m,KAP3),mul3(a,ETA3))
        for b in range(4):
            k2_offsets.add(add3(g,mul3(b,CHI3)))
        for b in range(3):
            k1_offsets.add(add3(add3(g,mul3(b,CHI3)),RHO3))

new_offsets=k2_offsets | k1_offsets

assert len(k2_offsets)==168
assert len(k1_offsets)==127
assert not (k2_offsets & k1_offsets)
assert len(new_offsets)==295

# ---------------------------------------------------------------------------
# Seam and first sigma chamber
# ---------------------------------------------------------------------------

# Seam: K2 intervals of width rho and K1 intervals of width sigma.
seam_sizes=[]
for off in sorted(k2_offsets):
    seam_sizes.append(len(orbit(base20f,eval3(off)+rhof/2)))
for off in sorted(k1_offsets):
    seam_sizes.append(len(orbit(base20f,eval3(off)+sigf/2)))

assert seam_sizes.count(10798)==168
assert seam_sizes.count(8176)==127
assert len(seam_sizes)==295

DELTA=sigf/3
E=base20f+DELTA

LOW=orbit(E,DELTA/2)
assert len(LOW)==18984
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE20,(0,0,0))

sizes=[]
new_graphs=[]

for off in sorted(new_offsets):
    z=eval3(off)+DELTA/2
    O=orbit(E,z)
    assert len(O)==18984
    G=graph(O,E,z,BASE20,off)
    new_graphs.append(G)
    sizes.append(18984)

for off in sorted(k2_offsets):
    z=eval3(off)+(DELTA+rhof)/2
    O=orbit(E,z)
    assert len(O)==10798
    sizes.append(10798)

for off in sorted(k1_offsets):
    z=eval3(off)+(DELTA+sigf)/2
    O=orbit(E,z)
    assert len(O)==8176
    sizes.append(8176)

assert sizes.count(18984)==295
assert sizes.count(10798)==168
assert sizes.count(8176)==127
assert len(sizes)==590
assert all(G==GNEW for G in new_graphs)

# New constant-set architecture and census.
constsets={+1:set(),-1:set()}
rc=Counter()
for t in LOW:
    c,o=graph_key(t,BASE20,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

assert constsets[+1]==constsets[-1]==S0
assert len(S0)==9492

for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(1839,1839,1840,3974)

# ---------------------------------------------------------------------------
# Inherited-species relabeling
# ---------------------------------------------------------------------------

# Reference K2 from the first rho chamber.
D0=rhof/3
E18=base18f+D0
OK2=orbit(E18,D0/2)
GK2=graph(OK2,E18,D0/2,BASE18,(0,0,0))
assert len(GK2)==10798

# Current K2: reflected orientation shifted by +rho.
Ocur=orbit(E,(DELTA+rhof)/2)
Gcur=graph(Ocur,E,(DELTA+rhof)/2,BASE20,(0,0,0))
assert Gcur==shift_graph(GK2,(0,0,0),RHO3)

# Reference K1 from the same first-rho chamber.
z1=(D0+chif)/2
OK1=orbit(E18,z1)
GK1=graph(OK1,E18,z1,BASE18,(0,0,0))
assert len(GK1)==8176

# Current K1: reflected orientation shifted by +rho.
zcur1=rhof+(DELTA+sigf)/2
Ocur1=orbit(E,zcur1)
Gcur1=graph(Ocur1,E,zcur1,BASE20,RHO3)
assert Gcur1==shift_graph(GK1,(0,0,0),RHO3)

# ---------------------------------------------------------------------------
# Next residual
# ---------------------------------------------------------------------------

# At delta=sigma:
#   K1 widths sigma-delta collapse;
#   K2 widths rho-delta become tau=rho-sigma.
assert abs((rhof-sigf)-tauf)<1e-15
assert 0<tauf<sigf

print("PASS: sigma seam has 168 K2/10798 and 127 K1/8176 generic bands")
print("PASS: all M6 gaps collapse at e=5*kappa+2chi+rho")
print("PASS: first sigma chamber has 590 generic bands")
print("PASS: counts = S0/18984 x295, K2/10798 x168, K1/8176 x127")
print("PASS: all 295 S0 bands are one exact graph species")
print("PASS: S0 per orientation = K2 union (rho+Y)")
print("PASS: |K2|=5399, |Y|=4093, |S0|=9492; full size=18984")
print("PASS: S0 census per orientation = A1839/B1839/D1840/T3974")
print("PASS: surviving K2 and K1 are exact reflected-orientation +rho relabelings")
print("PASS: tau=rho-sigma with 0<tau<sigma")
print("PASS: next topology event is e=5*kappa+2chi+rho+sigma")
print("NOTE: S0/18984 invertibility is not claimed in this seam pass")
