# RPB-28 — Resolvent-extremizer regularity bootstrap test

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO GENERIC BOOTSTRAP / SMOOTH SELECTED FORCING DOES NOT BY ITSELF GIVE HALF-SOBOLEV REGULARITY**  
**Dependencies:** RPB-27; WD-T35/T36; logarithmic-Laplacian Dirichlet boundary regularity literature.  
**Promotion status:** none.

## 0. Objective

RPB-27 isolated the first-variation obstruction:

```math
\partial_a
\cos\!\left(
\frac{\ell\xi}{a}
\right)
\sim
|\xi|.
```

To control the differentiated prime-shift quadratic form on a physical vector
one needs, at minimum, a half-derivative level of control:

```math
\int
|\xi|
|\widehat h(\xi)|^2
\,d\xi
<
\infty,
```

i.e. the zero extension should lie in (H^{1/2}(\mathbb R)).

RPB-28 tests whether the special resolvent equation

```math
A_{B,a}h_{a,u}
=
\Phi_a^*u
```

provides such extra regularity because the right-hand side belongs to a fixed
finite-dimensional smooth selected-source space.

The answer is:

```math
\boxed{
\text{not from smooth forcing alone}.
}
```

The obstruction is boundary regularity, not interior regularity.

---

## 1. Why (H^{1/2}) is the relevant threshold

For one active prime delay (ell), the fixed-interval support derivative has
Fourier multiplier

```math
\partial_a m_{\ell,a}(\xi)
=
O(|\xi|).
```

Thus the derivative quadratic form contains terms of the species

```math
\int
|\xi|
|\widehat h(\xi)|^2
\,d\xi.
```

This is the homogeneous (H^{1/2}) scale.

Therefore a uniform estimate

```math
\boxed{
\sup_{a,u}
\|\widetilde h_{a,u}\|_{H^{1/2}(\mathbb R)}
<
\infty
}
```

for zero-extended extremizers would be sufficient to remove the specific
prime-shift differentiation obstruction of RPB-27.

A smaller positive Sobolev exponent is not enough for this direct derivative
argument.

---

## 2. The selected right-hand side is smooth, but that is not decisive

