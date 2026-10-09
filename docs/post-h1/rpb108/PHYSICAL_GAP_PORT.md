# First post-H1 Lean component: universal physical-gap inequalities

Status: **INITIAL THREE LEMMAS PASSED REMOTE CI; COMPLETED-COLUMN EXTENSION LOCALLY VERIFIED, REMOTE CI PENDING**.
This companion port is based on the documentation transfer in PR #1. It adds a separate `WeilDefect.RPB108` module family. The existing Horizon-1 sources, theorem declarations, theorem IDs and ledger are unchanged.

## Exact declaration inventory

| Declaration in `WeilDefect.RPB108` | Statement | Role |
| --- | --- | --- |
| `weighted_mass_sq_le_energy` | For a finite set `s`, real vectors `w,L,z` and `0 < L i` on `s`, `(∑ i∈s, w i * abs(z i))² ≤ (∑ i∈s, (w i)²/L i) * (∑ i∈s, L i * (z i)²)` | Universal weighted Cauchy inequality |
| `physical_gap_of_denominator_bound` | If `gap ≥ 0` and `gap * (∑ i∈s, (w i)²/L i) ≤ 1`, then `gap * (∑ i∈s, w i * abs(z i))² ≤ ∑ i∈s, L i * (z i)²` for every `z` | Replaces coefficient sampling with a universal sufficient estimate |
| `physical_gap_of_mass_upper_bound` | Under the same denominator bound, if `0 ≤ mass ≤ ∑ i∈s, w i * abs(z i)`, then `gap * mass² ≤ ∑ i∈s, L i * (z i)²` | Explicit transport through a physical-norm upper estimate |

Source: [PhysicalGap.lean](../../../../WeilDefect/RPB108/PhysicalGap.lean).
Entry point: `import WeilDefect.RPB108`.
These are supporting generic inequalities, not promoted RPB-P theorem IDs.

The proof path is Mathlib's `Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul` → `weighted_mass_sq_le_energy` → `physical_gap_of_denominator_bound` → `physical_gap_of_mass_upper_bound`. No original Weil-form premise is hidden in the proofs. Axiom audits report only `propext`, `Classical.choice`, and `Quot.sound` for the initial three declarations.

## Completed-column extension

Three additional declarations in [CompletedColumns.lean](../../../../WeilDefect/RPB108/CompletedColumns.lean) close the specialization and norm-transport reductions:

| Declaration | Exact role |
| --- | --- |
| `four_column_tail_gap` | For `Fin 4` coefficients and any nonnegative high norm `r`, the denominator `sum w_i²/L_i + 1/k` entails `gap*(sum w_i*abs(z_i)+r)² ≤ sum L_i*z_i²+k*r²`. The proof appends one norm coordinate via `Option (Fin 4)`. |
| `completed_columns_norm_bound` | In any complex normed space, actual bounds `norm(v_i)≤b_i` imply `norm(sum z_i•v_i+h) ≤ sum b_i*norm(z_i)+norm(h)` for every high vector `h`. |
| `completed_columns_physical_gap` | Given positive diagonal weights, a checked denominator, actual column-norm bounds, and the explicit completed-square lower bound `sum L_i*norm(z_i)²+k*norm(h)² ≤ energy`, prove `gap*norm(sum z_i•v_i+h)² ≤ energy`. |

These proofs use only standard Lean axioms. The physical-vector realization and triangle reduction are now formal; the original Weil form must still provide the completed-column norm bounds and completed-square energy lower bound. The scalar denominator must also be kernel-checked against the original authenticated arithmetic values. The theorem exposes these three obligations directly and claims none of them for the original source by assumption or naming.

## Intended DNE27 application and exact boundary

Use four completed-column weights `s_i b_i`, lower diagonal weights `(alpha, theta*g, theta*g, theta*g)`, and append one coordinate equal to the remaining high norm, with weight `1` and lower weight `k=11/25`. The denominator is

`sum_i (s_i*b_i)^2/L_i + 1/k`.

The original quadratic-form energy lower bound and completed-column norm bounds must still be proved to instantiate the new physical-vector theorem; its triangle estimate is now proved from those norm bounds. The DNE27 rational values and their six authenticated input certificates have not been imported into the Lean kernel by this component. The preceding local review's genuine arithmetic replays and mutation checks remain computational evidence, not a formal arithmetic port.

Thus F2 gains its universal inequality lemma, while F0/F1, the numerical part of F2, and the original-form theorem F3 remain open. F4/F5/F6 are unchanged. No positivity of the full original 1.06 form, complete 104-dimensional response sign, global continuation, or RH is asserted.

## Reproduction and CI

The existing repository pins Lean 4.34.0 and mathlib v4.34.0. Run:

```sh
lake build WeilDefect.RPB108
lake build WeilDefect.Examples.WeakCriticalFallthrough
lake env lean WeilDefect/RPB108/PhysicalGap.lean
```

The last command prints the initial three axiom audits; also run `lake env lean WeilDefect/RPB108/CompletedColumns.lean` for the three extension audits. The companion CI change adds `lake build WeilDefect.RPB108` beside the existing H1 target and retains the admission check. Local evidence is recorded in [PHYSICAL_GAP_VERIFICATION.json](PHYSICAL_GAP_VERIFICATION.json); the initial head `fcd6f161e260692b9f80391f5185d34fd513e4ad` passed [remote CI](https://github.com/monocap-tech/weil/actions/runs/37995164234), and the extension requires its own successful remote CI run.

## Relationship to the next release

PR #1 stages the mathematical narrative and source custody. This companion change supplies the first reusable Lean component for that transfer. Both are reviewable stages toward the next Weil update. Neither declares the full research package ported or a new completed Horizon. Documentation acceptance can proceed separately from promotion of the original arithmetic theorems.
