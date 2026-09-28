# RPB-29 — Selected resolvent boundary-layer coefficient

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO COEFFICIENT THEOREM / EXISTING SOURCE CONSTRAINTS DO NOT FORCE BOUNDARY CANCELLATION / RETYPE AS FINITE REGULARITY-SUBSPACE INTERFACE**  
**Dependencies:** RPB-27, RPB-28; WD-T35/T36; selected packet symmetry.  
**Promotion status:** none.

## 0. Objective

RPB-28 reduced the first-variation problem to a possible exceptional
cancellation of the generic logarithmic Dirichlet boundary layer.

Schematically, one would like endpoint functionals

```math
\mathfrak b_a^{\pm}:M'\to\mathbb C
```

such that

```math
h_{a,u}(\pm a\mp r)
=
\mathfrak b_a^{\pm}(u)
\ell^{1/2}(r)
+
o(\ell^{1/2}(r)).
```

RPB-29 asks:

1. whether such a coefficient map is currently available for the actual
   compact-window Weil background;
2. whether zero moment, pair antisymmetry, parity, or endpoint neutrality
   forces the coefficient to vanish.

The determination is negative on both points at current standing.

The lawful replacement is a finite selected regularity subspace defined
without assuming a pointwise boundary asymptotic.

---

## 1. External boundary theory supplies a scale, not a general coefficient map

For the pure logarithmic Laplacian Dirichlet problem

```math
L_\Delta u=f
\quad\text{in }\Omega,
\qquad
u=0
\quad\text{in }\Omega^c,
```

Hernández-Santamaría, López Ríos, and Saldaña prove the optimal upper boundary
scale

```math
\boxed{
|u(x)|
\le
C
\ell^{1/2}
(\operatorname{dist}(x,\partial\Omega))
}
```

for bounded forcing.

For the positive torsion function in a sufficiently small ball they prove

```math
\boxed{
0
<
\liminf_{t\downarrow0}
\frac{
u(x_0-t\nu(x_0))
}{
\ell^{1/2}(t)
}
<
\infty
}
```

and two-sided comparability with the same (ell^{1/2}) scale.

These results establish the optimal **size** of the boundary layer.

They do not state, for arbitrary signed or complex solutions, a general limit

```math
\frac{u(x_0-t\nu)}{\ell^{1/2}(t)}
\longrightarrow
\mathfrak b(u;x_0)
```

defining a linear boundary coefficient.

### Contextual source

Víctor Hernández-Santamaría, Luis Fernando López Ríos, Alberto Saldaña,
*Optimal boundary regularity and a Hopf-type lemma for Dirichlet problems
involving the logarithmic Laplacian*, Discrete Contin. Dyn. Syst. 45 (2025),
1–36, Theorems 1.1 and 1.2.

---

## 2. Hopf theory also gives nonvanishing inequalities, not a universal coefficient

More recent Hopf theory for the logarithmic Laplacian gives inequalities and
positive (liminf) statements for nonnegative or antisymmetric
supersolutions.

For example, Pollastro and Soave prove for suitable positive supersolutions

```math
\liminf_{t\downarrow0}
\frac{
u(x_0-t\nu(x_0))
}{
\ell^{1/2}(t)
}
>
0.
```

Their antisymmetric theory likewise produces nontrivial Hopf behavior rather
than cancellation forced by symmetry.

Thus existing Hopf results support the conclusion

```math
\boxed{
\text{symmetry is compatible with a nonzero boundary-scale amplitude}.
}
```

They do not supply a signed/complex linear coefficient map for the RPB
selected resolvents.

### Contextual source

Luigi Pollastro, Nicola Soave,
*Antisymmetric maximum principles and Hopf's lemmas for the Logarithmic
Laplacian, with applications to symmetry results*,
Ann. Mat. Pura Appl. 204 (2025), 1827–1845.

---

## 3. The actual Weil background has an additional transfer gap

The finite-enlarged Weil background operator is not the pure
(L_\Delta) Dirichlet operator.

Its species is

```math
\boxed{
\text{logarithmic archimedean principal part}
+
\text{finite order-zero translations}
+
\text{finite-rank terms}.
}
```

The principal logarithmic order motivates comparison with the external
boundary theory, but no theorem presently proves that the perturbed operator
has:

1. the same exact (ell^{1/2}) leading asymptotic;
2. a limit coefficient rather than only upper/lower scale control;
3. a coefficient depending linearly and continuously on signed/complex
   forcing.

