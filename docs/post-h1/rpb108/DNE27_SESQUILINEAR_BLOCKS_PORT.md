# Block identities from algebraic sesquilinear realization

Status: **LOCALLY KERNEL-CHECKED; REMOTE CI PENDING**. The preceding finite Schur head `7baf4a3a5572f983c61a39b14d2c1c249b5ce112` passed pinned remote CI.

## Ten new declarations

[SesquilinearBlocks.lean](../../../../WeilDefect/RPB108/SesquilinearBlocks.lean), namespace `WeilDefect.RPB108`:

| Declaration | Proven role |
| --- | --- |
| `hermitian_form_add` | Real quadratic expansion with twice the signed real cross term. |
| `sesquilinear_smul_diagonal` | Exact norm-square weight for any complex coefficient. |
| `sesquilinear_gram` | Full real finite Gram entries determine the quadratic form on every complex three-column combination. |
| `sesquilinear_source_coupling` | Column coupling at the actual high vector extends to every complex four-column combination. |

[DNE27SesquilinearBlocks.lean](../../../../WeilDefect/RPB108/DNE27SesquilinearBlocks.lean), in each `DNE27Even` and `DNE27Odd` namespace:

| Declaration | Proven role |
| --- | --- |
| `native_block_of_sesquilinear_entries` | Derives the low/retained native block from the actual diagonal, row and retained entries. |
| `raw_block_of_sesquilinear_coupling` | Derives the raw block from the quadratic-form realization, local high restriction and column coupling. |
| `physical_gap_of_sesquilinear_realization` | Composes the derived blocks with finite Schur transport, both Schur bounds, both pairing estimates and high completion to prove the conditional physical gap. |

The form is Mathlib's algebraic `E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ`, conjugate-linear first and linear second. No continuity or boundedness of the full form is required. No new definitions, numerical inputs or generators are introduced; existing theorem statements are preserved.

## Exact dependency boundary

The full form F and high form B remain distinct. The raw block only needs `Re F(v,v) = Re B(v,v)` and `F(x_i,v) = inner(source_i,v)` at the actual high vector `v = h - T Rtotal`. It does not assume a global source representation. Realization of Q is likewise required at the actual raw vector. Full complex Hermitian symmetry and full complex finite entry identities are explicit, rather than inferred from real-part identities.

The native retained entries are the scaled matrix `V + G/highFloor`. G is raw source Gram data, not actual inverse covariance. Actual inverse covariance is separately handled by the existing weak-inverse Schur theorems. This proves the aggregate native and raw identities from their listed primitive facts; those facts have not yet been proved for the original Weil form.

The composed result still requires:

- an algebraic realization of the original form on a valid normed complex domain containing the native vectors, sources, inverse images and high vector;
- actual native/source vectors and their norm bounds, V/G interval enclosures, full scaled source Gram realization, native row/diagonal enclosures and actual finite form entries;
- Hermitian high-form subtraction identities, a restricted inverse with the stated norm bound, and weak inverse equations for total, low and retained sources;
- local original-Q identity, local high restriction and source coupling at the actual high vector;
- original high coercivity.

The current theorem requires a continuous linear T on the chosen E. Constructing a suitable original form domain with these interfaces is an explicit remaining obligation, not established by choosing an abstract E. No bounded full logarithmic Weil action on all physical L2 is asserted. This component is a reusable conditional reduction, not certification of the original carrier.

Full RPB-P03, the 104-dimensional response sign, complete 1.06 positivity, continuation and RH remain open. H1 source statements and IDs remain unchanged.

## Validation

Pinned Lean/mathlib 4.34.0 RPB108 and H1 CI targets passed locally. Independent Lean audits of all ten new declarations report only `propext`, `Classical.choice` and `Quot.sound`. The RPB108 sources contain no admissions, project axioms or `native_decide`. The complete component now contains 143 audited declarations. [DNE27_SESQUILINEAR_BLOCKS_VERIFICATION.json](DNE27_SESQUILINEAR_BLOCKS_VERIFICATION.json) records source/evidence hashes and the exact remaining realization boundary.
