# RPB-22 — Unit-gain → over-budget crossing datum to arithmetic forcing

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / EXACT CROSSING GRAM IDENTIFIED / NO DIRECT NEXT-JET FORCING YET**  
**Dependencies:** RPB-19 through RPB-21; WD-B4/B5; ZW1-T7/T8; ZW2-T1–T4.  
**Promotion status:** none.

## 0. Objective

RPB-21 showed that critical source custody reaches the same source-level next-jet object as WD-T37 but does not inherit WD-T37's strict-margin contradiction datum.

RPB-22 asks what the critical branch's exact replacement datum is and whether it can already be written as a nontrivial condition on the weighted next-jet field.

The replacement datum is an exact finite-dimensional inverse-background Gram crossing.

It is not yet identified with the scalar next-jet field.

---

## 1. Strict background positivity removes the range-defect branch

Fix the finite nullspace-covering packet from RPB-18/19:

```math
M'
=
M_{\Pi'}.
```

On a strict right neighborhood

```math
c_*\le a<c_*+\delta_*,
```

RPB-19 gives

```math
A_{B',a}
\succeq
\eta I
```

for some uniform

```math
\eta>0.
```

After legitimate background elimination, write

```math
A_{B',a}
=
S_{{\rm eff},a}S_{{\rm eff},a}^{*}.
```

