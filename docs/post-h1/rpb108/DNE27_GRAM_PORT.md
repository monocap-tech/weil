# Complete three-column source-Gram domination slice

Status: **LOCALLY KERNEL-CHECKED; REMOTE CI PENDING**. The preceding mixed-energy slice passed remote CI at `f818c791070226abc6862100a84a074af17e6319`.

## Exact data and scope

[generate_gram.py](numeric-inputs/generate_gram.py) authenticates the existing six-file manifest, then renders all lower/upper entries of the DNE22 prior `complete_coarse_matrix_intervals` and the even/odd `original_complete_source_Gram`. The matrix V here is the prior coarse retained-energy matrix; it is not substituted for the separate raw original-native Q Gram. Field names `nativeLower`/`nativeUpper` label those V enclosures.

Every coefficient of the scaled difference is enclosed by

`H_lower(i,j) = s_i*s_j*(rho*V_lower(i,j)-G_upper(i,j))`,
`H_upper(i,j) = s_i*s_j*(rho*V_upper(i,j)-G_lower(i,j))`.

The physical scales are exactly `s_i = scales(i.succ)` from the earlier four-column data. The generator proposes rational off-diagonal envelopes; Lean checks them against both endpoints for **all six** off-diagonal entries. It also checks the three row-margin equalities against the original DNE27 published margins, each strictly positive. Thus Python's proposed envelopes are not trusted premises.

## Generic proof inventory

[ThreeGram.lean](../../../../WeilDefect/RPB108/ThreeGram.lean) adds five lemmas:

- `bounded_cross_lower`: an absolute coefficient bound pays the worst signed cross term.
- `real_gram_lower`: diagonal lower bounds and all six cross bounds imply the exact row-margin lower quadratic form for every real coefficient vector.
- `complex_gram_lower`: extend that bound to every complex coefficient vector by splitting real and imaginary parts. No phase sampling is used.
- `positive_weighted_norm_sq`: strictly positive weights give a positive sum for every nonzero complex vector.
- `scaled_gram_difference`: identify the scaled matrix quadratic form exactly with rho times the coarse retained Gram minus the full source Gram, on the scaled coefficient vector.

The definitions `realGram`, `complexGram`, `rowMargins` and `offWeights` expose the exact finite quadratic forms and bounds. `complexGram A z` means `sum_i sum_j A(i,j)*Re(conj(z_i)*z_j)`. The bound does not require silently assigning symmetry to arbitrary enclosed matrices; it controls all ordered entries.

## Parity-specific inventory

[DNE27Gram.lean](../../../../WeilDefect/RPB108/DNE27Gram.lean) adds eight declarations in each of `DNE27Even` and `DNE27Odd`:

| Declaration | Role |
| --- | --- |
| `gram_scales_pos` | Each physical column scale is positive. |
| `rho_nonneg` | The exact contraction factor is nonnegative. |
| `rho_lt_one` | The exact contraction factor is strictly below one. |
| `off_bounds_nonneg` | The three off-diagonal envelopes are nonnegative. |
| `complete_off_certificate` | Both endpoints of all six off-diagonal intervals satisfy the envelopes. |
| `row_margin_certificate` | The three computed margins equal the published values and are strictly positive. |
| `source_gram_domination` | For any V/G satisfying the complete entry enclosures, the scaled difference dominates the published positive weighted norm-square sum, for every complex vector. |
| `strict_source_gram_domination` | For every nonzero complex vector and compatible V/G, `complexGram G (s*z) < rho*complexGram V (s*z)`. |

The numerical certificates use `norm_num` and finite case analysis. The two domination theorems are proved from those closed certificates and generic bounds. All 21 new declarations use only standard Lean axioms; there is no new axiom, admission or Python-result hypothesis.

## Remaining original-form boundary

This closes the full selected **three-column matrix arithmetic and universal coefficient-vector implication**. It does not establish that the original coarse retained form and complete physical projected sources actually realize the imported V/G enclosures. That assertion still requires the original source construction, form-domain and pairing proofs. It also does not extend the selected three-column frame to the uncovered 104 directions.

The original restricted high inverse, native/source enclosures, mixed-pairing estimate and raw energy attachment remain obligations before RPB-P03 is a theorem on the original form. The previous mixed-energy reduction and this matrix certificate now supply reusable checked reductions for that attachment. Complete positivity at 1.06, the 104-dimensional response sign, continuation and RH remain open.

## Validation

Run from the repository root:

```sh
python3 docs/post-h1/rpb108/numeric-inputs/generate_gram.py
lake build WeilDefect.RPB108
lake env lean WeilDefect/RPB108/DNE27Gram.lean
lake build WeilDefect.Examples.WeakCriticalFallthrough
```

The generator reproduces the exact checked source bytes. An isolated control set the even off-diagonal envelopes to zero; Lean rejected the corresponding certificates. The trusted module excludes that control. [DNE27_GRAM_VERIFICATION.json](DNE27_GRAM_VERIFICATION.json) records custody, local builds, axiom audits, rejection control and exact scope. CI already builds the RPB108 entry point.
