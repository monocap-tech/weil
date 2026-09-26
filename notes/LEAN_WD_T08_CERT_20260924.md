# LEAN WD-T08 certificate — 2026-09-24

Stable ID: **WD-T08 / WD-B2**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.FiniteIndexCap`

Source:

`WeilDefect/Screening/FiniteIndexCap.lean`

Certified source blob:

`9c61af90ab1374f65df446c558790a8b7f4dff27`

## Selected-sector cap

For a `k`-dimensional selected negative witness

`T : EuclideanSpace ℂ (Fin k) →L[ℂ] H`,

Lean proves that

$$
S_M^*\circ T : \mathbb C^k\to M
$$

is injective. If a nonzero coordinate vector were killed by the selected
adjoint, normalization would produce a unit vector on which the selected
quadratic form is nonnegative, contradicting strict negativity.

Hence finite-dimensional rank comparison gives

$$
k\le \dim M.
$$

This is the formal finite-rank-spectrum version of

$$
\operatorname{ind}_{-}(D_M)\le \dim M.
$$

## Background correction

Given a full `k`-negative witness `T`, define

$$
K_T=\ker(S_B^*\circ T).
$$

Rank-nullity gives

$$
k
=
\dim\operatorname{Ran}(S_B^*\circ T)
+
\dim K_T,
$$

while

$$
\dim\operatorname{Ran}(S_B^*\circ T)\le\dim B.
$$

Therefore Lean proves

$$
k-\dim B\le\dim K_T.
$$

On `K_T`, the background adjoint is zero, so the full quadratic form equals
the selected quadratic form.  The selected form is therefore strictly negative
on the unit sphere of this entire kernel slice.

This is the exact kernel-subspace proof of

$$
\operatorname{ind}_{-}(D_{\mathrm{full}})
\le
\operatorname{ind}_{-}(D_M)+\dim B.
$$

## CI evidence

The first dedicated build exposed only a normalization-through-kernel
simplification gap. It was repaired by explicitly mapping the normalized
scalar multiple of a kernel vector back to zero.

Successful certificate run:

`36007743473`

Repository head checked:

`c2b318997f2aaa9ca756ae66f9149ba9ac34956a`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.FiniteIndexCap`;
- unfinished-proof/project-axiom rejection.

No imported theorem premise is used.

## Next cursor

$$
\boxed{
\texttt{WD-T09 / WD-B3 — SHARED SCREENING BUDGET}
}
$$
