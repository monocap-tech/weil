# LEAN WD-T07 certificate — 2026-09-23

Stable ID: **WD-T07 / WD-B1**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.BackgroundCustody`

Source:

`WeilDefect/Screening/BackgroundCustody.lean`

Certified source blob:

`8a0acaef36c3c10df5f0ec6d7a692db1b420f32a`

## Certified content

Lean verifies

$$
q_{\mathrm{full}}(h)
=
q_M(h)-\|S_B^*h\|^2,
$$

so

$$
q_{\mathrm{full}}(h)\le q_M(h)
$$

for every physical vector.

Consequently every selected negative witness remains negative after arbitrary
negative-background aggregation.

The index statement is encoded dimension-by-dimension: if the selected form
admits a `k`-dimensional negative witness, then the full form admits the same
witness. This is the formal finite-rank-spectrum version of

$$
\operatorname{ind}_{-}(D_{\mathrm{full}})
\ge
\operatorname{ind}_{-}(D_M).
$$

## Converse failure

Lean also checks an explicit scalar counterexample.

Take all coefficient/physical spaces to be `ℂ`, selected positive and
negative synthesis maps equal to zero, and the background synthesis equal to
the identity.

At `h = 1`:

$$
q_M(1)=0,
\qquad
q_{\mathrm{full}}(1)=-1<0.
$$

Thus aggregate negativity need not be owned by the selected sector.

## CI evidence

The first dedicated build exposed only a simplification gap for the adjoint of
the identity map. The proof was repaired by making
`ContinuousLinearMap.adjoint_id` explicit.

Successful certificate run:

`35968741697`

Repository head checked:

`48f20dfa63e5b36bd5786a0fc9fe23db9e63e21a`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.BackgroundCustody`;
- unfinished-proof/project-axiom rejection.

No imported theorem premise is used.

## Next cursor

$$
\boxed{
\texttt{WD-T08 / WD-B2 — FINITE SELECTED-SECTOR NEGATIVE-INDEX CAP}
}
$$
