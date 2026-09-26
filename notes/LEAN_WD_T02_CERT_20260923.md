# LEAN-H1-P1 — WD-T02 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-T02 — contractive screening equivalence}.
}
$$

## Certification class

$$
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
$$

This distinction is load-bearing.

The external Douglas factorization theorem is represented by an explicit theorem
premise, not by a Lean axiom and not by a claimed formal reconstruction of the
1966 proof.

## Imported interface

For operators

$$
A:K_-\to H,
\qquad
B:K_+\to H,
$$

the formal interface supplies the unit-majorization equivalence

$$
AA^*\preceq BB^*
\iff
\exists C,\quad
\|C\|\le1,\quad
A=BC,
$$

together with existence and uniqueness of the reduced exact factor whose range
is orthogonal to $\ker B$.

## Project-side theorem certified

From that explicit premise, Lean proves the full WD-T02 convention transfer:

$$
\boxed{
\mathcal A\text{ is }J\text{-nonnegative}
\iff
D\succeq0
\iff
S_-S_-^*\preceq S_+S_+^*
\iff
\exists X,\ \|X\|\le1,\ S_-=-S_+X.
}
$$

The covariance order is encoded by the equivalent quadratic-form inequality

$$
\|S_-^*h\|^2\le\|S_+^*h\|^2
\qquad
\forall h.
$$

Lean also checks the sign transfer

$$
C\mapsto X=-C
$$

and proves that reducedness is preserved under this sign change.

Therefore the unique Douglas reduced solution becomes the unique reduced
solution of

$$
S_-=-S_+X.
$$

## Certification evidence

GitHub Actions run:

$$
\texttt{35960549233}
$$

checked repository head:

$$
\texttt{5dca4d98b7062e3676399b34dfc89b383bfe1662}.
$$

The dedicated module

$$
\texttt{WeilDefect.Screening.Douglas}
$$

built successfully under Lean 4.34.0 / mathlib v4.34.0.

The unfinished-proof/project-axiom gate passed.

## Status

$$
\boxed{
\text{WD-T02: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
$$

The Douglas source theorem remains an imported-source reconstruction target.

No second theorem was started in this pass.
