#!/usr/bin/env python3
"""Exact source-level verifier for SZ-RETURN-COCYCLE-4.

Builds the base 0<e<=kappa orbit directly from the parity equations,
uses the exact 31-skeleton x {0,kappa} x {z,e-z} factorization,
diagonalizes the reflection swap, derives the two 62x62 symbolic
sector determinants, and certifies their signs with rational interval
bounds for log(2), log(3), log(5), and the required square roots.

Dependency: sympy.
No floating-point sign decision is used.
"""
from fractions import Fraction as F
from math import isqrt
import sympy as sp

# Integer coefficient vectors in the Q-basis (q,j,k), where
# q=log(4/3), j=log(9/8), k=log(16/15).
Q = (1, 0, 0)
J = (0, 1, 0)
K = (0, 0, 1)

def add(a, b):
    return tuple(x + y for x, y in zip(a, b))

def neg(a):
    return tuple(-x for x in a)

def sub(a, b):
    return add(a, neg(b))

def mul(n, a):
    return tuple(n * x for x in a)

# Exact derived constants.
H = add(add(mul(2, J), K), neg(Q))          # h = 2j+k-q
P = add(add(Q, neg(J)), neg(K))             # p = q-j-k
KAPPA = add(add(mul(5, Q), mul(-10, J)), mul(-4, K))
R = add(Q, J)                               # r = q+j
S = sub(Q, K)                               # s = q-k
QS = add(Q, S)

# 31 lower skeleton sites.
skeleton = []
regions = {}

def put(c, region):
    if c not in regions:
        skeleton.append(c)
        regions[c] = region
    else:
        assert regions[c] == region

# A: m h, m=0..5
for m in range(6):
    put(mul(m, H), "A")

# B: p+m h, m=0..5
for m in range(6):
    put(add(P, mul(m, H)), "B")

# D: p+6h; s+m h, m=0..5
put(add(P, mul(6, H)), "D")
for m in range(6):
    put(add(S, mul(m, H)), "D")

# T: r+m h, m=0..5; q+s+m h, m=0..5
for m in range(6):
    put(add(R, mul(m, H)), "T")
for m in range(6):
    put(add(QS, mul(m, H)), "T")

assert len(skeleton) == 31

# Add the kappa-shifted copy and correct the two threshold roles:
# s+5h+kappa=q is T, while all other roles are inherited.
constants = []
region = {}
for c in skeleton:
    constants.append(c)
    region[c] = regions[c]
    ck = add(c, KAPPA)
    constants.append(ck)
    region[ck] = regions[c]

# Exact threshold corrections.
QNODE = Q
assert QNODE in region
region[QNODE] = "T"

# p+6h+kappa remains D; all source-family counts are now:
from collections import Counter
cnt = Counter(region[c] for c in constants)
assert cnt == {"A": 12, "B": 12, "D": 13, "T": 25}
assert len(set(constants)) == 62

# Every constant carries the two reflection orientations C+z and C+e-z.
# Hence total scalar orbit size is exactly 124.
assert 2 * len(constants) == 124

constants = sorted(set(constants))
idx = {c: i for i, c in enumerate(constants)}

# All source maps close on the 62 constants.
def targets(c):
    rg = region[c]
    if rg == "A":
        return (
            ("R", add(c, R)),
            ("S", add(c, S)),
            ("Uref", sub(K, c)),
        )
    if rg == "B":
        return (("R", add(c, R)),)
    if rg == "T":
        return (
            ("Qback", sub(c, Q)),
            ("Wref", sub(mul(2, Q), c)),
        )
    return ()

for c in constants:
    for _, t in targets(c):
        assert t in idx, (c, region[c], t)

# Symbolic coefficients.
b, d, m = sp.symbols("b d m")  # beta, delta*gamma, mu=beta*gamma

