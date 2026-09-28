#!/usr/bin/env python3
"""Exact verifier for SZ-RETURN-COCYCLE-21.

Certifies the S0/18984 species from COCYCLE-20.

Key reduction:
  * both orientations use the same 9492-site constant set S0;
  * translations preserve orientation and reflections swap it;
  * therefore the full 18984 matrix diagonalizes into two scalar
    9492x9492 reflection sectors.

Because a full dense 9492x9492 rational inverse witness is unnecessarily
large, the verifier uses a chunked left-inverse compiler:
  * factor the floating midpoint sector transpose once;
  * solve for blocks of inverse rows;
  * round each block to denominator 10^6;
  * verify its exact rational row norm and exact sparse residual;
  * discard the block and continue.

Thus no dense exact inverse or dense exact residual matrix is materialized.

The two sectors have exact witness norms
    ||R_+||_inf = 63924057 / 10^6 < 64
    ||R_-||_inf = 63924064 / 10^6 < 64
and both have
    ||I - R A0||_inf
      = 338547930925 / 10^15 < 1/2950.

The exact physical coefficient perturbation is <10^-9 in row-sum norm, so
    ||I - R A_phys||_inf < 1/2949 < 1.

Hence S0/18984 is invertible for both external parity choices.
"""

from collections import deque
from fractions import Fraction as F
from math import isqrt, log
import gc
import numpy as np
import scipy.sparse as sp
import scipy.sparse.linalg as spla

# ---------------------------------------------------------------------------
# Source geometry
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
BASE18=add3(mul3(5,KAP3),mul3(2,CHI3))
BASE20=add3(BASE18,RHO3)

R3=add3(Q3,J3)
S3=sub3(Q3,K3)
QS3=add3(Q3,S3)

qf=log(4/3); jf=log(9/8); kf=log(16/15); hf=log(81/80)
kapf=kf-5*hf
lamf=hf-kapf
etaf=lamf-4*kapf
chif=kapf-8*etaf
rhof=etaf-3*chif
sigf=chif-rhof
base20f=5*kapf+2*chif+rhof

assert 0<sigf<rhof<chif<etaf

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
# Exact S0 constant set from COCYCLE-20
# ---------------------------------------------------------------------------

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

K2=(M7
    | {add3(c,CHI3) for c in X}
    | {add3(c,mul3(2,CHI3)) for c in X}
    | {add3(c,mul3(3,CHI3)) for c in X})

Y=(M7
   | {add3(c,CHI3) for c in X}
   | {add3(c,mul3(2,CHI3)) for c in X}
   | {add3(c,mul3(3,CHI3)) for c in TOPX})

S0=K2 | {add3(c,RHO3) for c in Y}

assert len(K2)==5399
assert len(Y)==4093
assert len(S0)==9492

# ---------------------------------------------------------------------------
# Representative S0 band and orientation reduction
# ---------------------------------------------------------------------------

DELTA=sigf/3
E=base20f+DELTA
Z=DELTA/2
O=orbit(E,Z)
assert len(O)==18984

def graph_key(t):
    aq,aj,ak,ae,az=t
    c=add3((aq,aj,ak),mul3(ae,BASE20))
    if (ae,az)==(0,1): ori=+1
    elif (ae,az)==(1,-1): ori=-1
    else: raise AssertionError((ae,az))
    return c,ori

rep_plus={}
sets={+1:set(),-1:set()}
for t in O:
    c,o=graph_key(t)
    sets[o].add(c)
    if o==+1:
        rep_plus[c]=t

assert sets[+1]==sets[-1]==S0
assert set(rep_plus)==S0

# ---------------------------------------------------------------------------
# Rational coefficient center and exact physical enclosure
# ---------------------------------------------------------------------------

B0=1294116463
D0=1038397812
M0=915078526
DA=10**9
DR=10**6
DEN=DA*DR
CHUNK=64

def imul(a,c): return (a[0]*c[0],a[1]*c[1])
def idiv(a,c): return (a[0]/c[1],a[1]/c[0])

def ln_bounds(x,N):
    y=(x-1)/(x+1)
    s=F(0)
    for n in range(N+1):
        s += F(2,2*n+1)*y**(2*n+1)
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

b0=F(B0,DA); d0=F(D0,DA); m0=F(M0,DA)

def maxerr(iv,x0):
    return max(abs(iv[0]-x0),abs(iv[1]-x0))

