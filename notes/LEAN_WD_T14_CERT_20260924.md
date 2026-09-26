# LEAN WD-T14 certificate — 2026-09-24

Stable ID: **WD-T14 / WD-B8**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.FinitePositiveShadows`

Source:

`WeilDefect/Screening/FinitePositiveShadows.lean`

Certified source blob:

`ed287dfd0dbe7e47cdbb074c0fda64bcd0bc6e41`

## Signature shadow

For a positive coefficient (a) and negative coefficient (u), define the
algebraic negative margin

$$
\kappa(a,u)=\|u\|^2-\|a\|^2.
$$

For every closed positive subspace (U), Lean uses the actual orthogonal
projection `U.starProjection` and mathlib's contraction theorem

$$
\|P_Ua\|\le \|a\|.
$$

It then proves

$$
\boxed{
\|u\|^2-\|P_Ua\|^2
\ge
\|u\|^2-\|a\|^2.
}
$$

Consequently, if the original margin equals some (kappa>0), every positive
shadow retains margin at least (kappa) and remains algebraically negative.

## Graph admissibility

For a graph vector

$$
u=-X^*a,
$$

Lean proves the exact preservation criterion

$$
\boxed{
u=-X^*P_Ua
\iff
X^*(a-P_Ua)=0.
}
$$

Thus graph admissibility is not a consequence of the signature estimate: it
requires the discarded positive component to lie in the kernel of (X^*).

The certificate also contains an explicit negative-margin counterexample on
(mathbb C): take (X=2I), (a=1), (u=-2), and project the positive
coordinate to the zero subspace. Then

$$
u=-X^*a,
\qquad
\|u\|^2-\|a\|^2=3>0,
$$

while the projected pair does not satisfy the graph relation.

This formalizes the audited distinction

$$
\text{signature shadow}
\neq
\text{admissible analysis vector}.
$$

## Formal declarations

The certificate includes:

- `WeilDefect.WDT14.shadowMargin`;
- `WeilDefect.WDT14.wd_t14_positive_shadow_margin`;
- `WeilDefect.WDT14.wd_t14_positive_shadow_preserves_negative_margin`;
- `WeilDefect.WDT14.wd_t14_graph_shadow_admissible_iff`;
- `WeilDefect.WDT14.wd_t14_graph_admissibility_failure_example`;
- `WeilDefect.WDT14.wd_t14_finite_positive_shadows_preserve_signature_not_admissibility`.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T14.

The projection contraction, adjoint identities, and scalar star facts are
ordinary pinned mathlib results checked by the Lean kernel.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The generic projection theorem and graph-admissibility criterion compiled on
the first theorem pass.

The only repair residue came from elaborating the concrete (X=2I)
counterexample: Lean required the adjoint of the scaled identity to be
normalized explicitly through the star-module law, `adjoint_id`, and
`star_ofNat`.

No theorem statement or mathematical hypothesis changed.

## CI evidence

Successful certificate run:

`36062388096`

Workflow run number:

`116`

Repository head checked:

`adcdc167eb274af899a1a53dfb86b76c5bc442ae`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.FinitePositiveShadows`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T15 / WD-C1+WD-C2 — RIGHT-LIMIT PROJECTION CONVERGENCE AND GAP-SPACE DUALITY}
}
$$
