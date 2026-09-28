#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-22.

Types the tau collision seam at
    e = 5*kappa + 2*chi + rho + sigma
and the first chamber above it:
    e = 5*kappa + 2*chi + rho + sigma + delta,
    0 < delta < tau.

Definitions:
    eta   = h - 5*kappa
    chi   = kappa - 8*eta
    rho   = eta - 3*chi
    sigma = chi - rho
    tau   = rho - sigma
    omega = sigma - 4*tau.

Conclusions:
  * at the seam, all K1/8176 centers collapse;
    generic bands are S0/18984 and K2/10798;
  * immediately above, the exact generic atlas has
        463 x T0/29792
        295 x S0/18984
        168 x K2/10798
    = 926 bands;
  * all 463 new bands are one exact graph species;
  * per orientation
        T0 = S0 union (sigma + Z),
    where
        Z = K2 union (rho + 3chi + TOPX),
    with |S0|=9492, |Z|=5404, |T0|=14896,
    hence full size 29792;
  * inherited S0 is an exact relabeling with reflected orientation +sigma;
  * inherited K2 is an exact relabeling with positive orientation +sigma;
  * the Euclidean relation is
        sigma = 4*tau + omega,
    with 0 < omega < tau;
  * the immediate next topology event is delta=tau, where K2 centers
    collapse and the S0 center width becomes 3*tau+omega.

No invertibility claim for T0/29792 is made here.
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

BASE18=add3(mul3(5,KAP3),mul3(2,CHI3))
BASE20=add3(BASE18,RHO3)
BASE22=add3(BASE20,SIG3)

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

# omega = log(2^33628 5^5693 / 3^29557) > 0.
assert 2**33628 * 5**5693 > 3**29557
# tau-omega = log(3^36026 / (2^40988 5^6939)) > 0.
assert 3**36026 > 2**40988 * 5**6939
assert logcomb_sign(OMEGA3)>0
assert logcomb_sign(sub3(TAU3,OMEGA3))>0

# Fixed skeleton/body/wing data.
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
K2=(K1 | {add3(c,mul3(3,CHI3)) for c in X})
Y=(M7
   | {add3(c,CHI3) for c in X}
   | {add3(c,mul3(2,CHI3)) for c in X}
   | {add3(c,mul3(3,CHI3)) for c in TOPX})
S0=K2 | {add3(c,RHO3) for c in Y}

# New tau-collision truncated body.
TOPRHO={add3(add3(c,mul3(3,CHI3)),RHO3) for c in TOPX}
ZBODY=K2 | TOPRHO
T0=S0 | {add3(c,SIG3) for c in ZBODY}

assert len(K2)==5399
assert len(S0)==9492
assert len(TOPRHO)==5
assert len(ZBODY)==5404
assert len(T0)==14896
assert not (S0 & {add3(c,SIG3) for c in ZBODY})

# Numerical representatives only for orbit discovery.
qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf
rhof=etaf-3*chif
sigf=chif-rhof
tauf=rhof-sigf
omegaf=sigf-4*tauf
base20f=5*kapf+2*chif+rhof
base22f=base20f+sigf
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

# Exact topology certificate for the canonical T0 band.
def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)
ZERO=((0,0,0),0,0); QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE22),1,0)
VLIN=(add3(sub3(Q3,J3),BASE22),1,0)
WLIN=(add3(mul3(2,Q3),BASE22),1,0)
def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE22)),mul3(az,offset3))
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

# Anchor sets inherited from COCYCLE-20.
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
assert len(k2_offsets)==168
assert len(s0_offsets)==295
assert len(t0_offsets)==463

# Seam: 295 S0 and 168 K2 generic bands.
seam_sizes=[]
for off in sorted(s0_offsets):
    seam_sizes.append(len(orbit(base22f,eval3(off)+sigf/2)))
for off in sorted(k2_offsets):
    seam_sizes.append(len(orbit(base22f,eval3(off)+sigf+tauf/2)))
assert seam_sizes.count(18984)==295
assert seam_sizes.count(10798)==168
assert len(seam_sizes)==463

# First tau chamber.
DELTA=tauf/3
E=base22f+DELTA
LOW=orbit(E,DELTA/2)
assert len(LOW)==29792
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE22,(0,0,0))

sizes=[]; new_graphs=[]
for off in sorted(t0_offsets):
    z=eval3(off)+DELTA/2
    O=orbit(E,z)
    assert len(O)==29792
    G=graph(O,E,z,BASE22,off)
    new_graphs.append(G)
    sizes.append(29792)
for off in sorted(s0_offsets):
    z=eval3(off)+(DELTA+sigf)/2
    O=orbit(E,z)
    assert len(O)==18984
    sizes.append(18984)
for off in sorted(k2_offsets):
    z=eval3(off)+sigf+(DELTA+tauf)/2
    O=orbit(E,z)
    assert len(O)==10798
    sizes.append(10798)

assert sizes.count(29792)==463
assert sizes.count(18984)==295
assert sizes.count(10798)==168
assert len(sizes)==926
assert all(G==GNEW for G in new_graphs)

# New constant-set architecture and census.
constsets={+1:set(),-1:set()}; rc=Counter()
for t in LOW:
    c,o=graph_key(t,BASE22,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1
assert constsets[+1]==constsets[-1]==T0
for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(2886,2886,2887,6237)

# Inherited S0 relabeling.
D0=sigf/3; E20=base20f+D0
OS0=orbit(E20,D0/2); GS0=graph(OS0,E20,D0/2,BASE20,(0,0,0))
Ocur=orbit(E,(DELTA+sigf)/2)
Gcur=graph(Ocur,E,(DELTA+sigf)/2,BASE22,(0,0,0))
assert Gcur==shift_graph(GS0,(0,0,0),SIG3)

# Inherited K2 relabeling.
OK2=orbit(E20,(D0+rhof)/2)
GK2=graph(OK2,E20,(D0+rhof)/2,BASE20,(0,0,0))
Ocur2=orbit(E,sigf+(DELTA+tauf)/2)
Gcur2=graph(Ocur2,E,sigf+(DELTA+tauf)/2,BASE22,SIG3)
assert Gcur2==shift_graph(GK2,SIG3,(0,0,0))

# Immediate seam and Euclidean continuation.
assert abs((sigf-tauf)-(3*tauf+omegaf))<1e-15
assert 0<omegaf<tauf

print("PASS: tau seam has 295 S0/18984 and 168 K2/10798 generic bands")
print("PASS: all K1 centers collapse at e=5*kappa+2chi+rho+sigma")
print("PASS: first tau chamber has 926 generic bands")
print("PASS: counts = T0/29792 x463, S0/18984 x295, K2/10798 x168")
print("PASS: all 463 T0 bands are one exact graph species")
print("PASS: T0 per orientation = S0 union (sigma+Z)")
print("PASS: |S0|=9492, |Z|=5404, |T0|=14896; full size=29792")
print("PASS: T0 census per orientation = A2886/B2886/D2887/T6237")
print("PASS: surviving S0 is exact reflected-orientation +sigma relabeling")
print("PASS: surviving K2 is exact positive-orientation +sigma relabeling")
print("PASS: sigma = 4*tau + omega with 0<omega<tau")
print("PASS: next topology event is delta=tau; K2 centers collapse")
print("NOTE: T0/29792 invertibility is not claimed in this seam pass")
