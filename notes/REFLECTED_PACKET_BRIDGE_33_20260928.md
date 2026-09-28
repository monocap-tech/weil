# RPB-33 — Projected screw kernel at the neutral edge

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / NEUTRAL EDGE IS SCREW-VISIBLE / CORE-REGULAR NEUTRAL DIRECTION EXISTS**  
**Dependencies:** RPB-30 through RPB-32; Suzuki 2026 v3 §8.5.  
**Promotion status:** none.

## 0. Objective

RPB-32 reduced screw-core visibility of the neutral edge to the kernel of the
projected compact screw operator

```math
G_{c_*}:
L_0^2(-c_*,c_*)
\to
L_0^2(-c_*,c_*).
```

The question was:

```math
\boxed{
0\in\sigma(A_{c_*})
\stackrel{?}{\Longrightarrow}
\ker G_{c_*}\ne\{0\}.
}
```

Suzuki's current v3 paper answers this positively in the generalized
eigenvalue formulation.

---

## 1. Suzuki's generalized eigenvalue problem

Suzuki introduces

```math
K_a
=
(-\Delta_N)^{-1}
```

on the zero-mean space and rewrites the compact-window Weil Rayleigh quotient
as

```math
\boxed{
\frac{
Q_W^a(v)
}{
\|v\|_2^2
}
=
\frac{
\langle G_au,u\rangle
}{
\langle K_au,u\rangle
},
\qquad
u=Dv.
}
```

This leads to the generalized eigenvalue problem

```math
\boxed{
G_au
=
\lambda K_au.
}
```

Suzuki states that its spectrum coincides with the spectrum of the localized
self-adjoint Weil operator (A_a).

Most importantly for RPB-33, he then singles out the spectral point

```math
\lambda=0
```

and states that the (K_a) contribution disappears, so one is simply looking
at

```math
\boxed{
\ker G_a,
}
```

the (0)-eigenspace of the projected screw operator.

### External source pin

Masatoshi Suzuki,
*Weil's quadratic form via the screw function*,
arXiv:2606.09096v3 (23 Sep 2026),
§8.5, printed p. 31.

---

## 2. Apply the source statement at the RPB neutral edge

By construction of the plateau endpoint,

```math
A_{c_*}\succeq0
```

and

```math
\ker A_{c_*}\ne\{0\}.
```

Therefore

```math
0
\in
\sigma(A_{c_*}).
```

Suzuki's generalized spectral reformulation identifies the zero spectral point
with the zero eigenspace of (G_{c_*}).

Hence

```math
\boxed{
\ker G_{c_*}
\ne
\{0\}.
}
```

Thus the neutral edge is already visible in the projected compact screw
operator.

It is not created only by passage to the Friedrichs completion.

---

## 3. Immediate consequence via RPB-32

RPB-32 proved

```math
\ker A_c
\cap
H_0^1(-c,c)
=
D^{-1}(\ker G_c).
```

Since

```math
\ker G_{c_*}\ne\{0\},
```

we obtain

```math
\boxed{
\ker A_{c_*}
\cap
H_0^1(-c_*,c_*)
\ne
\{0\}.
}
```

Therefore at least one neutral localized Weil mode lies in the stronger screw
core.

This is exactly the regularity direction whose existence RPB-30/31 could not
force abstractly.

---

## 4. Half-Sobolev consequence

Every

```math
h\in
H_0^1(-c_*,c_*)
```

has zero extension in

```math
H^1(\mathbb R)
\subset
H^{1/2}(\mathbb R).
```

Therefore the half-Sobolev neutral nullspace satisfies

```math
\boxed{
N_*^{1/2}
\ne
\{0\}.
}
```

Using the neutral-resolvent isomorphism from RPB-30,

```math
E_*
=
\ker(\mathsf K_{c_*}-I)
\cong
\ker A_{c_*},
```

we conclude

```math
\boxed{
E_*
\cap
\mathcal R_{1/2}(c_*)
\ne
\{0\}.
}
```

Thus the endpoint unit-gain eigenspace contains at least one selected direction
whose physical resolvent representative is half-Sobolev regular.

---

## 5. Stronger core regularity is actually available

The screw-visible direction is not merely (H^{1/2}).

If

```math
u_0
\in
\ker G_{c_*}
\setminus\{0\},
```

then

```math
h_0
=
D^{-1}u_0
\in
H_0^1(-c_*,c_*).
```

Hence the first-variation test may use the full derivative energy

```math
\int
|\xi|^2
|\widehat h_0(\xi)|^2
\,d\xi
<
\infty,
```

which is stronger than the
(int|\xi||\widehat h_0|^2)
bound needed for the differentiated prime-shift form.

So the generic logarithmic boundary obstruction of RPB-27–30 is bypassed on at
least one endpoint neutral direction.

---

## 6. Parity decomposition

Because the screw kernel (g(x-y)) is even and the interval is symmetric,
(G_{c_*}) commutes with reflection.

Thus

