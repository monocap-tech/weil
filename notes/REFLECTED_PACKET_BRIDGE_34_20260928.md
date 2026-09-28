# RPB-34 — Screw-kernel crossing form on `ker G_{c_*}`

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / DIAGONAL KERNEL CROSSING FORM VANISHES IDENTICALLY / SIGN CHANGE CAN ONLY ENTER THROUGH COLLAR LEAKAGE OR COMPACT-TAIL ESCAPE**  
**Dependencies:** RPB-32, RPB-33; Suzuki's projected screw realization (G_a=P_aGP_a).  
**Promotion status:** none.

## 0. Objective

RPB-33 showed that the actual neutral edge is already visible in the projected
screw kernel:

```math
G_{c_*}\succeq0,
\qquad
\ker G_{c_*}\ne\{0\},
```

while for every sufficiently close strict right enlargement

```math
G_a\not\succeq0.
```

RPB-34 asks whether the immediate loss of positivity is detected by a negative
crossing form on the endpoint kernel itself.

It is not.

In the natural support-filtration coordinates the entire old compression is
exactly stationary:

```math
\boxed{
J_{c,a}^*G_aJ_{c,a}=G_c.
}
```

Therefore the diagonal quadratic form on the transported endpoint kernel is
identically zero for every (a>c).

The only kernel-driven mechanism is off-diagonal leakage into the newly
available collar.

---

## 1. Nested zero-mean carriers

For (0<c<a), set

```math
H_c
=
L_0^2(-c,c),
\qquad
H_a
=
L_0^2(-a,a).
```

Let

```math
J_{c,a}:H_c\to H_a
```

be zero extension.

Since every (u\in H_c) has zero integral on ((-c,c)), its zero extension
also has zero integral on ((-a,a)), so the map is well-defined and isometric.

Suzuki's projected screw operators are

```math
G_r
=
P_rGP_r,
```

where (P_r) is the orthogonal projection onto (H_r).

---

## 2. Exact compression identity

Take (u,v\in H_c).

Because (J_{c,a}u,J_{c,a}v\in H_a),

```math
P_aJ_{c,a}u
=
J_{c,a}u,
\qquad
P_aJ_{c,a}v
=
J_{c,a}v.
```

Hence

```math
\begin{aligned}
\langle
G_aJ_{c,a}u,
J_{c,a}v
\rangle_{H_a}
&=
\langle
P_aGP_aJ_{c,a}u,
J_{c,a}v
\rangle
\\
&=
\langle
GJ_{c,a}u,
J_{c,a}v
\rangle.
\end{aligned}
```

The vectors are supported in ((-c,c)), so the same whole-line convolution
pairing equals

```math
\langle
Gu,v
\rangle
=
\langle
G_cu,v
\rangle_{H_c}.
```

Therefore

```math
\boxed{
J_{c,a}^{*}
G_a
J_{c,a}
=
G_c.
}
```

This identity is exact for every (a>c).

No differentiability in (a) is used.

---

## 3. Consequence on the neutral screw kernel

Let

```math
N_c
=
\ker G_c.
```

For (u\in N_c) and arbitrary (v\in H_c),

```math
\langle
G_aJ_{c,a}u,
J_{c,a}v
\rangle
=
\langle
G_cu,v
\rangle
=
0.
```

Thus

```math
\boxed{
G_aJ_{c,a}u
\perp
J_{c,a}H_c.
}
```

In particular,

```math
\boxed{
\langle
G_aJ_{c,a}u,
J_{c,a}u
\rangle
=
0
}
```

for every (a>c).

Hence the direct crossing form

```math
P_{N_c}
J_{c,a}^{*}
(G_a-J_{c,a}G_cJ_{c,a}^{*})
J_{c,a}
P_{N_c}
```

vanishes identically.

The endpoint kernel has **no negative diagonal drift at any order** under the
natural zero-extension transport.

---

## 4. Fixed-interval scaling can hide this stationarity

If every interval is rescaled to ((-1,1)), the transported kernel becomes a
support-dependent integral kernel involving (g(a(x-y))), and a formal
(a)-variation appears even on the endpoint nullspace.

That representation is useful for norm-continuity arguments, but it does not
preserve the natural nested-support embedding.

The intrinsic support-filtration statement is Section 2:

```math
\boxed{
J_{c,a}^{*}G_aJ_{c,a}
=
G_c.
}
```

Therefore a nonzero diagonal derivative obtained from fixed-interval
coordinates must be interpreted together with the derivative of the transport
map itself.

It is not an intrinsic negative crossing form on the old kernel.

---

## 5. Collar complement

Define the orthogonal complement

