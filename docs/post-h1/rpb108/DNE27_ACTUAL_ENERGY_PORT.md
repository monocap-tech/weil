# Actual-energy mixed-pairing attachment

Status: **LOCALLY KERNEL-CHECKED; REMOTE CI PENDING**. The preceding Gram extension passed pinned CI at `cc731445e24872fdb429405de407a0de059fa0bc`.

## Exact distinction

`retainedEnergy z` is the coordinate lower bound `g * sum_j ||z(j.succ)||^2`. The actual retained energy is `Venergy = complexGram V (s*z)`. Although `retainedEnergy z <= Venergy`, one cannot replace Venergy by its lower bound inside the negative square-root cross term. The earlier `physical_gap_of_mixed_energy` remains a valid conditional theorem; its raw coordinate-energy premise has not been derived from the original form.

This component instead bounds the complete mixed pairing against **actual Venergy**, pays Young's inequality there, and only then uses the coordinate lower bound in the positive theta-weighted term. Existing statements and numerical inputs are unchanged.

## Seven added declarations

[MixedPairing.lean](../../../../WeilDefect/RPB108/MixedPairing.lean), namespace `WeilDefect.RPB108`:

| Declaration | Exact role |
| --- | --- |
| `source_cross_square_of_gram_domination` | From `||q||^2 <= c*G`, `c >= 0` and `G <= rho*V`, deduce `||q||^2 <= c*rho*V`. |
| `mixed_pairing_norm_le` | From native and source pairing squares bounded by `a*V`, `b*V` and the checked root-sum bound, deduce `||p-q|| <= M*sqrt(V)`. |
| `paid_actual_energy_lower` | Pay the mixed row using actual V, then substitute a lower bound v only into the positive `theta*v` term. |

[DNE27ActualEnergy.lean](../../../../WeilDefect/RPB108/DNE27ActualEnergy.lean), in **each** of `DNE27Even` and `DNE27Odd`:

| Declaration | Exact role |
| --- | --- |
| `actual_energy_diagonal_lower` | Native/source pairing squares and `retainedEnergy z <= Venergy` imply the four-column diagonal bound against `nativeLow*||z0||^2 - 2*||z0||*||p-q|| + Venergy`. |
| `physical_gap_of_gram_and_pairings` | Complete V/G entry enclosures, native/source pairing-square bounds, retained-energy lower bound, inverse/native/source norm bounds and the original form-completion lower bound imply the published `4/10^36` physical gap. |

All declarations are universal in complex coefficients. The latter theorem uses the complete previously checked Gram certificate, including all signed cross entries, rather than assuming its conclusion.

## Dependency path

`DNE27Gram.source_gram_domination` + positive published margins
→ `G(s*z) <= rho*V(s*z)`
→ source pairing square `<= (rho*P0/kappa^2)*Venergy`
→ `mixed_pairing_norm_le` + `combined_mixed_norm_bound`
→ `paid_actual_energy_lower` + exact alpha/theta identities
→ `actual_energy_diagonal_lower`
→ `physical_gap_of_native_source_bounds`
→ physical gap for the four completed columns and arbitrary high vector.

The source pairing input is exactly `||q||^2 <= (P0/kappa^2)*G(s*z)`. It does not assert an equality between raw source covariance and inverse-high covariance.

## Remaining original-form boundary

The original development must still instantiate:

- the actual form-domain vectors and bounded restricted inverse T, including domain compatibility;
- complete V/G enclosures and the DNE22 retained-energy lower bound;
- the original native pairing p and source/inverse pairing q, with their displayed square bounds;
- native/source norm bounds and the original four-column/high square-completion lower bound `hcompletion`.

These are explicit arguments, not axioms or opaque certificate assumptions. The final diagonal mixed estimate is now derived from separate pairing bounds, rather than required as an unexplained energy hypothesis. However, the concrete original pairings and completion are not yet attached. Full RPB-P03, the remaining 104-dimensional response, global continuation and RH remain open.

## Verification

Pinned Lean/mathlib 4.34.0 builds of `WeilDefect.RPB108` and the H1 target passed. Independent Lean invocation audits all seven declarations to only `propext`, `Classical.choice`, and `Quot.sound`. No new numerical certificate or data file is introduced; the existing authenticated Gram and mixed-root certificates supply the arithmetic. See [DNE27_ACTUAL_ENERGY_VERIFICATION.json](DNE27_ACTUAL_ENERGY_VERIFICATION.json).
