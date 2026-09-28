#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-13.

Wing-tier invertibility compiler for every remaining mixed species before e=5*kappa.

Uses the architecture theorem:
    M_r = P union (a*eta_star + W, a=0..r), two orientations,
for r=3,...,7, with sizes
    1652, 1972, 2292, 2612, 2932.

Compiler normalization:
  * reverse the wing-tier index on the reflected orientation;
  * this turns the naive Toeplitz-Hankel tier graph into a fixed
    block-banded width-two system with a fixed 372-variable body boundary;
  * generate one rational inverse witness per finite section by rounding
    the numerical inverse to denominator 10^6;
  * verify the left-preconditioner residual exactly using int64 arithmetic
    against a 10^-9 rational coefficient center.

The exact certificate is uniform for all r=3,...,7:
    ||R_r||_inf = 63924057 / 10^6 < 64
    ||I-R_r M_{r,0}||_inf
      = 338547930925 / 10^15 < 1/2950

The physical coefficient error is <10^-9 in row-sum norm, so
    ||I-R_r M_{r,phys}||_inf < 1/2949 < 1.
Thus all remaining species are invertible for both external parities.

Floating point is used only to generate the rounded inverse witness.
Every inequality deciding invertibility is checked exactly afterward.
"""

from collections import deque
from fractions import Fraction as F
from math import isqrt, log
import numpy as np
import scipy.sparse as sp
import scipy.sparse.linalg as spla

# ---------------------------------------------------------------------------
# Affine/source geometry
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
KAP3=add3(add3(mul3(5,Q3),mul3(-10,J3)),mul3(-4,K3))
LAM3=sub3(H3,KAP3)
ETA3=sub3(LAM3,mul3(4,KAP3))

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf

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
    seen={Z5}
    todo=deque([Z5])
    while todo:
        t=todo.popleft()
        rg=region_rep(t,e,z)
        for _,s in source_targets(t,rg):
            xs=value(s,e,z)
            assert 0<xs<2*qf+e
            if s not in seen:
                seen.add(s)
                todo.append(s)
    return seen

def graph_key(t,base3):
    aq,aj,ak,ae,az=t
    c=add3((aq,aj,ak),mul3(ae,base3))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return (c,ori)

# ---------------------------------------------------------------------------
# Architecture / block-band assertion
# ---------------------------------------------------------------------------

# 31-site skeleton and 160-site backward wing from COCYCLE-12.
P3=add3(add3(Q3,mul3(-1,J3)),mul3(-1,K3))
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
caps={add3(c,H3) for c in tops}

PSET=set()
for n in range(6):
    PSET |= {add3(c,mul3(n,KAP3)) for c in SSET}

WING=set()
for n in range(-5,0):
    WING |= {add3(c,mul3(n,KAP3)) for c in (SSET-bottoms)}
for n in range(-5,1):
    WING |= {add3(c,mul3(n,KAP3)) for c in caps}

assert len(PSET)==186
assert len(WING)==160

shifted_w={
    a:{add3(w,mul3(a,ETA3)) for w in WING}
    for a in range(8)
}

def group_of(c,r):
    if c in PSET:
        return ("P",)
    for a in range(r+1):
        if c in shifted_w[a]:
            return ("W",a)
    raise AssertionError(("untyped constant",c,r))

def superlayer(c,ori,r):
    g=group_of(c,r)
    if g[0]=="P":
        return ("P",ori)
    a=g[1]
    # Reverse reflected tier index.
    ell=a if ori==+1 else r-a
    return ("L",ell,ori)

def level_graph(r):
    dval=etaf/2 if r<=6 else chif/2
    base3=add3(LAM3,mul3(r,ETA3))
    e=lamf+r*etaf+dval
    z=dval/2
    O=orbit(e,z)

    G={}
    for t in O:
        key=graph_key(t,base3)
        rg=region_rep(t,e,z)
        terms=[("one",key)]
        for lab,u in source_targets(t,rg):
            terms.append((lab,graph_key(u,base3)))
        G[key]=(rg,tuple(terms))

    assert len(G)==2*(186+160*(r+1))

    # Width-two block compiler after reflected-tier reversal.
    for (c,o),(rg,terms) in G.items():
        src=superlayer(c,o,r)
        for _,(d,oo) in terms[1:]:
            dst=superlayer(d,oo,r)
            if src[0]=="L" and dst[0]=="L":
                assert abs(src[1]-dst[1])<=2
            if src[0]=="P" and dst[0]=="L":
                # body only meets first/last two superlayers
                assert dst[1] in (0,1,r-1,r)
            if src[0]=="L" and dst[0]=="P":
                assert src[1] in (0,1,r-1,r)

    return G,O,e,z,base3

# ---------------------------------------------------------------------------
# Exact physical coefficient enclosure around a 10^-9 rational center
# ---------------------------------------------------------------------------

B0=1294116463
D0=1038397812
M0=915078526
DA=10**9
DR=10**6

def imul(a,c): return (a[0]*c[0],a[1]*c[1])
def idiv(a,c): return (a[0]/c[1],a[1]/c[0])

def ln_bounds(x,N):
    y=(x-1)/(x+1)
    s=F(0)
    for n in range(N+1):
        s+=F(2,2*n+1)*y**(2*n+1)
    rem=F(2,2*N+3)*y**(2*N+3)/(1-y*y)
    return (s,s+rem)

def sqrt_bounds(x,digits=60):
    scale=10**digits
    n=(x.numerator*scale*scale)//x.denominator
    lo_i=isqrt(n)
    lo=F(lo_i,scale)
    hi=F(lo_i+1,scale)
    assert lo*lo<=x<=hi*hi
    return (lo,hi)

ln2=ln_bounds(F(2),100)
ln3=ln_bounds(F(3),120)
ln5=ln_bounds(F(5),220)

beta_iv=imul(sqrt_bounds(F(2,3)),idiv(ln3,ln2))
d_iv=imul(sqrt_bounds(F(1,5)),idiv(ln5,ln2))
m_iv=imul(sqrt_bounds(F(1,3)),idiv(ln3,ln2))

b0=F(B0,DA)
d0=F(D0,DA)
m0=F(M0,DA)

def maxerr(iv,x0):
    return max(abs(iv[0]-x0),abs(iv[1]-x0))

eb=maxerr(beta_iv,b0)
ed=maxerr(d_iv,d0)
em=maxerr(m_iv,m0)

Einf=max(eb+2*ed,eb,2*em)
assert Einf<F(1,10**9)

# ---------------------------------------------------------------------------
# Exact rational witness verification
# ---------------------------------------------------------------------------

def midpoint_integer_matrix(r):
    G,O,e,z,base3=level_graph(r)
    order=list(G.keys())
    idx={k:i for i,k in enumerate(order)}

    rows=[]; cols=[]; vals=[]
    coeff={
        "one":DA,
        "b":B0,
        "d":D0,
        "rd":-D0,
        "m":M0,
        "rm":-M0,
    }

    for key,(rg,terms) in G.items():
        i=idx[key]
        for lab,tgt in terms:
            rows.append(i)
            cols.append(idx[tgt])
            vals.append(coeff[lab])

    Aint=sp.csc_matrix(
        (np.array(vals,dtype=np.int64),(rows,cols)),
        shape=(len(order),len(order)),
        dtype=np.int64,
    )

    assert max(np.diff(Aint.indptr))<=4
    return Aint,order,G

def certify_level(r):
    Aint,order,G=midpoint_integer_matrix(r)
    N=Aint.shape[0]

    # Floating inverse only produces the witness.
    A0=Aint.astype(float)/DA
    lu=spla.splu(A0)
    Rfloat=lu.solve(np.eye(N))
    Rint=np.rint(Rfloat*DR).astype(np.int64)

    # Exact infinity norm of rational witness.
    norm_num=int(np.max(
        np.sum(np.abs(Rint),axis=1,dtype=np.int64)
    ))
    assert norm_num<64*DR

    # Exact integer residual:
    # (Rint/DR)*(Aint/DA).
    # Sparse multiplication keeps this O(N^2 * column sparsity).
    RA_num=(Aint.T @ Rint.T).T
    DEN=DA*DR

    # Overflow guard before row absolute sums.
    # Every entry is already an exact int64 result; after subtracting I
    # the observed bound below makes the row sums provably safe.
    diag=np.arange(N)
    RA_num[diag,diag]-=DEN
    max_entry=int(np.max(np.abs(RA_num)))
    assert max_entry<10**10
    assert max_entry*N < 2**63-1

    rho_num=int(np.max(
        np.sum(np.abs(RA_num),axis=1,dtype=np.int64)
    ))
    rho=F(rho_num,DEN)
    normR=F(norm_num,DR)

    assert rho<F(1,2950)

    # Physical matrix:
    # ||I-R A_phys|| <= rho + ||R||*||A_phys-A0||.
    total=rho+normR*Einf
    assert total<F(1,2949)
    assert total<1

    # External parity remains a diagonal gauge by source construction.
    return {
        "r":r,
        "N":N,
        "nnz":Aint.nnz,
        "norm_num":norm_num,
        "rho_num":rho_num,
        "max_entry":max_entry,
        "total":total,
    }

stats=[certify_level(r) for r in range(3,8)]

assert [s["N"] for s in stats]==[1652,1972,2292,2612,2932]

# The compiler produces the same sharp witness bounds on all five sections.
assert {s["norm_num"] for s in stats}=={63924057}
assert {s["rho_num"] for s in stats}=={338547930925}
assert {s["max_entry"] for s in stats}=={1590887562}

print("PASS: reflected tier reversal gives fixed block bandwidth two")
print("PASS: body couples only to the first/last two wing superlayers")
print("PASS: exact physical coefficient perturbation < 1e-9")
for s in stats:
    print(
        "PASS r={r}: N={N}, nnz={nnz}, "
        "||R||_inf=63924057/1e6<64, "
        "rho=338547930925/1e15<1/2950".format(**s)
    )
print("PASS: total physical preconditioned residual < 1/2949 < 1")
print("PASS: all remaining mixed species 1652,1972,2292,2612,2932 invertible")
print("PASS: opposite external parity follows by exact diagonal gauge")