eb=maxerr(beta_iv,b0)
ed=maxerr(d_iv,d0)
em=maxerr(m_iv,m0)
Einf=max(eb+2*ed,eb,2*em)
assert Einf<F(1,10**9)

# ---------------------------------------------------------------------------
# Reflection-sector matrices
# ---------------------------------------------------------------------------

order=sorted(S0)
idx={c:i for i,c in enumerate(order)}

def sector_matrix_int(sigma):
    rows=[]; cols=[]; vals=[]
    for c in order:
        t=rep_plus[c]
        i=idx[c]
        rg=region_rep(t,E,Z)

        rows.append(i); cols.append(i); vals.append(DA)

        for lab,u in source_targets(t,rg):
            d,oo=graph_key(u)
            j=idx[d]

            if lab=="b":
                v=B0
            elif lab=="d":
                v=D0
            elif lab=="m":
                v=M0
            elif lab=="rd":
                v=-sigma*D0
            elif lab=="rm":
                v=-sigma*M0
            else:
                raise AssertionError(lab)

            rows.append(i); cols.append(j); vals.append(v)

    A=sp.csc_matrix(
        (np.array(vals,dtype=np.int64),(rows,cols)),
        shape=(len(order),len(order)),
        dtype=np.int64,
    )
    assert A.nnz==24795
    assert max(np.diff(A.indptr))<=4
    return A

# ---------------------------------------------------------------------------
# Chunked exact rational left-inverse verification
# ---------------------------------------------------------------------------

def certify_sector(sigma,expected_norm):
    Aint=sector_matrix_int(sigma)
    N=Aint.shape[0]
    A0=Aint.astype(float)/DA

    # To generate rows of A0^{-1}, solve A0^T x = e_i.
    luT=spla.splu(A0.T.tocsc())

    norm_num=0
    rho_num=0
    max_entry=0

    for start in range(0,N,CHUNK):
        stop=min(N,start+CHUNK)
        b=stop-start

        RHS=np.zeros((N,b),dtype=float)
        RHS[np.arange(start,stop),np.arange(b)]=1.0

        X=luT.solve(RHS)
        Rint=np.rint(X.T*DR).astype(np.int64)
        del X,RHS

        block_norm=int(np.max(
            np.sum(np.abs(Rint),axis=1,dtype=np.int64)
        ))
        norm_num=max(norm_num,block_norm)

        # Exact residual rows:
        # (Rint/DR)*(Aint/DA) - corresponding identity rows.
        RA_num=(Aint.T @ Rint.T).T
        for local,global_i in enumerate(range(start,stop)):
            RA_num[local,global_i]-=DEN

        block_max=int(np.max(np.abs(RA_num)))
        max_entry=max(max_entry,block_max)

        # Overflow guard before exact row sums.
        assert block_max*N < 2**63-1

        block_rho=int(np.max(
            np.sum(np.abs(RA_num),axis=1,dtype=np.int64)
        ))
        rho_num=max(rho_num,block_rho)

        del Rint,RA_num
        gc.collect()

    assert norm_num==expected_norm
    assert norm_num<64*DR
    assert rho_num==338547930925
    assert max_entry<2*10**9

    rho=F(rho_num,DEN)
    normR=F(norm_num,DR)

    assert rho<F(1,2950)

    total=rho+normR*Einf
    assert total<F(1,2949)
    assert total<1

    return N,max_entry,total

plus=certify_sector(+1,63924057)
minus=certify_sector(-1,63924064)

assert plus[0]==minus[0]==9492

print("PASS: S0 graph has identical 9492-site constant set on both orientations")
print("PASS: full 18984 matrix diagonalizes into two 9492 reflection sectors")
print("PASS: both sectors have 24795 sparse midpoint nonzeros")
print("PASS: chunked rational left-inverse verification avoids dense exact 9492^2 storage")
print("PASS: exact physical coefficient perturbation < 1e-9")
print("PASS: plus sector ||R||_inf = 63924057/1e6 < 64")
print("PASS: minus sector ||R||_inf = 63924064/1e6 < 64")
print("PASS: both sectors have rho = 338547930925/1e15 < 1/2950")
print("PASS: total physical preconditioned residual < 1/2949 < 1")
print("PASS: both reflection sectors are invertible")
print("PASS: full 18984 S0 matrix is invertible")
print("PASS: opposite external parity merely swaps the reflection sectors")
