# LEAN-H1-P1 — WD-T33 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-T33 — adaptive co-cancellation identity}.
}
$$

## Formal content

Lean proves the exact scalar implication

$$
N+F=P+A,
\qquad
N=A
$$

implies

$$
\boxed{
P=F.
}
$$

This is the cutoffwise algebraic core of the explicit-formula co-adaptation theorem:

$$
\mathcal N_{v,R}[\psi]=\mathcal A_v[\psi]
\quad\Longrightarrow\quad
\mathcal P_v[\psi]=\mathcal F_{v,R}[\psi].
$$

No asymptotic $R\to\infty$ statement is included in WD-T33 itself; such a limit
requires the separate fixed/uniform multiplier hypotheses already isolated by the
P4 composite audit.

## Certification evidence

Current Lean source blob:

$$
\texttt{d01f92d725b9ad412130424b74bea9efadcda1e1}.
$$

The identical blob was kernel-checked successfully in full-library GitHub Actions run

$$
\texttt{35951096357}
$$

at commit

$$
\texttt{e9f158d3c8fb5b85494d08931d62cddfc8d4a534}.
$$

The pinned Lean/mathlib build and unfinished-proof/project-axiom gate both passed.

## Status

$$
\boxed{
\text{WD-T33: LEAN-CERTIFIED}.
}
$$

No second theorem was started in this pass.
