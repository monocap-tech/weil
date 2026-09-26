# H1-P1.1 — Restricted-Channel and Finite-Index Transfer
Date: 2026-09-23

## Determination

The selected/background problem closes to a recursive finite-index screening calculus.

Let

```math
K_{-}=M\oplus B.
```

Then

```math
D_{\rm full}
=
S_{+}S_{+}^{*}
-
S_MS_M^{*}
-
S_BS_B^{*}.
```

The exact selected/background identity is

```math
\boxed{
\langle D_{\rm full}h,h\rangle
=
\langle D_Mh,h\rangle
-
\|S_B^{*}h\|^2.
}
```

Hence selected negativity always survives in the full system, while full negativity does not preserve selected-sector custody.

If $\dim M=m$,

```math
\boxed{
\operatorname{ind}_{-}(D_M)\le m.
}
```

If the background is contractively screenable,

```math
S_B=-S_{+}X_B,
\qquad
\|X_B\|\le1,
```

then the residual budget is

```math
R_B=I-X_BX_B^{*}
```

and

```math
\boxed{
D_{\rm full}
=
S_{+}R_BS_{+}^{*}
-
S_MS_M^{*}.
}
```

Thus background elimination returns the problem to the same defect calculus with effective positive synthesis

```math
S_{\rm eff}=S_{+}R_B^{1/2}.
```

For a fixed finite selected sector with reduced residual screening map $Y$,

```math
\boxed{
\operatorname{ind}_{-}
=
\#\{\sigma_j(Y)>1\},
}
```

and

```math
\boxed{
\operatorname{nul}_J
=
\#\{\sigma_j(Y)=1\}.
}
```

The main correction from H1-P1.0 is therefore:

```math
\boxed{
\text{fixed finite-sector critical screening}
\Longrightarrow
\text{actual neutral mode}.
}
```

The non-attained approximate-neutral boundary requires an infinite-dimensional or moving limiting mechanism.

The pass also isolates two nonlocal effects:

1. separate negative channels share one screening budget;
2. a finite physical target sees the complement through a shorted covariance, not through direct compression alone.

## Standing

- WD-B1 selected/background monotonicity: **PROVED**;
- WD-B2 finite-sector index cap: **PROVED**;
- WD-B3 shared screening budget: **PROVED**;
- WD-E3 noncompositional individual screening: **PROVED EXAMPLE**;
- WD-B4 residual-budget reduction: **PROVED**;
- WD-B5 finite-sector singular-value inertia: **PROVED**;
- WD-B6 sequential background consumption: **PROVED**;
- WD-B7 direct compression vs shorting: **PROVED in strictly positive setting**;
- WD-E4 shorting-collapse example: **PROVED EXAMPLE**;
- WD-B8 finite signature shadow vs admissibility: **PROVED**.

## Next cursor

```math
\boxed{
\texttt{H1-P1.2 / SUPPORT FILTRATION AND PERSISTENCE LIMITS}
}
```
