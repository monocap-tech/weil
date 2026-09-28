# RPB-30 — Unit-gain eigenspace versus selected H^{1/2} regularity kernel

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO-GO AS A FORCED INTERSECTION / EXACT NEUTRAL-RESOLVENT ISOMORPHISM / SHARP LOGARITHMIC RANK-ONE COUNTERMODEL**  
**Dependencies:** RPB-18 through RPB-29; strict endpoint background gap; logarithmic-Laplacian boundary regularity.  
**Promotion status:** none.

## 0. Objective

RPB-29 retyped the boundary-regularity question as

```math
E_*
=
\ker(\mathsf K_{c_*}-I)
\quad\text{versus}\quad
\mathcal R_{1/2}(c_*),
```

where

```math
\mathcal R_{1/2}(c_*)
=
\left\{
u\in M':
\widetilde{
A_{B,*}^{-1}\Phi_*^*u
}
\in H^{1/2}(\mathbb R)
\right\}.
```

RPB-30 asks whether the existing unit-gain geometry forces

```math
E_*
\cap
\mathcal R_{1/2}(c_*)
\ne\{0\}.
```

It does not.

The pass has two results:

1. an exact isomorphism identifies (E_*) with the full physical nullspace;
2. a sharp logarithmic rank-one model shows the corresponding
   half-Sobolev neutral nullspace may be trivial even with smooth
   finite-dimensional forcing.

---

## 1. Endpoint setup

Suppress the support index (c_*).

Let

```math
A_B\succ0
```

be the finite-enlarged complementary-background operator from RPB-18/19.

Let

```math
\Phi:
L^2(-c_*,c_*)
\to M'
```

be the selected finite analysis map.

Then

```math
\boxed{
A_{\rm full}
=
A_B
-
\Phi^*\Phi.
}
```

The endpoint Birman--Schwinger matrix is

```math
\boxed{
\mathsf K
=
\Phi A_B^{-1}\Phi^*.
}
```

RPB-22/24 give

```math
\mathsf K\preceq I,
\qquad
1\in\sigma(\mathsf K).
```

Define

```math
E_*
=
\ker(\mathsf K-I).
```

---

## 2. Unit-gain selected vectors produce full null modes

Take

```math
u\in E_*.
```

Define

```math
\boxed{
h
=
A_B^{-1}\Phi^*u.
}
```

Then

```math
\Phi h
=
\Phi A_B^{-1}\Phi^*u
=
\mathsf Ku
=
u.
```

Therefore

```math
\begin{aligned}
A_{\rm full}h
&=
A_Bh-\Phi^*\Phi h
\\
&=
\Phi^*u-\Phi^*u
\\
&=
0.
\end{aligned}
```

Thus

```math
\boxed{
J_*:
E_*
\to
\ker A_{\rm full},
\qquad
J_*u
=
A_B^{-1}\Phi^*u
}
```

is well-defined.

---

## 3. Every full null mode comes from a unit-gain selected vector

Conversely, let

```math
0\ne h\in\ker A_{\rm full}.
```

Then

```math
A_Bh
=
\Phi^*\Phi h.
```

Set

```math
u=\Phi h.
```

If

```math
u=0,
```

then

```math
A_Bh=0,
```

contradicting strict positivity of (A_B).

Hence

```math
u\ne0.
```

Moreover,

```math
h
=
A_B^{-1}\Phi^*u,
```

and therefore

```math
\mathsf Ku
=
\Phi A_B^{-1}\Phi^*u
=
\Phi h
=
u.
```

So

```math
u\in E_*.
```

This proves surjectivity.

The inverse map is simply

```math
\boxed{
J_*^{-1}(h)
=
\Phi h.
}
```

---

## 4. Neutral-resolvent isomorphism

Sections 2 and 3 give

```math
\boxed{
E_*
\cong
\ker A_{\rm full}.
}
```

More precisely,

```math
\boxed{
J_*:
\ker(\mathsf K-I)
\overset{\sim}{\longrightarrow}
\ker A_{\rm full}.
}
```

Consequently,

```math
\boxed{
\dim E_*
=
\dim\ker A_{\rm full}.
}
```

This gives the exact finite-selected realization of every physical neutral
mode once the complementary background has a strict gap.

---

## 5. The regularity intersection is exactly physical nullspace regularity

Define the half-Sobolev neutral nullspace

```math
\boxed{
N_*^{1/2}
=
\left\{
h\in\ker A_{\rm full}:
\widetilde h\in H^{1/2}(\mathbb R)
\right\}.
}
```