Therefore

```math
\boxed{
\mathfrak b_a^{\pm}
}
```

is not yet a canonical object in the actual RPB branch.

The boundary-coefficient route cannot be used as if these maps had already
been constructed.

---

## 4. Parity would relate endpoint coefficients, not annihilate them

The compact interval and the full compact-window Weil form are reflection
symmetric.

Assume hypothetically that lawful endpoint coefficient maps
(mathfrak b_a^{\pm}) exist and respect reflection.

For an even resolvent vector,

```math
h(-x)=h(x),
```

reflection gives

```math
\boxed{
\mathfrak b_a^{-}(u)
=
\mathfrak b_a^{+}(u).
}
```

For an odd resolvent vector,

```math
h(-x)=-h(x),
```

reflection gives

```math
\boxed{
\mathfrak b_a^{-}(u)
=
-
\mathfrak b_a^{+}(u).
}
```

Neither relation implies

```math
\mathfrak b_a^{\pm}(u)=0.
```

The pure logarithmic torsion function is even and has a nonvanishing
(ell^{1/2}) boundary scale, providing a direct model showing that even
parity does not force cancellation.

Thus parity can reduce two endpoint amplitudes to one, but cannot by itself
remove the boundary obstruction.

---

## 5. Pair antisymmetry does not force boundary cancellation

The selected negative pair coordinate has raw form

```math
v_{\rho}
=
-c,
\qquad
v_{\bar\rho}
=
c
```

up to the fixed pair convention.

This antisymmetry is responsible for

```math
\mathbf1^Tv=0.
```

It is a relation in the finite zero-residue coefficient space.

The boundary layer is instead determined by the solution of

```math
A_{B,a}h_{a,u}
=
\Phi_a^*u.
```

No theorem identifies the leading boundary amplitude of this inverse problem
with the pair sum

```math
v_{\rho}+v_{\bar\rho}.
```

Therefore:

```math
\boxed{
\text{pair antisymmetry}
\not\Rightarrow
\text{boundary cancellation}
}
```

under current theory.

---

## 6. Zero moment is likewise insufficient

Every selected negative raw source satisfies

```math
\boxed{
\mathbf1^Tv=0.
}
```

Suppose, hypothetically, that one endpoint coefficient were a linear
functional

```math
\mathfrak b_a
:
V_{\Pi'}\to\mathbb C.
```

For zero moment alone to force cancellation one would need

```math
\ker(\mathbf1^T)
\subseteq
\ker\mathfrak b_a.
```

In finite-dimensional linear algebra this is equivalent to
(mathfrak b_a) factoring through the one-dimensional moment row:

```math
\boxed{
\mathfrak b_a
=
c_a\,\mathbf1^T
}
```

for some scalar (c_a).

No H1/RPB theorem supplies such a factorization.

The actual boundary inverse problem contains the full background resolvent
(A_{B,a}^{-1}), so reducing its boundary behavior to the zeroth raw residue
moment would be a new theorem.

Hence zero moment does not presently close the boundary layer.

---

## 7. Endpoint neutrality does not contain a boundary condition

At the neutral edge the selected crossing direction satisfies

```math
\boxed{
\mathsf K_{c_*}u_*
=
u_*,
}
```

equivalently

```math
C_{c_*}^*C_{c_*}u_*
=
u_*.
```

This is a unit-gain inverse-background relation.

The associated physical null relation is global:

```math
Q_{c_*}(k)=0,
```

or, in operator form,

```math
W_{c_*}k=0.
```

WD-S03 / the neutral morphology audit already prevents splitting this global
cancellation into separate prime, pole, archimedean, or boundary vanishing
conditions.

Therefore

```math
\boxed{
\mathsf K_{c_*}u_*=u_*
\not\Rightarrow
\mathfrak b_{c_*}^{\pm}(u_*)=0
}
```

without a new boundary theorem.

---

## 8. A coefficient-free replacement is available

The first-variation route does not actually require a pointwise coefficient.

It requires the zero-extended resolvent extremizer to have enough regularity
for the support derivative of the prime shifts.

Define

```math
\boxed{
\mathcal R_{1/2}(a)
=
\left\{
u\in M':
\widetilde h_{a,u}
\in H^{1/2}(\mathbb R)
\right\}.
}
```

Because

```math
u\mapsto
h_{a,u}
=
A_{B,a}^{-1}\Phi_a^*u
```

