# LEAN WD-T15 certificate — 2026-09-24

Stable ID: **WD-T15 / WD-C1 + WD-C2**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Filtration.RightLimit`

Source:

`WeilDefect/Filtration/RightLimit.lean`

Certified source blob:

`2df4a12993a7fdad3695deb5e68e7ae526b8ebee`

## Closed right-limit model

The certificate works with a monotone real-parameter family

$$
A:\mathbb R\to \operatorname{ClosedSubmodule}(\mathbb C,H).
$$

For an endpoint $c$, the right-limit space is encoded as the closed-submodule
infimum over parameters strictly to the right,

$$
A_{c+}
=
\bigcap_{t>c} A_t,
$$

via `WeilDefect.WDT15.rightLimit`.

The limiting gap space is encoded as the closed-submodule supremum

$$
G_{c+}
=
\overline{\operatorname{span}\bigcup_{t>c} A_t^\perp},
$$

via `WeilDefect.WDT15.gapLimit`. Because the lattice supremum of
`ClosedSubmodule` already takes the closed span, the closure is part of the
formal object rather than an external side condition.

## WD-C2 — gap duality

Lean proves natively

$$
\boxed{
A_{c+}=G_{c+}^{\perp}.
}
$$

The proof is the Hilbert-space lattice identity relating intersections and
orthogonal complements, expressed through
`ClosedSubmodule.iInf_orthogonal`.

Lean also certifies the reversal of the filtration on gap spaces: monotone
analysis spaces produce antitone orthogonal complements.

## Cofinal right-approach sequences

For every sequence $t_n$ satisfying

$$
c<t_n,
\qquad
t_n\to c,
$$

Lean proves

$$
\boxed{
\bigcap_n A_{t_n}=A_{c+}.
}
$$

Thus any real sequence approaching the endpoint from the right is cofinal for
the monotone filtration. The proof uses the real-order neighborhood structure
and monotonicity of $A$.

Lean further proves

$$
\overline{\operatorname{span}\bigcup_n A_{t_n}^{\perp}}
=
A_{c+}^{\perp}.
$$

## WD-C1 — strong projection limit

For every antitone right-approach sequence $t_n\downarrow c$ and every
$x\in H$, Lean proves the pointwise norm convergence

$$
\boxed{
P_{A_{t_n}}x
\longrightarrow
P_{A_{c+}}x.
}
$$

This is the strong-operator convergence statement along arbitrary decreasing
real sequences approaching $c$.

The proof dualizes to the increasing gap spaces, invokes mathlib's
`Submodule.starProjection_tendsto_closure_iSup`, and then converts the gap
projection limit back to the analysis projection. The final conversion is
certified through the defining projection uniqueness property rather than
through dependent rewriting of projection typeclass instances.

The P4 audit records that this sequential formulation suffices for the
real-parameter right-limit statement: failure of the full strong limit would
produce a violating sequence approaching $c$.

## Formal declarations

The certificate includes:

- `WeilDefect.WDT15.RightIndex`;
- `WeilDefect.WDT15.rightLimit`;
- `WeilDefect.WDT15.gapLimit`;
- `WeilDefect.WDT15.wd_t15_gap_antitone`;
- `WeilDefect.WDT15.wd_t15_right_limit_gap_duality`;
- `WeilDefect.WDT15.wd_t15_sequence_right_limit_eq`;
- `WeilDefect.WDT15.wd_t15_sequence_gap_eq_right_limit_orthogonal`;
- `WeilDefect.WDT15.wd_t15_monotone_projection_limit`;
- `WeilDefect.WDT15.wd_t15_right_limit_projection_and_gap_duality`.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T15.

The proof uses ordinary pinned mathlib Hilbert-space projection, orthogonal
complement, topology, and closed-submodule lattice theorems.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The mathematical spine compiled without revision. Repair work was confined to
Lean representation issues:

- marking the closed gap supremum noncomputable;
- using the pinned real-neighborhood API;
- normalizing `ClosedSubmodule` / `Submodule` coercions;
- replacing dependent projection-instance transport by projection uniqueness.

No theorem statement or mathematical hypothesis was weakened.

## CI evidence

Successful certificate run:

`36070010269`

Workflow run number:

`121`

Repository head checked:

`ee1efb86924caa501e0bfaa4ab8a1478736c64d8`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Filtration.RightLimit`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T16 / WD-C3+WD-C5 — FIXED FINITE NEGATIVE-SECTOR PERSISTENCE}
}
$$
