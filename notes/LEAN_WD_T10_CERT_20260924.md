# LEAN WD-T10 certificate — 2026-09-24

Stable ID: **WD-T10 / WD-B4**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}
}
$$

## Formal target

Module:

`WeilDefect.Screening.ResidualBudget`

Source:

`WeilDefect/Screening/ResidualBudget.lean`

Certified source blob:

`1ffb6b2a80620b266798d40e68fe3329dc2cfb78`

## Residual budget

Given

$$
S_B=-S_+X_B,
qquad
\|X_B\|\le1,
$$

define

$$
R_B=I-X_BX_B^*.
$$

Lean proves natively that `R_B` is positive.

The residual square root is the canonical continuous-functional-calculus
operator

$$
R_B^{1/2}=\operatorname{CFC.sqrt}(R_B).
$$

Lean verifies its self-adjointness and the exact square identity

$$
R_B^{1/2}R_B^{1/2}=R_B.
$$

## Effective positive synthesis

Define

$$
S_{\rm eff}=S_+R_B^{1/2}.
$$

Lean verifies

$$
S_{\rm eff}S_{\rm eff}^*
=
S_+R_BS_+^*
=
S_+S_+^*-S_BS_B^*.
$$

Consequently,

$$
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^*-S_MS_M^*.
$$

The operator identity and the corresponding scalar quadratic-form identity are
both kernel-checked internally.

## Imported-premise boundary

The final residual screening equivalence uses the explicit premise

`WeilDefect.WDT02.DouglasUnitData S_M (effectivePositive Spos X_B)`.

Downstream from that premise Lean proves

$$
D_{\rm full}\succeq0
\iff
\exists Y:M\to K_+,quad
\|Y\|\le1,quad
S_M=-S_{\rm eff}Y.
$$

Douglas itself is not reconstructed here and is not a project axiom.

The CFC square-root results are ordinary pinned mathlib theorems checked by the
Lean kernel, so they do not change the certificate to an additional imported
project premise.

## CI evidence

Successful certificate run:

`36021712105`

Repository head checked:

`1e5b881fd412ce88de62564c57637702f16858c8`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.ResidualBudget`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T11 / WD-B5 — FINITE-SECTOR SINGULAR-VALUE INERTIA THEOREM}
}
$$
