# Retained-energy floor from complete V intervals

Status: **LOCALLY KERNEL-CHECKED; REMOTE CI PENDING**. The preceding actual-energy pairing attachment passed pinned CI at `6b912392d2969ff592409029f698edbb44b588cf`.

## Exact arithmetic and scope

[generate_retained.py](numeric-inputs/generate_retained.py) authenticates every record in the existing six-file manifest. From the pinned DNE22 `complete_coarse_matrix_intervals`, it renders signed off-diagonal envelopes for the congruence `diag(s) V diag(s)` and the published `scaled_Gershgorin_margins`. Lean checks both endpoints of all six ordered off-diagonal entries, all three exact row-margin equalities and every comparison to `scaled_positive_margin` (the existing `retainedLower`). No new data files or approximate roots are introduced.

The matrix V is the **coarse retained-energy matrix**, distinct from the raw native Q Gram and the source Gram G. The conclusion is about every V satisfying the full displayed intervals; attachment of those intervals to the original form remains unproved.

## Thirteen added declarations

[DNE27RetainedEnergy.lean](../../../../WeilDefect/RPB108/DNE27RetainedEnergy.lean) adds the generic `WeilDefect.RPB108.scaled_retained_gram`, identifying the scaled matrix quadratic form exactly with the quadratic form on scaled complex coefficients.

Each of `DNE27Even` and `DNE27Odd` adds:

| Declaration | Role |
| --- | --- |
| `retained_off_nonneg` | The three retained cross envelopes are nonnegative. |
| `retained_off_certificate` | Both endpoints of all six ordered cross intervals satisfy those envelopes. |
| `retained_margin_certificate` | Each row margin equals the published DNE22 margin and is at least `retainedLower`. |
| `retained_gram_lower` | For every complex vector z and compatible V, `retainedLower * sum_i ||z_i||^2 <= complexGram V (s*z)`. |
| `retained_energy_of_enclosures` | The exact four-column coordinate bound `retainedEnergy z <= Venergy` follows from the V enclosures. |
| `physical_gap_of_enclosures_and_pairings` | Compose this certified energy floor with the complete Gram/pairing attachment to obtain the published physical gap, without a separate retained-energy premise. |

The new definitions are `retainedOffBounds`, `retainedPublishedMargins`, and `retainedDiagonalLower`. Existing definitions and theorem statements remain unchanged.

## Dependency path and precise remaining boundary

Complete V intervals → signed scaled cross envelopes → exact positive row margins → `complex_gram_lower` → `scaled_retained_gram` → universal retained-energy floor → `physical_gap_of_gram_and_pairings` → quantitative physical gap for every completed four-column combination and arbitrary high vector.

The final theorem still explicitly requires the original V/G entry enclosures, native/source pairing-square bounds, column native/source norm bounds, restricted inverse norm bound and four-column/high form-completion lower bound. The previous independent retained-energy obligation is now discharged **under those same V enclosures**. This does not establish that the original form realizes the enclosures, or attach the concrete original domain, inverse or pairings.

Full RPB-P03, the 104-dimensional response, complete 1.06 positivity, continuation and RH remain open. H1 theorem statements, IDs and certified status remain unchanged.

## Verification

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent axiom audits of all thirteen new declarations use only `propext`, `Classical.choice`, and `Quot.sound`. Authenticated regeneration is byte-identical. An isolated control falsely raised the odd retained floor to 1; Lean rejected it. The control is excluded from the trusted source. [DNE27_RETAINED_ENERGY_VERIFICATION.json](DNE27_RETAINED_ENERGY_VERIFICATION.json) records exact custody and evidence.
