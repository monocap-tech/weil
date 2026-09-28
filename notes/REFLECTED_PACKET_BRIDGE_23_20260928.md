# RPB-23 — Background Birman--Schwinger Gram versus complementary Cauchy field

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / PHYSICAL SCHUR RECONSTRUCTION YES / ZERO-SIDE CAUCHY IDENTIFICATION NO / RPB-22 CARRIER CORRECTION**  
**Dependencies:** RPB-18 through RPB-22; WD-B7; WD-T28; WD-T32; Bombieri EXT-2C.  
**Promotion status:** none.

## 0. Objective

RPB-22 identified the critical post-neutral crossing with a finite-dimensional Birman--Schwinger threshold and proposed to compare that matrix with the reciprocal-Cauchy field

```math
R_v(mu)
=
\sum_{\rho_j\in\Pi'}
\frac{v_j}{\mu-\rho_j}.
```

RPB-23 asks whether the Birman--Schwinger matrix can be recovered as a Schur/complement limit of finite zero-side matrices in a way that exposes the same kernel.

The result has three parts.

1. The Birman--Schwinger matrix **does** admit a canonical finite Schur/Galerkin reconstruction in the physical form carrier.
2. Horizon 1 does **not** show that the native zero-side coordinate truncations form a core for that physical background form.
3. Bombieri's finite matrix is complex symmetric rather than the Hermitian positive Gram needed for the inverse-background Schur problem, so it cannot be silently substituted.

Hence no reciprocal-Cauchy identification is obtained.

A carrier correction to RPB-22 is also required.

---

## 1. Carrier correction to RPB-22

RPB-22 wrote schematically

```math
A_{B',a}
=
S_{{\rm eff},a}S_{{\rm eff},a}^{*}
```

and then identified the physical Birman--Schwinger matrix with the Douglas coefficient Gram

```math
C_a^{*}C_a.
```

That step mixes two different realizations.

### Native Problem-1 carrier

WD-T28 proves that the native zero synthesis is Hilbert--Schmidt in the Green-preconditioned metric

```math
H^{-1}_L(-a,a).
```

Therefore the bounded zero-side synthesis/defect realization is compact at fixed support.

### Canonical compact-window operator

Suzuki's canonical operator

```math
A_a
```

acts in the (L^2)/closed-form realization.

It is lower bounded and has discrete spectrum with eigenvalues tending to (+infty).

It is not the same bounded compact operator as the native (H^{-1}_L) zero synthesis defect.

Thus:

```math
\boxed{
\text{native compact zero-side carrier}
\ne
\text{canonical }L^2\text{ operator carrier}
}
```

unless an explicit Green/metric intertwiner is inserted.

The abstract identity "same quadratic-form problem" does not license equality of the representing operators across these metrics.

Historical RPB-22 text is left unchanged; RPB-23 narrows its interpretation additively.

---

## 2. Correct physical Birman--Schwinger setup

Retain the finite packet

```math
\Pi'
```

from RPB-18 and the strict background gap from RPB-19.

Let

```math
A_{B,a}\succ0
```

be the canonical physical background operator on

```math
L^2(-a,a),
```

with closed quadratic form

```math
q_{B,a}.
```

Let the finite selected analysis map be

```math
\Phi_a:
L^2(-a,a)
\to
M',
```

so that the selected covariance is

```math
\Phi_a^{*}\Phi_a.
```

Then the full form is

```math
\boxed{
q_{{\rm full},a}[h]
=
q_{B,a}[h]
-
\|\Phi_a h\|^2.
}
```

The correctly typed physical Birman--Schwinger matrix is

```math
\boxed{
\mathsf K_a
=
\Phi_a
A_{B,a}^{-1}
\Phi_a^{*}
\quad\text{on }M'.
}
```

This definition is meaningful because:

- (A_{B,a}^{-1}) is bounded on (L^2) under the strict background gap;
- (M') is finite dimensional;
- (Phi_a) is bounded.

---

## 3. Birman--Schwinger threshold survives the correction

Define

```math
B_a
=
\Phi_a A_{B,a}^{-1/2}.
```

Then

```math
\mathsf K_a
=
B_aB_a^{*}.
```

For (h) in the form domain,

```math
\begin{aligned}
q_{{\rm full},a}[h]
&=
\|A_{B,a}^{1/2}h\|^2
-
\|\Phi_a h\|^2
\\
&=
\left\langle
\left(
I-B_a^{*}B_a
\right)
A_{B,a}^{1/2}h,
A_{B,a}^{1/2}h
\right\rangle.
\end{aligned}
```

Since (A_{B,a}^{1/2}) has onto range under strict positivity,

```math
\boxed{
q_{{\rm full},a}\ge0
\iff
B_a^{*}B_a\preceq I
\iff
\mathsf K_a\preceq I.
}
```

Therefore the threshold conclusion of RPB-22 remains valid in the corrected carrier:

```math
\boxed{
\lambda_{\max}(\mathsf K_{c_*})=1,
\qquad
\lambda_{\max}(\mathsf K_a)>1
}
```

for sufficiently close strict right (a>c_*).

What is withdrawn is only the unproved identification

```math
\mathsf K_a=C_a^{*}C_a
```

with a Douglas matrix living in the native preconditioned coefficient realization.

---

## 4. Physical Galerkin/Schur reconstruction

Fix (a) in the right neighborhood and suppress (a) from the notation.

Choose finite-dimensional subspaces

```math
V_1\subset V_2\subset\cdots
\subset
\mathfrak D(q_B)
```

whose union is a **form core** for (q_B).

For (u\in M'), define

```math
g_u
=
\Phi^{*}u.
```

The inverse-background energy has the variational representation

```math
\boxed{
\langle \mathsf Ku,u\rangle
=
\sup_{0\ne h\in\mathfrak D(q_B)}
\frac{
|\langle g_u,h\rangle|^2
}{
q_B[h]
}.
}
```

Restrict the supremum to (V_N):

```math
\boxed{
\langle \mathsf K_Nu,u\rangle
:=
\sup_{0\ne h\in V_N}
\frac{
|\langle g_u,h\rangle|^2
}{
q_B[h]
}.
}
```

Then

```math
0\preceq
\mathsf K_N
\preceq
\mathsf K_{N+1}
\preceq
\mathsf K.
```

Because the union is a form core,

```math
\langle\mathsf K_Nu,u\rangle
\uparrow
\langle\mathsf Ku,u\rangle
```

for every (u\in M').

Since (M') is finite dimensional, monotone pointwise convergence of these Hermitian quadratic forms implies

```math
\boxed{
\|\mathsf K_N-\mathsf K\|
\to0.
}
```

Thus the physical Birman--Schwinger matrix is indeed a finite Schur/Galerkin limit.

---

## 5. Explicit finite Schur matrix

Choose a basis

```math
e_1,\ldots,e_N
```

of (V_N).

Define the positive stiffness matrix

```math
G_N
=
\bigl(
q_B(e_i,e_j)
\bigr)_{i,j=1}^N
```

and the selected load matrix

```math
F_N
=
\bigl(
\langle \Phi^{*}m_r,e_i\rangle
\bigr)_{r,i},
```

where

```math
m_1,\ldots,m_d
```

is an orthonormal basis of (M').

Strict positivity of (q_B) makes (G_N) positive definite.

Finite-dimensional minimization gives

```math
\boxed{
\mathsf K_N
=
F_N
G_N^{-1}
F_N^{*}.
}
```

This is the exact Schur reconstruction sought in the first half of RPB-23.

---

## 6. Why this is not yet a zero-side Schur reconstruction

To expose the divisor Cauchy kernel, one would like to choose (V_N) canonically from finitely many zero-side physical columns.

The current corpus does not justify that move.

RPB-18/WD-T28 give:

- bounded native zero synthesis in the (H^{-1}_L) metric;
- Hilbert--Schmidt compactness there;
- enough critical-line coordinates to separate compactly supported physical vectors;
- hence (L^2)-type analysis injectivity under the stated Green realization.

But the Schur convergence in Section 4 requires:

```math
\boxed{
\overline{
\bigcup_N V_N
}^{\ \|\cdot\|_{q_B}}
=
\mathfrak D(q_B),
}
```

i.e. **form-core density**.

Plain Hilbert-space density of zero-side synthesis columns does not imply density in the logarithmic background form norm.

No Horizon-1 theorem proves zero-side form-core density.

Therefore:

```math
\boxed{
\text{zero-side }L^2\text{/native density}
\not\Rightarrow
\text{physical background form-core density}.
}
```

---

## 7. Bombieri's finite matrix cannot substitute for (G_N)

A second possible shortcut is to identify the positive stiffness matrix (G_N) with Bombieri's finite Weil matrix

```math
H(\Gamma;t).
```

The H1-P4.2 audit explicitly forbids this.

Bombieri's matrix in the nonreal-zero setting is **complex symmetric**, not the ordinary Hermitian Gram matrix used in the positive variational Schur problem.

WD-T28 was specifically rewritten so that equation (7.7) is no longer used as an ordinary Hilbert-Gram input.

Therefore:

```math
\boxed{
H(\Gamma;t)
\ne
\text{the positive Galerkin stiffness matrix }G_N
}
```

without a new, explicitly proved metric/intertwining theorem.

Using Bombieri's inverse as (G_N^{-1}) would reintroduce the exact metric mistake removed by the Horizon-1 audit.

---

## 8. Where reciprocal Cauchy structure actually lives

For the raw selected source

```math
v=(v_j)_{\rho_j\in\Pi'},
```

the complementary Cauchy map is

```math
\boxed{
(\mathcal C_Rv)(\mu)
=
R_v(\mu)
=
\sum_j
\frac{v_j}{\mu-\rho_j}.
}
```

For a finite complementary set (Omega), this is an ordinary finite Cauchy matrix

```math
\boxed{
C_{\Omega,\Pi'}
=
\left(
\frac1{\mu-\rho_j}
\right)_{\mu\in\Omega,\rho_j\in\Pi'}.
}
```

The weighted next-jet field is a linear functional of

```math
C_{\Omega,\Pi'}v.
```

So reciprocal-Cauchy structure is explicit on the **divisor evaluation side**.

By contrast, the Schur approximant is

```math
\mathsf K_N
=
F_NG_N^{-1}F_N^{*},
```

where (G_N) is a physical background form matrix.

Nothing in H1 identifies

```math
G_N^{-1}
```

with a Cauchy kernel on complementary zeros.

---

## 9. Bombieri kernel decay is not an equality theorem

EXT-2C supplies the bound

```math
|H(x,y;t)|
\ll_t
\frac1{(1+|x|)(1+|y|)}
\min\left(
1,
\frac1{|x-y|}
\right).
```

The factor

```math
\min\left(1,|x-y|^{-1}\right)
```

shows a Cauchy-like off-diagonal **decay scale**.

It does not give an identity

```math
H(x,y;t)
=
\frac{c(x,y)}{x-y}
```

with a coefficient suitable for exact Schur inversion.

Still less does it identify the inverse of a physical background stiffness matrix with

```math
(\mu-\rho)^{-1}.
```

Therefore Bombieri (7.7) is corroborating geometry only, not the missing bridge.

---

## 10. Abstract finite-background truncation does not solve the metric problem

Inside the bounded native zero-side carrier, one can truncate the negative background coefficient space and obtain finite-rank covariance corrections.

Because WD-T28 gives Hilbert--Schmidt tails, those covariance tails converge in operator norm.

However the resulting bounded preconditioned defect is compact.

It cannot possess a uniform positive lower bound on an infinite-dimensional carrier.

Thus the inverse

```math
A_{B}^{-1}
```

appearing in the canonical physical Birman--Schwinger matrix is not obtained by simply inverting that compact native defect.

One must first specify the Green/metric transport between:

```math
\boxed{
\text{native }H^{-1}_L\text{ zero synthesis}
}
```

and

```math
\boxed{
\text{canonical }L^2\text{ closed-form operator}.
}
```

Without that transport, "finite zero-side Schur complement converges to (mathsf K)" is ill-typed.

---

## 11. Correct current factorization of the problem

The situation is now:

```math
\boxed{
\begin{array}{ccc}
\text{physical background form}
&
\xrightarrow{\text{Galerkin / Schur}}
&
\mathsf K_a
\\[2mm]
\rotatebox{90}{$\not\equiv$}
&&
\rotatebox{90}{$?$}
\\[2mm]
\text{native zero-side coefficients}
&
\xrightarrow{\text{divisor evaluation}}
&
C_{\Omega,\Pi'}v
=
(R_v(\mu))_{\mu\in\Omega}.
\end{array}
}
```

The top horizontal arrow is now proved.

The bottom horizontal arrow is the existing Cauchy/next-jet theorem.

The missing vertical arrow is an explicit metric/intertwining theorem.

---

## 12. Consequence for RPB-22

The following RPB-22 result survives:

```math
\boxed{
\lambda_{\max}(\mathsf K_{c_*})=1
\to
\lambda_{\max}(\mathsf K_a)>1,
}
```

provided (mathsf K_a) is read in the corrected physical sense

```math
\boxed{
\mathsf K_a
=
\Phi_aA_{B,a}^{-1}\Phi_a^{*}.
}
```

The following RPB-22 identification is **not retained without further proof**:

```math
\mathsf K_a
=
C_a^{*}C_a
```

when (C_a) is the Douglas map formed in the native compact zero-side carrier.

Thus the crossing theorem survives; the coefficient-metric interpretation is demoted to an open transport question.

---

## 13. RPB-23 determination

```math
\boxed{
\textbf{RPB-23 — PHYSICAL SCHUR RECONSTRUCTION EXISTS; CAUCHY IDENTIFICATION DOES NOT YET.}
}
```

Positive result:

```math
\boxed{
\mathsf K_N
=
F_NG_N^{-1}F_N^{*}
\longrightarrow
\mathsf K
=
\Phi A_B^{-1}\Phi^{*}
}
```

for every increasing physical form-core Galerkin exhaustion.

Negative result:

```math
\boxed{
\text{no current theorem identifies }
G_N^{-1}
\text{ or }\mathsf K
\text{ with the complementary Cauchy kernel}.
}
```

The obstruction is now exactly typed:

1. zero-side columns are not yet proved to be a background-form core;
2. the native zero synthesis and canonical (L^2) operator live in different metrics;
3. Bombieri's finite matrix is complex symmetric, not the Hermitian positive stiffness matrix required for the Schur variational problem.

Next cursor:

```text
RPB-24 / GREEN-METRIC INTERTWINER FOR PHYSICAL RESOLVENT GRAM
```

The next pass should derive, if possible, the exact Green/preconditioning relation between the native (H^{-1}_L) zero-side defect and the canonical compact-window (L^2) operator, then determine whether the physical resolvent Gram (Phi A_B^{-1}Phi^*) has a lawful coefficient-space representation from which reciprocal-Cauchy structure could be tested.
