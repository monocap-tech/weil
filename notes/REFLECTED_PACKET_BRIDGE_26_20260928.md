# RPB-26 — Resolvent extremizer to support-dependent explicit-formula multiplier

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / UNIFORMLY BOUNDED RESOLVENT MULTIPLIER FAMILY EXISTS / SCALAR CROSSING CUSTODY STILL OPEN**  
**Dependencies:** RPB-24, RPB-25; WD-T30–WD-T33; fixed finite selected packet.  
**Promotion status:** none.

## 0. Objective

RPB-25 showed that the bare fixed source response

```math
R_v(\mu)
```

cannot encode the support-dependent Birman--Schwinger crossing.

The missing support datum is carried by the resolvent extremizer

```math
h_{a,u}
=
A_{B,a}^{-1}\Phi_a^*u.
```

RPB-26 asks whether (h_{a,u}) can generate a support-dependent scalar multiplier suitable for the explicit-formula / next-jet machinery, while preserving the boundedness required for far-tail control.

The answer is:

1. yes at the analytic multiplier level;
2. yes for uniform strip bounds;
3. yes for selected-preserving projection, provided the standard finite selected-contraction continuity is used;
4. but the present H1 normalization does not certify that the over-budget scalar (kappa_a-1) survives that projection as a nontrivial explicit-formula datum.

---

## 1. Right-edge resolvent branch

Let

```math
a_n\downarrow c_*.
```

Choose unit top Birman--Schwinger eigenvectors

```math
u_n\in M',
\qquad
\mathsf K_{a_n}u_n
=
\kappa_nu_n,
```

with

```math
\kappa_n>1,
\qquad
\kappa_n\to1.
```

After passage to a subsequence,

```math
u_n\to u_*,
\qquad
\|u_*\|=1.
```

Define the resolvent extremizers

```math
\boxed{
h_n
=
h_{a_n,u_n}
=
A_{B,a_n}^{-1}\Phi_{a_n}^*u_n.
}
```

Then

```math
\boxed{
\Phi_{a_n}h_n
=
\kappa_nu_n.
}
```

At the endpoint,

```math
h_*
=
A_{B,c_*}^{-1}\Phi_{c_*}^*u_*,
qquad
\Phi_{c_*}h_*
=
u_*.
```

---

## 2. Uniform physical bound

RPB-19 supplies a uniform right-neighborhood background gap:

```math
A_{B,a}\succeq\eta I
```

for

```math
c_*\le a<c_*+\delta_*
```

with some

```math
\eta>0.
```

The finite selected maps vary continuously in (a), so on a smaller compact right neighborhood

```math
\sup_a\|\Phi_a\|
<
\infty.
```

Therefore, for unit (u),

```math
\|h_{a,u}\|_2
\le
\|A_{B,a}^{-1}\|
\,\|\Phi_a^*\|
\le
\eta^{-1}
\sup_a\|\Phi_a\|.
```

Hence:

```math
\boxed{
\sup_n\|h_n\|_2
<
\infty.
}
```

All (h_n) are supported in one fixed compact interval

```math
[-B,B]
```

for any fixed

```math
B>c_*
```

containing the chosen right neighborhood.

---

## 3. Resolvent multiplier candidate

Define the centered bilateral Laplace transform

```math
\boxed{
\psi_n^{\rm res}(s)
=
\int_{-a_n}^{a_n}
h_n(x)e^{x(s-1/2)}\,dx.
}
```

For the closed critical strip

```math
0\le\Re s\le1,
```

we have

```math
|e^{x(s-1/2)}|
\le
e^{B/2}.
```

Thus

```math
\begin{aligned}
|\psi_n^{\rm res}(s)|
&\le
e^{B/2}\|h_n\|_1
\\
&\le
e^{B/2}\sqrt{2B}\,\|h_n\|_2.
\end{aligned}
```

Therefore

```math
\boxed{
\sup_n
\sup_{0\le\Re s\le1}
|\psi_n^{\rm res}(s)|
<
\infty.
}
```

So the resolvent extremizers produce a uniformly bounded family of entire strip multipliers.

