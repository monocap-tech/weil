# LEAN WD-T06 certificate — 2026-09-23

Stable ID: **WD-T06 / WD-A6**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.MonotoneScreening`

Source:

`WeilDefect/Screening/MonotoneScreening.lean`

Certified source blob:

`b4424d28e14466275f593e58683170d9e952b134`

## Projection-chain contract

The Lean interface records the exact properties used from an increasing
strongly exhaustive family of orthogonal projections:

- self-adjointness;
- idempotence;
- nesting `P n ∘L P (n+1) = P n`;
- contractivity;
- strong convergence `P n x → x`.

No external theorem is consumed by this certificate.

## Certified content

For

$$
D_N=S_+P_NS_+^*-S_-S_-^*,
$$

Lean verifies the truncated quadratic identity

$$
\langle D_Nh,h\rangle
=
\|P_NS_+^*h\|^2-\|S_-^*h\|^2.
$$

Nesting plus contractivity gives

$$
\|P_Nx\|\le \|P_{N+1}x\|\le\|x\|,
$$

hence

$$
D_N\preceq D_{N+1}\preceq D.
$$

Strong convergence of the projections is propagated through the bounded
synthesis operator to give

$$
D_Nh\to Dh
$$

for every physical vector `h`, together with convergence of the scalar
quadratic forms.

Finally, finite negative-index monotonicity is encoded dimension-by-dimension:
every `k`-direction negative witness for `D_(N+1)` is a `k`-direction
negative witness for `D_N`.  This is the same finite-rank-spectrum convention
used in the WD-T01 certificate.

## CI evidence

GitHub Actions run:

`35967932548`

Repository head checked:

`6024cce8bf4f152ca21a545b93cb467e7cdadb31`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.MonotoneScreening`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T07 / WD-B1 — SELECTED NEGATIVITY UNDER NEGATIVE-BACKGROUND AGGREGATION}
}
$$
