# LEAN-H1-P1 — WD-T30 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-T30 — two-mode selected-preserving multiplier}.
}
$$

## Formal content

Let

$$
C:V\to\mathbb C
$$

be a complex-linear selected-response functional and let

$$
\psi_1,\psi_2\in V.
$$

If

$$
C(\psi_1)\ne0
\quad\text{or}\quad
C(\psi_2)\ne0,
$$

Lean constructs

$$
\beta_1=C(\psi_2),
\qquad
\beta_2=-C(\psi_1),
$$

with

$$
(\beta_1,\beta_2)\ne(0,0)
$$

and proves

$$
\boxed{
C(\beta_1\psi_1+\beta_2\psi_2)=0.
}
$$

The degenerate branch

$$
C=0
$$

is also formalized, proving every mode is selected-preserving.

This matches the stable theorem's algebraic/function-space content; no
explicit-formula or actual-zeta premise is consumed.

## Certification evidence

GitHub Actions run:

$$
\texttt{35953990661}
$$

checked repository head:

$$
\texttt{6836f64a22544a2bd51daeb97d97bf824d339def}.
$$

The single target

$$
\texttt{WeilDefect.Arithmetic.Scalarization}
$$

built successfully under Lean 4.34.0 / mathlib v4.34.0, and the repository
unfinished-proof/project-axiom gate passed.

## Status

$$
\boxed{
\text{WD-T30: LEAN-CERTIFIED}.
}
$$

No second theorem was started in this pass.