---

## 4. Continuity along the selected subsequence

Under the fixed-interval scaling used in RPB-19,

```math
a
\mapsto
A_{B,a}^{-1}
```

and

```math
a
\mapsto
\Phi_a
```

are norm-continuous on the strict background-gap neighborhood.

Together with

```math
u_n\to u_*,
```

this gives strong convergence of the scaled extremizers.

After zero extension to the common compact interval ([-B,B]),

```math
h_n\to h_*
```

in (L^2), hence also in (L^1).

Consequently

```math
\boxed{
\sup_{0\le\Re s\le1}
|\psi_n^{\rm res}(s)-\psi_*^{\rm res}(s)|
\to0.
}
```

Thus the multiplier family is not only uniformly bounded but uniformly strip-continuous along the branch.

---

## 5. Selected evaluations retain the over-budget factor vectorially

Let

```math
\operatorname{Ev}_{\Pi'}
```

denote the finite selected raw evaluation map in the same zero-column normalization used to define the physical selected analysis map.

Up to the fixed pair-to-raw / Bombieri normalization matrix (W_{Pi'}),

```math
\operatorname{Ev}_{\Pi'}
\psi_n^{\rm res}
```

is the raw-coordinate image of

```math
\Phi_{a_n}h_n.
```

Hence

```math
\boxed{
\operatorname{Ev}_{\Pi'}
\psi_n^{\rm res}
=
\kappa_n
\,W_{\Pi'}v_n,
}
```

where

```math
v_n=Uu_n
```

is the raw zero-moment selected source.

At the endpoint,

```math
\boxed{
\operatorname{Ev}_{\Pi'}
\psi_*^{\rm res}
=
W_{\Pi'}v_*.
}
```

So the support crossing **is visible at the vector selected-evaluation level**.

---

## 6. Important scalarization custody issue

The canonical ZW2 scalarization does not identify the selected contracted-residue functional

```math
\mathcal C_v[\psi]
```

with a specific Hermitian pairing

```math
\langle
v,
\operatorname{Ev}_{\Pi'}\psi
\rangle.
```

WD-T30 deliberately formalizes

```math
\mathcal C_v
```

only as a complex-linear functional on the multiplier space.

Therefore Section 5 does **not** yet imply a canonical scalar identity such as

```math
\mathcal C_{v_n}
[
\psi_n^{\rm res}
]
=
\kappa_n\|v_n\|^2.
```

That identity would require an explicit contraction convention and the appropriate conjugation/weight matrix.

Thus:

```math
\boxed{
\text{vector crossing custody}
\not\Rightarrow
\text{certified scalar crossing custody}
}
```

at current H1 standing.

---

## 7. Natural Hermitian-contraction route, conditional only

If one later proves that the selected contracted-residue row is, after the fixed normalization,

```math
\mathcal C_v[\psi]
=
\langle
Wv,
\operatorname{Ev}_{\Pi'}\psi
\rangle
```

for a fixed positive/Hermitian packet metric (W), then Section 5 would give

```math
\mathcal C_{v_n}
[
\psi_n^{\rm res}
]
=
\kappa_n
\langle
Wv_n,W_{\Pi'}v_n
\rangle.
```

Under compatible normalization this would carry (kappa_n) directly.

No such Hermitian-contraction identification is promoted in RPB-26.

This is a conditional route only.

---

## 8. Selected-preserving projection exists without losing strip control

Consider first the nondegenerate case in which the limiting selected functional

```math
\mathcal C_{v_*}
```

is not identically zero.

Choose one fixed admissible exponential mode

```math
\chi
```

such that

```math
\mathcal C_{v_*}[\chi]\ne0.
```

Because the selected packet is finite and the raw contraction depends continuously on the finite source coordinates, after shrinking the subsequence,

```math
|\mathcal C_{v_n}[\chi]|
\ge
c_\chi
>
0.
```

Define

```math
\boxed{
\psi_n^{\rm sp}
=
\psi_n^{\rm res}
-
\frac{
\mathcal C_{v_n}
[
\psi_n^{\rm res}
]
}{
\mathcal C_{v_n}[\chi]
}
\chi.
}
```

Then

```math
\boxed{
\mathcal C_{v_n}[\psi_n^{\rm sp}]
=
0.
}
```

Because all selected contractions are finite-dimensional and the family

```math
\psi_n^{\rm res}
```

is uniformly bounded on the selected finite set, the scalar correction coefficients remain bounded along the subsequence.

Since (chi) is fixed and bounded on the zero strip,

```math
\boxed{
\sup_n
\sup_{0\le\Re s\le1}
|\psi_n^{\rm sp}(s)|
<
\infty.
}
```

Thus the resolvent-derived family can be made selected-preserving without sacrificing the WD-T31 strip-bound regime.

---

## 9. Degenerate selected-contraction branch

If

```math
\mathcal C_{v_*}\equiv0,
```

then the limiting source already annihilates every multiplier in the chosen scalarization space.

Along an exactly fixed source branch no selected-preserving correction is needed.

For the moving finite source sequence (v_n\to v_*), one may either:

1. pass to a further branch on which the finite functionals are nonzero and use Section 8; or
2. work directly with the unprojected bounded multiplier family until the exact limiting contraction is fixed.

No nontrivial crossing scalar is obtained merely from the degeneracy

```math
\mathcal C_{v_*}\equiv0.
```

---

## 10. Uniform far-tail control for the moving finite source family

WD-T31 is canonically stated for a fixed source.

Here the packet (Pi') is fixed and

```math
v_n
```

lies in a compact subset of its finite zero-moment source space.

The inverse-square constant

```math
C(v)
=
\|M_1(v)\|
+
2M_2(v)
```

used in WD-T31 depends continuously on the finitely many source coordinates.

Hence

```math
\boxed{
\sup_n C(v_n)<\infty.
}
```

Combined with the uniform strip bound from Section 8 and the same zeta unit-height zero count,

```math
\boxed{
\sup_n
|
\mathcal F_{v_n,R}
[
\psi_n^{\rm sp}
]
|
\ll
\frac{\log R}{R}.
}
```

Therefore

```math
\boxed{
\sup_n
|
\mathcal F_{v_n,R}
[
\psi_n^{\rm sp}
]
|
\to0
\qquad(R\to\infty).
}
```

This is a branch-local uniform-family extension of the fixed-source WD-T31 estimate.

It uses only compactness of the fixed finite source sphere and uniform multiplier bounds.

---

## 11. The weighted next-jet field is therefore available uniformly

For every fixed cutoff (R),

```math
\boxed{
\mathcal N_{v_n,R}
[
\psi_n^{\rm sp}
]
=
\sum_{\mu}^{\rm near}
m_\mu
\psi_n^{\rm sp}(\mu)
\frac{
H_{v_n}^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

And the far complement is uniformly small for large (R).

Thus the support-dependent multiplier construction is fully compatible with the **localization mechanics** of the existing next-jet package.

What remains is whether it carries the crossing sign/margin.

---

## 12. Why selected-preserving projection may erase the crossing datum

The vector identity

```math
\Phi_{a_n}h_n
=
\kappa_nu_n
```

lives exactly in the selected coordinate sector.

The operation

```math
\psi
\mapsto
\psi
-
\frac{
\mathcal C_v[\psi]
}{
\mathcal C_v[\chi]
}
\chi
```

is designed to annihilate the selected contracted-residue scalar.

Therefore it deliberately removes one scalar projection of the selected information.

Unless the explicit contraction convention is known and one proves that the remaining complementary/prime/archimedean rows retain a controlled component proportional to

```math
\kappa_n-1,
```

there is no theorem that the over-budget signal survives.

This is not a boundedness problem.

It is a **scalar custody problem**.

---

## 13. Even under Hermitian contraction, the signal degenerates at the edge

Suppose conditionally that Section 7's Hermitian contraction holds and that

```math
\mathcal C_{v_n}
[
\psi_n^{\rm res}
]
=
\kappa_n c_n
```

with

```math
c_n\to c_*\ne0.
```

Then the selected-preserving projection has the schematic form

```math
\psi_n^{\rm sp}
=
\psi_n^{\rm res}
-
\kappa_n\alpha_n\chi,
```

with

```math
\alpha_n\to\alpha_*.
```

Since

```math
\kappa_n\to1
```

and

```math
\psi_n^{\rm res}
\to
\psi_*^{\rm res}
```

uniformly on the strip,

```math
\psi_n^{\rm sp}
\to
\psi_*^{\rm sp}.
```

Thus the first post-edge over-budget excess

```math
\kappa_n-1
```

vanishes in the unrenormalized multiplier limit.

No nonzero limiting near-field floor follows.

---

## 14. Exact remaining datum is first-order / crossing-normalized

The natural quantity is therefore not

```math
\psi_n^{\rm sp}
```

itself but a renormalized support difference such as

```math
\boxed{
\frac{
\psi_n^{\rm sp}
-
\psi_*^{\rm sp}
}{
\kappa_n-1
}.
}
```

A useful theorem would need to establish some combination of:

1. boundedness of this quotient on the zero strip;
2. convergence to a nonzero multiplier;
3. selected-preserving compatibility;
4. a nontrivial limiting next-jet / prime / archimedean identity.

Current continuity results provide only

```math
\psi_n^{\rm sp}
-
\psi_*^{\rm sp}
\to0.
```

They provide no rate relative to

```math
\kappa_n-1.
```

So the exact missing ingredient is a first-variation/transversality theorem.

---

## 15. Explicit-formula admissibility scope

There is one additional scope point.

The canonical H1 scalarization theorem explicitly certifies finite linear combinations of the bounded-depth exponential modes

```math
e^{\tau(s-c)}.
```

The resolvent multiplier

```math
\psi_n^{\rm res}(s)
=
\int
h_n(x)e^{x(s-1/2)}\,dx
```

is a compact-support superposition of exactly those modes and has the required strip bound.

However H1 does not separately state a closure theorem saying that **every** such compact-support (L^1) superposition belongs to the admissible scalar-multiplier class of the retained explicit formula.

Therefore RPB-26 records:

```math
\boxed{
\text{analytic multiplier candidate + uniform strip control: PROVED};
}
```

while the completely formal passage into the canonical scalar explicit-formula class is

```math
\boxed{
\text{admissibility closure: NOT YET RATIFIED}.
}
```

This does not affect the boundedness/no-go conclusions above.

---

## 16. RPB-26 determination

```math
\boxed{
\textbf{RPB-26 — RESOLVENT MULTIPLIER FAMILY EXISTS, BUT CROSSING SCALARIZATION IS NOT YET CLOSED.}
}
```

Established:

```math
\boxed{
\sup_n
\sup_{0\le\Re s\le1}
|
\psi_n^{\rm res}(s)
|
<
\infty,
}
```

and, after selected-preserving projection in the nondegenerate branch,

```math
\boxed{
\sup_n
\sup_{0\le\Re s\le1}
|
\psi_n^{\rm sp}(s)
|
<
\infty.
}
```

Consequently the moving finite source/multiplier family has uniform far-tail control:

```math
\boxed{
\sup_n
|
\mathcal F_{v_n,R}
[
\psi_n^{\rm sp}
]
|
=
O\!\left(
\frac{\log R}{R}
\right).
}
```

But:

```math
\boxed{
\Phi_{a_n}h_n
=
\kappa_nu_n
}
```

has not yet been converted into a certified nonzero scalar next-jet forcing statement after selected-preserving projection.

The surviving obstruction is a first-order scalar custody problem, not a tail or compactness problem.

Next cursor:

```text
RPB-27 / CROSSING-NORMALIZED MULTIPLIER FIRST VARIATION
```

The next pass should test whether the norm-continuous families
(A_{B,a}^{-1}), (Phi_a), and the finite Birman--Schwinger matrix admit enough one-sided differentiability or quantitative modulus control at (c_*) to compare

```math
\psi_a^{\rm sp}-\psi_{c_*}^{\rm sp}
```

with

```math
\kappa_a-1,
```

and thereby produce a nontrivial limiting support-dependent next-jet datum.
