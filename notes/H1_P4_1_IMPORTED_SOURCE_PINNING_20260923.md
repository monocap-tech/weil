# H1-P4.1 — Imported Source Pinning
Date: 2026-09-23

## Determination

The load-bearing external inputs are now pinned.

### Douglas

Douglas (1966), Theorem 1, pp. 413–415:

```math
\operatorname{Ran}A\subseteq\operatorname{Ran}B
\iff
AA^{*}\le\lambda^2BB^{*}
\iff
A=BC,
```

with the reduced/minimum-norm solution.

Consumed by WD-T02.

### Bombieri

- Theorem 8, p. 213: finite negative index equals the number of distinct nonreal conjugate pairs.
- Lemma 10, p. 210 with proof continuation p. 213: multiplicity-null directions.
- Theorem 6 proof, equation (7.7), p. 204: kernel decay used in the compact/Hilbert-Schmidt derivation.

Consumed by WD-T22, WD-T23, WD-T28.

### Zeta zero counting

Titchmarsh, 2nd ed., Theorem 9.2, equation (9.2.1), p. 211:

```math
N(T+1)-N(T)=O(\log T).
```

The following text also records the fixed $h$ variant and multiplicity consequence.

Consumed by WD-T28 and WD-T31.

### Compact-window explicit formula

Zhu, arXiv:2608.24827v2, equations (2)–(3), p. 2.

For support $[-L,L]$, only prime powers satisfying

```math
\log n<2L
```

occur.

Horizon convention:

```math
L=c.
```

The strict support inequality is now frozen.

Consumed by WD-T34, WD-T35, WD-T38.

### Digamma asymptotic

DLMF 5.11.2:

```math
\psi(z)
\sim
\log z-\frac1{2z}-\cdots.
```

At $z=1/4+it/2$,

```math
\Re\psi(1/4+it/2)=\log|t|+O(1).
```

Consumed by WD-T35.

## Context-only sources

Anderson–Trapp and Suzuki remain contextual/non-load-bearing for the current theorem statements.

## Phase status

```math
\boxed{
\text{H1-P4 ACTIVE}.
}
```

## Next cursor

```math
\boxed{
\texttt{H1-P4.2 / INTERNAL PROOF AUDIT}
}
```
