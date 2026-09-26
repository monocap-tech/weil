# H1-P3.2 — Noncompact Background Morphology Theorem
Date: 2026-09-23

## Determination

The remaining noncompact branches are now classified.

There are two distinct noncompactness mechanisms.

### 1. Moving selected-sector escape

For normalized zero-edge coefficient vectors $w_n$, if some fixed finite coordinate block retains nonzero mass, weak compactness yields a nonzero exact limiting coefficient relation.

If instead

```math
Q_Rw_n\to0
```

for every fixed finite coordinate block, then

```math
w_n\rightharpoonup0.
```

Thus approximate zero-edge relations may survive without any exact anchored relation.

For a fixed finite selected packet this escape is impossible, because the finite selected negative coordinates are compact.

Hence selected-sector nonpersistence requires a moving/infinite selected sector.

### 2. Unselected-background compactness

After a fixed selected negative ray is anchored, define the normalized unselected background $b_n$.

After subsequence there are three regimes:

```math
\boxed{
\begin{array}{ll}
\text{B∞}:&\|b_n\|\to\infty,\\
\text{BT}:&b_n\text{ bounded but non-tail-tight},\\
\text{BF}:&b_n\to b\text{ strongly}.
\end{array}
}
```

B∞ and BT are background escape.

BF produces a fixed full-divisor negative ray

```math
Y_{\rm full}=(a,u,b)
```

with signature

```math
[Y_{\rm full},Y_{\rm full}]_{\rm full}
\le
-\kappa-\|b\|^2<0.
```

Even bounded weak background escape cannot erase the fixed selected ray:

```math
(a,u,b)
```

remains a nonzero negative weak full coefficient limit because $u\ne0$.

Thus background noncompactness is a full-divisor strong-compactness failure, not loss of selected custody.

## H1-P3 disposition

The morphology phase is now complete:

1. fixed-packet negative morphology;
2. fixed-packet attained-neutral morphology;
3. moving selected-sector escape;
4. unselected-background escape;
5. fixed full-divisor negative convergence.

```math
\boxed{
\textbf{H1-P3 — COMPLETE.}
}
```

## Next cursor

```math
\boxed{
\texttt{H1-P4.0 / THEOREM LEDGER AND DEPENDENCY AUDIT}
}
```
