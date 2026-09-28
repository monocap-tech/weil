# RPB-24 — Green-metric intertwiner for the physical resolvent Gram

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / GREEN CONGRUENCE ESTABLISHED / DOUGLAS GRAM RESTORED IN INVERSE-FORM SENSE**  
**Dependencies:** RPB-18 through RPB-23; WD-T28; WD-B4/B5; compact-window carrier identification.  
**Promotion status:** none.

## 0. Objective

RPB-23 separated two carriers:

1. the native Problem-1 zero-side carrier
   ```math
   H^{-1}_L(-a,a),
   ```
   in which the zero synthesis is Hilbert--Schmidt/compact;
2. the canonical compact-window (L^2) closed-form carrier, with positive background operator
   ```math
   A_{B,a}.
   ```

It therefore withdrew the unproved direct identification of the physical Birman--Schwinger matrix with a native Douglas Gram.

RPB-24 asks whether an explicit Green/metric transport repairs that mismatch.

It does.

The correct relation is a **form congruence** through the Dirichlet Green operator. The canonical inverse-background Gram transports exactly to an unbounded inverse-form sandwich of the compact native background defect.

That is enough to recover the native reduced-screening Gram (C_a^*C_a), without ever claiming that the compact native defect is boundedly invertible.

---

## 1. Dirichlet Hilbert scale

Fix support (a>0) and let

```math
L_a
=
-\partial_u^2+\frac14
```

on (L^2(-a,a)) with Dirichlet boundary conditions.

Then

```math
L_a\succ0,
```

and its inverse

```math
G_a=L_a^{-1}
```

is positive, compact, injective, and self-adjoint.

Define the native Problem-1 Hilbert space (H^{-1}_{L_a}) as the completion of (L^2(-a,a)) for

```math
\langle f,g\rangle_{-1,a}
=
\langle f,G_ag\rangle_2.
```

On the dense copy of (L^2),

```math
\|f\|_{-1,a}
=
\|G_a^{1/2}f\|_2.
```

Because

```math
\overline{\operatorname{Ran}G_a^{1/2}}
=
L^2(-a,a),
```

the map

```math
\boxed{
U_a
=
G_a^{1/2}
}
```

extends uniquely to a unitary

```math
\boxed{
U_a:
H^{-1}_{L_a}
\longrightarrow
L^2(-a,a).
}
```

This is the basic metric transport.

---

## 2. Native zero coordinates are canonical coordinates after one Green factor

Let

```math
f_\gamma(u)=e^{-i\gamma u}
```

denote a raw zero-side source column, with the canonical pair combinations taken afterward as usual.

For (h\in L^2(-a,a)subset H^{-1}_{L_a}),

```math
\begin{aligned}
\langle h,f_\gamma\rangle_{-1,a}
&=
\langle h,G_af_\gamma\rangle_2
\\
&=
\langle G_ah,f_\gamma\rangle_2.
\end{aligned}
```

Thus the native Problem-1 analysis coefficient of (h) is exactly the ordinary zero-side/Fourier coefficient of

```math
G_ah.
```

The same identity holds after:

- pair diagonalization;
- selected/background projection;
- finite symmetric packet restriction.

Therefore the entire signed zero-side quadratic form satisfies

```math
\boxed{
q_{\rm nat,a}[h]
=
Q_a[G_ah]
}
```

on the dense (L^2) copy, where (Q_a) is the canonical compact-window Weil form.