is linear,

```math
\boxed{
\mathcal R_{1/2}(a)
\le M'
}
```

is a linear subspace.

Since (M') is finite dimensional, this is an ordinary finite-dimensional
subspace even though (H^{1/2}) is a stronger infinite-dimensional physical
condition.

This definition is lawful without any boundary asymptotic theorem.

---

## 9. Exact regularity obligation at the crossing

Let

```math
E_*
=
\ker(
\mathsf K_{c_*}-I
)
\subseteq M'
```

be the endpoint unit-gain eigenspace.

The first-variation route would be reopened if the actual crossing branch
could be chosen with

```math
\boxed{
u_*
\in
E_*
\cap
\mathcal R_{1/2}(c_*),
\qquad
u_*\ne0,
}
```

together with a suitable uniform right-neighborhood version.

A strong sufficient statement is

```math
\boxed{
E_*
\subseteq
\mathcal R_{1/2}(c_*).
}
```

The existing source constraints do not establish this inclusion.

---

## 10. Zero moment cannot distinguish the regularity subspace

The pair-to-raw map sends every (u\in M') to a zero-moment source.

Thus the zero-moment law holds on **all of (M')**:

```math
\mathbf1^T Uu=0
\qquad
(u\in M').
```

But

```math
\mathcal R_{1/2}(a)
```

may be a proper subspace of (M').

Therefore zero moment has no resolving power between regular and irregular
selected directions unless an additional theorem proves

```math
\mathcal R_{1/2}(a)=M'.
```

RPB-28 specifically showed that such a full-space regularity theorem does not
follow from smooth forcing alone.

---

## 11. Parity only block-diagonalizes the regularity question

Reflection symmetry decomposes

```math
M'
=
M'^+
\oplus
M'^-.
```

The background resolvent respects parity, so

```math
\mathcal R_{1/2}(a)
=
\mathcal R_{1/2}^+(a)
\oplus
\mathcal R_{1/2}^-(a)
```

with

```math
\mathcal R_{1/2}^{\pm}(a)
\subseteq
M'^{\pm}.
```

Likewise the endpoint unit eigenspace decomposes by parity.

Thus parity reduces the test to smaller finite blocks.

It does not prove

```math
E_*^{\pm}
\subseteq
\mathcal R_{1/2}^{\pm}(c_*).
```

This is the exact surviving parity-resolved obligation.

---

## 12. What has been ruled out

RPB-29 rules out four automatic arguments:

```math
\boxed{
\begin{array}{rcl}
\mathbf1^Tv=0
&\not\Rightarrow&
H^{1/2}\text{ boundary cancellation},
\\
\text{pair antisymmetry}
&\not\Rightarrow&
H^{1/2}\text{ boundary cancellation},
\\
\text{parity}
&\not\Rightarrow&
H^{1/2}\text{ boundary cancellation},
\\
\mathsf K_{c_*}u=u
&\not\Rightarrow&
H^{1/2}\text{ boundary cancellation}.
\end{array}
}
```

These statements are jurisdictional: no existing theorem supplies the
implications.

They do not assert that cancellation is impossible for the actual crossing
direction.

---

## 13. RPB-29 determination

```math
\boxed{
\textbf{RPB-29 — THE LEADING BOUNDARY COEFFICIENT IS NOT CURRENTLY A LAWFUL WEIL OBJECT, AND THE EXISTING SOURCE CONSTRAINTS DO NOT FORCE ITS VANISHING.}
}
```

The boundary problem is retyped without assuming a coefficient:

```math
\boxed{
E_*
\stackrel{?}{\cap}
\mathcal R_{1/2}(c_*).
}
```

More precisely, the first-variation route requires a nonzero unit-gain
crossing direction with half-Sobolev regularity and corresponding
right-neighborhood control.

The remaining problem is therefore finite-selected but still genuinely
analytic.

Next cursor:

```text
RPB-30 / UNIT-GAIN EIGENSPACE VS SELECTED H^{1/2} REGULARITY KERNEL
```

The next pass should test the inclusion/intersection

```math
E_*
=
\ker(\mathsf K_{c_*}-I)
\quad\text{versus}\quad
\mathcal R_{1/2}(c_*),
```

using the Green-congruence representation, finite selected forcing, parity
blocks, and any available domain characterization of
(A_{B,c_*}^{-1}\Phi_{c_*}^*).
