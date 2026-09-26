# LEAN-H1-P1 — WD-T01 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-T01 — defect identity and coefficient/physical negative-index transfer}.
}
$$

## Formal content

Lean certifies the coefficient/physical defect identity:

$$
[E^*h,E^*h]_J
=
\langle Dh,h\rangle.
$$

It also certifies the nonnegativity equivalence:

$$
\boxed{
\mathcal A\text{ is }J\text{-nonnegative}
\iff
D\succeq0.
}
$$

For the index statement, the Lean development formalizes the complete finite
negative-rank spectrum.

For every $n$,

$$
\boxed{
\text{analysis has an }n\text{-dimensional negative witness}
\iff
\text{physical carrier has an }n\text{-dimensional negative witness}.
}
$$

A separate bridge theorem proves every such negative witness map is injective
when the quadratic form vanishes at zero. Hence the witness really carries
$n$ independent negative directions.

Equality of the attainable finite negative dimensions is exactly the
dimension-by-dimension form of

$$
\operatorname{ind}_-(\mathcal A,J)
=
\operatorname{ind}_-(D),
$$

where the index is the supremum of finite negative-definite dimensions.

The reverse direction is formalized using:

- closure of the analysis range;
- finite-product density of basis values;
- orthonormal-basis reconstruction;
- compactness of the finite-dimensional unit sphere;
- uniform persistence of strict negativity under operator perturbation.

## Certification evidence

GitHub Actions run:

$$
\texttt{35959085940}
$$

checked repository head:

$$
\texttt{79218489b0a3cdeacc5ed7abe44565ee45fffca5}.
$$

The dedicated module

$$
\texttt{WeilDefect.Screening.DefectIndex}
$$

built successfully under Lean 4.34.0 / mathlib v4.34.0.

The unfinished-proof/project-axiom gate also passed.

## Status

$$
\boxed{
\text{WD-T01: LEAN-CERTIFIED}.
}
$$

No second theorem was started in this pass.
