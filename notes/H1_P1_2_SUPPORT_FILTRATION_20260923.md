# H1-P1.2 — Support Filtration and Persistence Limits
Date: 2026-09-23

## Determination

The remaining abstract support-filtration mechanism closes.

For nested closed analysis spaces

```math
\mathcal A_s\subseteq\mathcal A_t
\qquad
(s<t),
```

the right-limit space is

```math
\mathcal A_{c+}
=
\bigcap_{t>c}\mathcal A_t.
```

Its gap dual is

```math
G_{c+}
=
\overline{\bigcup_{t>c}\mathcal A_t^\perp},
\qquad
\mathcal A_{c+}=G_{c+}^\perp.
```

With a fixed finite negative sector, any normalized right-approaching sequence with

```math
[y_n,y_n]_J\to q_*\le0
```

has a nonzero right-limit vector

```math
y\in\mathcal A_{c+}
```

satisfying

```math
[y,y]_J\le q_*.
```

At criticality $q_*=0$, there are only two possibilities:

1. strong positive-coordinate compactness, producing an actual neutral right-limit vector;
2. positive-coordinate mass loss, producing a strictly negative persistent vector.

Thus approximate neutrality without a persistent ray requires the negative sector itself to move through an infinite coefficient space or an equivalent noncompactness mechanism.

If the endpoint $\mathcal A_c$ is $J$-nonnegative, then new negative index is bounded by the endpoint jump:

```math
\operatorname{ind}_{-}(\mathcal A_{c+},J)
\le
\dim(\mathcal A_{c+}/\mathcal A_c)
```

when the quotient is finite dimensional.

Under a common bounded physical realization

```math
\mathcal A_t
=
\overline{T(\mathscr H_t)},
```

with

```math
\mathscr H_c
=
\bigcap_{t>c}\mathscr H_t,
```

every genuinely new endpoint vector

```math
y\in\mathcal A_{c+}\setminus\mathcal A_c
```

has diverging representation cost as $t\downarrow c$.

## Standing

- WD-C1 monotone projection limit: **PROVED**;
- WD-C2 right-limit gap duality: **PROVED**;
- WD-C3 fixed finite-sector compactness: **PROVED**;
- WD-C4 critical-sequence dichotomy: **PROVED**;
- WD-C5 uniform negative margin persistence: **PROVED**;
- WD-C6 endpoint jump/index bound: **PROVED**;
- WD-C7 representative blow-up: **PROVED**;
- WD-C8 boundary amplification functional: **PROVED**;
- WD-C9 vanishing-amplitude rescaling: **PROVED**;
- WD-E5 moving-sector escape: **PROVED EXAMPLE**;
- WD-E6 positive-mass-loss strengthening: **PROVED EXAMPLE**.

## Phase disposition

```math
\boxed{
\textbf{H1-P1 — ABSTRACT DEFECT CALCULUS: COMPLETE.}
}
```

## Next cursor

```math
\boxed{
\texttt{H1-P2.0 / ZETA-WEIL SPECIALIZATION MAP}
}
```