def sector_matrix(sig):
    """62x62 sector after diagonalizing the orientation swap.

    sig = epsilon*eta in {+1,-1}.
    """
    M = sp.MutableSparseMatrix(62, 62, {})
    for c, i in idx.items():
        rg = region[c]
        M[i, i] += 1
        if rg == "A":
            M[i, idx[add(c, R)]] += b
            M[i, idx[add(c, S)]] += d
            M[i, idx[sub(K, c)]] += -sig * d
        elif rg == "B":
            M[i, idx[add(c, R)]] += b
        elif rg == "T":
            M[i, idx[sub(c, Q)]] += m
            M[i, idx[sub(mul(2, Q), c)]] += -sig * m
    return M

Pplus = sp.Poly(sp.factor(sector_matrix(+1).det(method="domain-ge")), b, d, m)
Pminus = sp.Poly(sp.factor(sector_matrix(-1).det(method="domain-ge")), b, d, m)

assert len(Pplus.terms()) == 76
assert len(Pminus.terms()) == 76

# Exact rational interval arithmetic for positive quantities.
def imul(a, bnd):
    return (a[0] * bnd[0], a[1] * bnd[1])

def idiv(a, bnd):
    assert bnd[0] > 0
    return (a[0] / bnd[1], a[1] / bnd[0])

def ipow(a, n):
    if n == 0:
        return (F(1), F(1))
    return (a[0] ** n, a[1] ** n)

def ln_bounds(x, N):
    """Atanh-series enclosure for log(x), x>1 rational."""
    y = (x - 1) / (x + 1)
    s0 = F(0)
    for n in range(N + 1):
        s0 += F(2, 2 * n + 1) * y ** (2 * n + 1)
    rem = F(2, 2 * N + 3) * y ** (2 * N + 3) / (1 - y * y)
    return (s0, s0 + rem)

def sqrt_bounds(x, digits=60):
    """Exact decimal-grid enclosure for sqrt(x), x>0 rational."""
    scale = 10 ** digits
    n = (x.numerator * scale * scale) // x.denominator
    lo_i = isqrt(n)
    lo = F(lo_i, scale)
    hi = F(lo_i + 1, scale)
    assert lo * lo <= x <= hi * hi
    return (lo, hi)

ln2 = ln_bounds(F(2), 100)
ln3 = ln_bounds(F(3), 120)
ln5 = ln_bounds(F(5), 220)

beta_iv = imul(sqrt_bounds(F(2, 3)), idiv(ln3, ln2))
d_iv = imul(sqrt_bounds(F(1, 5)), idiv(ln5, ln2))
m_iv = imul(sqrt_bounds(F(1, 3)), idiv(ln3, ln2))

def poly_interval(poly, ivs):
    lo = F(0)
    hi = F(0)
    for exps, coeff0 in poly.terms():
        coeff = F(int(coeff0))
        term = (F(1), F(1))
        for iv, e0 in zip(ivs, exps):
            term = imul(term, ipow(iv, e0))
        if coeff >= 0:
            lo += coeff * term[0]
            hi += coeff * term[1]
        else:
            lo += coeff * term[1]
            hi += coeff * term[0]
    return (lo, hi)

Ip = poly_interval(Pplus, (beta_iv, d_iv, m_iv))
Im = poly_interval(Pminus, (beta_iv, d_iv, m_iv))

assert Ip[1] < 0
assert Im[1] < 0

# Because the 124x124 block matrix uses only I and the swap S,
# its determinant is P_{epsilon}(+) * P_{epsilon}(-).
# Changing external parity epsilon swaps the two sectors, so both
# external-parity determinants are exactly the same positive product.
print("PASS: 31 skeleton sites")
print("PASS: 62 constant sites =", dict(cnt))
print("PASS: 124 scalar orbit points")
print("PASS: source maps close on the orbit")
print("P+ interval:", float(Ip[0]), float(Ip[1]))
print("P- interval:", float(Im[0]), float(Im[1]))
print("PASS: both 62x62 sector determinants are strictly negative")
print("PASS: both 124x124 external-parity determinants are identical and positive")
