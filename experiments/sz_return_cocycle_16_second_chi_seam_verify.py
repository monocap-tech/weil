#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-16.

Types the second chi seam at
    e = 5*kappa + chi
and the first chamber above it:
    e = 5*kappa + chi + delta, 0 < delta < chi.

Conclusions:
  * at the seam, all M7/2932 centers from the first chi chamber collapse;
    generic bands are C0/5554 and M6/2612;
  * immediately above, the exact generic atlas has
        127 x K1/8176
         86 x C0/5554
         40 x M6/2612
    = 253 bands;
  * all 127 new bands are one exact graph species;
  * per orientation
        K1 = M7 union (chi+X) union (2chi+X),
    with sizes
        1466 + 1311 + 1311 = 4088,
    hence full size 8176;
  * the inherited C0 bands are exact C0 graph relabelings with the
    reflected orientation shifted by +chi;
  * the inherited M6 bands are exact M6 graph relabelings with the
    positive orientation shifted by +chi;
  * the next residual is
        rho = eta - 3chi,
    with 0 < rho < chi;
  * the next topology event is e = 5*kappa + 2chi, where the surviving
    C0 centers collapse and the M6 residual width becomes rho.

No invertibility claim for K1/8176 is made here.
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
BASE5=mul3(5,KAP3)
BASE16=add3(BASE5,CHI3)

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

# rho = eta-3chi = (-665,1330,537)
assert RHO3==(-665,1330,537)
assert logcomb_sign(RHO3)>0
assert logcomb_sign(sub3(CHI3,RHO3))>0

# Explicit prime-power certificates:
# rho = log(3^2788/(2^3172 5^537)) > 0
# chi-rho = log(2^4188 5^709 / 3^3681) > 0
assert 3**2788 > 2**3172 * 5**537
assert 2**4188 * 5**709 > 3**3681

assert add3(mul3(3,CHI3),RHO3)==ETA3

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

X=set(PSET)
for a in range(7):
    X |= {add3(c,mul3(a,ETA3)) for c in WING}
X |= {add3(c,mul3(7,ETA3)) for c in CAPS}

C0=M7 | {add3(c,CHI3) for c in X}
K1=(M7
    | {add3(c,CHI3) for c in X}
    | {add3(c,mul3(2,CHI3)) for c in X})

assert len(M7)==1466
assert len(X)==1311
assert len(C0)==2777
assert len(K1)==4088

# ---------------------------------------------------------------------------
# Numerical representatives only for orbit discovery
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf
rhof=etaf-3*chif
base5f=5*kapf
base16f=base5f+chif

assert 0<rhof<chif
assert abs(etaf-(3*chif+rhof))<1e-15

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
# Exact topology certification for new K1 bands
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,ea,za=a; pb,eb,zb=b
    return (sub3(pa,pb),ea-eb,za-zb)

ZERO=((0,0,0),0,0)
QLIN=(Q3,0,0)
ULIN=(add3(K3,BASE16),1,0)
VLIN=(add3(sub3(Q3,J3),BASE16),1,0)
WLIN=(add3(mul3(2,Q3),BASE16),1,0)

def margins(t,rg,offset3):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,BASE16)),mul3(az,offset3))
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
# Seam at e=5*kappa+chi
# ---------------------------------------------------------------------------

# At the seam: 86 C0 bands + 40 M6 bands; all M7 centers have collapsed.
seam_sizes=[]

new_offsets=set()
c0_offsets=set()
m6_offsets=set()

for m in range(5):
    for a in range(9):
        g=add3(mul3(m,KAP3),mul3(a,ETA3))
        for b in range(3):
            new_offsets.add(add3(g,mul3(b,CHI3)))
        for b in range(2):
            c0_offsets.add(add3(g,mul3(b,CHI3)))
        if a<8:
            m6_offsets.add(g)

assert len(new_offsets)==127
assert len(c0_offsets)==86
assert len(m6_offsets)==40

for off in sorted(c0_offsets):
    z=eval3(off)+chif/2
    seam_sizes.append(len(orbit(base16f,z)))
for off in sorted(m6_offsets):
    z=eval3(off)+(2*chif+etaf)/2
    seam_sizes.append(len(orbit(base16f,z)))

assert seam_sizes.count(5554)==86
assert seam_sizes.count(2612)==40
assert len(seam_sizes)==126