By definition of the selected regularity kernel,

```math
u\in
E_*
\cap
\mathcal R_{1/2}(c_*)
```

if and only if

```math
J_*u
\in
N_*^{1/2}.
```

Hence

```math
\boxed{
J_*\left(
E_*
\cap
\mathcal R_{1/2}(c_*)
\right)
=
N_*^{1/2}.
}
```

Therefore

```math
\boxed{
E_*
\cap
\mathcal R_{1/2}(c_*)
\ne\{0\}
\iff
N_*^{1/2}
\ne\{0\}.
}
```

The selected-coordinate problem is not an independent geometric question.

It is exactly the (H^{1/2}) regularity problem for full neutral null modes.

---

## 6. Parity is transported exactly

Because the interval, background operator, and selected covariance respect
reflection, both

```math
\mathsf K
```

and

```math
A_{\rm full}
```

commute with parity.

Thus

```math
E_*
=
E_*^+
\oplus
E_*^-,
```

and

```math
\ker A_{\rm full}
=
N_*^+
\oplus
N_*^-.
```

The isomorphism (J_*) intertwines the parity decompositions.

Therefore

```math
\boxed{
E_*^\pm
\cap
\mathcal R_{1/2}^\pm(c_*)
\ne\{0\}
\iff
N_*^\pm
\cap
H^{1/2}_0
\ne\{0\}.
}
```

Parity only decomposes the physical regularity question into two blocks.

---

## 7. Pure logarithmic rank-one model

The previous equivalence does not yet show whether
(N_*^{1/2}) must be nonzero.

A sharp comparison model shows that it need not be.

Let

```math
\Omega=(-r,r)
```

be a sufficiently small symmetric interval on which the Dirichlet logarithmic
Laplacian

```math
B=L_\Delta^\Omega
```

has positive principal spectral bottom, so

```math
B\succ0.
```

Let

```math
g\equiv1
```

on (Omega), and define the torsion solution

```math
w
=
B^{-1}g.
```

For the positive logarithmic torsion problem, sharp boundary regularity gives
the generic scale

```math
w(x)
\asymp
\ell^{1/2}
(\operatorname{dist}(x,\partial\Omega))
```

near the boundary in the regime covered by the logarithmic Hopf theorem.

As shown in RPB-28, this implies

```math
\boxed{
\widetilde w
\notin
H^{1/2}(\mathbb R).
}
```

The forcing (g\equiv1) is smooth and even.

---

## 8. Normalize a rank-one selected channel to unit gain

Put

```math
q
=
\langle
g,
B^{-1}g
\rangle
=
\langle g,w\rangle
>
0
```

and

```math
\alpha
=
q^{-1/2}.
```

Define a one-dimensional selected analysis map

```math
\Phi:
L^2(\Omega)
\to
\mathbb C
```

by

```math
\boxed{
\Phi f
=
\alpha
\langle
g,f
\rangle.
}
```

Then

```math
\Phi^*1
=
\alpha g.
```

Its Birman--Schwinger scalar is

```math
\begin{aligned}
\mathsf K
&=
\Phi B^{-1}\Phi^*
\\
&=
\alpha^2
\langle
g,B^{-1}g
\rangle
\\
&=
1.
\end{aligned}
```

Hence

```math
\boxed{
E_*
=
\mathbb C.
}
```

---

## 9. The full rank-one defect is nonnegative and neutral

Define

```math
\boxed{
A_*
=
B
-
\Phi^*\Phi.
}
```

Because the Birman--Schwinger norm is exactly one,

```math
A_*\succeq0.
```

The corresponding resolvent neutral vector is

```math
h_*
=
B^{-1}\Phi^*1
=
\alpha w.
```

Moreover,

```math
\Phi h_*
=
\alpha^2
\langle
g,w
\rangle
=
1,
```

and therefore

```math
\begin{aligned}
A_*h_*
&=
Bh_*
-
\Phi^*\Phi h_*
\\
&=
\alpha g
-
\alpha g
\\
&=
0.
\end{aligned}
```

So

```math
\boxed{
\ker A_*
=
\mathbb C h_*.
}
```

Yet

```math
\boxed{
\widetilde h_*
\notin
H^{1/2}(\mathbb R).
}
```

Thus

```math
\boxed{
E_*
\cap
\mathcal R_{1/2}
=
\{0\}.
}
```

---

## 10. What the model matches

