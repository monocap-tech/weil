# LEAN WD-T20 certificate — 2026-09-24

Stable ID: **WD-T20 / ZW1-T1**

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

`a15e6eb544f9154836644d1a82a607f10639cbb3`

## Canonical pair coordinates

For one distinct nonreal conjugate pair, Lean represents the raw coefficient
space as

$$
\mathbb C^2
$$

through the two-coordinate type

`WeilDefect.RawPair := Bool → ℂ`.

The conjugation involution is the coordinate swap

`WeilDefect.pairSwap`.

The formal positive and negative pair channels are the symmetric and
antisymmetric directions

$$
p=(1,1),
\qquad
n=(1,-1).
$$

These are unnormalized representatives of the same canonical eigendirections
as the mathematical convention

$$
\frac{e_\gamma+e_{\bar\gamma}}{\sqrt2},
\qquad
\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2}.
$$

Normalization does not change the eigenspaces or their one-dimensional
positive/negative channel count.

Lean proves

$$
\boxed{
Jp=p,
\qquad
Jn=-n.
}
$$

These are formalized by

- `WeilDefect.wd_t20_pair_pos_eigen`;
- `WeilDefect.wd_t20_pair_neg_eigen`.

## Pair diagonalization

Lean defines a complex-linear equivalence

`WeilDefect.pairEigenEquiv`

from positive/negative eigenchannel coordinates to the raw pair coordinates.

In those coordinates, the conjugation involution is diagonal:

$$
\boxed{
(a,b)\longmapsto(a,-b).
}
$$

Formally,

`WeilDefect.wd_t20_pair_diagonalization`

proves

$$
\operatorname{pairSwap}
  (\operatorname{pairEigenEquiv}(a,b))
=
\operatorname{pairEigenEquiv}(a,-b).
$$

Thus one distinct nonreal conjugate pair contributes exactly one positive and
one negative coefficient eigendirection.

## Multiplicity boundary

WD-T20 is the **pair-level algebra after same-frequency multiplicity-null
directions have been reduced to one distinct pair coordinate**.

It does not itself certify the multiplicity quotient construction. That
jurisdiction remains WD-T23. This preserves the theorem-ledger separation
between:

1. diagonalization of one distinct conjugate pair; and
2. quotienting repeated identical-frequency raw coordinates before index
   counting.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T20.

The proof is direct finite-dimensional complex linear algebra and Boolean
coordinate case analysis, checked by the pinned Lean/mathlib kernel.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Certification result

The WD-T20 source already existed before this certification cursor and
compiled without modification. No theorem repair or hypothesis adjustment was
required.

The same module also contains later declarations for WD-T21 and WD-T26, but
their presence does not promote those stable IDs. WD-T20 is certified here
only through its own mapped pair-eigenchannel declarations.

## CI evidence

Successful certificate run:

`36087496196`

Workflow run number:

`145`

Repository head checked:

`9b8142168cb5e4a5bd53e4d6e903abec211465d4`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.PairGeometry`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T21 / ZW1-T2 — ONE SIMPLE ZETA QUARTET CONTRIBUTES TWO NEGATIVE PAIR COORDINATES}
}
$$
