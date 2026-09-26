# LEAN WD-T09 certificate — 2026-09-24

Stable ID: **WD-T09 / WD-B3**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.BackgroundCustody`

WD-T09 declarations are colocated in:

`WeilDefect/Screening/BackgroundCustody.lean`

Certified source blob:

`eec7e8db876cf2504bc3cca349b68bb60d93a626`

## Reduced-carrier contract

The source theorem writes the screening maps into

$$
(\ker S_+)^\perp.
$$

The Lean certificate treats that reduced carrier as the positive coefficient
space itself, encoded by

$$
\ker S_+=0.
$$

No closed-range or surjectivity assumption is introduced.

## Shared budget

Assume

$$
S_M=-S_+X_M,
qquad
S_B=-S_+X_B.
$$

Lean verifies

$$
D_{\rm full}
=
S_+\bigl(I-X_MX_M^*-X_BX_B^*\bigr)S_+^*.
$$

The joint budget is encoded pointwise as

$$
\|X_M^*a\|^2+\|X_B^*a\|^2\le\|a\|^2
$$

for every positive coefficient vector `a`.

Lean proves

$$
D_{\rm full}\succeq0
\iff
\text{joint budget}.
$$

The reverse implication to a global coefficient-space inequality is obtained
from density of `Ran(Spos†)`:

$$
\overline{\operatorname{Ran}S_+^*}
=
(\ker S_+)^\perp
=
K_+,
$$

together with closedness of the budget inequality.

Thus the WD-T09 equivalence is proved natively once the exact screening maps
are supplied. It does not consume `DouglasUnitData`.

## Noncompositional unit budgets

Lean also checks the scalar obstruction directly.

Set both screening maps to the identity on `ℂ`. Each has norm one, but at
`a = 1` the shared cost is

$$
1+1>1.
$$

Therefore two separate contractions need not satisfy the joint budget.

## Repair history

The first WD-T09 pass exposed only Lean elaboration issues:

- the Douglas namespace was not visible for the reused `IsContraction`
  definition;
- operator-factorization rewrites were applied in the wrong order;
- closedness of the budget sublevel set required explicit continuous
  left/right functions;
- the scalar counterexample required an explicit arithmetic contradiction.

All four were repaired without changing the theorem statement or its
mathematical hypotheses.

## CI evidence

Successful direct certificate run:

`36019357419`

Repository head checked:

`f08c8f8a5639e1cf9d23b6381ca852c6c2e1007a`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.BackgroundCustody`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T10 / WD-B4 — BACKGROUND ELIMINATION AND RESIDUAL BUDGET}
}
$$