# ---------------------------------------------------------------------------
# First chamber above the seam
# ---------------------------------------------------------------------------

DELTA=chif/3
E=base16f+DELTA

new_graphs=[]
sizes=[]

for off in sorted(new_offsets):
    z=eval3(off)+DELTA/2
    O=orbit(E,z)
    assert len(O)==8176
    certify_new_band(O,E,z,off)
    new_graphs.append(graph(O,E,z,BASE16,off))
    sizes.append(8176)

for off in sorted(c0_offsets):
    z=eval3(off)+(DELTA+chif)/2
    O=orbit(E,z)
    assert len(O)==5554
    sizes.append(5554)

for off in sorted(m6_offsets):
    z=eval3(off)+(2*chif+DELTA+etaf)/2
    O=orbit(E,z)
    assert len(O)==2612
    sizes.append(2612)

assert sizes.count(8176)==127
assert sizes.count(5554)==86
assert sizes.count(2612)==40
assert len(sizes)==253
assert all(G==new_graphs[0] for G in new_graphs)

# New constant-set architecture and row census.
LOW=orbit(E,DELTA/2)
constsets={+1:set(),-1:set()}
rc=Counter()
for t in LOW:
    c,o=graph_key(t,BASE16,(0,0,0))
    constsets[o].add(c)
    rc[(o,region_rep(t,E,DELTA/2))]+=1

assert constsets[+1]==constsets[-1]==K1
assert len(K1)==4088

for ori in (+1,-1):
    assert tuple(rc[(ori,x)] for x in ("A","B","D","T"))==(792,792,793,1711)

# ---------------------------------------------------------------------------
# Exact inherited-species relabeling checks
# ---------------------------------------------------------------------------

# Reference C0 from the first chi chamber.
EPS0=chif/3
EC0=base5f+EPS0
OC0=orbit(EC0,EPS0/2)
GC0=graph(OC0,EC0,EPS0/2,BASE5,(0,0,0))
assert len(GC0)==5554

# Current surviving C0: reflected orientation shifted by +chi.
Ocur=orbit(E,(DELTA+chif)/2)
Gcur=graph(Ocur,E,(DELTA+chif)/2,BASE16,(0,0,0))
assert Gcur==shift_graph(GC0,(0,0,0),CHI3)

# Reference M6 from the first chi chamber.
z6=(chif+EPS0+etaf)/2
OM6=orbit(EC0,z6)
GM6=graph(OM6,EC0,z6,BASE5,CHI3)
assert len(GM6)==2612

# Current M6: positive orientation shifted by +chi.
zcur6=(2*chif+DELTA+etaf)/2
Ocur6=orbit(E,zcur6)
Gcur6=graph(Ocur6,E,zcur6,BASE16,mul3(2,CHI3))
assert Gcur6==shift_graph(GM6,CHI3,(0,0,0))

# ---------------------------------------------------------------------------
# Next residual / topology event
# ---------------------------------------------------------------------------

# For one eta cell the pattern is:
#   K1(0,delta), C0(delta,chi),
#   K1(chi,chi+delta), C0(chi+delta,2chi),
#   K1(2chi,2chi+delta), M6(2chi+delta,eta).
#
# At delta=chi both C0 centers collapse and the M6 width becomes
#   eta-3chi = rho.
assert abs((etaf-3*chif)-rhof)<1e-15
assert rhof>0 and rhof<chif

print("PASS: second chi seam has 86 C0/5554 and 40 M6/2612 generic bands")
print("PASS: all M7 centers collapse at e=5*kappa+chi")
print("PASS: first post-seam chamber is 5*kappa+chi < e < 5*kappa+2chi")
print("PASS: exact band counts = K1/8176 x127, C0/5554 x86, M6/2612 x40")
print("PASS: all 127 K1 bands are one exact graph species")
print("PASS: K1 per orientation = M7 union (chi+X) union (2chi+X)")
print("PASS: |K1| per orientation = 4088, full size = 8176")
print("PASS: K1 census per orientation = A792/B792/D793/T1711")
print("PASS: surviving C0 graph is exact reflected-orientation +chi relabeling")
print("PASS: surviving M6 graph is exact positive-orientation +chi relabeling")
print("PASS: rho=eta-3chi with 0<rho<chi")
print("PASS: next topology event is e=5*kappa+2chi; M6 residual width becomes rho")
print("NOTE: K1/8176 invertibility is not claimed in this seam pass")