For the complementary-background form relative to the fixed finite packet (Pi'),

```math
\boxed{
q_{B,\rm nat,a}[h]
=
Q_{B,a}[G_ah].
}
```

This is the exact Green preconditioning relation.

---

## 3. Transport to (L^2)

Let

```math
k
=
U_ah
=
G_a^{1/2}h.
```

Then formally

```math
h=G_a^{-1/2}k
```

on the dense transported domain, and

```math
G_ah
=
G_a^{1/2}k.
```

Hence

```math
\boxed{
\widetilde q_{B,\rm nat,a}[k]
=
Q_{B,a}[G_a^{1/2}k].
}
```

Let (A_{B,a}) be the canonical self-adjoint operator associated with (Q_{B,a}).

The transported native background operator is therefore the form congruence

```math
\boxed{
\widetilde D_{B,a}
=
G_a^{1/2}
A_{B,a}
G_a^{1/2}.
}
```

This equality is to be read through closed quadratic forms.

It is **not** an ordinary bounded similarity.

The distinction is essential because:

- (A_{B,a}) is an unbounded compact-resolvent operator;
- (widetilde D_{B,a}) is the bounded compact Green-preconditioned/native defect.

There is no contradiction between these spectral types.

---

## 4. Boundedness and compactness of the transported native defect

The range of

```math
G_a^{1/2}
```

is

```math
\mathfrak D(L_a^{1/2})
=
H_0^1(-a,a).
```

The compact-window Weil form has only logarithmic order, so

```math
H_0^1(-a,a)
\subset
\mathfrak D(Q_{B,a}).
```

The embedding

```math
G_a^{1/2}:
L^2
\to
\mathfrak D(Q_{B,a})
```

is bounded when the form domain is equipped with its shifted logarithmic form norm.

Consequently the pulled-back form

```math
k\mapsto Q_{B,a}[G_a^{1/2}k]
```

is bounded on (L^2).

Its representing operator is exactly the bounded native zero-side defect already supplied by WD-T28 / the zero-side synthesis realization.

Because the native synthesis is Hilbert--Schmidt,

```math
\boxed{
\widetilde D_{B,a}
\text{ is compact}.
}
```

---

## 5. Selected map under Green transport

Let

```math
\Phi_a:
L^2(-a,a)
\to
M'
```

be the canonical finite selected analysis map in the physical form carrier.

Its adjoint

```math
\Phi_a^*:
M'
\to
L^2(-a,a)
```

contains the finite selected raw/pair physical columns.

The transported native selected synthesis is

```math
\boxed{
\widetilde S_{M,a}
=
G_a^{1/2}\Phi_a^*.
}
```

Indeed, the transported analysis is

```math
\widetilde\Phi_a
=
\Phi_aG_a^{1/2},
```

so

```math
\widetilde\Phi_a^*
=
G_a^{1/2}\Phi_a^*.
```

This is exactly the native Green-preconditioned selected synthesis.

---

## 6. Physical resolvent Gram

RPB-23's correctly typed physical Birman--Schwinger matrix is

```math
\boxed{
\mathsf K_a^{\rm phys}
=
\Phi_a
A_{B,a}^{-1}
\Phi_a^*.
}
```

Since RPB-19 gives

```math
A_{B,a}
\succeq
\eta I
```

on the relevant right neighborhood,

```math
A_{B,a}^{-1}
```

is bounded.

For (u\in M'),

```math
\langle
\mathsf K_a^{\rm phys}u,u
\rangle
=
\sup_{0\ne f\in\mathfrak D(Q_{B,a})}
\frac{
|\langle \Phi_a^*u,f\rangle_2|^2
}{
Q_{B,a}[f]
}.
```

---

## 7. The Green range is a form core

The range

```math
\operatorname{Ran}G_a^{1/2}
=
H_0^1(-a,a)
```

contains

```math
C_c^\infty(-a,a).
```

The latter is a form core for the canonical compact-window form and remains a form core after the finite selected covariance is restored.

Therefore

```math
\boxed{
\overline{
\operatorname{Ran}G_a^{1/2}
}^{\ \|\cdot\|_{Q_{B,a}}}
=
\mathfrak D(Q_{B,a}).
}
```

The supremum in Section 6 may therefore be restricted to

```math
f=G_a^{1/2}k.
```

---

## 8. Exact inverse-form transport of the Gram

Substitute

```math
f=G_a^{1/2}k.
```

Then

```math
\langle
\Phi_a^*u,
G_a^{1/2}k
\rangle_2
=
\langle
G_a^{1/2}\Phi_a^*u,
k
\rangle_2
=
\langle
\widetilde S_{M,a}u,
k
\rangle_2,
```

and

```math
Q_{B,a}[G_a^{1/2}k]
=
\langle
\widetilde D_{B,a}k,k
\rangle_2.
```

Hence

```math
\boxed{
\langle
\mathsf K_a^{\rm phys}u,u
\rangle
=
\sup_{k\ne0}
\frac{
|\langle
\widetilde S_{M,a}u,k
\rangle|^2
}{
\langle
\widetilde D_{B,a}k,k
\rangle
}.
}
```

For a positive injective compact operator, this supremum is finite exactly on the form domain of the inverse square root.

Therefore

```math
\boxed{
\langle
\mathsf K_a^{\rm phys}u,u
\rangle
=
\|
\widetilde D_{B,a}^{-1/2}
\widetilde S_{M,a}u
\|^2.
}
```

Equivalently, in finite-sandwich notation,

```math
\boxed{
\mathsf K_a^{\rm phys}
=
\widetilde S_{M,a}^*
\widetilde D_{B,a}^{-1}
\widetilde S_{M,a},
}
```

where

```math
\widetilde D_{B,a}^{-1}
```

is understood as its unbounded inverse quadratic form on the selected finite range.

This is the requested Green-metric intertwiner for the physical resolvent Gram.

---

## 9. Why the unbounded inverse is lawful

The native background defect is compact, so

```math
\widetilde D_{B,a}^{-1}
```

is not bounded on (L^2).

RPB-23 was correct to reject a naive bounded inversion.

But the selected sandwich is finite because it equals the already bounded physical matrix

```math
\Phi_aA_{B,a}^{-1}\Phi_a^*.
```

Thus for every

```math
u\in M',
```

```math
\boxed{
\widetilde S_{M,a}u
\in
\mathfrak D(
\widetilde D_{B,a}^{-1/2}
).
}
```

For a positive injective operator,

```math
\mathfrak D(D^{-1/2})
=
\operatorname{Ran}D^{1/2}.
```

Hence

```math
\boxed{
\operatorname{Ran}
\widetilde S_{M,a}
\subseteq
\operatorname{Ran}
\widetilde D_{B,a}^{1/2}.
}
```

So exact native screening is recovered from the physical gap.

---

## 10. Recovery of the native Douglas factorization

The positive native background defect has the zero-side factorization supplied by WD-B4:

```math
\boxed{
\widetilde D_{B,a}
=
T_aT_a^*,
}
```

where (T_a) is the residual/effective positive native synthesis after background elimination.

For every bounded operator,

```math
\operatorname{Ran}(T_a)
=
\operatorname{Ran}
(\widetilde D_{B,a}^{1/2})
```

in the Douglas range sense.

Section 9 therefore gives

```math
\boxed{
\operatorname{Ran}
\widetilde S_{M,a}
\subseteq
\operatorname{Ran}T_a.
}
```

Thus there exists a unique Douglas reduced solution

```math
C_a:
M'\to
(\ker T_a)^\perp
```

with

```math
\boxed{
\widetilde S_{M,a}
=
-
T_aC_a.
}
```

No surjectivity of (T_a) is claimed or required.

---

## 11. The Douglas Gram is exactly the physical Birman--Schwinger matrix

For a reduced solution of

```math
\widetilde S_M
=
-TC,
\qquad
TT^*
=
\widetilde D_B,
```

the minimum-norm solution formula gives

```math
\|C_au\|^2
=
\|
\widetilde D_{B,a}^{-1/2}
\widetilde S_{M,a}u
\|^2.
```

Using Section 8,

```math
\boxed{
\|C_au\|^2
=
\langle
\mathsf K_a^{\rm phys}u,u
\rangle.
}
```

Since (M') is finite dimensional, polarization yields the operator identity

```math
\boxed{
C_a^*C_a
=
\mathsf K_a^{\rm phys}
=
\Phi_aA_{B,a}^{-1}\Phi_a^*.
}
```

Therefore the coefficient-space interpretation proposed in RPB-22 is **restored**, but only after the Green transport is made explicit.

---

## 12. Additive correction to RPB-22 and RPB-23

### RPB-22

The conclusion

```math
\lambda_{\max}(C_a^*C_a)
:
1
\longrightarrow
>1
```

is valid.

But its proof must not use

```math
A_{B,a}
=
T_aT_a^*
```

inside the canonical (L^2) carrier.

The correct chain is

```math
A_{B,a}
\xrightarrow{\ G^{1/2}\text{-congruence}\ }
\widetilde D_{B,a}
=
T_aT_a^*.
```

### RPB-23

RPB-23 correctly identified the metric mismatch and correctly rejected direct bounded inversion of the compact native defect.

Its statement that the Douglas-Gram identification was not yet justified is now superseded by the Green-congruence theorem above.

The inverse remains unbounded; only the finite selected sandwich is bounded.

Historical notes remain unchanged.

---

## 13. Crossing datum in the lawful native carrier

The critical crossing may now be written equivalently in three forms.

### Physical resolvent form

```math
\boxed{
\lambda_{\max}
\left(
\Phi_aA_{B,a}^{-1}\Phi_a^*
\right)
:
1\to>1.
}
```

### Native inverse-form form

```math
\boxed{
\lambda_{\max}
\left(
\widetilde S_{M,a}^*
\widetilde D_{B,a}^{-1}
\widetilde S_{M,a}
\right)
:
1\to>1.
}
```

### Douglas compensator form

```math
\boxed{
\|C_{c_*}\|=1,
\qquad
\|C_a\|>1
\quad(a>c_*\text{ close}).
}
```

These are the same finite-dimensional threshold after the metric transport is supplied.

---

## 14. Does Green transport expose reciprocal Cauchy structure?

Not yet.

The native representation has now reduced the missing bridge to

```math
\boxed{
\widetilde D_{B,a}^{-1}
}
```

on the finite selected source range.

But the current theory has no explicit kernel formula for that inverse.

The complementary divisor map remains

```math
R_v(\mu)
=
\sum_j
\frac{v_j}{\mu-\rho_j}.
```

Therefore the unresolved comparison is now correctly typed as

```math
\boxed{
\text{inverse of the compact Green-preconditioned background defect}
\quad ? \quad
\text{complementary reciprocal-Cauchy evaluation}.
}
```

The metric mismatch is no longer the obstruction.

The obstruction is now the absence of an explicit inverse/resolvent formula for the native background defect.

---

## 15. Spectral representation of the remaining object

If

```math
\widetilde D_{B,a}e_n
=
d_n e_n,
\qquad
d_n>0,
\qquad
d_n\downarrow0,
```

then for (u\in M'),

```math
\boxed{
\langle
\mathsf K_a u,u
\rangle
=
\sum_n
\frac{
|\langle
\widetilde S_{M,a}u,e_n
\rangle|^2
}{
d_n
}.
}
```

Thus the critical unit-gain condition is exactly an inverse-spectral sum.

This is the natural object to compare next with divisor/Cauchy data.

No identification of the eigenvectors (e_n) with individual zeta-zero coordinates is currently available.

---

## 16. RPB-24 determination

```math
\boxed{
\textbf{RPB-24 — GREEN-METRIC INTERTWINER EXISTS AND RESTORES THE DOUGLAS GRAM.}
}
```

Exact transport:

```math
\boxed{
\widetilde D_{B,a}
=
G_a^{1/2}
A_{B,a}
G_a^{1/2}
}
```

in the form sense, and

```math
\boxed{
\Phi_aA_{B,a}^{-1}\Phi_a^*
=
\widetilde S_{M,a}^*
\widetilde D_{B,a}^{-1}
\widetilde S_{M,a}
=
C_a^*C_a.
}
```

The native inverse is unbounded, but its finite selected sandwich is bounded.

Therefore the earlier metric obstruction is closed.

What remains open is an **inverse-kernel** question, not a carrier-identification question.

Next cursor:

```text
RPB-25 / NATIVE INVERSE-DEFECT SPECTRAL SUM ↔ RECIPROCAL-CAUCHY RESPONSE
```

The next pass should test whether the inverse-spectral representation of (C_a^*C_a) can be related to the finite/intermediate complementary divisor evaluations (R_v(\mu)), perhaps through the explicit zero-channel columns, a resolvent identity, or a reproducing-kernel interpretation.
