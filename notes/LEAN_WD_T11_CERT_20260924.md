# LEAN WD-T11 certificate — 2026-09-24

Stable ID: **WD-T11 / WD-B5**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.FiniteSectorInertia`

Source:

`WeilDefect/Screening/FiniteSectorInertia.lean`

Certified source blob:

`5404514d874c1cdc710045cab7819601d0a6994f`

## Certified content

WD-T11 is formalized on the canonical finite-dimensional active carrier

$$
\operatorname{Ran}Y,
$$

using the corestricted screen and its adjoint.

Lean verifies natively:

- corestriction to the active range preserves the operator norm;
- the active adjoint has the same norm as the original selected screen;
- if $\|Y\|=1$, the active graph form attains an actual nonzero neutral direction;
- the active covariance diagonalizes in the singular-vector basis;
- the graph form has diagonal weights $1-\sigma_i^2$;
- every finite negative witness injects into the $\sigma_i>1$ coordinate block;
- the full negative spectral space is strictly negative away from zero;
- its complex dimension is exactly the number of singular values strictly greater than one;
- that count is attained by a negative witness and is the exact maximal finite negative rank;
- the neutral spectral-space dimension is exactly the number of singular values equal to one;
- every vector in the neutral spectral space has zero graph form.

The assembled theorem is:

`WeilDefect.WDT11.wd_t11_finite_sector_singular_value_inertia`.

Its formal conclusion packages:

$$
\operatorname{ind}_{-}
=
\#\{i:\sigma_i>1\},
$$

in the project's finite-negative-rank witness encoding,

$$
\dim E_0
=
\#\{i:\sigma_i=1\},
$$

and finite-sector norm-one attainment of a genuine nonzero neutral direction.

## Imported-premise boundary

No imported theorem premise is consumed by the WD-T11 proof.

The module imports surrounding screening infrastructure, including the graph-normal-form module, but the certified WD-T11 declarations do not assume `DouglasUnitData`, `DouglasRangeData`, or another project-level imported theorem interface.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

rather than `LEAN-CERTIFIED-FROM-IMPORTED-PREMISE`.

## Repair-pass result

The WD-T11 certification required several compiler repair passes, but the repairs were proof-engineering only. No stable theorem statement or mathematical hypothesis was weakened.

The recurring Lean friction was concentrated in:

- active-range subtype coercions;
- operator-norm attainment on a finite-dimensional carrier;
- real/complex norm-square coercions;
- spectral-coordinate normalization;
- span-induction elaboration;
- typed zero-operator norm facts.

These are candidates for later extraction into the proposed Weil-specific Lean infrastructure layer.

## CI evidence

Successful certificate run:

`36032799794`

Repository head checked:

`44a2634f87604dc7d8d82ec36db8ba379e1b64aa`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.FiniteSectorInertia`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T12 / WD-B6 — SEQUENTIAL ELIMINATION}
}
$$