For fixed finite selected packet (Pi'),

```math
\Phi_a^*u
```

is a finite linear combination of the selected physical columns.

After fixed-interval scaling these columns are smooth/analytic functions of the
interior variable and depend continuously on (a).

Hence the forcing space

```math
\mathcal G_a
:=
\operatorname{Ran}\Phi_a^*
```

is finite dimensional and consists of smooth interior functions.

This removes any forcing-side high-frequency pathology.

It does **not** remove the exterior Dirichlet boundary layer created by the
logarithmic-order nonlocal operator.

---

## 3. Sharp logarithmic-Laplacian comparison model

The pure logarithmic Laplacian has Fourier symbol

```math
2\log|\xi|.
```

For a bounded domain (Omega), its exterior-Dirichlet problem is

```math
L_\Delta u=f
\quad\text{in }\Omega,
\qquad
u=0
\quad\text{in }\Omega^c.
```

Hernández-Santamaría, López Ríos, and Saldaña prove optimal boundary
regularity for this problem.

With

```math
\ell(r)
=
\frac1{
|\log(\min\{r,0.1\})|
},
```

bounded forcing gives the boundary upper scale

```math
|u(x)|
\lesssim
\ell^{1/2}
(\operatorname{dist}(x,\partial\Omega)).
```

For the torsion problem with the **smooth constant forcing**

```math
f\equiv1,
```

they prove the two-sided sharp behavior

```math
\boxed{
u(x)
\asymp
\ell^{1/2}
(\operatorname{dist}(x,\partial\Omega))
}
```

near the boundary, under their small-domain positivity hypotheses.

Thus a perfectly smooth right-hand side can still produce only logarithmic
square-root boundary decay.

### Contextual source

Víctor Hernández-Santamaría, Luis Fernando López Ríos, Alberto Saldaña,
*Optimal boundary regularity and a Hopf-type lemma for Dirichlet problems
involving the logarithmic Laplacian*, Discrete and Continuous Dynamical Systems
45 (2025), 1–36, especially Theorems 1.1 and 1.2.

This source is contextual for RPB-28 and is not promoted into the canonical
H1 source-pin matrix.

---

## 4. Logarithmic square-root boundary decay fails (H^{1/2})

Work in one dimension near one endpoint and write the boundary distance as

```math
r>0.
```

Suppose a zero-extended function satisfies the sharp lower behavior

```math
|u(r)|
\gtrsim
\frac1{
\sqrt{\log(1/r)}
}
```

for sufficiently small (r).

The cross-boundary part of the (H^{1/2}(\mathbb R)) Gagliardo seminorm
contains

```math
\int_0^\varepsilon
|u(r)|^2
\left(
\int_{-\varepsilon}^{0}
\frac{dy}{
|r-y|^2
}
\right)
dr.
```

The inner integral satisfies

```math
\int_{-\varepsilon}^{0}
\frac{dy}{
|r-y|^2
}
\asymp
\frac1r.
```

Hence

```math
[u]_{H^{1/2}}^2
\gtrsim
\int_0^\varepsilon
\frac{dr}{
r\log(1/r)
}.
```

But

```math
\boxed{
\int_0^\varepsilon
\frac{dr}{
r\log(1/r)
}
=
\infty.
}
```

Therefore

```math
\boxed{
u
\notin
H^{1/2}(\mathbb R)
}
```

for the sharp logarithmic boundary profile.

---

## 5. Consequence: smooth forcing does not imply the needed bootstrap

The torsion example gives an explicit model of the logical implication

```math
f\in C^\infty
```

but

```math
u
\notin
H^{1/2}
```

for a Dirichlet logarithmic-order operator.

Therefore the proposed shortcut

```math
\boxed{
\Phi_a^*u
\text{ smooth finite-dimensional}
\Longrightarrow
h_{a,u}
\in H^{1/2}
}
```

is not a consequence of logarithmic ellipticity or smooth forcing alone.

Any proof for the actual Weil background operator must use additional
structure specific to the selected forcing and/or to the lower-order
prime/pole perturbations.

---

## 6. Finite translations do not automatically cure the boundary layer

The actual compact-window background operator has species

```math
\boxed{
\text{logarithmic archimedean principal part}
+
\text{finitely many order-zero translations}
+
\text{finite-rank terms}.
}
```

The finite translations preserve every ordinary Sobolev scale on the whole
line, but this does not imply that they cancel the logarithmic exterior
Dirichlet boundary singularity of a particular solution.

Similarly, a finite-rank perturbation can alter finitely many global
directions but does not generically supply a half-derivative boundary
bootstrap.

No current theorem establishes such cancellation for the actual selected
resolvent family.

Thus:

```math
\boxed{
\text{order-zero perturbations}
\not\Rightarrow
\text{boundary-layer cancellation}.
}
```

---

## 7. What would be enough

RPB-28 would reopen the first-variation route if one could prove for the
specific selected resolvent family that

```math
\boxed{
\sup_{
c_*\le a<c_*+\delta,
\ \|u\|=1
}
\|
\widetilde h_{a,u}
\|_{H^{1/2}}
<
\infty.
}
```

A weaker but still useful route would be a selected-direction theorem saying
that the leading logarithmic boundary coefficient vanishes:

```math
\boxed{
\mathfrak b_a(u)
=
0
}
```

for the crossing eigenvector/source direction.

If the generic
(ell^{1/2})-boundary layer is absent, a better boundary class may become
available.

No such boundary cancellation is presently known.

---

## 8. Boundary coefficient is additional finite data

Because the selected source sector is finite dimensional, any lawful leading
boundary asymptotic—if it can be established for the actual background
operator—would define finite linear functionals

```math
\mathfrak b_a^{\pm}
:
M'
\to
\mathbb C
```

for the left/right endpoints, schematically through

```math
h_{a,u}(\pm a\mp r)
=
\mathfrak b_a^{\pm}(u)
\ell^{1/2}(r)
+
o(\ell^{1/2}(r)).
```

Then (H^{1/2})-level improvement would require, at minimum,

```math
\boxed{
\mathfrak b_a^+(u)
=
\mathfrak b_a^-(u)
=
0
}
```

for the relevant selected crossing direction.

The existence and computation of these functionals for the actual Weil
background is not part of H1.

---

## 9. Relation to RPB-27

RPB-27 found that the support derivative of an active prime translation
requires half-Sobolev control.

RPB-28 shows that the special resolvent equation does not automatically
supply it.

Therefore the obstruction is not merely that H1 lacks a generic coercive
estimate.

There is a known logarithmic Dirichlet mechanism showing that smooth forcing
can retain the exact boundary roughness that defeats (H^{1/2}).

So the burden has sharpened to:

```math
\boxed{
\text{selected forcing must cancel the generic boundary layer}.
}
```

---

## 10. RPB-28 determination

```math
\boxed{
\textbf{RPB-28 — RESOLVENT SMOOTH FORCING DOES NOT AUTOMATICALLY BOOTSTRAP TO }H^{1/2}.
}
```

The first-variation route remains blocked unless an actual-zeta/actual-Weil
boundary-cancellation theorem is proved for the finite selected resolvent
family.

Exact remaining question:

> Does the crossing selected source lie in the kernel of the leading
> logarithmic Dirichlet boundary-layer functional(s) of the finite-enlarged
> background resolvent?

Next cursor:

```text
RPB-29 / SELECTED RESOLVENT BOUNDARY-LAYER COEFFICIENT
```

The next pass should determine whether the actual compact-window Weil operator
admits a leading endpoint asymptotic map on the selected resolvent family, and
whether zero moment, pair antisymmetry, parity, or the endpoint neutral relation
forces that leading boundary coefficient to vanish.
