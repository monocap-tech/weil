# RPB-31 — Actual-Weil neutral nullspace boundary regularity

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO H^{1/2} GAIN FROM THE KNOWN ACTUAL-WEIL DECOMPOSITION / ARITHMETIC TERMS ARE DOMAIN-INVARIANT LOWER ORDER**  
**Dependencies:** RPB-27 through RPB-30; WD-T34–WD-T38; Suzuki localized Weil operator framework.  
**Promotion status:** none.

## 0. Objective

RPB-30 reduced the selected regularity question exactly to the physical neutral
nullspace:

```math
E_*
\cap
\mathcal R_{1/2}(c_*)
\ne\{0\}
\iff
N_*^{1/2}
\ne\{0\}.
```

RPB-31 asks whether the **actual compact-window Weil operator**, rather than a
generic logarithmic comparison operator, contains enough additional
zeta-specific structure to force

```math
N_*^{1/2}\ne\{0\}.
```

The known exact decomposition does not.

The reason is operator-theoretic:

```math
\boxed{
\text{all currently explicit zeta-specific corrections are bounded relative to the logarithmic principal operator.}
}
```

They alter the spectrum and the finite-dimensional nullspace, but they do not
raise the operator-domain regularity order.

---

## 1. Canonical logarithmic reference form

Fix a support radius (c).

For a compactly supported physical test (f), write (F=\widehat f).

The compact-window Weil form has symbol

```math
\Psi_c(t)
=
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
-
\log\pi
-
\sum_{\log n<2c}
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n),
```

together with the finite-rank pole/evaluation contribution.

Define the reference logarithmic quadratic form

```math
q_{\log,c}[f]
=
\frac1{2\pi}
\int_{\mathbb R}
\log(e+|t|)
|F(t)|^2\,dt.
```

Let

```math
A_{\log,c}
```

be the self-adjoint operator associated with the corresponding closed
compact-window form.

---

## 2. The exact archimedean correction is bounded relative to the log model

The digamma asymptotic gives

```math
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
=
\log|t|
-
\log2
+
O(|t|^{-2})
qquad
(|t|\to\infty).
```

Therefore

```math
b_\infty(t)
:=
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
-
\log\pi
-
\log(e+|t|)
```

is bounded on the real axis.

Thus the difference between the exact archimedean form and the reference
logarithmic form is an (L^2)-bounded quadratic form.

In fact the high-frequency difference is better than merely bounded after the
constant term is separated, but no positive-order gain is needed here.

---

## 3. Prime terms are order zero

At fixed support only finitely many prime powers satisfy

```math
\log n<2c.
```

The prime contribution in Fourier space is

```math
p_c(t)
=
-
\sum_{\log n<2c}
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n).
```

Since the sum is finite,

```math
\boxed{
p_c\in L^\infty(\mathbb R).
}
```

Equivalently, in physical space the prime contribution is a finite sum of
translations.

Hence the prime part is an order-zero bounded perturbation on (L^2).

It can affect the nullspace and support dependence, but it does not change the
operator domain of the logarithmic principal part.

---

## 4. Pole and selected-covariance terms are bounded finite rank

The pole/evaluation term satisfies, on fixed support,

```math
|F(i/2)|
\le
C_c\|f\|_2.
```

Therefore its quadratic contribution is bounded and finite rank.

