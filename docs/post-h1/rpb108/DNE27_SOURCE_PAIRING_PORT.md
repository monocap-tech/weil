# Source-pairing square from actual vectors and restricted inverse

Status: **KERNEL-CHECKED; PINNED REMOTE CI PASSED** at `4aee865272a835a8063ea2ab55f169c669d9859b`. The preceding native-row extension passed pinned CI at `fcf548917a799b1a8c725776a3f9a0f38d69e37e`.

## Exact distinction and realization

The source Gram and inverse covariance are different objects. This component defines the actual inverse source pairing

`q = inner(source 0, T(sum_i z(i.succ) • source(i.succ)))`,

using the **same** restricted inverse T and source vectors that complete the physical columns. Cauchy–Schwarz and `||T|| <= 1/kappa` bound its square by `P0/kappa^2` times the retained source-vector norm square. No equality between raw source covariance and inverse covariance is asserted, and no sign or self-adjointness is silently imposed on T.

The precise Gram-realization premise is

`inner(source(i.succ), source(j.succ)) = (s_i*s_j*G(i,j) : complex)`

for every ordered i,j. This requires the full inner product to be real, not merely an enclosure on its real part. That reality is needed to identify the real-matrix `complexGram` with the vector norm for arbitrary complex coefficients. The original real source construction must establish the displayed identity on the actual form domain.

## Ten new declarations

[SourcePairing.lean](../../../../WeilDefect/RPB108/SourcePairing.lean), namespace `WeilDefect.RPB108`:

| Declaration | Role |
| --- | --- |
| `source_gram_norm_sq` | Full Gram realization identifies the norm square of any complex linear combination of three actual source vectors. |
| `inverse_source_pairing_square` | Cauchy and the bounded inverse norm give `||inner(r,T v)||^2 <= (P/kappa^2)*||v||^2` from `||r||^2 <= P`. |

[DNE27SourcePairing.lean](../../../../WeilDefect/RPB108/DNE27SourcePairing.lean), in each parity namespace:

| Declaration | Role |
| --- | --- |
| `low_source_square_identity` | The low scale is exactly one, hence `sourceSquare 0 = rawSourceSquare 0`. |
| `retained_source_norm_sq` | The existing scaled source frame has norm square exactly `complexGram G (s*z)`. |
| `inverse_source_pairing_square_of_gram` | Derive the formerly required source-pairing square bound from the low source norm, actual Gram realization and inverse bound. |
| `physical_gap_of_realized_source_gram` | Compose with the native row and retained-energy certificates, removing both standalone pairing-square premises from the physical-gap attachment. |

The new definition is `inverseSourcePairing`. Existing definitions and theorem statements remain unchanged. No numerical data or certificate generator is added.

## Dependency path and remaining boundary

Actual full real Gram identity → exact scaled source norm → Cauchy + inverse norm + low source square → source-pairing square → `physical_gap_of_native_row_enclosures` (native row square and retained-energy floor already derived) → published physical gap for the same completed columns and arbitrary high vector.

The final theorem requires actual native/source column norms, restricted inverse norm, V/G entry enclosures, native row enclosures, full scaled source Gram realization and the original four-column/high form-completion lower bound. Its pairing q is now constructed from T and source, rather than supplied with a square-bound hypothesis. Original source/domain/inverse realization and form completion are still open; these facts are explicit arguments rather than new axioms. The theorem applies to inner-product spaces without assuming that the full original logarithmic Weil operator is bounded on all physical L2.

Full RPB-P03, the remaining 104-dimensional response sign, complete 1.06 positivity, continuation and RH remain open. H1 statuses and theorem statements remain unchanged.

## Verification

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent audits of all ten added declarations use only `propext`, `Classical.choice`, and `Quot.sound`. The generic norm identities and Cauchy estimates are Lean proofs; there is no external numerical premise or new numerical certificate. [DNE27_SOURCE_PAIRING_VERIFICATION.json](DNE27_SOURCE_PAIRING_VERIFICATION.json) records source hashes, audit evidence and exact scope.

The subsequent [form-completion component](DNE27_FORM_COMPLETION_PORT.md) derives the mixed completion inequality from explicit raw and finite Schur block identities, separate block lower bounds and high-form coercivity. Those original-form attachments remain unproved.
