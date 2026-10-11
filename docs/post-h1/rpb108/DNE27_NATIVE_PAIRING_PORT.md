# Native-pairing square from unsquared entry enclosures

Status: **KERNEL-CHECKED; PINNED REMOTE CI PASSED** at `fcf548917a799b1a8c725776a3f9a0f38d69e37e`. The preceding retained-energy extension passed pinned CI at `57db5c1a2b254bf848f71868d63aac063f56536a`.

## Source and exact normalization

DNE23's original unsquared low/lift pairings are three real intervals in each parity. Its published native dual budget is exactly

`d_native * g = sum_i (s_i * max(|p_lower_i|, |p_upper_i|))^2`,

where g is the DNE22 retained-energy floor and s are the existing physical congruence scales. [generate_native.py](numeric-inputs/generate_native.py) authenticates all six existing manifest records and renders those endpoints and envelopes. Lean checks their signs, endpoint coverage and the exact budget identity. No new input data is introduced.

The native row on scaled coordinates is explicitly defined as `nativePairing a z = sum_i (s_i*a_i)*z(i.succ)`. A normalization lemma identifies it with `sum_i a_i*(s_i*z(i.succ))`. This keeps the original unsquared row and coordinate scaling visible. The row coefficients a must satisfy the imported intervals; the original form must still produce those coefficients and prove the enclosures.

## Sixteen new declarations

[NativePairing.lean](../../../../WeilDefect/RPB108/NativePairing.lean), namespace `WeilDefect.RPB108`:

| Declaration | Role |
| --- | --- |
| `complex_row_square_le` | A finite complex row with entrywise norm envelopes obeys the full Cauchy square bound for every complex coefficient vector. |
| `native_row_square_of_energy_floor` | A checked dual budget and coordinate-energy floor imply the native pairing square bound against actual V-energy. |

[DNE27NativePairing.lean](../../../../WeilDefect/RPB108/DNE27NativePairing.lean), in each parity namespace:

| Declaration | Role |
| --- | --- |
| `native_pairing_normalization` | Exact identity between scaled row coefficients and the original row on scaled coordinates. |
| `native_envelope_nonneg` | Each native row envelope is nonnegative. |
| `native_pairing_endpoints` | Both signed endpoints satisfy the absolute envelope. |
| `native_dual_budget_identity` | The sum of squared scaled envelopes equals `nativeDualSquare*retainedLower`. |
| `native_scaled_row_bound` | Every row satisfying the intervals obeys the scaled norm envelopes. |
| `native_pairing_square_of_enclosures` | Complete V and native row enclosures imply the published native pairing-square bound for every complex vector. |
| `physical_gap_of_native_row_enclosures` | Compose that bound with the existing source/Gram and physical-gap reduction, removing the standalone native pairing-square premise. |

New definitions are `nativePairingLower`, `nativePairingUpper`, `nativePairingEnvelope`, `nativeScaledEnvelope`, and `nativePairing`. Existing theorem statements and data remain unchanged.

## Dependency path and remaining boundary

Unsquared row intervals → signed envelopes → exact dual-budget identity + universal complex row Cauchy + certified retained V-energy floor → native pairing square → `physical_gap_of_enclosures_and_pairings` → published physical gap.

The resulting theorem still requires actual V/G and native row enclosures, actual native/source column norm bounds, restricted inverse norm bound, source pairing-square estimate and original four-column/high completion. The native pairing square and retained-energy floor are now derived from the enclosures, not assumed independently. Concrete original-form realization of the finite coefficients, source vectors, inverse and completion remains open. The source pairing argument q is still explicit, with its exact required square bound; no raw covariance is equated with inverse-high covariance.

This closes the native row arithmetic/reduction boundary, not full RPB-P03, the 104-dimensional response, complete 1.06 positivity, continuation or RH. H1 statuses and original theorem statements remain unchanged.

## Verification

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent audits of all sixteen new declarations use only the standard axioms `propext`, `Classical.choice`, and `Quot.sound`. Authenticated regeneration is byte-identical. Lean rejected an isolated control setting the native dual budget to zero. See [DNE27_NATIVE_PAIRING_VERIFICATION.json](DNE27_NATIVE_PAIRING_VERIFICATION.json) for source and evidence hashes.

The subsequent [source-pairing attachment](DNE27_SOURCE_PAIRING_PORT.md) constructs q from the same inverse and source vectors and derives its square bound from their full Gram realization.