```math
\boxed{
\mathcal C_{c,a}
=
J_{c,a}H_c^{\perp}
\cap
H_a.
}
```

Then

```math
H_a
=
J_{c,a}H_c
\oplus
\mathcal C_{c,a}.
```

Relative to this decomposition, (G_a) has block form

```math
\boxed{
G_a
=
\begin{pmatrix}
G_c & C_{c,a}^{*}
\\
C_{c,a} & H_{c,a}
\end{pmatrix},
}
```

where

```math
C_{c,a}
:
H_c
\to
\mathcal C_{c,a}
```

is the old-to-collar coupling.

The upper-left block is exactly (G_c), not merely approximately so.

---

## 6. Kernel vectors leak only into the collar

If

```math
u\in N_c,
```

then Section 3 gives

```math
G_aJ_{c,a}u
\in
\mathcal C_{c,a}.
```

Define

```math
\boxed{
\mathcal L_{c,a}u
:=
G_aJ_{c,a}u
=
C_{c,a}u.
}
```

This is the screw-kernel collar leakage.

There are exactly two possibilities for each endpoint kernel vector.

### Persistent kernel direction

If

```math
\mathcal L_{c,a}u=0,
```

then

```math
\boxed{
G_aJ_{c,a}u=0.
}
```

The zero-extended kernel vector remains an actual screw-kernel vector at the
larger support.

### Leaking kernel direction

If

```math
\mathcal L_{c,a}u\ne0,
```

the vector remains quadratically neutral on the old line but develops a
nonzero off-diagonal coupling to the collar.

---

## 7. Any nonzero kernel leakage immediately creates negativity

Fix

```math
u\in N_c
```

with

```math
L
:=
\mathcal L_{c,a}u
\ne0.
```

Consider

```math
w_t
=
J_{c,a}u
-
tL,
\qquad
t>0.
```

Since

```math
G_aJ_{c,a}u=L,
```

and

```math
\langle
G_aJ_{c,a}u,
J_{c,a}u
\rangle
=
0,
```

we have

```math
\begin{aligned}
\langle
G_aw_t,w_t
\rangle
&=
-2t
\|L\|^2
+
t^2
\langle
G_aL,L
\rangle.
\end{aligned}
```

Because (G_a) is bounded, the quadratic term is (O(t^2)).

Therefore, for all sufficiently small (t>0),

```math
\boxed{
\langle
G_aw_t,w_t
\rangle
<
0.
}
```

Hence

```math
\boxed{
\mathcal L_{c,a}u\ne0
\Longrightarrow
G_a\not\succeq0.
}
```

This implication requires no sign assumption on the collar block
(H_{c,a}).

---

## 8. Screw-potential interpretation

For (u\in H_c), define the whole-line screw potential

```math
\boxed{
F_u(x)
=
\int_{-c}^{c}
g(x-y)u(y)\,dy.
}
```

Since

```math
G_c
=
P_cGP_c,
```

the condition

```math
u\in\ker G_c
```

means

```math
P_cF_u=0.
```

Equivalently,

```math
\boxed{
F_u
\text{ is constant a.e. on }(-c,c).
}
```

Because (g) is continuous, (F_u) is continuous, so the equality is
pointwise.

Likewise,

```math
G_aJ_{c,a}u=0
```

if and only if

```math
\boxed{
F_u
\text{ is constant on }(-a,a).
}
```

Therefore

```math
\boxed{
\mathcal L_{c,a}u=0
\iff
F_u
\text{ remains constant across the whole new collar}.
}
```

The kernel-leakage problem is exactly a screw-potential collar-rigidity
problem.

---

## 9. Relation to the old neutral null-extension interface

If

```math
u
=
Dh,
\qquad
h\in
H_0^1(-c,c),
```

then

```math
\langle
G_cu,u
\rangle
=
Q_W^c(h).
```

Zero extension of (h) to a larger interval has the same global Weil
quadratic value, so the diagonal stationarity derived above is consistent with
the earlier RPB-10 observation that an endpoint neutral physical vector retains
form value zero under support enlargement.

What changes under enlargement is not the old quadratic value.

What changes is the admissible off-diagonal coupling to newly available
directions.

Thus the screw formulation gives a sharper version of the same phenomenon:

```math
\boxed{
\text{neutral form persistence}
+
\text{new collar coupling}
\Longrightarrow
\text{possible negative fall-through}.
}
```

---

## 10. Immediate right negativity does not logically force kernel leakage

RPB-33 gives

```math
G_a\not\succeq0
```

for every sufficiently close strict right (a>c_*).

It would be tempting to conclude

```math
\mathcal L_{c_*,a}
\big|
_{\ker G_{c_*}}
\ne0.
```

