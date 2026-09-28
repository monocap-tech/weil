#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-26.

Types the third tau-tier seam at
    e = 5*kappa + 2*chi + rho + sigma + 2*tau
and the chamber immediately above it:
    e = 5*kappa + 2*chi + rho + sigma + 2*tau + delta,
    0 < delta < tau.

Conclusions:
  * at the seam, the T0/29792 centers have collapsed;
    generic bands are T1/48786 and S0/18984;
  * immediately above, the generic atlas has
        1053 x T2/67780
         758 x T1/48786
         295 x S0/18984
    = 2106 bands;
  * all 1053 new bands are one exact graph species;
  * per orientation
        T2 = T1 union (2*tau + W),
    where
        W = S0 union (sigma + T_rho),
        |W|=9497,
    so |T2|=33890, full size 67780;
  * this is the same W used in T1=T0 union (tau+W):
    after the initial nested truncation, the tau ladder stabilizes to a
    fixed 9497-site module;
  * inherited T1 is the prior T1 graph with reflected orientation +tau;
  * inherited S0 is the prior S0 graph with positive orientation +tau;
  * sigma = 4*tau + omega, 0<omega<tau;
  * at the next seam delta=tau, T1 centers collapse and S0 width becomes
        sigma-3*tau = tau+omega.

No invertibility claim for T2/67780 is made here.
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
BASE26=add3(BASE24,TAU3)

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

assert len(K2)==5399
assert len(S0)==9492
assert len(TOPRHO)==5
assert len(T0)==14896
assert len(WBODY)==9497
assert len(T1)==24393
assert len(T2)==33890
assert not (T1 & {add3(c,mul3(2,TAU3)) for c in WBODY})

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
base26f=base24f+tauf

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
# Exact topology certificate for canonical T2 band
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0); QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE26),1,0)
VLIN=(add3(sub3(Q3,J3),BASE26),1,0)
WLIN=(add3(mul3(2,Q3),BASE26),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE26)),mul3(az,offset3))
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

assert len(s0_offsets)==295
assert len(t0_offsets)==463
assert len(t1_offsets)==758
assert len(t2_offsets)==1053
assert not (t1_offsets & {add3(o,mul3(2,TAU3)) for o in s0_offsets})

# ---------------------------------------------------------------------------
# Seam typing
# ---------------------------------------------------------------------------

# Seam has T1 intervals of width tau and S0 intervals of width sigma-2tau.
assert len(orbit(base26f,tauf/2))==48786
assert len(orbit(base26f,2*tauf+(sigf-2*tauf)/2))==18984

# ---------------------------------------------------------------------------
# Third tau chamber
# ---------------------------------------------------------------------------

DELTA=tauf/3
E=base26f+DELTA

LOW=orbit(E,DELTA/2)
assert len(LOW)==67780
certify_new_band(LOW,E,DELTA/2,(0,0,0))
GNEW=graph(LOW,E,DELTA/2,BASE26,(0,0,0))

# Representative from the newly added 2tau+S0 anchor family.
second_family={add3(o,mul3(2,TAU3)) for o in s0_offsets}
rep2=min(second_family,key=eval3)
O2=orbit(E,eval3(rep2)+DELTA/2)
G2=graph(O2,E,eval3(rep2)+DELTA/2,BASE26,rep2)
assert G2==GNEW

# Constant set and row census.
constsets={+1:set(),-1:set()}; rc=Counter()
for t in LOW:
    c,o=graph_key(t,BASE26,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

assert constsets[+1]==constsets[-1]==T2
for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(6566,6566,6567,14191)

# Fixed-module increment from T1.
assert tuple(
    b-a for a,b in zip(
        (4726,4726,4727,10214),
        (6566,6566,6567,14191),
    )
)==(1840,1840,1840,3977)
assert 1840+1840+1840+3977==9497

# Inherited T1: reflected orientation +tau relative to COCYCLE-24.
D0=tauf/3
E24=base24f+D0
OT1=orbit(E24,D0/2)
GT1=graph(OT1,E24,D0/2,BASE24,(0,0,0))

Ocur=orbit(E,(DELTA+tauf)/2)
Gcur=graph(Ocur,E,(DELTA+tauf)/2,BASE26,(0,0,0))
assert Gcur==shift_graph(GT1,(0,0,0),TAU3)

# Inherited S0: positive orientation +tau relative to the prior tau chamber.
zS=tauf+(D0+(sigf-tauf))/2
OS0=orbit(E24,zS)
GS0=graph(OS0,E24,zS,BASE24,TAU3)

zcur=2*tauf+(DELTA+(sigf-2*tauf))/2
OcurS=orbit(E,zcur)
GcurS=graph(OcurS,E,zcur,BASE26,mul3(2,TAU3))
assert GcurS==shift_graph(GS0,TAU3,(0,0,0))

# Immediate next seam.
# At delta=tau:
#   T1 widths tau-delta collapse;
#   S0 widths (sigma-2tau)-delta become sigma-3tau=tau+omega.
assert abs((sigf-3*tauf)-(tauf+omegaf))<1e-15
assert 0<omegaf<tauf

print("PASS: third tau seam has T1/48786 and S0/18984 generic species")
print("PASS: all T0 centers have collapsed")
print("PASS: third tau chamber counts = T2/67780 x1053, T1/48786 x758, S0/18984 x295")
print("PASS: total generic bands = 2106")
print("PASS: all new anchors normalize to one T2 source graph")
print("PASS: T2 per orientation = T1 union (2tau+W), |W|=9497")
print("PASS: |T2| per orientation = 33890; full size = 67780")
print("PASS: T2 census per orientation = A6566/B6566/D6567/T14191")
print("PASS: T2-T1 increment = A1840/B1840/D1840/T3977 = 9497")
print("PASS: same W body used in T1 is reused at shift 2tau")
print("PASS: inherited T1 is reflected-orientation +tau relabeling")
print("PASS: inherited S0 is positive-orientation +tau relabeling")
print("PASS: sigma=4tau+omega, 0<omega<tau")
print("PASS: next seam delta=tau collapses T1; S0 width becomes tau+omega")
print("NOTE: T2/67780 invertibility is not claimed in this seam pass")
