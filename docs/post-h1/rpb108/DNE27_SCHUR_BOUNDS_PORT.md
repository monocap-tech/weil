# Actual low and retained Schur-block bounds

Status: **LOCALLY KERNEL-CHECKED; REMOTE CI PENDING**. The preceding form-completion head `2729c76f4b69ea17783e80b9727ef3f6a9c19147` passed pinned remote CI.

## Actual inverse versus raw source

For any actual source r and restricted inverse T with `||T|| <= 1/kappa`, Lean proves

`Re inner(r,T r) <= ||r||^2/kappa`.

This is an upper bound on actual inverse covariance, not an identity with the raw source Gram. It needs no silent positivity or self-adjointness assumption on T.

The low Schur diagonal is explicitly `lowDiag - Re inner(source0,T source0)`. The authenticated CC62 native diagonal lower bound satisfies the exact identity

`lowNativeLower = nativeLow + P0/kappa`.

Thus the original native diagonal enclosure, the existing low source-square bound and the inverse norm imply the published low Schur floor.

The retained native energy is explicitly the quadratic form of the matrix `V + G/kappa` on the existing scaled coefficients. The actual retained Schur block subtracts `Re inner(R3,T R3)`, with R3 the same three-vector source combination. Full source Gram realization gives `||R3||^2 = complexGram G (s*z)`. The inverse bound then proves actual retained Schur energy is at least `complexGram V (s*z)`.

The definition `V + G/kappa` does not certify a new original-native energy identity: the original form must still realize this native block in the raw/finite Schur decomposition. It merely exposes the exact coarse/native/source relation used by the existing upstream formulation.

## Eleven added declarations

[SchurBounds.lean](../../../../WeilDefect/RPB108/SchurBounds.lean), namespace `WeilDefect.RPB108`:

| Declaration | Role |
| --- | --- |
| `inverse_quadratic_upper` | Bound the actual inverse covariance by source norm and inverse operator norm. |
| `low_schur_lower_of_norm_bound` | Native diagonal plus source norm bounds imply an actual inverse-corrected low diagonal lower bound. |
| `complex_gram_add_div` | Exact linearity identifying the Gram of `V + G/kappa` with `Venergy + Genergy/kappa`. |

[DNE27SchurBounds.lean](../../../../WeilDefect/RPB108/DNE27SchurBounds.lean), in each parity namespace:

| Declaration | Role |
| --- | --- |
| `low_native_floor_identity` | Kernel-check the authenticated CC62/DNE27 low diagonal normalization. |
| `actual_low_schur_lower` | Derive the actual low Schur bound from that normalization, native diagonal enclosure and low source-square/inverse bounds. |
| `actual_retained_schur_lower` | Derive the actual retained Schur bound from complete source Gram realization and the inverse bound. |
| `physical_gap_of_actual_schur_blocks` | Compose with high-form completion and the preceding pairing/Gram certificates, removing separate low/retained Schur lower-bound premises. |

New definitions are `lowNativeLower`, `actualLowSchur`, `retainedNativeEnergy`, and `actualRetainedSchur`. Existing theorem statements remain unchanged. [generate_schur.py](numeric-inputs/generate_schur.py) authenticates all existing manifest files and renders the CC62 native diagonal lower values from the already pinned input. No new input files are introduced.

## Exact remaining boundary

The new gap theorem still requires original native/source vectors and norm bounds, V/G and native row enclosures, the native low diagonal enclosure, full scaled source Gram realization, high-form algebra and weak inverse identity, raw original form block identity, finite Schur decomposition and high coercivity. It now derives both actual Schur lower bounds from those primitive inputs. Both mixed pairing-square estimates, the V coordinate-energy floor and the mixed energy inequality were already reduced by prior components.

The original raw block and finite Schur identities are not proved by this theorem. In particular, original native-energy realization of `V + G/kappa`, source/operator domains, restricted inverse construction and high coercivity remain concrete obligations. No raw Gram is substituted for actual inverse covariance.

Dependency path: inverse norm + actual source vector → actual covariance upper bound; native low normalization/enclosure → low Schur floor; exact Gram linearity + full source Gram realization → retained Schur floor; these two bounds + `physical_gap_of_form_blocks` → published physical gap on the exact completed vector.

Full RPB-P03, the remaining 104-dimensional response sign, complete 1.06 positivity, continuation and RH remain open. H1 statements and statuses remain unchanged.

## Verification

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent audits of all eleven new declarations use only `propext`, `Classical.choice`, and `Quot.sound`. Authenticated regeneration reproduces the checked module byte for byte. [DNE27_SCHUR_BOUNDS_VERIFICATION.json](DNE27_SCHUR_BOUNDS_VERIFICATION.json) records source and evidence hashes and all remaining original-form obligations.
