#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-12.

Proves the finite eta-star wing architecture over every admissible level
before the next kappa collision.

Notation:
    kappa = k - 5 h
    lambda_ret = h - kappa
    eta_star = h - 5 kappa

Levels:
    e = lambda_ret + r*eta_star + delta.

Full levels r=0,...,6 use 0<delta<eta_star.
Level r=7 is truncated to
    0<delta<chi := kappa - 8 eta_star.

The verifier establishes:
  * exact arithmetic ceiling 8 eta_star < kappa < 9 eta_star;
  * exact collision endpoint lambda_ret + 7 eta_star + chi = 5 kappa;
  * the new level-r graph has per-orientation constant set
        P union (a eta_star + W, a=0,...,r),
    hence size 2*(186+160*(r+1));
  * exact row census
        A=67+31r, B=67+31r, D=68+31r, T=144+67r
    per orientation;
  * generic seed bands alternate between level r and level r-1 species,
    with the long residual bands always the certified 310 species;
  * exact affine chamber typing is valid throughout every admissible
    parameter polygon, not merely at sampled representatives.

No matrix invertibility beyond the already certified r=0,1,2 levels is
claimed here.
"""
from collections import Counter, deque
from math import log

# ---------------------------------------------------------------------------
# Exact affine arithmetic
# ---------------------------------------------------------------------------

Q5=(1,0,0,0,0); J5=(0,1,0,0,0); K5=(0,0,1,0,0)
E5=(0,0,0,1,0); Z5=(0,0,0,0,1)

def add5(a,b): return tuple(x+y for x,y in zip(a,b))
def sub5(a,b): return tuple(x-y for x,y in zip(a,b))
def mul5(n,a): return tuple(n*x for x in a)

R5=add5(Q5,J5)
S5=sub5(Q5,K5)
U5=add5(K5,E5)
W5=add5(mul5(2,Q5),E5)

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
R3=add3(Q3,J3)
S3=sub3(Q3,K3)
QS3=add3(Q3,S3)

def logcomb_sign(c):
    """Exact sign of aq*q+aj*j+ak*k by prime-power comparison."""
    aq,aj,ak=c
    # q=2log2-log3, j=-3log2+2log3, k=4log2-log3-log5
    e2=2*aq-3*aj+4*ak
    e3=-aq+2*aj-ak
    e5=-ak
    num=den=1
    for prime,expo in ((2,e2),(3,e3),(5,e5)):
        if expo>=0: num*=prime**expo
        else: den*=prime**(-expo)
    return (num>den)-(num<den)

# Exact ceiling:
# kappa-8 eta = log(2^1016*5^172 / 3^893) > 0
# 9 eta-kappa = log(3^1002 / (2^1140*5^193)) > 0
assert 2**1016 * 5**172 > 3**893
assert 3**1002 > 2**1140 * 5**193
assert logcomb_sign(CHI3)>0
assert logcomb_sign(sub3(ETA3,CHI3))>0

# lambda + 7 eta + chi = 5 kappa exactly.
assert add3(add3(LAM3,mul3(7,ETA3)),CHI3)==mul3(5,KAP3)

# ---------------------------------------------------------------------------
# Fixed h-chain body and backward wing
# ---------------------------------------------------------------------------

skeleton=[]
for n in range(6): skeleton.append(mul3(n,H3))
for n in range(6): skeleton.append(add3(P3,mul3(n,H3)))
skeleton.append(add3(P3,mul3(6,H3)))
for n in range(6): skeleton.append(add3(S3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(R3,mul3(n,H3)))
for n in range(6): skeleton.append(add3(QS3,mul3(n,H3)))
SSET=set(skeleton)
assert len(SSET)==31

bottoms={(0,0,0),P3,S3,R3,QS3}
tops={
    mul3(5,H3),
    add3(P3,mul3(6,H3)),
    add3(S3,mul3(5,H3)),
    add3(R3,mul3(5,H3)),
    add3(QS3,mul3(5,H3)),
}
caps={add3(c,H3) for c in tops}
assert len(bottoms)==len(caps)==5

PSET=set()
for n in range(0,6):
    PSET |= {add3(c,mul3(n,KAP3)) for c in SSET}

WING=set()
for n in range(-5,0):
    WING |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    WING |= {add3(c,mul3(n,KAP3)) for c in caps}

assert len(PSET)==186
assert len(WING)==160
assert not (PSET & WING)

# ---------------------------------------------------------------------------
# Numerical representatives only for orbit discovery
# ---------------------------------------------------------------------------

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf

assert 0<chif<etaf
assert 8*etaf<kapf<9*etaf
assert abs((lamf+7*etaf+chif)-5*kapf)<1e-14

def value(t,e,z):
    return t[0]*qf+t[1]*jf+t[2]*kf+t[3]*e+t[4]*z

def region_rep(t,e,z):
    x=value(t,e,z); u=kf+e; v=qf-jf+e; w=2*qf+e
    tol=1e-11
    if 0<x<u-tol: return "A"
    if u+tol<x<v-tol: return "B"
    if v+tol<x<qf-tol: return "D"
    if qf+tol<x<w-tol: return "T"
    raise AssertionError(("threshold",t,x,u,v,qf,w))

def source_targets(t,rg):
    if rg=="A":
        return (add5(t,R5),add5(t,S5),sub5(U5,t))
    if rg=="B":
        return (add5(t,R5),)
    if rg=="T":
        return (sub5(t,Q5),sub5(W5,t))
    return ()

def orbit(e,z):
    seen={Z5}; todo=deque([Z5])
    while todo:
        t=todo.popleft(); rg=region_rep(t,e,z)
        for s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s); todo.append(s)
    return seen

# ---------------------------------------------------------------------------
# Exact chamber-margin checker
# ---------------------------------------------------------------------------

def lsub(a,b):
    pa,da,za=a; pb,db,zb=b
    return (sub3(pa,pb),da-db,za-zb)

ZERO=((0,0,0),0,0)

def region_margins(t,rg,base3,offset3,after_delta):
    aq,aj,ak,ae,az=t
    pure=add3(add3((aq,aj,ak),mul3(ae,base3)),mul3(az,offset3))
    L=(pure,ae+(az if after_delta else 0),az)

    U=(add3(K3,base3),1,0)
    V=(add3(sub3(Q3,J3),base3),1,0)
    Q=(Q3,0,0)
    W=(add3(mul3(2,Q3),base3),1,0)

    if rg=="A": return (lsub(L,ZERO),lsub(U,L))
    if rg=="B": return (lsub(L,U),lsub(V,L))
    if rg=="D": return (lsub(L,V),lsub(Q,L))
    if rg=="T": return (lsub(L,Q),lsub(W,L))
    raise AssertionError(rg)

def sign_at(L,dv,zv):
    pure,cd,cz=L
    return logcomb_sign(add3(add3(pure,mul3(cd,dv)),mul3(cz,zv)))

def certify_canonical_band(r,mode):
    D=ETA3 if r<=6 else CHI3
    dval=etaf/2 if r<=6 else chif/2
    base3=add3(LAM3,mul3(r,ETA3))
    basef=lamf+r*etaf
    e=basef+dval

    if mode=="new":
        z=dval/2
        offset=(0,0,0)
        after=False
        verts=(((0,0,0),(0,0,0)),(D,(0,0,0)),(D,D))
    elif mode=="old":
        z=(dval+etaf)/2
        offset=(0,0,0)
        after=True
        verts=(
            ((0,0,0),(0,0,0)),
            ((0,0,0),ETA3),
            (D,(0,0,0)),
            (D,sub3(ETA3,D)),
        )
    elif mode=="long":
        gap=sub3(KAP3,mul3(r+1,ETA3))
        z=((r+1)*etaf+dval+kapf)/2
        offset=mul3(r+1,ETA3)
        after=True
        verts=(
            ((0,0,0),(0,0,0)),
            ((0,0,0),gap),
            (D,(0,0,0)),
            (D,sub3(gap,D)),
        )
    else:
        raise AssertionError(mode)

    O=orbit(e,z)
    for t in O:
        rg=region_rep(t,e,z)
        for M in region_margins(t,rg,base3,offset,after):
            signs=[sign_at(M,dv,zv) for dv,zv in verts]
            assert all(s>=0 for s in signs),(r,mode,t,rg,signs)
            assert any(s>0 for s in signs),(r,mode,t,rg,signs)
    return O,e,z,base3

# ---------------------------------------------------------------------------
# Canonical graph and relabeling
# ---------------------------------------------------------------------------

def graph_key(t,base3,offset3):
    aq,aj,ak,ae,az=t
    c=add3(add3((aq,aj,ak),mul3(ae,base3)),mul3(az,offset3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

def graph(O,e,z,base3,offset3):
    out={}
    for t in O:
        key=graph_key(t,base3,offset3)
        rg=region_rep(t,e,z)
        terms=[("one",key)]
        tg=[]
        if rg=="A":
            tg=[("b",add5(t,R5)),("d",add5(t,S5)),("rd",sub5(U5,t))]
        elif rg=="B":
            tg=[("b",add5(t,R5))]
        elif rg=="T":
            tg=[("m",sub5(t,Q5)),("rm",sub5(W5,t))]
        for lab,u in tg:
            terms.append((lab,graph_key(u,base3,offset3)))
        out[key]=(rg,tuple(terms))
    return out

def shift_graph(G,sp,sm):
    sh={+1:sp,-1:sm}; out={}
    for (c,o),(rg,terms) in G.items():
        key=(add3(c,sh[o]),o)
        nts=[]
        for lab,(d,oo) in terms:
            nts.append((lab,(add3(d,sh[oo]),oo)))
        out[key]=(rg,tuple(nts))
    return out

# Reference long 310 graph from r=0.
O0,e0,z0,b0=certify_canonical_band(0,"long")
G310=graph(O0,e0,z0,b0,ETA3)
assert len(G310)==310

level_graphs=[]

for r in range(8):
    Onew,enew,znew,base3=certify_canonical_band(r,"new")
    Oold,eold,zold,_=certify_canonical_band(r,"old")
    Olong,elong,zlong,_=certify_canonical_band(r,"long")

    Gnew=graph(Onew,enew,znew,base3,(0,0,0))
    level_graphs.append(Gnew)

    # Exact constant-set architecture.
    pred=set(PSET)
    for a in range(r+1):
        pred |= {add3(c,mul3(a,ETA3)) for c in WING}

    constsets={+1:set(),-1:set()}
    for t in Onew:
        c,o=graph_key(t,base3,(0,0,0))
        constsets[o].add(c)

    assert constsets[+1]==constsets[-1]==pred
    assert len(pred)==186+160*(r+1)
    assert len(Onew)==2*(186+160*(r+1))

    # Exact row census.
    rc=Counter((graph_key(t,base3,(0,0,0))[1],region_rep(t,enew,znew))
               for t in Onew)
    expected=(67+31*r,67+31*r,68+31*r,144+67*r)
    for ori in (+1,-1):
        got=tuple(rc[(ori,x)] for x in ("A","B","D","T"))
        assert got==expected

    # Intermediate band is the preceding level, with the reflected
    # orientation shifted by +eta_star.
    Gold=graph(Oold,eold,zold,base3,(0,0,0))
    if r>=1:
        assert Gold==shift_graph(level_graphs[r-1],(0,0,0),ETA3)
    else:
        assert len(Gold)==372  # G4 base case, certified in COCYCLE-9.

    # Long residual band is always the same 310 graph, with + orientation
    # shifted by r eta_star.
    Glong=graph(Olong,elong,zlong,base3,mul3(r+1,ETA3))
    assert Glong==shift_graph(G310,mul3(r,ETA3),(0,0,0))

    # Full representative band-size atlas.
    dval=etaf/2 if r<=6 else chif/2
    e=lamf+r*etaf+dval
    sizes=[]
    for m in range(5):
        for a in range(r+2):
            lo=m*kapf+a*etaf
            hi=lo+dval
            sizes.append(len(orbit(e,(lo+hi)/2)))
            if a<r+1:
                lo=hi
                hi=m*kapf+(a+1)*etaf
                sizes.append(len(orbit(e,(lo+hi)/2)))
        if m<4:
            lo=m*kapf+(r+1)*etaf+dval
            hi=(m+1)*kapf
            sizes.append(len(orbit(e,(lo+hi)/2)))

    newsize=2*(186+160*(r+1))
    oldsize=372 if r==0 else 2*(186+160*r)
    expected_sizes=[]
    for m in range(5):
        for a in range(r+2):
            expected_sizes.append(newsize)
            if a<r+1:
                expected_sizes.append(oldsize)
        if m<4:
            expected_sizes.append(310)

    assert sizes==expected_sizes
    assert len(sizes)==10*r+19

# Remaining uncertified species after COCYCLE-11.
assert [2*(186+160*(r+1)) for r in range(3,8)] == [
    1652,1972,2292,2612,2932
]

print("PASS: exact arithmetic ceiling 8 eta_star < kappa < 9 eta_star")
print("PASS: final truncated level ends exactly at e=5*kappa")
print("PASS: all admissible levels r=0..7 have the predicted wing constant sets")
print("PASS: |M_r| = 2*(186+160*(r+1))")
print("PASS: row census = (67+31r,67+31r,68+31r,144+67r) per orientation")
print("PASS: all canonical new/old/long chamber typings certified exactly")
print("PASS: seed atlas alternates M_r/M_{r-1}, with long G3=310")
print("PASS: full levels r=0..6; r=7 is truncated by chi=kappa-8 eta_star")
print("PASS: remaining new species sizes = 1652,1972,2292,2612,2932")