That conclusion does not follow from compact-operator continuity alone.

The reason is that (G_{c_*}) is compact and nonnegative.

Even if

```math
\ker G_{c_*}
```

is finite dimensional, the positive spectrum of (G_{c_*}) may accumulate at
zero.

Therefore there is no ordinary (L^2) spectral gap between the kernel and the
positive complement.

A small collar perturbation can, in principle, turn an arbitrarily small
positive mode negative without coupling to the exact kernel.

---

## 11. Abstract compact-tail sharpness model

Let

```math
H
=
\ell^2(\mathbb N_0)
```

with orthonormal basis

```math
e_0,e_1,e_2,\ldots.
```

Set

```math
G_0e_0=0,
\qquad
G_0e_n
=
\frac1n e_n
\quad(n\ge1).
```

Then

```math
G_0\succeq0,
\qquad
\ker G_0
=
\mathbb Ce_0,
```

and the positive spectrum accumulates at zero.

For the sequence

```math
G_n
=
G_0
-
\frac{2}{n}
e_n\otimes e_n,
```

we have

```math
\|G_n-G_0\|
=
\frac{2}{n}
\to0,
```

while

```math
G_ne_0=0
```

for every (n), but

```math
\langle
G_ne_n,e_n
\rangle
=
-\frac1n<0.
```

Thus:

```math
\boxed{
\text{compact nonnegative endpoint}
+
\text{nontrivial persistent kernel}
+
\text{arbitrarily small perturbation}
}
```

can coexist with new negative spectrum arising entirely from the positive
compact tail.

This is exactly the logical alternative that prevents inference of kernel
leakage from sign loss alone.

The example is abstract and does not claim the actual screw family realizes
this escape.

---

## 12. Crossing-form determination

The requested "crossing form on the kernel" is therefore exactly

```math
\boxed{
0.
}
```

More strongly,

```math
\boxed{
P_{N_c}
J_{c,a}^{*}
G_a
J_{c,a}
P_{N_c}
=
0
}
```

for every (a>c).

So there is no diagonal first-order, second-order, or higher-order kernel
crossing term under natural support transport.

The correct local object is the off-diagonal collar map

```math
\boxed{
\mathcal L_{c,a}
:
\ker G_c
\to
\mathcal C_{c,a}.
}
```

---

## 13. What would close the screw-alignment problem

A sufficient theorem is now very concrete:

```math
\boxed{
\forall
0\ne u\in\ker G_{c_*},
\quad
\forall a>c_*
\text{ sufficiently close},
\quad
\mathcal L_{c_*,a}u\ne0.
}
```

A weaker existence version would already suffice:

```math
\boxed{
\exists
0\ne u\in\ker G_{c_*}
\text{ with }
\mathcal L_{c_*,a}u\ne0.
}
```

By Section 7, either statement directly produces the post-edge negative sign
from a screw-visible endpoint neutral direction.

In potential language this is:

> a nonzero endpoint screw-kernel potential cannot remain constant on any
> strict exterior collar.

That is an actual kernel/support-rigidity theorem, not a spectral-continuity
statement.

---

## 14. RPB-34 determination

```math
\boxed{
\textbf{RPB-34 — THE SCREW-KERNEL DIAGONAL CROSSING FORM IS IDENTICALLY ZERO; THE RELEVANT OBJECT IS COLLAR LEAKAGE.}
}
```

Exact stationary compression:

```math
\boxed{
J_{c,a}^{*}G_aJ_{c,a}
=
G_c.
}
```

Exact kernel dichotomy:

```math
\boxed{
u\in\ker G_c
\Longrightarrow
\begin{cases}
\mathcal L_{c,a}u=0
&\Rightarrow
J_{c,a}u\in\ker G_a,
\\[1mm]
\mathcal L_{c,a}u\ne0
&\Rightarrow
G_a\text{ has a negative direction}.
\end{cases}
}
```

But the known fact that (G_a) is negative immediately right does not by itself
force the second branch because compact-tail escape remains possible.

Next cursor:

```text
RPB-35 / SCREW-POTENTIAL COLLAR RIGIDITY OF ker G_{c_*}
```

The next pass should test whether a nonzero

```math
u\in\ker G_{c_*}
```

can have

```math
F_u(x)
=
\int_{-c_*}^{c_*}
g(x-y)u(y)\,dy
```

remain constant on any strict enlargement of ((-c_*,c_*)).

The explicit screw kernel is continuous and piecewise analytic away from its
arithmetic knots (|t|=\log n), so this is now a concrete exterior
unique-continuation / collar-rigidity problem for a fixed compact source.
