# LEAN-H1-P1 — WD-X01 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-X01 — complete finite-to-infinite screening}.
}
$$

## Formal content

The Lean certificate proves:

$$
c_j^2
=
\frac{1}{(j+1)(j+2)}
=
\frac1{j+1}-\frac1{j+2},
$$

the exact partial sum

$$
\sum_{j<N}c_j^2
=
1-\frac1{N+1},
$$

the finite defect formula

$$
D_N
=
-\frac1{N+1}<0,
$$

and the limit

$$
D_N\to0.
$$

Thus the formal certificate captures the actual sharpness statement:

$$
\boxed{
\text{every finite truncation is negative while the infinite limit is neutral}.
}
$$

## Certification evidence

GitHub Actions run:

$$
\texttt{35952789867}
$$

checked repository head:

$$
\texttt{6ef0dffba1a8732d554b15ee906c64fe60bc63c7}.
$$

The target Lean file compiled successfully and the unfinished-proof/project-axiom gate passed.

## Status

$$
\boxed{
\text{WD-X01: LEAN-CERTIFIED}.
}
$$

No second theorem was started in this pass.
