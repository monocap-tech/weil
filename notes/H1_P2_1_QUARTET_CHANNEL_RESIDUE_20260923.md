# H1-P2.1 — Quartet Channel and Residue Structure
Date: 2026-09-23

## Determination

The first genuinely zeta-Weil-specific theorem package is normalized.

### Pair geometry

Each distinct nonreal conjugate pair gives canonical coordinates

```math
p=\frac{e_\gamma+e_{\bar\gamma}}{\sqrt2},
\qquad
n=\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2},
```

with

```math
Jp=p,
\qquad
Jn=-n.
```

One simple zeta quartet contains two such conjugate pairs and therefore two negative pair coordinates.

### Finite inertia

Bombieri's finite Weil inertia theorem saturates the abstract H1-P1 index cap:

```math
\operatorname{ind}_{-}
=
\#\{\text{distinct nonreal conjugate pairs}\}.
```

Two simple quartets therefore give

```math
\operatorname{ind}_{-}=4.
```

Multiplicity-null directions must be quotiented first.

### Finite cancellation

Finite distinct exponentials are linearly independent on every nonempty interval.

After applying

```math
L=-\partial_u^2+\frac14
```

to a finite Problem-1 relation, the Green/boundary terms reduce to such an exponential identity.

Hence a selected negative cell cannot be exactly canceled by finitely many distinct positive channels.

### Residue theorem

Every selected negative raw residue vector satisfies

```math
\mathbf{1}^Tv=0,
```

so

```math
R_v(z)=O(|z|^{-2}).
```

The order is universally sharp because the first raw moment

```math
\sum_j\rho_jv_j
```

need not vanish.

### Compact synthesis

Bombieri's native Problem-1 column estimate plus the zeta zero count gives

```math
E_t:\ell^2(\Gamma)\to H^{-1}_L(-t,t)
```

Hilbert-Schmidt.

Thus the infinite native synthesis is compact, off-axis positive helper synthesis is Hilbert-Schmidt, and its covariance is trace class.

The high helper tail satisfies

```math
\|S_{{\rm off},+}Q_{>G}\|
\ll_t
\sqrt{\frac{\log G}{G}}.
```

### Metric correction

Any stable frame statement for an unweighted $L^2/PW_t$ exponential family must remain separate from the native weighted Problem-1 synthesis.

The latter is compact and cannot possess a uniform infinite-dimensional lower frame bound.

This removes the earlier metric ambiguity from the theorem spine.

## Standing

- ZW1-T1 pair diagonalization: **PROVED**;
- ZW1-T2 quartet negative-coordinate count: **PROVED**;
- ZW1-T3 finite Weil inertia saturation: **IMPORTED + specialized**;
- ZW1-T4 multiplicity-null reduction: **IMPORTED/DERIVED**;
- ZW1-T5 finite exponential independence: **PROVED**;
- ZW1-T6 no finite positive compensation: **PROVED**;
- ZW1-T7 selected zero moment: **PROVED**;
- ZW1-T8 inverse-square far decay: **PROVED**;
- ZW1-E1 sharpness of inverse-square order: **PROVED EXAMPLE**;
- ZW1-T9 Hilbert-Schmidt native synthesis: **DERIVED from Bombieri estimate + zero count**;
- ZW1-T10 finite-head approximation necessity: **PROVED**;
- ZW1-S1 positive-channel completeness/frame metric separation: **SCOPE NORMALIZATION**.

## Phase cursor

```math
\boxed{
\texttt{H1-P2.2 / EXPLICIT-FORMULA ARITHMETIC ATTACHMENT}
}
```