Since (A_{B',a}) is boundedly invertible,

```math
S_{{\rm eff},a}
```

is surjective.

Therefore every selected physical source lies in its range:

```math
\operatorname{Ran}S_{M',a}
\subseteq
\operatorname{Ran}S_{{\rm eff},a}
=
\mathcal H_a.
```

So on this neighborhood there is no residual selected range-defect alternative.

The post-edge defect is necessarily an **over-budget** defect.

---

## 2. Explicit reduced screening solution

The Douglas reduced solution

```math
C_a:
M'\to(\ker S_{{\rm eff},a})^\perp
```

of

```math
S_{M',a}
=
-
S_{{\rm eff},a}C_a
```

is explicitly

```math
\boxed{
C_a
=
-
S_{{\rm eff},a}^{*}
A_{B',a}^{-1}
S_{M',a}.
}
```

Indeed,

```math
\begin{aligned}
S_{{\rm eff},a}C_a
&=
-
S_{{\rm eff},a}
S_{{\rm eff},a}^{*}
A_{B',a}^{-1}
S_{M',a}
\\
&=
-
A_{B',a}
A_{B',a}^{-1}
S_{M',a}
\\
&=
-
S_{M',a}.
\end{aligned}
```

Its range is automatically orthogonal to the kernel of (S_{{\rm eff},a}).

---

## 3. Background Birman--Schwinger matrix

Define

```math
\boxed{
\mathsf K_a
:=
C_a^{*}C_a.
}
```

Using the explicit formula above,

```math
\begin{aligned}
\mathsf K_a
&=
S_{M',a}^{*}
A_{B',a}^{-1}
S_{{\rm eff},a}
S_{{\rm eff},a}^{*}
A_{B',a}^{-1}
S_{M',a}
\\
&=
\boxed{
S_{M',a}^{*}
A_{B',a}^{-1}
S_{M',a}.
}
```

Thus (mathsf K_a) is a finite-dimensional positive Hermitian operator on (M').

This is the exact residual screening-cost matrix.

---

## 4. Full defect factorization

Let

```math
B_a
=
A_{B',a}^{-1/2}
S_{M',a}.
```

Then

```math
B_a^{*}B_a
=
\mathsf K_a.
```

The full compact-window defect is

```math
D_{{\rm full},a}
=
A_{B',a}
-
S_{M',a}S_{M',a}^{*}.
```

Hence

```math
\boxed{
D_{{\rm full},a}
=
A_{B',a}^{1/2}
\left(
I-B_aB_a^{*}
\right)
A_{B',a}^{1/2}.
}
```

Because (A_{B',a}^{1/2}) is invertible,

```math
D_{{\rm full},a}\succeq0
```

if and only if

```math
B_aB_a^{*}\preceq I.
```

The nonzero spectra of (B_aB_a^{*}) and (B_a^{*}B_a=mathsf K_a) coincide.

Therefore:

```math
\boxed{
D_{{\rm full},a}\succeq0
\iff
\mathsf K_a\preceq I.
}
```

And:

```math
\boxed{
D_{{\rm full},a}
\text{ has a negative direction}
\iff
\lambda_{\max}(\mathsf K_a)>1.
}
```

This is the exact unit-gain/over-budget criterion.

---

## 5. The neutral edge is exactly a unit Birman--Schwinger threshold

At

```math
a=c_*,
```

the full operator is nonnegative and has nonzero nullspace.

Thus

```math
\mathsf K_{c_*}\preceq I.
```

If all eigenvalues of (mathsf K_{c_*}) were strictly below (1), then the factorization in Section 4 would make the full operator strictly positive because the background has a strict positive gap.

That contradicts

```math
\ker A_{c_*}\ne\{0\}.
```

Hence

```math
\boxed{
\lambda_{\max}(\mathsf K_{c_*})
=
1.
}
```

For every sufficiently close strict right enlargement,

```math
\lambda_a^{\rm full}<0,
```

so

```math
\boxed{
\lambda_{\max}(\mathsf K_a)
>
1.
}
```

Therefore the post-neutral transition is exactly:

```math
\boxed{
\lambda_{\max}(\mathsf K_{c_*})=1
\quad\longrightarrow\quad
\lambda_{\max}(\mathsf K_a)>1.
}
```

---

## 6. Support continuity of the crossing matrix

RPB-19 scaled the background form to one fixed interval and represented it as

```math
\bar A_{B',a}
=
A_0
+
B(a),
```

where (A_0) is the operator associated with the fixed singular logarithmic form and (B(a)) is a bounded self-adjoint perturbation varying continuously in operator norm.

On the right neighborhood under consideration,

```math
\bar A_{B',a}
\succeq
\eta I.
```

Therefore

```math
a
\longmapsto
\bar A_{B',a}^{-1}
```

is operator-norm continuous by the resolvent identity.

The finitely many scaled selected synthesis columns also vary continuously in (L^2), hence the finite synthesis map

```math
\bar S_{M',a}
```

varies continuously in operator norm.

Consequently

```math
\boxed{
a
\longmapsto
\mathsf K_a
```

is norm-continuous as a finite-dimensional Hermitian family.

---

## 7. Eigenvector/source compactness

Let

```math
a_n\downarrow c_*.
```

Choose unit top eigenvectors

```math
u_n\in M',
\qquad
\mathsf K_{a_n}u_n
=
\kappa_n u_n,
```

with

```math
\kappa_n
=
\lambda_{\max}(\mathsf K_{a_n})
>
1.
```

Finite dimensionality gives, after a subsequence,

```math
u_n\to u_*,
\qquad
\|u_*\|=1.
```

Norm continuity of (mathsf K_a) gives

```math
\kappa_n\to1
```

and

```math
\boxed{
\mathsf K_{c_*}u_*
=
u_*.
}
```

Thus the limiting critical source direction is literally a unit eigenvector of the endpoint inverse-background Gram matrix.

---

## 8. Raw source coordinates

Let

```math
U:
M'
\to
V_{\Pi'}
```

be the fixed pair-to-raw coordinate unitary, with (V_{Pi'}) the finite raw selected source space.

Set

```math
v_n=Uu_n,
\qquad
v_*=Uu_*.
```

Then

```math
v_n\to v_*,
\qquad
v_*\ne0.
```

By canonical pair antisymmetry,

```math
\boxed{
\mathbf1^Tv_n
=
\mathbf1^Tv_*
=
0.
}
```

Define the raw-coordinate crossing matrix

```math
\widehat{\mathsf K}_a
=
U\mathsf K_aU^{-1}.
```

Then

```math
\boxed{
\widehat{\mathsf K}_{c_*}v_*
=
v_*.
}
```

And along the strict right branch,

```math
\boxed{
\langle
(\widehat{\mathsf K}_{a_n}-I)v_n,
v_n
\rangle
=
\kappa_n-1
>
0.
}
```

This is the exact arithmetic-coordinate crossing datum.

---

## 9. Inverse-background source energy

For (u\in M'), define

```math
\mathfrak E_a(u)
=
\langle
(\mathsf K_a-I)u,u
\rangle.
```

Equivalently,

```math
\boxed{
\mathfrak E_a(u)
=
\langle
A_{B',a}^{-1}S_{M',a}u,
S_{M',a}u
\rangle
-
\|u\|^2.
}
```

For unit top eigenvectors:

```math
\mathfrak E_{c_*}(u_*)=0,
```

while

```math
\mathfrak E_{a_n}(u_n)>0.
```

This is the exact unit-gain-to-over-budget branch obligation.

It survives even when the normalized (J)-signature margin tends to zero.

---

## 10. Dual variational form

Because

```math
A_{B',a}\succ0,
```

for

```math
g_u
=
S_{M',a}u
```

one has

```math
\boxed{
\langle
A_{B',a}^{-1}g_u,
g_u
\rangle
=
\sup_{h\ne0}
\frac{
|\langle g_u,h\rangle|^2
}{
\langle A_{B',a}h,h\rangle
}.
}
```

Therefore over-budget crossing is equivalent to

```math
\boxed{
\exists u,\ \|u\|=1:
\sup_{h\ne0}
\frac{
|\langle S_{M',a}u,h\rangle|^2
}{
\langle A_{B',a}h,h\rangle
}
>
1.
}
```

At the endpoint, the supremum equals (1) on (u_*).

So the critical branch carries a precise inverse-background extremal relation, not merely the statement that a source exists.

---

## 11. Comparison with the source-level next-jet field

For each raw source (v), the ZW2 next-jet object is linear in (v):

```math
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)R_v(\mu).
```

By contrast, the crossing energy is quadratic in (v) and contains the inverse background operator:

```math
\boxed{
\langle
\widehat{\mathsf K}_a v,v
\rangle.
}
```

These are not currently identified by any Horizon-1 theorem.

The next-jet package knows:

- the fixed source (v);
- its rational response (R_v);
- complementary zero evaluations;
- the scalar explicit-formula balance.

The Birman--Schwinger crossing additionally knows:

- the support-dependent background-only operator;
- its inverse;
- the minimum positive compensation cost after all unselected negative background has been absorbed.

That inverse/minimization datum is not present in the scalar next-jet representation as currently normalized.

---

## 12. Why scalarization does not automatically recover the inverse metric

ZW2 selected scalarization chooses (psi) so that

```math
\mathcal C_v[\psi]=0.
```

This removes the selected contracted-residue row and leaves

```math
\mathcal N_v[\psi]
+
\mathcal F_v[\psi]
=
\mathcal P_v[\psi]
+
\mathcal A_v[\psi].
```

That operation is linear in (v).

It does not solve the variational problem

```math
A_{B',a}h=S_{M',a}u
```

or identify the extremizer

```math
h
=
A_{B',a}^{-1}S_{M',a}u.
```

Therefore the scalar multiplier supplied by ZW2-T1 is not, merely by construction, the dual extremizer encoding the Birman--Schwinger energy.

A new bridge theorem would be required.

---

## 13. No current lower bound on the near field follows from the crossing

The crossing gives

```math
\mathfrak E_{a_n}(u_n)>0.
```

It does **not** currently imply, for a fixed selected-preserving multiplier,

```math
|\mathcal N_{v_n,R}[\psi]|
\ge
c>0,
```

nor a signed inequality of that form.

This agrees with the existing scope guard WD-S04:

```math
\boxed{
\text{next-jet localization}
\not\Rightarrow
\text{a source-free uniform lower bound}.
}
```

RPB-22 adds that even the critical over-budget crossing itself has not yet been transported into such a lower bound.

---

## 14. What has been achieved

The critical branch contradiction datum is no longer vague.

It is the finite-dimensional spectral crossing

```math
\boxed{
\lambda_{\max}
\left(
S_{M',a}^{*}
A_{B',a}^{-1}
S_{M',a}
\right)
:
1
\longrightarrow
>1.
}
```

In raw source coordinates, a subsequence supplies

```math
\boxed{
v_n\to v_*\ne0,
\qquad
\widehat{\mathsf K}_{c_*}v_*=v_*,
\qquad
\langle
(\widehat{\mathsf K}_{a_n}-I)v_n,v_n
\rangle>0.
}
```

This is the exact replacement for the missing fixed (kappa) datum.

---

## 15. Arithmetic forcing status

The requested transfer to the existing weighted next-jet field is:

```math
\boxed{
\textbf{NOT YET PROVED}.
}
```

What is missing is a theorem relating the inverse-background Gram

```math
\widehat{\mathsf K}_a
```

to the complementary Cauchy/next-jet response of the same source.

Schematically, one needs some controlled relation of the form

```math
\boxed{
\text{inverse-background source energy}
\quad\longleftrightarrow\quad
\text{complementary divisor response}.
}
```

No such relation is part of H1.

---

## 16. RPB-22 determination

```math
\boxed{
\textbf{RPB-22 — CRITICAL CROSSING DATUM = BACKGROUND BIRMAN--SCHWINGER THRESHOLD.}
}
```

Exact result:

```math
\boxed{
\lambda_{\max}(\mathsf K_{c_*})=1,
\qquad
\lambda_{\max}(\mathsf K_a)>1
\text{ for strict right }a,
}
```

where

```math
\boxed{
\mathsf K_a
=
S_{M',a}^{*}
A_{B',a}^{-1}
S_{M',a}.
}
```

The raw zero-moment source survives and can be chosen compatibly with this threshold.

But:

```math
\boxed{
\text{Birman--Schwinger crossing}
\not\stackrel{\rm current\ theory}{\Longrightarrow}
\text{nontrivial weighted next-jet lower bound}.
}
```

Next cursor:

```text
RPB-23 / BACKGROUND BIRMAN-SCHWINGER GRAM ↔ COMPLEMENTARY CAUCHY FIELD
```

The next pass should test whether the inverse-background Gram can be reconstructed as a Schur/complement limit of finite zero-side Gram matrices and whether that limit exposes the same reciprocal-Cauchy structure appearing in (R_v(\mu)) and the completed-(Xi) next-jet field.
