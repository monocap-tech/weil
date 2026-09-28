#!/usr/bin/env python3
"""Exact source-level verifier for SZ-RETURN-COCYCLE-5.

Certifies the first extra-kappa-return chamber
    e = kappa + eta, 0 < eta < kappa.

It proves the exact seed split:
    0 < z < eta       -> 186-variable edge orbit,
    eta < z < kappa   -> 124-variable middle orbit,
    kappa < z < e     -> reflected 186-variable edge orbit.

The middle orbit is row-for-row isomorphic to the already reconstructed
SZ-RETURN-COCYCLE-4 base system.

For the 186 edge system, the verifier proves:
  * exact affine-orbit closure;
  * 93+93 orientation split;
  * exact external-parity gauge equivalence;
  * exact rational midpoint determinant < -1600;
  * exact midpoint inverse infinity norm < 63;
  * actual coefficient perturbation infinity norm < 10^-12;
  * hence, by a Neumann argument, the physical 186 matrix is invertible
    for both external parities.

No floating-point sign decision is used for the determinant/invertibility
certificate. Floating evaluation is used only to seed the finite orbit;
the resulting region typing is then certified over the entire chamber by
exact prime-power comparisons at the vertices of the relevant parameter
polygons.
"""
from collections import Counter, deque
from fractions import Fraction as F
from math import isqrt, log
import sympy as sp

# ---------------------------------------------------------------------------
# Integer affine coordinates
# ---------------------------------------------------------------------------

# A point is (aq,aj,ak,ae,az) representing
# aq*q + aj*j + ak*k + ae*e + az*z.
Q5 = (1, 0, 0, 0, 0)
J5 = (0, 1, 0, 0, 0)
K5 = (0, 0, 1, 0, 0)
E5 = (0, 0, 0, 1, 0)
Z5 = (0, 0, 0, 0, 1)

def add5(a, b):
    return tuple(x + y for x, y in zip(a, b))

def neg5(a):
    return tuple(-x for x in a)

def sub5(a, b):
    return add5(a, neg5(b))

def mul5(n, a):
    return tuple(n * x for x in a)

R5 = add5(Q5, J5)
S5 = sub5(Q5, K5)
U5 = add5(K5, E5)
V5 = add5(sub5(Q5, J5), E5)
W5 = add5(mul5(2, Q5), E5)

# q,j,k-only coordinates.
Q3 = (1, 0, 0)
J3 = (0, 1, 0)
K3 = (0, 0, 1)

def add3(a, b):
    return tuple(x + y for x, y in zip(a, b))

def sub3(a, b):
    return tuple(x - y for x, y in zip(a, b))

def mul3(n, a):
    return tuple(n * x for x in a)

H3 = add3(add3(mul3(2, J3), K3), mul3(-1, Q3))
P3 = add3(add3(Q3, mul3(-1, J3)), mul3(-1, K3))
KAP3 = add3(add3(mul3(5, Q3), mul3(-10, J3)), mul3(-4, K3))
R3 = add3(Q3, J3)
S3 = sub3(Q3, K3)
QS3 = add3(Q3, S3)

# 31-site skeleton from the base chamber.
skeleton = []
for n in range(6):
    skeleton.append(mul3(n, H3))
for n in range(6):
    skeleton.append(add3(P3, mul3(n, H3)))
skeleton.append(add3(P3, mul3(6, H3)))
for n in range(6):
    skeleton.append(add3(S3, mul3(n, H3)))
for n in range(6):
    skeleton.append(add3(R3, mul3(n, H3)))
for n in range(6):
    skeleton.append(add3(QS3, mul3(n, H3)))
assert len(set(skeleton)) == 31
skeleton = tuple(dict.fromkeys(skeleton))

# ---------------------------------------------------------------------------
# Numerical representative only for orbit discovery
# ---------------------------------------------------------------------------

qf = log(4 / 3)
jf = log(9 / 8)
kf = log(16 / 15)
kapf = kf - 5 * log(81 / 80)

