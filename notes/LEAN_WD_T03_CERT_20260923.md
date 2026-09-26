# LEAN-H1-P1 — WD-T03 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-T03 — reduced-screening graph normal form}.
}
$$

## Certification class

$$
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
$$

Douglas is used only to supply the unique reduced factor from exact range
inclusion. Every graph/decomposition statement after that point is certified
internally.

## Imported interface

From

$$
\operatorname{Ran}S_-
\subseteq
\operatorname{Ran}S_+,
$$

the explicit Douglas premise supplies the unique reduced factor $X$ satisfying

$$
S_-=-S_+X
$$

and orthogonality of the range of $X$ to $\ker S_+$.

## Kernel decomposition

Lean proves

$$
E(x,u)=0
\iff
\exists! k\in\ker S_+:
(x,u)=(k,0)+(Xu,u),
$$

and verifies the direct-sum orthogonality of the two components.

## Graph normal form

Using the explicit direct-sum inner form

$$
\langle(a,v),(x,u)\rangle_\oplus
=
\langle a,x\rangle+\langle v,u\rangle,
$$

Lean proves

$$
\boxed{
(a,v)\in(\ker E)^\perp
\iff
a\perp\ker S_+,\quad
v=-X^*a.
}
$$

This is the stable graph statement

$$
\mathcal A
=
\{(a,-X^*a):a\in(\ker S_+)^\perp\}.
$$

## Signature and defect

Lean certifies

$$
[(a,-X^*a),(a,-X^*a)]_J
=
\|a\|^2-\|X^*a\|^2
$$

and

$$
\boxed{
D=S_+(I-XX^*)S_+^*.
}
$$

## Certification evidence

GitHub Actions run:

$$
\texttt{35962199281}
$$

checked repository head:

$$
\texttt{570dcb25de1e728bb2b135363e0b0d1ae735b5e5}.
$$

The dedicated module

$$
\texttt{WeilDefect.Screening.GraphNormalForm}
$$

built successfully under Lean 4.34.0 / mathlib v4.34.0.

The unfinished-proof/project-axiom gate passed.

## Status

$$
\boxed{
\text{WD-T03: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
$$

No second theorem was started in this pass.