```math
\ker G_{c_*}
=
\ker G_{c_*}^{+}
\oplus
\ker G_{c_*}^{-}
```

in the even/odd decomposition of the zero-mean screw space.

At least one parity block is nonzero.

The derivative map (D) flips parity, so the corresponding core neutral Weil
mode lies in the opposite physical parity block.

RPB-33 does not determine which parity block owns the actual neutral edge.

---

## 7. What is and is not proved about multiplicity

Suzuki states that the generalized eigenvalue problem has the same spectrum as
(A_a) and explicitly identifies the zero spectral case with
(ker G_a).

For the purposes of RPB-33 this proves the needed nontrivial kernel.

RPB-33 does **not** promote the stronger multiplicity identity

```math
\boxed{
\dim\ker A_{c_*}
=
\dim\ker G_{c_*}
}
```

from that sentence alone.

Therefore the core-lift nullity defect from RPB-32 remains potentially positive:

```math
\delta_{\rm core}(c_*)
=
\dim\ker A_{c_*}
-
\dim\ker G_{c_*}
\ge0.
```

But its maximum value is no longer relevant to the existence question:

```math
\boxed{
\dim\ker G_{c_*}\ge1.
}
```

---

## 8. Relation to the generalized Bombieri problem

Suzuki's §8.4 identifies Bombieri's Problem 1 with the ordinary eigenvalue
problem for the compact operator (G_a) on the zero-mean space.

The (lambda=0) case therefore has a direct compact-operator interpretation:

```math
\boxed{
\text{neutral screw-core mode}
\Longleftrightarrow
\text{zero eigenvector of }G_a.
}
```

This is considerably cleaner than the unbounded Friedrichs representation for
the purpose of detecting the existence of a core-regular neutral direction.

---

## 9. Consequence for the RPB first-variation route

RPB-27 was blocked because generic neutral vectors may lie only in the
logarithmic Friedrichs domain.

RPB-30 showed that unit gain alone does not force a regular direction.

RPB-33 now adds the actual-Weil-specific input:

```math
\boxed{
\text{at the actual neutral edge, at least one regular direction exists}.
}
```

So the first-variation route is no longer blocked by **endpoint regularity
existence**.

However one new finite-dimensional question remains.

For strict right (a>c_*), the top Birman--Schwinger eigenvalue satisfies

```math
\lambda_{\max}(\mathsf K_a)>1.
```

It is not yet proved that the over-budget branch emerges from the particular
core-regular endpoint subspace corresponding to (D^{-1}(\ker G_{c_*})).

If the endpoint unit eigenspace is multidimensional, the crossing may in
principle occur in a different direction.

Thus endpoint regularity and post-edge crossing direction still need to be
matched.

---

## 10. Equivalent compact-screw crossing formulation

At the neutral edge,

```math
G_{c_*}\succeq0
```

and

```math
\ker G_{c_*}\ne\{0\}.
```

For every strict right support (a>c_*), the full Weil form has a negative
direction.

Because the infimum over smooth compactly supported/core vectors equals the
ground value, there exists

```math
v\in H_0^1(-a,a)
```

with

```math
Q_W^a(v)<0.
```

Writing (u=Dv),

```math
\langle G_au,u\rangle
=
Q_W^a(v)
<
0.
```

Hence

```math
\boxed{
G_a
\text{ has a negative eigenvalue}
\qquad
(a>c_*\text{ sufficiently close}).
}
```

So the neutral-to-negative transition can be expressed purely in the compact
screw family:

```math
\boxed{
G_{c_*}\succeq0,
\quad
\ker G_{c_*}\ne0,
\quad
G_a\not\succeq0
\text{ immediately right}.
}
```

This is a new and potentially more regular crossing carrier.

---

## 11. RPB-33 determination

```math
\boxed{
\textbf{RPB-33 — THE ACTUAL NEUTRAL EDGE IS ALREADY VISIBLE IN THE PROJECTED SCREW KERNEL.}
}
```

Exact imported/derived chain:

```math
\boxed{
0\in\sigma(A_{c_*})
\Longrightarrow
\ker G_{c_*}\ne\{0\}
\Longrightarrow
\ker A_{c_*}\cap H_0^1\ne\{0\}
\Longrightarrow
E_*\cap\mathcal R_{1/2}(c_*)\ne\{0\}.
}
```

Moreover the right-side negative branch is visible directly as loss of
positivity of (G_a).

The remaining problem is no longer whether a regular endpoint direction exists.

It is whether the **screw-visible kernel direction is the direction that
actually exits into negativity**.

Next cursor:

```text
RPB-34 / SCREW-KERNEL CROSSING FORM ON ker G_{c_*}
```

The next pass should work entirely in the compact continuous-kernel family
(G_a): scale to a fixed interval, analyze the variation of (G_a) on
(ker G_{c_*}), and determine whether the immediate right loss of positivity
forces a negative crossing form on the screw kernel itself.  This may avoid the
logarithmic support-derivative obstruction because the twice-integrated screw
kernel (g) is continuous and has only a (|t|\log|t|) cusp.