def value(t, e, z):
    return t[0]*qf + t[1]*jf + t[2]*kf + t[3]*e + t[4]*z

def region_rep(t, e, z):
    x = value(t, e, z)
    u = kf + e
    v = qf - jf + e
    w = 2*qf + e
    tol = 1e-11
    if 0 < x < u - tol:
        return "A"
    if u + tol < x < v - tol:
        return "B"
    if v + tol < x < qf - tol:
        return "D"
    if qf + tol < x < w - tol:
        return "T"
    raise AssertionError(("representative on/near threshold", t, x, u, v, qf, w))

def source_targets(t, rg):
    if rg == "A":
        return (add5(t, R5), add5(t, S5), sub5(U5, t))
    if rg == "B":
        return (add5(t, R5),)
    if rg == "T":
        return (sub5(t, Q5), sub5(W5, t))
    return ()

def orbit(e, z):
    seen = {Z5}
    todo = deque([Z5])
    while todo:
        t = todo.popleft()
        rg = region_rep(t, e, z)
        for s in source_targets(t, rg):
            xs = value(s, e, z)
            assert 0 < xs < 2*qf + e
            if s not in seen:
                seen.add(s)
                todo.append(s)
    return seen

# Choose one representative in each seed band.
# kappa ~= 0.0024259, eta = e-kappa ~= 0.0010741.
E_REP = 0.0035
Z_LOW = 0.0005
Z_MID = 0.0018
Z_HIGH = E_REP - Z_LOW

low = orbit(E_REP, Z_LOW)
mid = orbit(E_REP, Z_MID)
high = orbit(E_REP, Z_HIGH)

assert len(low) == 186
assert len(mid) == 124
assert len(high) == 186

# ---------------------------------------------------------------------------
# Exact chamber topology certification
# ---------------------------------------------------------------------------

# q = 2 log2 - log3
# j = -3 log2 + 2 log3
# k = 4 log2 - log3 - log5
def logcomb_sign(c):
    """Exact sign of aq*q+aj*j+ak*k using integer prime powers."""
    aq, aj, ak = c
    e2 = 2*aq - 3*aj + 4*ak
    e3 = -aq + 2*aj - ak
    e5 = -ak
    num = 1
    den = 1
    for prime, expo in ((2, e2), (3, e3), (5, e5)):
        if expo >= 0:
            num *= prime**expo
        else:
            den *= prime**(-expo)
    return (num > den) - (num < den)

def subst_eta_z(t):
    aq, aj, ak, ae, az = t
    pure = add3((aq, aj, ak), mul3(ae, KAP3))
    # e = kappa + eta
    return (pure, ae, az)

def lsub(a, b):
    pa, ea, za = a
    pb, eb, zb = b
    return (sub3(pa, pb), ea-eb, za-zb)

ZERO = ((0,0,0), 0, 0)
QLIN = (Q3, 0, 0)
ULIN = (add3(K3, KAP3), 1, 0)
VLIN = (add3(sub3(Q3, J3), KAP3), 1, 0)
WLIN = (add3(mul3(2, Q3), KAP3), 1, 0)

def margins(t, rg):
    T = subst_eta_z(t)
    if rg == "A":
        return (lsub(T, ZERO), lsub(ULIN, T))
    if rg == "B":
        return (lsub(T, ULIN), lsub(VLIN, T))
    if rg == "D":
        return (lsub(T, VLIN), lsub(QLIN, T))
    if rg == "T":
        return (lsub(T, QLIN), lsub(WLIN, T))
    raise AssertionError(rg)

# Parameter polygons after scaling eta,z by kappa:
# low:  0 <= z <= eta <= kappa
# mid:  0 <= eta <= z <= kappa
LOW_VERTS = ((0,0), (1,0), (1,1))
MID_VERTS = ((0,0), (0,1), (1,1))