This model contains all of the structural features relevant to the proposed
bootstrap:

- logarithmic-order Dirichlet background;
- strict positive background gap;
- finite selected sector;
- smooth selected forcing;
- even parity;
- exact Birman--Schwinger unit gain;
- nonnegative full operator;
- attained nonzero neutral null mode.

It still has

```math
N_*^{1/2}
=
\{0\}.
```

Thus these structural inputs do not force the desired regularity
intersection.

The model is not claimed to be an actual zeta selected packet.

Its role is sharpness:

```math
\boxed{
\text{operator species + unit gain + smooth forcing}
\not\Rightarrow
N_*^{1/2}\ne0.
}
```

---

## 11. Zero-moment labeling does not repair the model abstractly

If one wishes to append the canonical negative-pair source bookkeeping, the
one-dimensional selected coefficient may be mapped to raw pair coordinates

```math
1
\mapsto
\frac1{\sqrt2}(1,-1).
```

Then the raw selected label has

```math
\mathbf1^Tv=0.
```

This does not alter the physical resolvent or its boundary regularity.

Therefore the abstract zero-moment constraint cannot repair the regularity
failure.

Again, this is a custody/sharpness model, not an actual-zeta realization.

---

## 12. External comparison with pure logarithmic eigenfunction regularity

Known Dirichlet logarithmic-Laplacian eigenfunction theory gives boundedness,
interior continuity, and—under an exterior sphere condition—continuous
vanishing at the boundary.

It does not upgrade arbitrary eigenfunctions to (H^{1/2}).

The small-order fractional-eigenfunction literature explicitly emphasizes the
much weaker boundary regularity of logarithmic-Laplacian eigenfunctions
relative to spectral (log(-\Delta_D)) eigenfunctions.

Thus there is no external regularity theorem presently available that would
force

```math
N_*^{1/2}
\ne\{0\}
```

for the actual Weil neutral space merely because it is finite dimensional.

### Contextual sources

- H. Chen and T. Weth, *The Dirichlet problem for the logarithmic Laplacian*,
  Comm. Partial Differential Equations 44 (2019), 1100–1139.
- P. A. Feulefack, S. Jarohs, T. Weth,
  *Small Order Asymptotics of the Dirichlet Eigenvalue Problem for the
  Fractional Laplacian*, J. Fourier Anal. Appl. 28 (2022), Paper 18.
- V. Hernández-Santamaría, L. F. López Ríos, A. Saldaña,
  *Optimal boundary regularity and a Hopf-type lemma for Dirichlet problems
  involving the logarithmic Laplacian*, DCDS 45 (2025), 1–36.

---

## 13. Exact status for the actual Weil endpoint

For the actual finite-enlarged Weil operator, RPB-30 proves only the exact
equivalence

```math
\boxed{
E_*
\cap
\mathcal R_{1/2}(c_*)
\ne\{0\}
\iff
\ker A_{c_*}
\text{ contains a nonzero }H^{1/2}\text{ zero-extended null mode}.
}
```

No current H1/RPB theorem decides the right-hand side.

The sharp comparison model shows that it cannot be decided from the retained
abstract/operator-order hypotheses alone.

Therefore an actual-Weil-specific input is necessary.

---

## 14. RPB-30 determination

```math
\boxed{
\textbf{RPB-30 — UNIT GAIN DOES NOT FORCE A HALF-SOBOLEV CROSSING DIRECTION.}
}
```

Exact positive theorem:

```math
\boxed{
\ker(\mathsf K_{c_*}-I)
\cong
\ker A_{c_*}.
}
```

Exact regularity reduction:

```math
\boxed{
E_*
\cap
\mathcal R_{1/2}(c_*)
\cong
N_*^{1/2}.
}
```

Sharp no-go:

```math
\boxed{
\text{positive logarithmic background}
+
\text{smooth finite selected forcing}
+
\text{unit gain}
\not\Rightarrow
N_*^{1/2}\ne0.
}
```

The first-variation route therefore cannot continue from unit-gain geometry
alone.

Next cursor:

```text
RPB-31 / ACTUAL-WEIL NEUTRAL NULLSPACE BOUNDARY REGULARITY
```

The next pass should test whether the actual compact-window Weil null equation
contains additional zeta-specific boundary structure—beyond generic
logarithmic order and finite translations—that can decide whether
(N_*^{1/2}) is trivial or nontrivial. Candidate inputs include the exact
archimedean kernel, pole term, parity-resolved null equation, and finite prime
delay geometry.
