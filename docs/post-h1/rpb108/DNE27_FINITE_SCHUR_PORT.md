# Finite Schur identity from native blocks and weak inverse equations

Status: **LOCALLY KERNEL-CHECKED; PINNED REMOTE CI PASSED**. The preceding Schur-bound head `9dc74c27347275dc02c115596404ff82f78671cf` passed pinned remote CI.

## Exact conjugation and source realization

The low/retained source split is `Rtotal = z0 • source0 + R3`, with R3 the existing three-column source combination. For the actual restricted inverse T, the expansion of `Re inner(Rtotal,T Rtotal)` needs Hermitian covariance to combine its two signed mixed terms. An operator norm bound alone does not provide that symmetry.

The new generic lemma derives the needed covariance identity from the actual Hermitian high form B and the two pointwise cross weak equations:

`B(T source0,T R3) = inner(source0,T R3)` and
`B(T R3,T source0) = inner(R3,T source0)`.

It follows that `inner(R3,T source0) = conj(inner(source0,T R3))`. The resulting expansion is

`Re inner(Rtotal,T Rtotal) = ||z0||^2 Re inner(source0,T source0) + 2 Re(conj(z0) inner(source0,T R3)) + Re inner(R3,T R3)`.

Subtracting this from the **uncorrected native** low/retained block identity gives the exact finite Schur identity using the already defined actual low/retained Schur blocks and `nativePairing - inverseSourcePairing`. No raw source covariance is substituted for inverse covariance.

## Seven new declarations

[FiniteSchur.lean](../../../../WeilDefect/RPB108/FiniteSchur.lean), namespace `WeilDefect.RPB108`:

| Declaration | Role |
| --- | --- |
| `inverse_covariance_hermitian` | Actual Hermitian high form plus two cross weak inverse equations imply covariance symmetry on the source pair. |
| `inverse_covariance_split` | Exact inverse covariance expansion for every complex low coefficient. |
| `finite_schur_split` | Native block identity transports to actual finite Schur blocks with the correctly conjugated mixed pairing. |

[DNE27FiniteSchur.lean](../../../../WeilDefect/RPB108/DNE27FiniteSchur.lean), in each parity namespace:

| Declaration | Role |
| --- | --- |
| `finite_schur_identity_of_native_block` | Split the existing four-column source sum and instantiate the exact native-to-Schur identity. |
| `physical_gap_of_native_form_blocks` | Derive covariance symmetry and the finite Schur identity from Hermitian high-form/weak-inverse facts and the uncorrected native block identity, then compose with the checked physical-gap chain. |

No new definitions, input data or generators are added. Existing theorem statements remain unchanged.

## Precise remaining boundary

The new physical-gap theorem removes the separate finite Schur identity premise. It still requires:

- actual native/source vectors, norm bounds, V/G and native row/diagonal enclosures, and full scaled source Gram realization;
- high form subtraction and full Hermitian symmetry on its actual domain, restricted inverse norm, and weak inverse equations for total, low and retained sources;
- the original raw form block identity;
- the uncorrected native block identity, including original native-energy realization of the matrix `V + G/kappa`;
- original high coercivity.

The generic covariance-symmetry lemma uses only the two displayed cross evaluations. The parity composition accepts weak inverse identities for all test vectors at each of the relevant three sources, so the original domain must support those evaluations. No global boundedness of the full Weil action or high form is asserted.

The native and raw form block identities are still unproved on the original carrier. This closes the finite Schur algebra under primitive high/native block facts; it does not convert those facts into original Weil-form theorems. Both actual Schur bounds, both pairing-square estimates, retained-energy floor and mixed completion estimate are derived by the composed chain.

Full RPB-P03, the remaining 104-dimensional response sign, complete 1.06 positivity, continuation and RH remain open. H1 statuses and original theorem statements remain unchanged.

## Validation

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent axiom audits of all seven new declarations use only `propext`, `Classical.choice`, and `Quot.sound`. The complex expansion uses exact algebra, with no phase sampling or numerical certificate premise. [DNE27_FINITE_SCHUR_VERIFICATION.json](DNE27_FINITE_SCHUR_VERIFICATION.json) records source hashes, evidence and all original-form realization obligations.

Pinned finite-Schur CI passed at `7baf4a3a5572f983c61a39b14d2c1c249b5ce112`: https://github.com/monocap-tech/weil/actions/runs/38013891325/job/114099818925
