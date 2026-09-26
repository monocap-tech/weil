# LEAN WD-T05 certificate — 2026-09-23

Stable ID: **WD-T05 / WD-A5**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}
}
$$

## Formal target

Module:

`WeilDefect.Screening.RankOne`

Source:

`WeilDefect/Screening/RankOne.lean`

Certified source blob:

`2c37aaf3546b49cbab8be2c58ee954fd6989a965`

## Certified content

Lean verifies the native rank-one covariance identity

$$
(\alpha\mapsto\alpha g)(\alpha\mapsto\alpha g)^*=g\otimes g,
$$

and hence

$$
D=S_+S_+^*-g\otimes g.
$$

It also formalizes the one-dimensional factor/vector identification:

- from a contraction `X : ℂ →L[ℂ] Kpos`, take `c = X 1`;
- `‖c‖ ≤ ‖X‖ ≤ 1`;
- exact signed factorization gives `g = -Spos c`;
- conversely a vector `c` with `‖c‖ ≤ 1` yields the contraction
  `toSpanSingleton ℂ c`.

Thus the general contractive screening factor reduces exactly to the
single-vector rank-one formulation.

## Imported-premise boundary

The equivalence between covariance majorization / positivity and existence of a
contractive factor consumes the explicit

`WeilDefect.WDT02.DouglasUnitData`

premise. Douglas itself is not reconstructed here and is not a project axiom.

Accordingly the complete WD-T05 stable theorem is
**LEAN-CERTIFIED-FROM-IMPORTED-PREMISE**.

## CI evidence

GitHub Actions run:

`35966956166`

Repository head checked:

`ef3853ef4a3892662fa59761685dfe68b1f82844`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.RankOne`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T06 / WD-A6 — MONOTONE POSITIVE SCREENING}
}
$$
