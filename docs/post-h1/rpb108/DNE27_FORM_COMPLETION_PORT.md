# High-form square completion and physical-gap block interface

Status: **KERNEL-CHECKED; PINNED REMOTE CI PASSED** at `2729c76f4b69ea17783e80b9727ef3f6a9c19147`. The preceding source-pairing head `4aee865272a835a8063ea2ab55f169c669d9859b` passed pinned remote CI. GitHub authentication briefly failed during this pass, then recovered; the proof extension was pushed at `82a02c7`.

## Scope

This component proves the high square-completion algebra from explicit high-form properties and a weak inverse identity. It does not impose boundedness of the high form or of the full original logarithmic Weil operator on physical L2. The inverse T is the same bounded restricted inverse used by the existing completed-column and source-pairing interfaces.

For the actual total source R and completed high vector h, the weak identity is `B(T R,u) = inner(R,u)`. Subtraction in each argument and real symmetry suffice to prove

`Re B(h-T R,h-T R) + 2 Re inner(R,h-T R) = Re B(h,h) - Re inner(R,T R)`.

The finite contribution remains an explicitly realized Schur decomposition, not an assumed positivity result. Its low diagonal D and retained block actualRetained must separately dominate `nativeLow` and the certified V quadratic form.

## Six added declarations

[FormCompletion.lean](../../../../WeilDefect/RPB108/FormCompletion.lean), namespace `WeilDefect.RPB108`:

| Declaration | Role |
| --- | --- |
| `high_form_square_completion` | The exact high-form identity above, from subtraction, real symmetry and the weak inverse equation. |
| `completed_column_identity` | Identify the same physical vector as either a sum of completed columns plus h or native columns plus `h-T(total source)`. |
| `complex_mixed_cross_lower` | The signed real cross is bounded below by `-2 ||z|| ||w||`. |
| `energy_lower_of_form_blocks` | Raw block identity plus actual finite Schur decomposition, low/retained block lower bounds and high coercivity imply the mixed energy estimate. |

[DNE27FormCompletion.lean](../../../../WeilDefect/RPB108/DNE27FormCompletion.lean) adds `physical_gap_of_form_blocks` in each parity namespace. It proves the `4/10^36` physical gap for the supplied form Q on the exact completed vector. Both pairing-square bounds and the V coordinate-energy floor come from prior certificates; the mixed completion estimate comes from the new block lemmas.

No new definitions, numerical inputs, certificate generators or project axioms are added. Existing theorem statements remain unchanged.

## Exact remaining original-form obligations

The resulting parity theorem still requires:

- the original native/source vectors and their norm bounds, V/G and unsquared native row enclosures, and full source Gram realization;
- the actual high form B with subtraction and real symmetry on its correct domain, and the bounded restricted inverse T satisfying the weak inverse equation;
- the original form Q's raw native/source/high block identity at the displayed physical vector;
- the finite Schur decomposition with the **actual** inverse source covariance and mixed pairing, together with its low-diagonal and retained-block lower bounds;
- the original high coercivity estimate at h.

The final mixed energy inequality is derived, rather than passed as `hcompletion`. This closes the generic high-completion algebra and identifies the sharper block attachment boundary. It does not prove the original form identities, finite Schur bounds, high-domain/inverse realization or coercivity. In particular, replacing an aggregate inequality by explicit block identities does not certify those identities on the original Weil form.

Dependency path: weak high inverse + form algebra → high square completion; completed-column identity + raw Q block identity + finite Schur identity + separate block lower bounds → mixed energy lower bound; prior realized-source/native-row certificates → quantitative physical gap.

Full RPB-P03, the remaining 104-dimensional response sign, complete 1.06 positivity, continuation and RH remain open. H1 statuses and theorem statements remain unchanged.

## Validation and publication

Pinned Lean/mathlib 4.34.0 component and H1 target builds passed. Independent audits of all six added declarations use only `propext`, `Classical.choice`, and `Quot.sound`. No external numerical proof premise is introduced. [DNE27_FORM_COMPLETION_VERIFICATION.json](DNE27_FORM_COMPLETION_VERIFICATION.json) records source hashes, checks and the exact unproved original-form attachments. The proof extension is published on the draft PR branch and passed pinned remote CI.

The subsequent [actual Schur-bound component](DNE27_SCHUR_BOUNDS_PORT.md) derives the separate low and retained Schur lower bounds from native/source enclosures and the inverse norm. Original raw and finite block identities remain unproved.