Likewise, for the fixed finite selected packet (Pi'),

```math
f
\mapsto
\|\Phi_cf\|^2
```

is a bounded finite-rank form.

Thus restoring or removing the selected covariance does not alter the
operator domain.

---

## 5. Actual background operator is a bounded perturbation of the logarithmic operator

Collect the bounded terms into

```math
B_{B,c}
\in
\mathcal B(
L^2(-c,c)
),
```

self-adjoint.

Then the finite-enlarged complementary-background operator has the form

```math
\boxed{
A_{B,c}
=
A_{\log,c}
+
B_{B,c}.
}
```

The bounded-perturbation theorem for self-adjoint operators gives

```math
\boxed{
\mathfrak D(A_{B,c})
=
\mathfrak D(A_{\log,c}),
}
```

with equivalent graph norms.

This is the exact domain-level content of the known arithmetic decomposition.

---

## 6. The full endpoint operator has the same operator domain

The full endpoint operator is

```math
A_c
=
A_{B,c}
-
\Phi_c^*\Phi_c.
```

Since

```math
\Phi_c^*\Phi_c
```

is bounded finite rank,

```math
\boxed{
\mathfrak D(A_c)
=
\mathfrak D(A_{B,c})
=
\mathfrak D(A_{\log,c}).
}
```

Therefore every neutral null mode satisfies

```math
h\in\ker A_c
\Longrightarrow
h\in\mathfrak D(A_{\log,c}).
```

This is stronger than mere logarithmic **form-domain** membership, but it is
still only logarithmic operator-domain regularity.

---

## 7. Logarithmic operator domain is still below every positive Sobolev order

For the whole-line logarithmic multiplier model, operator-domain regularity is
of the species

```math
\int
\log^2(e+|t|)
|F(t)|^2\,dt
<
\infty.
```

For every

```math
\varepsilon>0,
```

```math
\frac{
|t|^{2\varepsilon}
}{
\log^2(e+|t|)
}
\to\infty.
```

Thus logarithmic operator-domain control is strictly weaker than
(H^\varepsilon) control for every positive (arepsilon).

In particular it does not imply

```math
H^{1/2}.
```

The compact-window boundary realization does not improve this comparison.

---

## 8. The null equation does not bootstrap itself

Let

```math
h\in\ker A_c.
```

Writing

```math
A_c
=
A_{\log,c}
+
B_c
```

with (B_c) bounded gives

```math
\boxed{
A_{\log,c}h
=
-
B_ch.
}
```

The right-hand side belongs to (L^2), because (B_c) is bounded.

This recovers exactly

```math
h\in\mathfrak D(A_{\log,c}).
```

But substituting the equation again gives no stronger class: (B_ch) remains
only an (L^2) datum at the level guaranteed by the theorem.

The finite translations preserve regularity but do not create any.

The finite-rank pole and selected terms are smoother in range, but they are
only part of (B_ch); the translation term still contains the full unknown
(h).

Hence there is no automatic bootstrap cycle.

---

## 9. Exact archimedean structure does not remove the boundary obstruction

The exact archimedean multiplier differs from the pure logarithmic symbol by a
bounded lower-order term.

Consequently the principal exterior-Dirichlet boundary mechanism remains
logarithmic-order.

RPB-28's comparison with the pure logarithmic torsion problem therefore remains
relevant at the level of what can be forced solely from principal order and
bounded perturbations.

This does **not** prove that an actual Weil null mode has the same precise
boundary asymptotic.

It proves only that the exact archimedean correction does not provide a
domain-level mechanism forcing a half derivative.

---

## 10. Finite prime-delay geometry does not raise the domain

The actual zeta prime data are more structured than an arbitrary bounded
operator:

```math
\sum_j
c_j
(
\tau_{\ell_j}
+
\tau_{-\ell_j}
).
```

However every translation is unitary on (H^s(\mathbb R)) for all (s).

Thus, if (h) has only logarithmic regularity, the prime-delay term has only
the same regularity.

No smoothing enters.

So the exact finite prime locations and coefficients can affect **cancellation**
inside a particular null vector, but cannot force (H^{1/2}) by an operator
mapping theorem.

Any gain would have to be a special arithmetic cancellation theorem for the
actual nullspace.

---

## 11. Parity likewise remains non-smoothing

The operator commutes with reflection.

Therefore the nullspace splits into even and odd blocks.

This can reduce the finite-dimensional analysis but does not alter

```math
\mathfrak D(A_c)
=
\mathfrak D(A_{\log,c}).
```

Hence parity supplies no regularity gain by itself.

---

## 12. Suzuki core-domain distinction survives intact

Suzuki's localized Weil operator (A_c) is the Friedrichs extension of a
symmetric operator (B_c) whose core realization has stronger domain

```math
\mathfrak D(B_c)
=
H_0^1(-c,c)
```

in the screw-function framework.

The current argument gives only

```math
h\in
\mathfrak D(A_c).
```

It does **not** give

```math
h\in
H_0^1(-c,c).
```

This is exactly the domain caution already recorded in RPB-10.

Because

```math
H_0^1
\subset
H^{1/2},
```

a theorem proving that every neutral null mode of the Friedrichs extension
actually lies in the original core domain would completely bypass the
half-Sobolev boundary obstruction.

No such theorem follows from Friedrichs extension theory alone.

---

## 13. Exact remaining actual-Weil regularity route

The only stronger domain statement visibly present in the current exact
operator framework is therefore the **core-domain route**:

```math
\boxed{
h\in\ker A_c
\stackrel{?}{\Longrightarrow}
h\in\mathfrak D(B_c)=H_0^1(-c,c).
}
```

If true for the actual neutral eigenspace, then

```math
N_*^{1/2}
=
\ker A_c
```

and RPB-27's first-variation route would reopen.

If false, the current logarithmic-domain obstruction remains sharp.

---

## 14. RPB-31 determination

```math
\boxed{
\textbf{RPB-31 — THE KNOWN ACTUAL-WEIL ARITHMETIC TERMS DO NOT FORCE }H^{1/2}\textbf{ NULLSPACE REGULARITY.}
}
```

Exact domain theorem:

```math
\boxed{
\mathfrak D(A_c)
=
\mathfrak D(A_{B,c})
=
\mathfrak D(A_{\log,c})
}
```

because all currently explicit zeta-specific corrections are bounded
order-zero / finite-rank perturbations of the logarithmic principal operator.

Therefore

```math
\boxed{
\ker A_c
\subset
\mathfrak D(A_{\log,c}),
}
```

but no current theorem upgrades this to

```math
\ker A_c
\subset
H^{1/2}.
```

The remaining actual-Weil-specific regularity question is no longer the
explicit-formula decomposition itself.

It is whether the **zero eigenspace of the Friedrichs extension lifts to the
stronger screw-operator core domain**.

Next cursor:

```text
RPB-32 / FRIEDRICHS ZERO-MODE → SCREW-OPERATOR CORE DOMAIN
```

The next pass should test whether the special eigenvalue (0), the
factorization (B_c=D^*G_cD), or the null relation can force a neutral
(A_c)-eigenvector into (H_0^1(-c,c)), despite the general distinction
between a Friedrichs extension and its initial symmetric core.
