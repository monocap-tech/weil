# LEAN WD-T12 certificate — 2026-09-24

Stable ID: **WD-T12 / WD-B6**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.SequentialElimination`

Source:

`WeilDefect/Screening/SequentialElimination.lean`

Certified source blob:

`482eee655471c74e6e87733b3441b2bd26990ab9`

## Certified content

Let the first background channel factor as

$$
S_{B_1}=-S_+X_1,
\qquad
\|X_1\|\le 1,
$$

with first residual budget

$$
R_1=I-X_1X_1^*
$$

and first effective positive synthesis

$$
S_1=S_+R_1^{1/2}.
$$

Let the second background factor through that residual synthesis,

$$
S_{B_2}=-S_1Y_2,
\qquad
\|Y_2\|\le 1.
$$

The Lean module defines the sequential coefficient-space residual budget

$$
R_{12}
=
R_1-
R_1^{1/2}Y_2Y_2^*R_1^{1/2}.
$$

Lean then verifies natively that the twice-consumed covariance is exactly

$$
S_+R_{12}S_+^*,
$$

and equivalently

$$
S_1(I-Y_2Y_2^*)S_1^*.
$$

The formal declarations are:

- `WeilDefect.WDT12.sequentialResidualBudget`;
- `WeilDefect.WDT12.wd_t12_sequential_budget_covariance`;
- `WeilDefect.WDT12.wd_t12_second_background_elimination`;
- `WeilDefect.WDT12.wd_t12_sequential_background_consumption`.

The assembled theorem preserves the audited jurisdiction condition: the second
background must factor through `effectivePositive Spos X1`. Individual
screenability through the original positive synthesis is not substituted for
that residual-factorization hypothesis.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T12.

The proof reuses the native algebraic portions of WD-T10:

- residual-square-root covariance;
- effective covariance;
- background covariance elimination.

It does not invoke `DouglasUnitData`, `DouglasRangeData`, or another
project-level imported theorem interface.

Therefore WD-T12 is reported as native `LEAN-CERTIFIED`.

## CI evidence

Successful certificate run:

`36057422878`

Workflow run number:

`105`

Repository head checked:

`cbbaf45442ec5f6cae5cb4e639882a3f2e2c6304`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.SequentialElimination`;
- unfinished-proof/project-axiom rejection.

WD-T12 compiled successfully on the first formal pass; no repair commit was
required after the initial theorem implementation.

## Next cursor

$$
\boxed{
\texttt{WD-T13 / WD-B7 — DIRECT COMPRESSION VERSUS SHORTED COVARIANCE}
}
$$

The audited WD-T13 hypothesis is the corrected uniformly positive setting
$K\succeq mI$, ensuring bounded invertibility of the complementary block.
