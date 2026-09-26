# LEAN WD-T21 certificate — 2026-09-24

Stable ID: **WD-T21 / ZW1-T2**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.PairGeometry`

Source:

`WeilDefect/PairGeometry.lean`

Certified source blob:

`427fbe49617add15010ba812c6140e07a7b9507f`

## Quartet geometry in Bombieri ordinate coordinates

For a simple off-critical functional-equation quartet, the Bombieri ordinate
coordinates are represented by the two conjugate pairs

$$
\{T+i\delta,,T-i\delta\}
$$

and

$$
\{-T+i\delta,,-T-i\delta\}.
$$

Lean defines these as

- `WeilDefect.quartetPairPos T δ`;
- `WeilDefect.quartetPairNeg T δ`.

The formal hypotheses are the minimal nondegeneracy conditions needed for the
audited simple off-critical quartet geometry:

$$
T\ne0,
\qquad
\delta\ne0.
$$

Here $\delta\ne0$ makes each pair nonreal, while $T\ne0$ separates
the $+T$ and $-T$ pair centers.

## Conjugacy

Lean proves natively that both pairs are complex-conjugate pairs:

$$
(T-i\delta)=\overline{(T+i\delta)}
$$

and

$$
(-T-i\delta)=\overline{(-T+i\delta)}.
$$

These are formalized by

- `WeilDefect.wd_t21_quartet_pair_pos_conjugate`;
- `WeilDefect.wd_t21_quartet_pair_neg_conjugate`.

In the pinned complex API, conjugation is represented by the `star`
operation.

## Nonreality and distinctness

Lean proves

$$
\operatorname{Im}(T+i\delta)\ne0,
\qquad
\operatorname{Im}(-T+i\delta)\ne0
$$

under $\delta\ne0$, via

`WeilDefect.wd_t21_quartet_pairs_nonreal`.

It also proves

$$
\boxed{
\{T+i\delta,T-i\delta\}
\ne
\{-T+i\delta,-T-i\delta\}
}
$$

under $T\ne0$, via

`WeilDefect.wd_t21_quartet_pairs_distinct`.

Thus the quartet genuinely contains two distinct nonreal conjugate pairs.

## Negative-coordinate count

WD-T20 already certifies that each distinct nonreal conjugate pair contributes
one canonical negative pair direction.

The selected negative coordinate type for one simple quartet is therefore

`WeilDefect.SimpleQuartetNegative := Fin 2`,

and Lean proves

$$
\boxed{
\operatorname{card}(\texttt{SimpleQuartetNegative})=2.
}
$$

This is

`WeilDefect.wd_t21_simple_quartet_negative_count`.

The assembled theorem

`WeilDefect.wd_t21_simple_quartet_pair_geometry`

packages conjugacy, nonreality, pair distinctness, and the two-coordinate
count into one kernel-checked WD-T21 statement.

## Jurisdiction boundary

WD-T21 is a **coefficient-space count** derived from the functional-equation
quartet and WD-T20 pair diagonalization.

It does **not** identify that count with the negative spectral index of the
finite Weil matrix. That saturation step is WD-T22 and depends on Bombieri's
imported finite-inertia theorem.

Thus WD-T21 remains native and does not consume the WD-T22 imported theorem.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T21.

The proof uses only direct complex-coordinate algebra, the native star
involution, and the already-certified pair-coordinate interpretation from
WD-T20.

Therefore the correct status is:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The original module already contained the bare cardinality theorem

`Fintype.card SimpleQuartetNegative = 2`.

Before promotion, the certification cursor strengthened the formal source so
that the audited zeta-specific bridge is explicit: the four Bombieri
ordinates form two distinct nonreal conjugate pairs.

The only compiler repair was replacing the unavailable name
`Complex.conj` by the pinned `star` conjugation operation.

No theorem hypothesis or conclusion was weakened.

## CI evidence

Successful certificate run:

`36088674422`

Workflow run number:

`147`

Repository head checked:

`e8e1c6b9e1f9f9f566d6398b296d7b30b827ef3d`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.PairGeometry`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T22 / ZW1-T3 — FINITE WEIL INERTIA SATURATION}
}
$$

This next cursor is not expected to be native-only: its theorem-ledger
standing is imported Bombieri finite inertia plus exact specialization.