def vertex_sign(L, vertex):
    pure, ce, cz = L
    ae, az = vertex
    c = add3(pure, mul3(ce*ae + cz*az, KAP3))
    return logcomb_sign(c)

def certify_regions(orb, e, z, vertices):
    for t in orb:
        rg = region_rep(t, e, z)
        for L in margins(t, rg):
            signs = [vertex_sign(L, v) for v in vertices]
            assert all(s >= 0 for s in signs), (t, rg, signs)
            assert any(s > 0 for s in signs), (t, rg, signs)

certify_regions(low, E_REP, Z_LOW, LOW_VERTS)
certify_regions(mid, E_REP, Z_MID, MID_VERTS)

# High seed band is exactly the z -> e-z image of the low band.
def seed_reflect(t):
    aq, aj, ak, ae, az = t
    return (aq, aj, ak, ae + az, -az)

assert {seed_reflect(t) for t in low} == high

# ---------------------------------------------------------------------------
# Exact layer architecture
# ---------------------------------------------------------------------------

def canonical_constant(t):
    aq, aj, ak, ae, az = t
    if ae == 0 and az == 1:
        return (aq, aj, ak), +1
    if ae == 1 and az == -1:
        return (aq, aj, ak), -1
    raise AssertionError(("unexpected affine orientation", t))

low_sets = {+1:set(), -1:set()}
for t in low:
    c, ori = canonical_constant(t)
    low_sets[ori].add(c)

layers = {
    n: {add3(c, mul3(n, KAP3)) for c in skeleton}
    for n in (-1,0,1,2)
}

assert low_sets[+1] == layers[0] | layers[1] | layers[2]
assert low_sets[-1] == layers[-1] | layers[0] | layers[1]
assert len(low_sets[+1]) == len(low_sets[-1]) == 93

# Middle seed band is exactly the old base 31 x {0,kappa} x 2 architecture.
mid_sets = {+1:set(), -1:set()}
for t in mid:
    c, ori = canonical_constant(t)
    mid_sets[ori].add(c)
base_constants = layers[0] | layers[1]
assert mid_sets[+1] == base_constants
assert mid_sets[-1] == base_constants

# ---------------------------------------------------------------------------
# Matrix assembly
# ---------------------------------------------------------------------------

b, d, m = sp.symbols("b d m")  # beta, delta*gamma, mu

def symbolic_matrix(orb, e, z, eps):
    order = sorted(orb)
    idx = {t:i for i,t in enumerate(order)}
    M = sp.MutableSparseMatrix(len(order), len(order), {})
    for t, i in idx.items():
        rg = region_rep(t, e, z)
        M[i,i] += 1
        if rg == "A":
            M[i,idx[add5(t,R5)]] += b
            M[i,idx[add5(t,S5)]] += d
            M[i,idx[sub5(U5,t)]] += -eps*d
        elif rg == "B":
            M[i,idx[add5(t,R5)]] += b
        elif rg == "T":
            M[i,idx[sub5(t,Q5)]] += m
            M[i,idx[sub5(W5,t)]] += -eps*m
    return M, order

Mplus, order = symbolic_matrix(low, E_REP, Z_LOW, +1)

# External parity is a diagonal gauge: translations preserve az, reflections flip it.
G = sp.diag(*[1 if t[4] == 1 else -1 for t in order])
Mminus, order_minus = symbolic_matrix(low, E_REP, Z_LOW, -1)
assert order_minus == order
assert Mminus == G * Mplus * G

# Middle system is row-for-row the base architecture under canonical pairing.
def abstract_rows(orb, e, z):
    rows = {}
    for t in orb:
        key = canonical_constant(t)
        rg = region_rep(t, e, z)
        terms = [("one", key)]
        if rg == "A":
            terms += [
                ("b", canonical_constant(add5(t,R5))),
                ("d", canonical_constant(add5(t,S5))),
                ("refl_d", canonical_constant(sub5(U5,t))),
            ]
        elif rg == "B":
            terms += [("b", canonical_constant(add5(t,R5)))]
        elif rg == "T":
            terms += [
                ("m", canonical_constant(sub5(t,Q5))),
                ("refl_m", canonical_constant(sub5(W5,t))),
            ]
        rows[key] = (rg, tuple(terms))
    return rows

# Build one base representative 0<e<kappa.
base = orbit(0.0015, 0.0004)
assert len(base) == 124
assert abstract_rows(mid, E_REP, Z_MID) == abstract_rows(base, 0.0015, 0.0004)

# ---------------------------------------------------------------------------
# Exact coefficient enclosures
# ---------------------------------------------------------------------------

def imul(a, c):
    return (a[0]*c[0], a[1]*c[1])

def idiv(a, c):
    assert c[0] > 0
    return (a[0]/c[1], a[1]/c[0])

def ln_bounds(x, N):
    y = (x-1)/(x+1)
    s = F(0)
    for n in range(N+1):
        s += F(2,2*n+1) * y**(2*n+1)
    rem = F(2,2*N+3) * y**(2*N+3) / (1-y*y)
    return (s, s+rem)

def sqrt_bounds(x, digits=60):
    scale = 10**digits
    n = (x.numerator * scale * scale)//x.denominator
    lo_i = isqrt(n)
    lo = F(lo_i, scale)
    hi = F(lo_i+1, scale)
    assert lo*lo <= x <= hi*hi
    return (lo,hi)

ln2 = ln_bounds(F(2),100)
ln3 = ln_bounds(F(3),120)
ln5 = ln_bounds(F(5),220)

beta_iv = imul(sqrt_bounds(F(2,3)), idiv(ln3,ln2))
d_iv = imul(sqrt_bounds(F(1,5)), idiv(ln5,ln2))
m_iv = imul(sqrt_bounds(F(1,3)), idiv(ln3,ln2))

# 12-decimal rational midpoint matrix.
b0 = F(1294116462737, 10**12)
d0 = F(1038397811807, 10**12)
m0 = F(915078526447, 10**12)

def maxerr(iv, x0):
    return max(abs(iv[0]-x0), abs(iv[1]-x0))

eb = maxerr(beta_iv, b0)
ed = maxerr(d_iv, d0)
em = maxerr(m_iv, m0)

# Every A row has coefficient perturbation <= eb+2ed;
# every B row <= eb; every T row <= 2em.
Einf = max(eb+2*ed, eb, 2*em)
assert Einf < F(1,10**12)

Mr = Mplus.subs({
    b: sp.Rational(b0.numerator,b0.denominator),
    d: sp.Rational(d0.numerator,d0.denominator),
    m: sp.Rational(m0.numerator,m0.denominator),
})

det0 = Mr.det(method="domain-ge")
assert det0 < -1600

# Exact inverse infinity norm.
Minv = Mr.inv(method="DM")
norm_inf = max(
    sum(abs(Minv[i,j]) for j in range(Minv.cols))
    for i in range(Minv.rows)
)
assert norm_inf < 63

# Neumann certificate:
# ||Mr^{-1}(Mphysical-Mr)||_inf <= ||Mr^{-1}||_inf * Einf < 1.
neumann = norm_inf * sp.Rational(Einf.numerator,Einf.denominator)
assert neumann < sp.Rational(63,10**12)
assert neumann < 1

print("PASS: first extra-return chamber topology certified exactly")
print("PASS: seed split = 186 / 124 / reflected 186")
print("PASS: low edge = 93+93 orientation variables")
print("PASS: middle band is exactly the old 124-row assembler")
print("PASS: external parity is diagonal-gauge equivalent")
print("PASS: rational midpoint determinant < -1600")
print("PASS: exact midpoint inverse infinity norm < 63")
print("PASS: physical coefficient perturbation infinity norm < 1e-12")
print("PASS: Neumann product < 63e-12 < 1")
print("PASS: physical 186 edge system invertible for both external parities")
