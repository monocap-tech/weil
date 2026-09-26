# Lean Status Ledger

This file records formal verification separately from mathematical standing and P4 audit status.

## Status labels

- **LEAN-NOT-ATTEMPTED** — not yet entered into the formalization queue.
- **LEAN-IN-PROGRESS** — a Lean declaration or infrastructure exists but has not yet passed the pinned CI build.
- **LEAN-CERTIFIED** — kernel-checked under the pinned toolchain with no project `sorry`, `admit`, or `axiom`.
- **LEAN-CERTIFIED-FROM-IMPORTED-PREMISE** — Lean verifies the downstream deduction from an explicit external premise, but not the external theorem itself.
- **LEAN-BLOCKED** — direct formalization is exhausted for the current pass and an exact missing formal dependency is recorded.
- **SCOPE-ONLY** — jurisdiction rule rather than a theorem.

## Current control state

- **Formalization track:** LEAN-H1 exhausted.
- **Active phase:** none.
- **Active Lean cursor:** none.
- **Next project cursor:** none; no post-Horizon cursor has been selected.
- **Public packaging:** complete; see [Public Package Audit](PUBLIC_PACKAGE_AUDIT.md).

This section is canonical for the live queue. The certificate sections below are an append-only evidence history and may describe what was still pending at an earlier checkpoint.

## Declaration map

| Stable ID | Lean declaration | Status |
| --- | --- | --- |
| WD-T39 | WeilDefect.FullNegativeSpace + WeilDefect.fullNegativeCoeff + WeilDefect.fullCoeff + WeilDefect.fullJValue + WeilDefect.wd_t39_p3_b1_anchored_mass + WeilDefect.wd_t39_p3_b2_full_coordinate_escape_weak_zero + WeilDefect.wd_t39_p3_b3_fixed_packet_custody + WeilDefect.normEscapeSubsequence + WeilDefect.wd_t39_p3_b4_norm_escape_of_unbounded + WeilDefect.BoundedBackgroundRegime + WeilDefect.wd_t39_p3_b4_bounded_background_dichotomy + WeilDefect.BackgroundCompactnessRegime + WeilDefect.wd_t39_p3_b4_background_compactness_trichotomy + WeilDefect.wd_t39_p3_b5_fixed_selected_ray_stability + WeilDefect.wd_t39_p3_b6_fixed_full_divisor_negative_weak_limit + WeilDefect.wd_t39_p3_b7_finite_shadow_separation + WeilDefect.NoncompactDefectMorphology + WeilDefect.wd_t39_noncompact_background_morphology | LEAN-CERTIFIED |
| WD-T38 | WeilDefect.wd_t38_p3_u1_fixed_packet_critical_dichotomy + WeilDefect.wd_t38_attained_neutral_selected_coordinate_nonzero + WeilDefect.rightLimitPrimePowers + WeilDefect.wd_t38_p3_u3_right_limit_prime_decomposition + WeilDefect.wd_t38_p3_u3_right_limit_prime_support_finite + WeilDefect.wd_t38_p3_u4_logarithmic_order_neutral_carrier + WeilDefect.wd_t38_p3_u5_no_free_positive_sobolev_control + WeilDefect.wd_t38_p3_u5_finite_prime_translations_no_smoothing + WeilDefect.wd_t38_p3_u6_global_cancellation_not_termwise + WeilDefect.neutralNegativeSynthesis + WeilDefect.neutralWeilOperator + WeilDefect.wd_t38_p3_u2_negative_adjoint_identity + WeilDefect.wd_t38_p3_u2_physical_neutral_null_mode + WeilDefect.NeutralNullExtensionInterface + WeilDefect.NeutralNullExtensionInterface.persistenceGoal + WeilDefect.wd_t38_p3_u7_neutral_null_extension_reduction + WeilDefect.NeutralArithmeticMorphology + WeilDefect.wd_t38_neutral_arithmetic_morphology + WeilDefect.NeutralDefectMorphology + WeilDefect.wd_t38_attained_unit_gain_neutral_morphology | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T37 | WeilDefect.wd_t37_selected_source_zero_moment_of_wd_t26 + WeilDefect.wd_t37_selected_source_nonzero_of_wd_t26 + WeilDefect.wd_t37_p3_n1_endpoint_ray + WeilDefect.wd_t37_p3_n2_normalized_representative_blowup + WeilDefect.wd_t37_p3_n3_normalized_full_negativity + WeilDefect.wd_t37_p3_n4_zero_moment_source_far_decay + WeilDefect.wd_t37_p3_n5_far_localization + WeilDefect.wd_t37_p3_n6_weighted_next_jet_morphology + WeilDefect.wd_t37_p3_n7_no_adaptive_scalar_bypass + WeilDefect.NegativeArithmeticMorphology + WeilDefect.NegativeDefectMorphology + WeilDefect.wd_t37_fixed_packet_persistent_negative_morphology | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T36 | WeilDefect.positiveSobolevFrequencyWeight + WeilDefect.logarithmicFourierWeight_isBigO_log + WeilDefect.logarithmicFourierWeight_isLittleO_positiveSobolev + WeilDefect.positiveSobolevFrequencyWeight_not_isBigO_logarithmic + WeilDefect.wd_t36_no_uniform_positive_sobolev_coercivity_of_witness + WeilDefect.wd_t36_no_positive_sobolev_bootstrap + WeilDefect.finitePrimeTrigCorrection + WeilDefect.finitePrimeTrigBound + WeilDefect.abs_finitePrimeTrigCorrection_le + WeilDefect.finitePrimeTrigCorrection_isBigO_logarithmic + WeilDefect.logarithmicPlusFinitePrimeCorrection_isBigO + WeilDefect.wd_t36_finite_prime_translations_add_no_smoothing | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T35 | WeilDefect.logarithmicFourierWeight + WeilDefect.one_le_logarithmicFourierWeight + WeilDefect.logarithmicFourierEnergy + WeilDefect.spectralMass + WeilDefect.shiftedCompactWeilForm + WeilDefect.wd_t35_shifted_form_logarithmic_order + WeilDefect.wd_t35_compact_weil_logarithmic_form_order | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T34 | WeilDefect.activePrimePowers + WeilDefect.wd_t34_active_prime_powers_finite + WeilDefect.activePrimePowerFinset + WeilDefect.activePrimeTranslationShifts + WeilDefect.wd_t34_active_prime_translation_shifts_finite + WeilDefect.translateBy + WeilDefect.symmetricPrimeTranslation + WeilDefect.compactPrimeTranslationSum + WeilDefect.wd_t34_finite_prime_power_translations + WeilDefect.primePowerThreshold + WeilDefect.primePowerThreshold_subsingleton | LEAN-CERTIFIED |
| WD-T32 | WeilDefect.completedResponseLift + WeilDefect.iteratedDeriv_centered_power + WeilDefect.iteratedDeriv_centered_power_mul + WeilDefect.wd_t32_complementary_next_jet_identity + WeilDefect.nearComplementaryResponse + WeilDefect.weightedNearNextJetField + WeilDefect.wd_t32_weighted_near_next_jet_representation | LEAN-CERTIFIED |
| WD-T31 | WeilDefect.ZetaLogShellCountData + WeilDefect.FarShellResponseData + WeilDefect.logarithmicTail_tsum_le + WeilDefect.farShellResponse_norm_le_logarithmic_kernel + WeilDefect.wd_t31_shell_aggregation + WeilDefect.rationalResponse_zero_moment_norm_le_inverse_square + WeilDefect.farShellResponseData_of_zero_moment + WeilDefect.wd_t31_zero_moment_zero_count_far_tail | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T29 | WeilDefect.wd_t29_finite_head_approximation + WeilDefect.wd_t29_quantitative_finite_head_approximation | LEAN-CERTIFIED |
| WD-T28 | WeilDefect.ZetaZeroShellCountData + WeilDefect.NativeProblemOneResolventData + WeilDefect.NativeHilbertSchmidtCriterion + WeilDefect.NativeTraceClassCovarianceCriterion + WeilDefect.wd_t28_native_problem_one_hilbert_schmidt_actual + WeilDefect.problemOneGreenPairing_eq_dirichletEnergy + WeilDefect.problemOneColumnEnergySq_eq_dirichletEnergy + WeilDefect.wd_t28_actual_dirichlet_energy_summable | LEAN-CERTIFIED |
| WD-T27 | WeilDefect.rationalResponse + WeilDefect.residueFirstMoment + WeilDefect.rationalResponse_laurent_two + WeilDefect.rationalResponse_zero_moment_remainder_bound + WeilDefect.rationalResponse_zero_moment_remainder_isBigO + WeilDefect.rationalResponse_zero_moment_isBigO + WeilDefect.wd_t27_universal_inverse_square_far_decay + WeilDefect.wd_t27_universal_inverse_square_isBigO | LEAN-CERTIFIED |
| WD-T26 | WeilDefect.rawResiduesOfNegativePairs + WeilDefect.wd_t26_zero_moment + WeilDefect.wd_t26_coefficient_mem_rawResidues + WeilDefect.wd_t26_nonzero_raw_residue_of_nonzero_coefficient + WeilDefect.wd_t26_selected_zero_moment_residue | LEAN-CERTIFIED |
| WD-T25 | WeilDefect.problemOneDenominator + WeilDefect.problemOneL + WeilDefect.problemOneMode + WeilDefect.problemOneL_problemOneMode + WeilDefect.wd_t25_finite_problem_one_relation_trivial + WeilDefect.wd_t25_no_exact_finite_positive_compensation | LEAN-CERTIFIED |
| WD-T24 | WeilDefect.realExpMode + WeilDefect.realExpMode_ne_zero + WeilDefect.hasDerivAt_realExpMode + WeilDefect.iteratedDeriv_realExpMode + WeilDefect.iteratedDeriv_finite_exp_sum + WeilDefect.wd_t24_finite_distinct_frequency_exponential_independence | LEAN-CERTIFIED |
| WD-T23 | WeilDefect.BombieriMultiplicityNullData + WeilDefect.wd_t23_same_frequency_synthesis_factor + WeilDefect.wd_t23_same_frequency_zero_sum_null + WeilDefect.wd_t23_total_multiplicity_nullity + WeilDefect.wd_t23_single_ordinate_nullity + WeilDefect.wd_t23_single_ordinate_has_null_iff_repeated + WeilDefect.wd_t23_distinct_frequency_reduction | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T22 | WeilDefect.BombieriFiniteInertiaData + WeilDefect.wd_t22_finite_weil_inertia_saturation + WeilDefect.SimpleQuartetPacketNegative + WeilDefect.wd_t22_simple_quartet_packet_pair_count + WeilDefect.wd_t22_simple_quartet_packet_inertia + WeilDefect.wd_t22_two_simple_quartet_negative_index | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T21 | WeilDefect.quartetPairPos + WeilDefect.quartetPairNeg + WeilDefect.wd_t21_quartet_pair_pos_conjugate + WeilDefect.wd_t21_quartet_pair_neg_conjugate + WeilDefect.wd_t21_quartet_pairs_nonreal + WeilDefect.wd_t21_quartet_pairs_distinct + WeilDefect.wd_t21_simple_quartet_negative_count + WeilDefect.wd_t21_simple_quartet_pair_geometry | LEAN-CERTIFIED |
| WD-T20 | WeilDefect.wd_t20_pair_pos_eigen + WeilDefect.wd_t20_pair_neg_eigen + WeilDefect.pairEigenEquiv + WeilDefect.wd_t20_pair_diagonalization | LEAN-CERTIFIED |
| WD-T19 | WeilDefect.WDT19.analysisSpace + WeilDefect.WDT19.weak_limit_mem_physical_rightLimit + WeilDefect.WDT19.wd_t19_endpoint_representative_blowup + WeilDefect.WDT19.BoundaryAmplifies + WeilDefect.WDT19.wd_t19_boundary_amplification + WeilDefect.WDT19.wd_t19_vanishing_amplitude_normalized_blowup | LEAN-CERTIFIED |
| WD-T18 | WeilDefect.WDT18.endpointInside + WeilDefect.WDT18.endpointQuotientMap + WeilDefect.WDT18.wd_t18_endpoint_quotient_map_injective + WeilDefect.WDT18.wd_t18_endpoint_jump_negative_rank_le_quotient + WeilDefect.WDT18.wd_t18_one_dimensional_jump_rank_cap | LEAN-CERTIFIED |
| WD-T17 | WeilDefect.WDT17.weaklyTendsto_strong_of_norm_sq_tendsto + WeilDefect.WDT17.wd_t17_critical_positive_mass_le_half + WeilDefect.WDT17.wd_t17_fixed_sector_critical_dichotomy + WeilDefect.WDT17.wd_t17_neutral_branch + WeilDefect.WDT17.wd_t17_loss_branch | LEAN-CERTIFIED |
| WD-T16 | WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le + WeilDefect.WDT16.wd_t16_fixed_negative_sector_compactness + WeilDefect.WDT16.wd_t16_nonpositive_limit_persists + WeilDefect.WDT16.wd_t16_uniform_negative_margin_persists + WeilDefect.WDT16.wd_t16_uniform_negative_margin_forces_endpoint_jump + WeilDefect.WDT16.wd_t16_fixed_finite_negative_sector_persistence | LEAN-CERTIFIED |
| WD-T15 | WeilDefect.WDT15.wd_t15_gap_antitone + WeilDefect.WDT15.wd_t15_right_limit_gap_duality + WeilDefect.WDT15.wd_t15_sequence_right_limit_eq + WeilDefect.WDT15.wd_t15_sequence_gap_eq_right_limit_orthogonal + WeilDefect.WDT15.wd_t15_monotone_projection_limit + WeilDefect.WDT15.wd_t15_right_limit_projection_and_gap_duality | LEAN-CERTIFIED |
| WD-T14 | WeilDefect.WDT14.wd_t14_positive_shadow_margin + WeilDefect.WDT14.wd_t14_positive_shadow_preserves_negative_margin + WeilDefect.WDT14.wd_t14_graph_shadow_admissible_iff + WeilDefect.WDT14.wd_t14_graph_admissibility_failure_example + WeilDefect.WDT14.wd_t14_finite_positive_shadows_preserve_signature_not_admissibility | LEAN-CERTIFIED |
| WD-T13 | WeilDefect.WDT13.wd_t13_complement_isUnit + WeilDefect.WDT13.wd_t13_complement_inverse_nonnegative + WeilDefect.WDT13.wd_t13_schur_correction_positive + WeilDefect.WDT13.wd_t13_schur_le_compression + WeilDefect.WDT13.wd_t13_schur_lower_bound + WeilDefect.WDT13.wd_t13_schur_isUnit + WeilDefect.WDT13.wd_t13_block_solution_exists + WeilDefect.WDT13.wd_t13_block_solution_first_component + WeilDefect.WDT13.wd_t13_direct_compression_versus_shorted_covariance | LEAN-CERTIFIED |
| WD-T12 | WeilDefect.WDT12.sequentialResidualBudget + WeilDefect.WDT12.wd_t12_sequential_budget_covariance + WeilDefect.WDT12.wd_t12_second_background_elimination + WeilDefect.WDT12.wd_t12_sequential_background_consumption | LEAN-CERTIFIED |
| WD-T11 | WeilDefect.WDT11.wd_t11_norm_one_attains_neutral + WeilDefect.WDT11.wd_t11_graphQ_diagonal + WeilDefect.WDT11.wd_t11_negative_rank_le_count + WeilDefect.WDT11.wd_t11_negative_space_strict + WeilDefect.WDT11.wd_t11_negative_space_finrank + WeilDefect.WDT11.wd_t11_negative_index_exact + WeilDefect.WDT11.wd_t11_neutral_space_finrank + WeilDefect.WDT11.wd_t11_neutral_space_graphQ_zero + WeilDefect.WDT11.wd_t11_finite_sector_singular_value_inertia | LEAN-CERTIFIED |
| WD-T10 | WeilDefect.WDT10.wd_t10_residual_budget_positive + WeilDefect.WDT10.wd_t10_residual_sqrt_sq + WeilDefect.WDT10.wd_t10_effective_covariance + WeilDefect.WDT10.wd_t10_background_covariance_elimination + WeilDefect.WDT10.wd_t10_full_defect_reduction + WeilDefect.WDT10.wd_t10_full_nonnegative_iff_effective_physical + WeilDefect.WDT10.wd_t10_full_nonnegative_iff_residual_screening + WeilDefect.WDT10.wd_t10_background_elimination_and_residual_budget | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T09 | WeilDefect.WDT09.wd_t09_full_quadratic_factorization + WeilDefect.WDT09.wd_t09_shared_defect_factorization + WeilDefect.WDT09.wd_t09_full_nonnegative_iff_joint_budget + WeilDefect.WDT09.wd_t09_separate_contractions_not_joint + WeilDefect.WDT09.wd_t09_shared_screening_budget | LEAN-CERTIFIED |
| WD-T08 | WeilDefect.WDT08.selected_adjoint_comp_injective + WeilDefect.WDT08.wd_t08_selected_negative_rank_le_finrank + WeilDefect.WDT08.wd_t08_background_null_finrank_lower + WeilDefect.WDT08.wd_t08_selected_negative_on_background_null + WeilDefect.WDT08.wd_t08_full_negative_rank_background_reduction + WeilDefect.WDT08.wd_t08_finite_selected_sector_index_cap | LEAN-CERTIFIED |
| WD-T07 | WeilDefect.wd_t07_selected_full_identity + WeilDefect.wd_t07_selected_negative_implies_full + WeilDefect.WDT07.wd_t07_full_le_selected + WeilDefect.WDT07.wd_t07_negative_rank_custody + WeilDefect.WDT07.wd_t07_full_negative_without_selected_negative + WeilDefect.WDT07.wd_t07_selected_background_monotonicity_and_custody | LEAN-CERTIFIED |
| WD-T06 | WeilDefect.WDT06.wd_t06_truncated_inner_identity + WeilDefect.WDT06.wd_t06_quadratic_mono + WeilDefect.WDT06.wd_t06_defect_mono + WeilDefect.WDT06.wd_t06_defect_le_full + WeilDefect.WDT06.wd_t06_defect_strong_tendsto + WeilDefect.WDT06.wd_t06_quadratic_tendsto + WeilDefect.WDT06.wd_t06_negative_rank_antitone + WeilDefect.WDT06.wd_t06_monotone_positive_screening | LEAN-CERTIFIED |
| WD-T05 | WeilDefect.wd_t05_rank_one_covariance + WeilDefect.WDT05.wd_t05_defect_rank_one + WeilDefect.WDT05.wd_t05_signed_factor_iff_vector + WeilDefect.WDT05.wd_t05_covariance_iff_unit_vector + WeilDefect.WDT05.wd_t05_physical_nonnegative_iff_unit_vector + WeilDefect.WDT05.wd_t05_analysis_nonnegative_iff_unit_vector + WeilDefect.WDT05.wd_t05_rank_one_specialization | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T04 | WeilDefect.WDT04.wd_t04_range_defect_no_exact_screening + WeilDefect.WDT04.wd_t04_range_defect_negative + WeilDefect.WDT04.wd_t04_over_budget_negative + WeilDefect.WDT04.wd_t04_strict_screened_lower_bound + WeilDefect.WDT04.wd_t04_attained_critical_neutral + WeilDefect.WDT04.wd_t04_nonattained_critical_positive + WeilDefect.WDT04.wd_t04_critical_approximate_neutral + WeilDefect.WDT04.wd_t04_complete_reduced_taxonomy | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T03 | WeilDefect.WDT03.wd_t03_kernel_decomposition + WeilDefect.WDT03.wd_t03_analysis_graph_iff + WeilDefect.WDT03.wd_t03_graph_signature + WeilDefect.WDT03.wd_t03_defect_factorization | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T02 | WeilDefect.WDT02.wd_t02_contractive_screening_equivalence + WeilDefect.WDT02.wd_t02_unique_reduced_solution | LEAN-CERTIFIED-FROM-IMPORTED-PREMISE |
| WD-T01 | WeilDefect.WDT01.wd_t01_defect_inner_identity + WeilDefect.WDT01.wd_t01_nonnegative_iff + WeilDefect.WDT01.wd_t01_negative_rank_iff | LEAN-CERTIFIED |
| WD-T33 | WeilDefect.wd_t33_adaptive_cocancellation | LEAN-CERTIFIED |
| WD-T30 | WeilDefect.wd_t30_two_mode_kernel_combination + WeilDefect.wd_t30_zero_functional_preserves_every_mode | LEAN-CERTIFIED |
| WD-X01 | WeilDefect.wd_x01_partial_sum + WeilDefect.wd_x01_finite_defect_negative + WeilDefect.wd_x01_finite_defect_formula + WeilDefect.wd_x01_defect_tendsto_zero | LEAN-CERTIFIED |
| WD-X02 | WeilDefect.wdX02Weight + WeilDefect.wdX02Coord + WeilDefect.wdX02Operator + WeilDefect.wd_x02_operator_norm_eq_one + WeilDefect.wd_x02_strict_norm_loss + WeilDefect.wd_x02_no_nonzero_norm_attainer + WeilDefect.wd_x02_critical_nonattainment | LEAN-CERTIFIED |
| WD-X03 | `WeilDefect.wd_x03_individual_not_compositional` | LEAN-CERTIFIED |
| WD-X04 | `WeilDefect.wd_x04_shorted_covariance_identity` | LEAN-CERTIFIED |
| WD-X05 | WeilDefect.wdX05Delta + WeilDefect.wdX05PosAmp + WeilDefect.wdX05NegAmp + WeilDefect.wdX05Pos + WeilDefect.wdX05Neg + WeilDefect.wdX05Vector + WeilDefect.wd_x05_vector_norm_eq_one + WeilDefect.wd_x05_jvalue_formula + WeilDefect.wd_x05_jvalue_negative + WeilDefect.wd_x05_jvalue_tendsto_zero + WeilDefect.wdX05Tail + WeilDefect.wd_x05_tail_antitone + WeilDefect.wd_x05_vector_mem_tail + WeilDefect.wd_x05_tail_intersection_trivial + WeilDefect.wd_x05_moving_sectors_lose_persistent_ray | LEAN-CERTIFIED |
| WD-X06 | WeilDefect.wdX06Amp + WeilDefect.wdX06Pos + WeilDefect.wdX06Neg + WeilDefect.wdX06Vector + WeilDefect.wdX06Limit + WeilDefect.wd_x06_vector_norm_eq_one + WeilDefect.wd_x06_vector_critical + WeilDefect.wd_x06_lp_coordinate_tendsto_zero + WeilDefect.wd_x06_positive_weakly_tendsto_zero + WeilDefect.wd_x06_vector_weakly_tendsto_limit + WeilDefect.wd_x06_limit_jvalue + WeilDefect.wd_x06_positive_mass_loss_fallthrough | LEAN-CERTIFIED |
| WD-X07 | WeilDefect.wd_x07_response_identity + WeilDefect.wd_x07_real_response_formula + WeilDefect.wd_x07_scaled_response_tendsto_neg_one | LEAN-CERTIFIED |

A `LEAN-IN-PROGRESS` entry becomes `LEAN-CERTIFIED` only after the pinned CI build succeeds. `LEAN-CERTIFIED` entries in the table already have certificate evidence recorded below.

## Current formalization cursor

```math
\boxed{
\texttt{LEAN-H1 EXHAUSTED / H1-P5 COMPLETE / POST-H1 CURSOR NOT SELECTED}
}
```

No further Lean or public-package cursor is active. The certificate sections below remain append-only history.


## WD-X02 earlier failed attempt

Before certification, the implementation in `WeilDefect/Examples/CriticalNonattainment.lean` had a failed dedicated run at commit `76fde3da2385c8f43bb9ac00c04dfcbec686f00a` (GitHub Actions run `36193331699`). This is retained as historical evidence only. A later successful certificate run promoted WD-X02 to `LEAN-CERTIFIED`; see the WD-X02 certificate section below.

## First certificate evidence

The first stable-ID certifications were built at Lean commit:

```math
\boxed{
\texttt{c125114e2dd39fa3907f8690ca39d9c899468caf}.
}
```

GitHub Actions run:

```math
\boxed{
\texttt{35949414095}.
}
```

The run completed successfully with all of:

- pinned dependency resolution;
- mathlib cache fetch;
- Lake build;
- unfinished/project-axiom rejection.

Thus WD-X03 and WD-X04 satisfy the repository's LEAN-CERTIFIED rule.

At this early checkpoint, WD-T26 and WD-X07 still remained LEAN-IN-PROGRESS because their declarations covered only algebraic cores. Both were promoted by later certificate runs recorded below.

## Historical phase cursor

```math
\boxed{
\texttt{LEAN-H1-P1 / ALGEBRAIC AND FINITE-DIMENSIONAL CORE}.
}
```

This records the earlier phase checkpoint and is not the active cursor.


## WD-X01 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-X01: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_x01_weight_sq_telescope;
- WeilDefect.wd_x01_partial_sum;
- WeilDefect.wd_x01_finite_defect_negative;
- WeilDefect.wd_x01_finite_defect_formula;
- WeilDefect.wd_x01_defect_tendsto_zero.

The dedicated theorem CI checked only:

```math
\texttt{WeilDefect/Examples/SpectralScreening.lean}.
```

Certificate run:

```math
\boxed{
\texttt{35952789867}
}
```

at repository head:

```math
\boxed{
\texttt{6ef0dffba1a8732d554b15ee906c64fe60bc63c7}.
}
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- Lean compilation of the WD-X01 target;
- repository unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-X07 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-X07: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_x07_response_identity;
- WeilDefect.wd_x07_real_response_formula;
- WeilDefect.wd_x07_scaled_response_tendsto_neg_one.

The certificate proves the exact two-point rational identity and an explicit
sharpness witness with nonzero inverse-square leading coefficient.

The current theorem file blob

```math
\texttt{83196783b21e40eee21ca74c12b3b8094c2af391}
```

is identical to the blob checked successfully by GitHub Actions run

```math
\boxed{
\texttt{35951096357}.
}
```

That run checked repository commit

```math
\texttt{e9f158d3c8fb5b85494d08931d62cddfc8d4a534}
```

under the pinned Lean 4.34.0 / mathlib v4.34.0 environment and passed the
unfinished-proof/project-axiom gate.

A later dedicated WD-X07 rerun was also launched for redundant single-target
confirmation; certification does not depend on it because the exact current
Lean source blob is already kernel-checked.

No other stable theorem ID is promoted by this certificate.


## WD-T30 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T30: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_t30_two_mode_selected_preserving;
- WeilDefect.wd_t30_both_zero_selected_preserving;
- WeilDefect.wd_t30_two_mode_kernel_combination;
- WeilDefect.wd_t30_zero_functional_preserves_every_mode.

The stable theorem is represented at the functional level:

given a complex-linear selected-response functional $C$ and two multiplier
modes $\psi_1,\psi_2$ whose selected responses are not both zero, Lean
constructs a nontrivial coefficient pair $(\beta_1,\beta_2)$ with

```math
C(\beta_1\psi_1+\beta_2\psi_2)=0.
```

The identically-zero functional branch is also formalized: every mode is
selected-preserving.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Arithmetic.Scalarization}
```

through Lake.

Certificate run:

```math
\boxed{
\texttt{35953990661}
}
```

at repository head:

```math
\boxed{
\texttt{6836f64a22544a2bd51daeb97d97bf824d339def}.
}
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T33 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T33: LEAN-CERTIFIED}.
}
```

Formal declaration:

- WeilDefect.wd_t33_adaptive_cocancellation.

The certificate formalizes the exact cutoffwise algebraic implication:

```math
N+F=P+A,
\qquad
N=A
\quad\Longrightarrow\quad
P=F.
```

This is the complete algebraic content of the audited WD-T33 co-adaptation theorem.
The analytic interpretation of $N,F,P,A$ belongs to the surrounding explicit-formula
setup and is not assumed by the Lean proof.

The current theorem file blob

```math
\texttt{d01f92d725b9ad412130424b74bea9efadcda1e1}
```

is identical to the blob included in successful full-library GitHub Actions run

```math
\boxed{
\texttt{35951096357}.
}
```

That run checked commit

```math
\texttt{e9f158d3c8fb5b85494d08931d62cddfc8d4a534}
```

with:

- pinned dependency resolution;
- mathlib cache retrieval;
- full Lake build;
- unfinished-proof/project-axiom rejection.

A later dedicated WD-T33-only CI run was also launched; certification does not depend
on it because the exact current source blob was already kernel-checked in the successful
full-library run.

No other stable theorem ID is promoted by this certificate.


## WD-T01 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T01: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.WDT01.wd_t01_coeff_identity;
- WeilDefect.WDT01.wd_t01_defect_inner_identity;
- WeilDefect.WDT01.wd_t01_nonnegative_iff;
- WeilDefect.WDT01.negativeWitness_injective_of_zero;
- WeilDefect.WDT01.wd_t01_physical_to_analysis_rank;
- WeilDefect.WDT01.wd_t01_analysis_to_physical_rank;
- WeilDefect.WDT01.wd_t01_negative_rank_iff.

The formal negative-index statement is encoded dimension-by-dimension.

For each $n$, Lean proves equivalence between:

1. an $n$-direction negative witness in the physical carrier; and
2. an $n$-direction negative witness in the closed analysis carrier.

The bridge theorem proves such a unit-sphere negative witness is injective whenever
the quadratic form vanishes at zero. Therefore these witnesses are genuine
$n$-dimensional negative directions, and equality for every finite $n$ is the
formal finite-rank-spectrum version of equality of the supremum negative indices.

The certificate also proves:

```math
[E^*h,E^*h]_J
=
\langle Dh,h\rangle,
```

in the project coefficient/operator encoding, and

```math
\mathcal A\text{ nonnegative}
\iff
D\text{ nonnegative}.
```

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.DefectIndex}.
```

Certificate run:

```math
\boxed{
\texttt{35959085940}
}
```

at repository head:

```math
\boxed{
\texttt{79218489b0a3cdeacc5ed7abe44565ee45fffca5}.
}
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T02 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T02: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations:

- WeilDefect.WDT02.physicalNonnegative_iff_covarianceLe;
- WeilDefect.WDT02.covarianceLe_iff_signed_contractive_factorization;
- WeilDefect.WDT02.reduced_neg_iff;
- WeilDefect.WDT02.signed_reduced_exists_unique;
- WeilDefect.WDT02.wd_t02_contractive_screening_equivalence;
- WeilDefect.WDT02.wd_t02_unique_reduced_solution.

The imported theorem is represented explicitly by the proposition-valued structure

```math
\texttt{WeilDefect.WDT02.DouglasUnitData}.
```

It supplies exactly the Douglas unit-majorization input:

- covariance majorization iff contractive factorization;
- existence and uniqueness of the reduced exact factor.

It is passed as a theorem premise. It is not declared as a project axiom.

Lean then verifies the full Horizon-1 convention transfer:

```math
\mathcal A\text{ nonnegative}
\iff
D\succeq0
\iff
S_-S_-^*\preceq S_+S_+^*
\iff
\exists X,\ \|X\|\le1,\ S_-=-S_+X,
```

where covariance order is encoded by its quadratic-form inequality.

Lean also verifies that the Douglas reduced solution transfers through the
project sign convention and is unique among exact signed solutions whose range
is orthogonal to $\ker S_+$.

The Douglas source theorem itself has not been reconstructed in Lean.
Accordingly this theorem must not be reported as a native LEAN-CERTIFIED result.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.Douglas}.
```

Certificate run:

```math
\boxed{
\texttt{35960549233}
}
```

at repository head:

```math
\boxed{
\texttt{5dca4d98b7062e3676399b34dfc89b383bfe1662}.
}
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T03 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T03: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.WDT03.signed_reduced_of_range;
- WeilDefect.WDT03.wd_t03_kernel_decomposition;
- WeilDefect.WDT03.wd_t03_analysis_graph_iff;
- WeilDefect.WDT03.wd_t03_graph_signature;
- WeilDefect.WDT03.wd_t03_defect_factorization;
- WeilDefect.WDT03.wd_t03_reduced_graph_normal_form.

The imported theorem is isolated in the explicit proposition-valued interface
WeilDefect.WDT03.DouglasRangeData. It supplies only the Douglas
range-inclusion step giving the unique reduced exact factor.

Once the reduced signed solution X is supplied, Lean verifies internally the
orthogonal kernel decomposition, graph characterization, graph signature
identity, and defect factorization.

The coefficient direct-sum inner form is represented explicitly as

```math
\langle(a,v),(x,u)\rangle_\oplus
=
\langle a,x\rangle+\langle v,u\rangle,
```

so the formalization does not confuse Lean's ordinary product Banach norm with
the Hilbert direct-sum norm.

Dedicated theorem CI built WeilDefect.Screening.GraphNormalForm.

Certificate run:

```math
\boxed{\texttt{35962199281}}
```

at repository head:

```math
\boxed{\texttt{570dcb25de1e728bb2b135363e0b0d1ae735b5e5}}.
```

The run passed the single-module Lake build and unfinished-proof/project-axiom
gate. The Douglas source theorem itself remains unformalized.

No other stable theorem ID is promoted by this run.


## WD-T04 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T04: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations:

- WeilDefect.WDT04.wd_t04_range_defect_no_exact_screening;
- WeilDefect.WDT04.wd_t04_range_defect_negative;
- WeilDefect.WDT04.wd_t04_over_budget_negative;
- WeilDefect.WDT04.wd_t04_strict_screened_lower_bound;
- WeilDefect.WDT04.wd_t04_attained_critical_neutral;
- WeilDefect.WDT04.wd_t04_nonattained_critical_positive;
- WeilDefect.WDT04.wd_t04_critical_approximate_neutral;
- WeilDefect.WDT04.wd_t04_complete_reduced_taxonomy.

The certificate formalizes the five-way abstract screening morphology:
range defect, over-budget negative defect, strict positive screening, attained
critical neutrality, and non-attained approximate neutrality.

The range-defect negative-direction implication consumes the explicit
WeilDefect.WDT02.DouglasUnitData theorem premise.  Douglas is not introduced as
a project axiom and is not reconstructed by this certificate.  The
over-budget, strict-screening, attained-critical, and non-attained-critical
branches are checked internally once the reduced factor is given.

In particular, the non-attained critical branch does not assume operator-norm
attainment.  Lean derives arbitrarily small graph defect from the definition of
the operator norm while proving every nonzero graph vector remains strictly
positive when no nonzero adjoint vector attains norm one.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.Taxonomy}.
```

Certificate run:

```math
\boxed{\texttt{35965367830}}
```

at repository head:

```math
\boxed{\texttt{fe4ab88bbed7e5a6b1091587569ccb7713522960}}.
```

The certified theorem source blob is:

```math
\texttt{f86f72692fb4465827e4ec9f374a5a3c64f3d22a}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T05 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T05: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations:

- WeilDefect.wd_t05_rank_one_covariance;
- WeilDefect.wd_t05_rank_one_covariance_apply;
- WeilDefect.WDT05.rankOneNegative;
- WeilDefect.WDT05.wd_t05_defect_rank_one;
- WeilDefect.WDT05.wd_t05_signed_factor_iff_vector;
- WeilDefect.WDT05.wd_t05_covariance_iff_unit_vector;
- WeilDefect.WDT05.wd_t05_physical_nonnegative_iff_unit_vector;
- WeilDefect.WDT05.wd_t05_analysis_nonnegative_iff_unit_vector;
- WeilDefect.WDT05.wd_t05_rank_one_specialization.

Lean verifies natively that the one-dimensional synthesis map
$\alpha\mapsto\alpha g$ has covariance $g\otimes g$, hence

```math
D=S_+S_+^*-g\otimes g.
```

It also verifies internally that a signed contractive map
$X:\mathbb C\to K_+$ is equivalent to a single coefficient vector
$c=X(1)$ with $\|c\|\le1$, and reconstructs the converse factor from
$c$ by $\operatorname{toSpanSingleton}(c)$.

The covariance-majorization/positivity-to-factorization step is supplied by
the explicit proposition-valued Douglas premise

```math
\texttt{WeilDefect.WDT02.DouglasUnitData}.
```

Therefore the complete stable theorem is reported as
LEAN-CERTIFIED-FROM-IMPORTED-PREMISE rather than native LEAN-CERTIFIED.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.RankOne}.
```

Certificate run:

```math
\boxed{\texttt{35966956166}}
```

at repository head:

```math
\boxed{\texttt{ef3853ef4a3892662fa59761685dfe68b1f82844}}.
```

The certified theorem source blob is:

```math
\texttt{2c37aaf3546b49cbab8be2c58ee954fd6989a965}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T06 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T06: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT06.ProjectionChainData;
- WeilDefect.WDT06.projection_inner_self;
- WeilDefect.WDT06.projection_norm_mono;
- WeilDefect.WDT06.wd_t06_truncated_inner_identity;
- WeilDefect.WDT06.wd_t06_quadratic_mono;
- WeilDefect.WDT06.wd_t06_quadratic_le_full;
- WeilDefect.WDT06.wd_t06_defect_mono;
- WeilDefect.WDT06.wd_t06_defect_le_full;
- WeilDefect.WDT06.wd_t06_defect_strong_tendsto;
- WeilDefect.WDT06.wd_t06_quadratic_tendsto;
- WeilDefect.WDT06.wd_t06_negative_rank_antitone;
- WeilDefect.WDT06.wd_t06_monotone_positive_screening.

The projection-chain interface records exactly the operator properties consumed by
the proof: self-adjointness, idempotence, nesting, contractivity, and strong
convergence to the identity.

Lean then verifies internally that

```math
D_N=S_+P_NS_+^*-S_-S_-^*
```

has quadratic form

```math
\|P_NS_+^*h\|^2-\|S_-^*h\|^2,
```

that the projected positive norms are nondecreasing under the nested
contractive projections, and hence

```math
D_N\preceq D_{N+1}\preceq D.
```

It also proves strong pointwise operator convergence

```math
D_Nh\to Dh,
```

and pointwise convergence of the corresponding quadratic forms.

Negative-index monotonicity is certified in the same dimension-by-dimension
form used by WD-T01: every $k$-dimensional negative witness for
$D_{N+1}$ is already a $k$-dimensional negative witness for $D_N$.
Thus the attainable finite negative-rank spectrum is nonincreasing under
positive-channel restoration.

No imported theorem premise is used by WD-T06.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.MonotoneScreening}.
```

Certificate run:

```math
\boxed{\texttt{35967932548}}
```

at repository head:

```math
\boxed{\texttt{6024cce8bf4f152ca21a545b93cb467e7cdadb31}}.
```

The certified theorem source blob is:

```math
\texttt{b4424d28e14466275f593e58683170d9e952b134}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T07 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T07: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_t07_selected_full_identity;
- WeilDefect.wd_t07_selected_negative_implies_full;
- WeilDefect.WDT07.wd_t07_full_le_selected;
- WeilDefect.WDT07.wd_t07_negative_rank_custody;
- WeilDefect.WDT07.wd_t07_converse_failure;
- WeilDefect.WDT07.wd_t07_full_negative_without_selected_negative;
- WeilDefect.WDT07.wd_t07_selected_background_monotonicity_and_custody.

Lean verifies the exact quadratic identity

```math
q_{\rm full}(h)
=
q_M(h)-\|S_B^*h\|^2,
```

and therefore the pointwise form order

```math
q_{\rm full}(h)\le q_M(h).
```

It certifies the negative-index custody statement in finite-rank-spectrum form:
for every $k$, any $k$-dimensional negative witness for the selected
quadratic form remains a $k$-dimensional negative witness for the full
quadratic form after arbitrary negative-background aggregation.

The converse is disproved internally by an explicit one-dimensional complex
example: selected positive and negative synthesis maps are zero while the
background synthesis is the identity.  At $h=1$, the selected quadratic
value is zero but the full quadratic value is strictly negative.  Thus full
aggregate negativity does not identify the selected sector as the owner of the
defect.

No imported theorem premise is used by WD-T07.

The first dedicated attempt exposed only a simplifier gap for the adjoint of
the identity map; this was repaired explicitly using mathlib's
`ContinuousLinearMap.adjoint_id`.  No theorem statement changed.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.BackgroundCustody}.
```

Certificate run:

```math
\boxed{\texttt{35968741697}}
```

at repository head:

```math
\boxed{\texttt{48f20dfa63e5b36bd5786a0fc9fe23db9e63e21a}}.
```

The certified theorem source blob is:

```math
\texttt{8a0acaef36c3c10df5f0ec6d7a692db1b420f32a}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T08 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T08: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.WDT08.selected_adjoint_comp_injective;
- WeilDefect.WDT08.wd_t08_selected_negative_rank_le_finrank;
- WeilDefect.WDT08.backgroundNullCoords;
- WeilDefect.WDT08.wd_t08_background_null_finrank_lower;
- WeilDefect.WDT08.wd_t08_selected_negative_on_background_null;
- WeilDefect.WDT08.wd_t08_full_negative_rank_background_reduction;
- WeilDefect.WDT08.wd_t08_finite_selected_sector_index_cap.

For the selected sector, Lean proves that any k-dimensional negative witness
forces the composed adjoint map

```math
S_M^*\circ T : \mathbb C^k \to M
```

to be injective.  Finite-dimensional rank comparison therefore gives

```math
k\le \dim M.
```

This is the finite-rank-spectrum form of

```math
\operatorname{ind}_{-}(D_M)\le \dim M.
```

For the background correction, given any k-dimensional full negative witness
T, Lean forms the canonical coordinate kernel

```math
\ker(S_B^*\circ T).
```

Rank-nullity and the finite-dimensional range bound give

```math
k-\dim B
\le
\dim\ker(S_B^*\circ T).
```

On this kernel the background term vanishes identically, so the full and
selected quadratic forms agree, and Lean proves the selected form is strictly
negative on the unit sphere of that kernel.  This is exactly the
finite-dimensional kernel-slice argument underlying

```math
\operatorname{ind}_{-}(D_{\rm full})
\le
\operatorname{ind}_{-}(D_M)+\dim B.
```

The stable theorem is therefore certified in the same finite-negative-rank /
negative-subspace encoding used by the earlier index certificates.

No imported theorem premise is used by WD-T08.

The first dedicated build exposed only a normalization-through-kernel
simplification issue.  The repair replaced automation by the explicit fact
that a scalar multiple of a kernel vector remains in the kernel; no theorem
statement or mathematical hypothesis changed.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.FiniteIndexCap}.
```

Certificate run:

```math
\boxed{\texttt{36007743473}}
```

at repository head:

```math
\boxed{\texttt{c2b318997f2aaa9ca756ae66f9149ba9ac34956a}}.
```

The certified theorem source blob is:

```math
\texttt{9c61af90ab1374f65df446c558790a8b7f4dff27}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- single-module Lake build;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T09 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T09: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.WDT09.sharedDefect;
- WeilDefect.WDT09.JointBudget;
- WeilDefect.WDT09.FullNonnegative;
- WeilDefect.WDT09.adjoint_of_signed_factor;
- WeilDefect.WDT09.wd_t09_full_quadratic_factorization;
- WeilDefect.WDT09.wd_t09_shared_defect_factorization;
- WeilDefect.WDT09.wd_t09_full_nonnegative_iff_joint_budget;
- WeilDefect.WDT09.wd_t09_separate_contractions_not_joint;
- WeilDefect.WDT09.wd_t09_shared_screening_budget.

The certificate is stated on the reduced positive carrier, encoded by

```math
\ker S_+=0,
```

which is the abstract theorem's $(\ker S_+)^\perp$ target treated as its
own Hilbert carrier.

Under exact signed screening factorizations

```math
S_M=-S_+X_M,
\qquad
S_B=-S_+X_B,
```

Lean verifies the operator identity

```math
D_{\rm full}
=
S_+
\left(
I-X_MX_M^*-X_BX_B^*
\right)
S_+^*.
```

It also proves natively that full nonnegativity is equivalent to the shared
quadratic budget

```math
\|X_M^*a\|^2+\|X_B^*a\|^2
\le
\|a\|^2
\qquad
\forall a.
```

For the reverse implication from full physical nonnegativity to the global
coefficient-space budget, Lean uses

```math
\overline{\operatorname{Ran}S_+^*}
=
(\ker S_+)^\perp
=
K_+,
```

and closure of the budget inequality. Thus no Douglas factorization theorem
premise is consumed by the WD-T09 certificate.

The file imports the Douglas module only to reuse the IsContraction definition
in the explicit separate-versus-joint counterexample. It does not consume
DouglasUnitData or any imported theorem premise.

Lean also certifies that separate unit bounds are insufficient: with both
screening maps equal to the identity on $\mathbb C$, each individual map
has norm one, while the joint budget fails at $a=1$.

The first WD-T09 build exposed only local elaboration issues: theorem
visibility, rewrite order, closed-set construction, and final scalar
arithmetic. These were repaired without changing the theorem statement or
mathematical hypotheses.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.BackgroundCustody}.
```

Certificate run:

```math
\boxed{\texttt{36019357419}}
```

at repository head:

```math
\boxed{\texttt{f08c8f8a5639e1cf9d23b6381ca852c6c2e1007a}}.
```

The certified theorem source blob is:

```math
\texttt{eec7e8db876cf2504bc3cca349b68bb60d93a626}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T09-containing module;
- unfinished-proof/project-axiom rejection.

No other stable theorem ID is promoted by this run.


## WD-T10 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T10: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.WDT10.residualBudget;
- WeilDefect.WDT10.wd_t10_residual_budget_positive;
- WeilDefect.WDT10.residualSqrt;
- WeilDefect.WDT10.wd_t10_residual_sqrt_selfAdjoint;
- WeilDefect.WDT10.wd_t10_residual_sqrt_sq;
- WeilDefect.WDT10.effectivePositive;
- WeilDefect.WDT10.wd_t10_effective_covariance;
- WeilDefect.WDT10.wd_t10_background_covariance_elimination;
- WeilDefect.WDT10.wd_t10_full_defect_reduction;
- WeilDefect.WDT10.wd_t10_shared_defect_inner_identity;
- WeilDefect.WDT10.wd_t10_full_nonnegative_iff_effective_physical;
- WeilDefect.WDT10.wd_t10_full_nonnegative_iff_residual_screening;
- WeilDefect.WDT10.wd_t10_background_elimination_and_residual_budget.

Assuming an exact contractive background screen

```math
S_B=-S_+X_B,
\qquad
\|X_B\|\le1,
```

Lean verifies natively that

```math
R_B=I-X_BX_B^*
```

is positive.  The canonical square root is constructed by mathlib's continuous
functional calculus,

```math
R_B^{1/2}:=\operatorname{CFC.sqrt}(R_B),
```

and Lean checks both self-adjointness and

```math
R_B^{1/2}R_B^{1/2}=R_B.
```

For

```math
S_{\rm eff}=S_+R_B^{1/2},
```

Lean then proves internally

```math
S_{\rm eff}S_{\rm eff}^*
=
S_+R_BS_+^*
=
S_+S_+^*-S_BS_B^*,
```

hence

```math
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^*-S_MS_M^*.
```

The corresponding scalar quadratic forms are identified exactly, so full
nonnegativity is reduced to physical nonnegativity of the effective
two-channel defect.

The final screening-existence clause consumes the explicit proposition-valued
premise

```math
\texttt{WeilDefect.WDT02.DouglasUnitData\ S_M\ S_eff}.
```

Downstream from that premise, Lean verifies

```math
D_{\rm full}\succeq0
\iff
\exists Y, \|Y\|\le1,\quad S_M=-S_{\rm eff}Y.
```

The CFC square-root theorems are ordinary kernel-checked mathlib library
results and are not an imported project theorem premise.  The only imported
boundary in the stable WD-T10 statement is the same Douglas factorization
interface already isolated in WD-T02.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.ResidualBudget}.
```

Certificate run:

```math
\boxed{\texttt{36021712105}}
```

at repository head:

```math
\boxed{\texttt{1e5b881fd412ce88de62564c57637702f16858c8}}.
```

The certified theorem source blob is:

```math
\texttt{1ffb6b2a80620b266798d40e68fe3329dc2cfb78}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T10 module;
- unfinished-proof/project-axiom rejection.

The first two WD-T10 compiler passes exposed only local Lean representation and
rewrite issues around adjoints, CFC square-root order hypotheses, composition
association, and scalar quadratic-form transport.  Those repairs did not alter
the theorem statement or mathematical hypotheses.

No other stable theorem ID is promoted by this run.


## WD-T11 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T11: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT11.wd_t11_norm_activeScreen;
- WeilDefect.WDT11.wd_t11_norm_activeAdjoint;
- WeilDefect.WDT11.wd_t11_norm_one_attains_neutral;
- WeilDefect.WDT11.wd_t11_graphQ_eigenvector;
- WeilDefect.WDT11.wd_t11_graphQ_diagonal;
- WeilDefect.WDT11.wd_t11_negative_rank_le_count;
- WeilDefect.WDT11.wd_t11_negative_space_strict;
- WeilDefect.WDT11.wd_t11_negative_space_finrank;
- WeilDefect.WDT11.wd_t11_negative_rank_count_exists;
- WeilDefect.WDT11.wd_t11_negative_index_exact;
- WeilDefect.WDT11.wd_t11_neutral_space_finrank;
- WeilDefect.WDT11.wd_t11_neutral_space_graphQ_zero;
- WeilDefect.WDT11.wd_t11_finite_sector_singular_value_inertia.

The certificate formalizes finite-sector singular-value inertia on the canonical
active carrier. Lean proves that the number of singular values strictly greater
than one is the exact maximal finite negative rank, that the singular values
equal to one give the neutral-space dimension, and that operator norm one is
attained by an actual nonzero neutral graph direction.

No imported project theorem premise is consumed by WD-T11.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.FiniteSectorInertia}.
```

Certificate run:

```math
\boxed{\texttt{36032799794}}
```

at repository head:

```math
\boxed{\texttt{44a2634f87604dc7d8d82ec36db8ba379e1b64aa}}.
```

The certified theorem source blob is:

```math
\texttt{5404514d874c1cdc710045cab7819601d0a6994f}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T11 module;
- unfinished-proof/project-axiom rejection.

The certification repair passes changed proof engineering only; no stable theorem
statement or mathematical hypothesis was weakened.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T12 / WD-B6 — SEQUENTIAL ELIMINATION}
}
```


## WD-T12 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T12: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.WDT12.sequentialResidualBudget;
- WeilDefect.WDT12.wd_t12_sequential_budget_covariance;
- WeilDefect.WDT12.wd_t12_second_background_elimination;
- WeilDefect.WDT12.wd_t12_sequential_background_consumption.

The certificate formalizes sequential background consumption under the exact
residual-factorization hypothesis. After the first contractive screen, the
second background is required to factor through the first effective positive
synthesis. Lean verifies that the twice-consumed covariance is both

```math
S_+
\left(
R_1-R_1^{1/2}Y_2Y_2^*R_1^{1/2}
\right)
S_+^*
```

and

```math
S_1(I-Y_2Y_2^*)S_1^*.
```

No imported project theorem premise is consumed by WD-T12. The proof reuses
the native algebraic WD-T10 residual-budget lemmas and does not invoke a
Douglas premise.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.SequentialElimination}.
```

Certificate run:

```math
\boxed{\texttt{36057422878}}
```

at repository head:

```math
\boxed{\texttt{cbbaf45442ec5f6cae5cb4e639882a3f2e2c6304}}.
```

The certified theorem source blob is:

```math
\texttt{482eee655471c74e6e87733b3441b2bd26990ab9}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T12 module;
- unfinished-proof/project-axiom rejection.

WD-T12 compiled successfully on the first formal pass.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T13 / WD-B7 — DIRECT COMPRESSION VERSUS SHORTED COVARIANCE}
}
```

The audited WD-T13 hypothesis is the corrected uniformly positive setting
$K\succeq mI$, which guarantees bounded invertibility of the complementary
block.


## WD-T13 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T13: LEAN-CERTIFIED}.
}
```

The certificate uses the corrected uniformly positive hypothesis

```math
K\succeq mI,
\qquad m>0,
```

for the self-adjoint block operator. The Hilbert direct-sum lower bound is
encoded explicitly in `WeilDefect.WDT13.BlockUniformlyPositive`.

Formal declarations include:

- WeilDefect.WDT13.wd_t13_complement_lower_bound;
- WeilDefect.WDT13.wd_t13_complement_isUnit;
- WeilDefect.WDT13.wd_t13_complement_inverse_nonnegative;
- WeilDefect.WDT13.wd_t13_schur_correction_positive;
- WeilDefect.WDT13.wd_t13_schur_le_compression;
- WeilDefect.WDT13.wd_t13_schur_lower_bound;
- WeilDefect.WDT13.wd_t13_schur_isUnit;
- WeilDefect.WDT13.wd_t13_block_solution_exists;
- WeilDefect.WDT13.wd_t13_block_solution_first_component;
- WeilDefect.WDT13.wd_t13_direct_compression_versus_shorted_covariance.

Lean derives bounded invertibility of the complementary block from the uniform
lower bound; it is not assumed. For

```math
H_W=A-BC^{-1}B^*,
```

Lean proves

```math
H_W\preceq A
```

and a uniform lower bound on $H_W$, hence bounded invertibility of
$H_W$.

The inverse-compression identity is kernel-checked in its equivalent block
solution form: every solution of

```math
Ax+By=w,
\qquad
B^*x+Cy=0
```

has

```math
x=H_W^{-1}w,
```

and such a solution is constructed for every $w$. This is the coordinate
form of $P_WK^{-1}|_W=H_W^{-1}$.

No imported project theorem premise is consumed by WD-T13.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.ShortedCovariance}.
```

Certificate run:

```math
\boxed{\texttt{36059475701}}
```

at repository head:

```math
\boxed{\texttt{b2af38e06332be4d68a57a159fdf4ca547e372cd}}.
```

The certified theorem source blob is:

```math
\texttt{a0c3ee14272f34dff041601b5abdfaeca7841e8b}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T13 module;
- unfinished-proof/project-axiom rejection.

The certification retained the corrected uniformly positive hypothesis from the
P4 audit; no theorem statement or mathematical hypothesis was weakened.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T14 / WD-B8 — FINITE POSITIVE SHADOWS PRESERVE SIGNATURE BUT NOT ADMISSIBILITY}
}
```


## WD-T14 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T14: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.WDT14.shadowMargin;
- WeilDefect.WDT14.wd_t14_positive_shadow_margin;
- WeilDefect.WDT14.wd_t14_positive_shadow_preserves_negative_margin;
- WeilDefect.WDT14.wd_t14_graph_shadow_admissible_iff;
- WeilDefect.WDT14.wd_t14_graph_admissibility_failure_example;
- WeilDefect.WDT14.wd_t14_finite_positive_shadows_preserve_signature_not_admissibility.

For every orthogonal positive-coordinate projection $P_U$, Lean certifies

```math
\|u\|^2-\|P_Ua\|^2
\ge
\|u\|^2-\|a\|^2.
```

Hence positive truncation preserves, and can only strengthen, a positive
negative margin.

For graph vectors $u=-X^*a$, Lean also proves the exact admissibility
criterion

```math
u=-X^*P_Ua
\iff
X^*(a-P_Ua)=0.
```

An explicit $\mathbb C$ counterexample with $X=2I$, $a=1$,
$u=-2$, and zero positive projection has margin $3>0$ before and after
the signature shadow while the projected pair is not graph-admissible.

Thus the stable distinction between signature shadow and admissible analysis
vector is kernel-checked.

No imported project theorem premise is consumed by WD-T14.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Screening.FinitePositiveShadows}.
```

Certificate run:

```math
\boxed{\texttt{36062388096}}
```

at repository head:

```math
\boxed{\texttt{adcdc167eb274af899a1a53dfb86b76c5bc442ae}}.
```

The certified theorem source blob is:

```math
\texttt{ed287dfd0dbe7e47cdbb074c0fda64bcd0bc6e41}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T14 module;
- unfinished-proof/project-axiom rejection.

The only repair residue was normalization of the concrete scaled-identity
adjoint in the counterexample; no theorem statement or hypothesis changed.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T15 / WD-C1+WD-C2 — RIGHT-LIMIT PROJECTION CONVERGENCE AND GAP-SPACE DUALITY}
}
```


## WD-T15 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T15: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT15.rightLimit;
- WeilDefect.WDT15.gapLimit;
- WeilDefect.WDT15.wd_t15_gap_antitone;
- WeilDefect.WDT15.wd_t15_right_limit_gap_duality;
- WeilDefect.WDT15.wd_t15_sequence_right_limit_eq;
- WeilDefect.WDT15.wd_t15_sequence_gap_eq_right_limit_orthogonal;
- WeilDefect.WDT15.wd_t15_monotone_projection_limit;
- WeilDefect.WDT15.wd_t15_right_limit_projection_and_gap_duality.

The certificate represents the right-limit analysis space as the
`ClosedSubmodule` infimum

```math
A_{c+}=\bigcap_{t>c}A_t
```

and the limiting gap as the closed-submodule supremum

```math
G_{c+}
=
\overline{\operatorname{span}\bigcup_{t>c}A_t^\perp}.
```

Lean proves the gap duality

```math
A_{c+}=G_{c+}^{\perp}.
```

For every antitone real sequence $t_n\downarrow c$ from the right and every
vector $x$, Lean also proves

```math
P_{A_{t_n}}x\to P_{A_{c+}}x.
```

The P4 audit records that the sequential formulation suffices for the
real-parameter strong-limit statement.

No imported project theorem premise is consumed by WD-T15.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Filtration.RightLimit}.
```

Certificate run:

```math
\boxed{\texttt{36070010269}}
```

at repository head:

```math
\boxed{\texttt{ee1efb86924caa501e0bfaa4ab8a1478736c64d8}}.
```

The certified theorem source blob is:

```math
\texttt{2df4a12993a7fdad3695deb5e68e7ae526b8ebee}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T15 module;
- unfinished-proof/project-axiom rejection.

Repair work changed Lean representation only; no theorem statement or
mathematical hypothesis was weakened.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T16 / WD-C3+WD-C5 — FIXED FINITE NEGATIVE-SECTOR PERSISTENCE}
}
```


## WD-T16 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T16: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le;
- WeilDefect.WDT16.weaklyTendsto_norm_sq_le_of_tendsto;
- WeilDefect.WDT16.wd_t16_fixed_negative_sector_compactness;
- WeilDefect.WDT16.wd_t16_nonpositive_limit_persists;
- WeilDefect.WDT16.wd_t16_uniform_negative_margin_persists;
- WeilDefect.WDT16.wd_t16_uniform_negative_margin_forces_endpoint_jump;
- WeilDefect.WDT16.wd_t16_fixed_finite_negative_sector_persistence.

The coefficient Hilbert space is represented by the actual $L^2$-product
$K_+\oplus M$, with $M$ finite-dimensional.

Lean natively extracts a weakly convergent subsequence of the positive
coordinates without assuming global separability: it localizes to the
separable closed span of the sequence, passes through the Fréchet–Riesz
isometry, applies sequential Banach–Alaoglu in the weak dual, and lifts the
result back to the ambient Hilbert space.

Finite-dimensional compactness gives strong convergence of the negative
coordinate. The assembled weak limit lies in the WD-T15 right-limit space.

For normalized signatures

```math
J(a_n,u_n)\to q_*\le0,
```

Lean proves

```math
\boxed{
\exists,0\ne y\in A_{c+},
\qquad
J(y)\le q_*.
}
```

For a uniform margin $\kappa>0$,

```math
J(a_n,u_n)\le-\kappa,
```

Lean proves

```math
\boxed{
\exists,0\ne y\in A_{c+},
\qquad
J(y)\le-\kappa.
}
```

If the endpoint $A_c$ is $J$-nonnegative, the produced vector is also
certified to lie in

```math
A_{c+}\setminus A_c.
```

No imported project theorem premise is consumed by WD-T16.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Filtration.FiniteNegativeSector}.
```

Certificate run:

```math
\boxed{\texttt{36078296999}}
```

at repository head:

```math
\boxed{\texttt{6c8bd4b57eb18c583d426c767beca21f06307f69}}.
```

The certified theorem source blob is:

```math
\texttt{f7f2a50f8183ba1a617ce1cf97855461bbbbda5f}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T16 module;
- unfinished-proof/project-axiom rejection.

The final audited WD-C3 nonpositive-limit theorem was added before promotion;
the certificate does not merely cover the compactness core.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T17 / WD-C4 — FIXED-SECTOR CRITICAL DICHOTOMY}
}
```


## WD-T17 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T17: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT17.weaklyTendsto_strong_of_norm_sq_tendsto;
- WeilDefect.WDT17.NeutralCriticalBranch;
- WeilDefect.WDT17.NegativeFallthroughBranch;
- WeilDefect.WDT17.wd_t17_critical_positive_mass_le_half;
- WeilDefect.WDT17.wd_t17_fixed_sector_critical_dichotomy;
- WeilDefect.WDT17.wd_t17_neutral_branch;
- WeilDefect.WDT17.wd_t17_loss_branch.

For a unit-normalized critical sequence in a fixed finite negative sector,

```math
J(y_n)\to0,
```

Lean proves

```math
\|a_n\|^2\to\frac12,
\qquad
\|u_n\|^2\to\frac12.
```

After the WD-T16 compactness extraction, the nonzero right-limit vector
$y=(a,u)$ satisfies exactly one of two alternatives:

1. $\|a\|^2=1/2$, hence $J(y)=0$, weak convergence of the positive
   coordinate upgrades to strong convergence, and the full coefficient
   subsequence converges strongly to $y$;
2. $\|a\|^2<1/2$, hence $J(y)<0$.

The assembled theorem proves both exhaustivity and mutual exclusion of these
branches.

No imported project theorem premise is consumed by WD-T17.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Filtration.CriticalDichotomy}.
```

Certificate run:

```math
\boxed{\texttt{36081480092}}
```

at repository head:

```math
\boxed{\texttt{ed92f76a62c26ab48f35f7637c07bdf9568dccab}}.
```

The certified theorem source blob is:

```math
\texttt{7102a25b28f7a8cf72e805f845bad23daf535aa2}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T17 module;
- unfinished-proof/project-axiom rejection.

Repair work changed only Lean normalization and coercion details; no theorem
statement or mathematical hypothesis was weakened.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T18 / WD-C6 — ENDPOINT-JUMP QUOTIENT BOUNDS NEW RIGHT-LIMIT NEGATIVE INDEX}
}
```


## WD-T18 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T18: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT18.endpointInside;
- WeilDefect.WDT18.endpointQuotientMap;
- WeilDefect.WDT18.wd_t18_endpoint_quotient_map_injective;
- WeilDefect.WDT18.wd_t18_endpoint_jump_negative_rank_le_quotient;
- WeilDefect.WDT18.wd_t18_one_dimensional_jump_rank_cap.

For closed endpoint/right-limit spaces $A_0\subseteq A_+$, Lean formalizes
the endpoint quotient $A_+/A_0$. Any finite-dimensional strictly negative
witness in $A_+$ injects into that quotient when the endpoint is
nonnegative. Hence every such witness rank is bounded by the quotient
dimension; in particular a one-dimensional jump caps the finite negative rank
at one.

No imported project theorem premise is consumed by WD-T18.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Filtration.EndpointJump}.
```

Certificate run:

```math
\boxed{\texttt{36082262379}}
```

at repository head:

```math
\boxed{\texttt{f02683ec35aa1d61ee056512f2a9977e081a7990}}.
```

The certified theorem source blob is:

```math
\texttt{d7743465cac328c8aa6236fb12942117b8e67a7e}.
```

The run passed pinned dependency resolution, mathlib cache retrieval, the
direct Lake build, and unfinished-proof/project-axiom rejection.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T19 / WD-C7+WD-C8+WD-C9 — NEW ENDPOINT VECTORS FORCE BOUNDARY AMPLIFICATION / REPRESENTATIVE BLOW-UP}
}
```


## WD-T19 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T19: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.WDT19.analysisSpace;
- WeilDefect.WDT19.weaklyTendsto_of_tendsto;
- WeilDefect.WDT19.weaklyTendsto_map;
- WeilDefect.WDT19.weaklyTendsto_unique;
- WeilDefect.WDT19.weak_limit_mem_physical_rightLimit;
- WeilDefect.WDT19.wd_t19_endpoint_representative_blowup;
- WeilDefect.WDT19.BoundaryAmplifies;
- WeilDefect.WDT19.wd_t19_boundary_amplification;
- WeilDefect.WDT19.wd_t19_vanishing_amplitude_normalized_blowup.

For a common bounded physical map $T$ and right-continuous nested physical
spaces, Lean proves that any new endpoint vector requires representative norm
blow-up, upgrades that statement to the full local boundary-amplification
predicate, and certifies the reciprocal-growth identity for vanishing-amplitude
normalized representatives.

No imported project theorem premise is consumed by WD-T19.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.Filtration.RepresentativeBlowup}.
```

Certificate run:

```math
\boxed{\texttt{36083158273}}
```

at repository head:

```math
\boxed{\texttt{33f5a187baf7e195c19e179bb3b6b9befb7a0700}}.
```

The certified theorem source blob is:

```math
\texttt{6645820485d46afe8566e1812de0e301fb290ba2}.
```

The run passed pinned dependency resolution, mathlib cache retrieval, the
direct Lake build, and unfinished-proof/project-axiom rejection.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T20 / ZW1-T1 — CANONICAL CONJUGATE-PAIR DIAGONALIZATION INTO POSITIVE/NEGATIVE WEIL CHANNELS}
}
```


## WD-T20 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T20: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_t20_pair_pos_eigen;
- WeilDefect.wd_t20_pair_neg_eigen;
- WeilDefect.pairEigenEquiv;
- WeilDefect.wd_t20_pair_diagonalization.

For one distinct nonreal conjugate pair, Lean represents conjugation as a
two-coordinate swap and proves that the symmetric and antisymmetric channels
are the $+1$ and $-1$ eigendirections. The complex-linear
`pairEigenEquiv` identifies raw pair coefficients with positive/negative
channel coordinates, in which the involution is exactly

```math
(a,b)\mapsto(a,-b).
```

The formal source uses unnormalized representatives $(1,1)$ and
$(1,-1)$; these span the same canonical eigendirections as the normalized
$1/\sqrt2$ convention.

WD-T20 is pair-level algebra after reduction to a distinct conjugate-pair
coordinate. The separate same-frequency multiplicity quotient remains WD-T23.

No imported project theorem premise is consumed by WD-T20.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.PairGeometry}.
```

Certificate run:

```math
\boxed{\texttt{36087496196}}
```

at repository head:

```math
\boxed{\texttt{9b8142168cb5e4a5bd53e4d6e903abec211465d4}}.
```

The certified theorem source blob is:

```math
\texttt{a15e6eb544f9154836644d1a82a607f10639cbb3}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T20 module;
- unfinished-proof/project-axiom rejection.

The theorem source required no repair during this certification cursor.

Next theorem cursor:

```math
\boxed{
\texttt{WD-T21 / ZW1-T2 — ONE SIMPLE ZETA QUARTET CONTRIBUTES TWO NEGATIVE PAIR COORDINATES}
}
```


## WD-T21 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T21: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.quartetPairPos;
- WeilDefect.quartetPairNeg;
- WeilDefect.wd_t21_quartet_pair_pos_conjugate;
- WeilDefect.wd_t21_quartet_pair_neg_conjugate;
- WeilDefect.wd_t21_quartet_pairs_nonreal;
- WeilDefect.wd_t21_quartet_pairs_distinct;
- WeilDefect.wd_t21_simple_quartet_negative_count;
- WeilDefect.wd_t21_simple_quartet_pair_geometry.

Under the simple off-critical nondegeneracy assumptions

```math
T\ne0,
\qquad
\delta\ne0,
```

Lean certifies that the Bombieri ordinate coordinates

```math
\{T+i\delta,T-i\delta\}
```

and

```math
\{-T+i\delta,-T-i\delta\}
```

are two distinct nonreal complex-conjugate pairs.

Combining this with WD-T20's pair diagonalization, one simple quartet has
exactly two canonical negative pair coordinates. The formal coordinate type
is `Fin 2`, with cardinality two.

WD-T21 is only the coefficient-space count. Equality with the finite Weil
matrix negative spectral index remains WD-T22 and uses Bombieri's imported
finite-inertia theorem.

No imported project theorem premise is consumed by WD-T21.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.PairGeometry}.
```

Certificate run:

```math
\boxed{\texttt{36088674422}}
```

at repository head:

```math
\boxed{\texttt{e8e1c6b9e1f9f9f566d6398b296d7b30b827ef3d}}.
```

The certified theorem source blob is:

```math
\texttt{427fbe49617add15010ba812c6140e07a7b9507f}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T21 module;
- unfinished-proof/project-axiom rejection.

The only compiler repair was the pinned complex-conjugation API name; no
mathematical statement was weakened.

## WD-T22 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T22: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations:

- WeilDefect.BombieriFiniteInertiaData;
- WeilDefect.wd_t22_finite_weil_inertia_saturation;
- WeilDefect.SimpleQuartetPacketNegative;
- WeilDefect.wd_t22_simple_quartet_packet_pair_count;
- WeilDefect.wd_t22_simple_quartet_packet_inertia;
- WeilDefect.wd_t22_two_simple_quartet_negative_index.

The pinned Bombieri finite-inertia theorem (Theorem 8, p. 213) is represented
explicitly by the proposition-valued premise

```math
\texttt{BombieriFiniteInertiaData}.
```

It supplies exactly the imported equality between the finite Weil matrix's
negative spectral index and the number of distinct nonreal conjugate pairs.
It is passed as a theorem premise and is not declared as a project axiom.

Lean then verifies the packet specialization internally.  Using WD-T21's
two negative pair coordinates per simple quartet, a packet of $q$ simple
disjoint quartets has pair-coordinate cardinality

```math
2q.
```

Therefore the imported Bombieri equality specializes to

```math
\operatorname{ind}_{-}=2q,
```

and for the audited two-quartet packet:

```math
\boxed{
\operatorname{ind}_{-}=4.
}
```

The Bombieri source theorem itself has not been reconstructed in Lean, so this
result must not be reported as a native LEAN-CERTIFIED theorem.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.PairGeometry}.
```

Certificate run:

```math
\boxed{\texttt{36089403584}}
```

at repository head:

```math
\boxed{\texttt{83914d302ba9201983c5e0b0d4404b727714acbd}}.
```

The certified theorem source blob is:

```math
\texttt{91bc6efce70e05a3ec1d320ec8ee1e99abc6be3d}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T22 target module;
- unfinished-proof/project-axiom rejection.

No stable theorem statement or mathematical hypothesis was weakened.

## WD-T23 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T23: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations:

- WeilDefect.BombieriMultiplicityNullData;
- WeilDefect.wd_t23_same_frequency_synthesis_factor;
- WeilDefect.wd_t23_same_frequency_zero_sum_null;
- WeilDefect.wd_t23_total_multiplicity_nullity;
- WeilDefect.wd_t23_single_ordinate_nullity;
- WeilDefect.wd_t23_single_ordinate_has_null_iff_repeated;
- WeilDefect.wd_t23_distinct_frequency_reduction.

The direct coefficient mechanism is proved natively.  For duplicate
same-frequency coordinates with common physical shape $g$, Lean verifies

```math
\sum_i x_i g
=
\left(\sum_i x_i\right)g.
```

Hence every zero-sum duplicate coefficient combination is an exact
synthesis-null direction.

The exact nullity count is the imported part.  Bombieri Lemma 10 and its proof
continuation are represented by the explicit proposition-valued premise

```math
\texttt{BombieriMultiplicityNullData}.
```

For distinct ordinates of raw multiplicities $m_j$, it supplies exactly

```math
\operatorname{nullity}
=
\sum_j (m_j-1).
```

For one ordinate of multiplicity $m$, Lean specializes this to

```math
\operatorname{nullity}=m-1
```

and proves that a nontrivial multiplicity-null sector occurs exactly when
$m>1$.

Thus multiplicity-null directions are formally separated from the active
distinct-frequency channel before independent negative-index counting.  The
Bombieri source theorem itself is not reconstructed in Lean and is not a
project axiom.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.PairGeometry}.
```

Certificate run:

```math
\boxed{\texttt{36089684621}}
```

at repository head:

```math
\boxed{\texttt{a16b63021e91639beb59bfc387946531aa1fdd83}}.
```

The certified theorem source blob is:

```math
\texttt{853b2de7d7df4a435059d7f5cb3ae0fe89a5baeb}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T23 target module;
- unfinished-proof/project-axiom rejection.

No stable theorem statement or mathematical hypothesis was weakened.

## WD-T24 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T24: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.realExpMode;
- WeilDefect.realExpMode_ne_zero;
- WeilDefect.hasDerivAt_realExpMode;
- WeilDefect.iteratedDeriv_realExpMode;
- WeilDefect.contDiffAt_const_mul_realExpMode;
- WeilDefect.iteratedDeriv_finite_exp_sum;
- WeilDefect.wd_t24_finite_distinct_frequency_exponential_independence.

For distinct complex frequencies $\lambda_i$, Lean certifies that if

```math
\sum_i c_i e^{\lambda_i x}=0
```

throughout a nonempty real interval, then every coefficient $c_i$ is zero.

The proof is fully internal.  It chooses an interior point $x_0$, differentiates
the local zero relation through orders $0,\dots,n-1$, and obtains

```math
\sum_i
\bigl(c_i e^{\lambda_i x_0}\bigr)\lambda_i^k
=
0.
```

Mathlib's Vandermonde nonsingularity theorem then forces all weighted
coefficients to vanish.  Since the complex exponential is never zero, every
$c_i$ vanishes.

No analytic-continuation theorem and no imported project theorem premise is
needed.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.FiniteExponentialIndependence}.
```

Certificate run:

```math
\boxed{\texttt{36093132364}}
```

at repository head:

```math
\boxed{\texttt{79882bdc976581db62bbc783d52f8bb4ac01e214}}.
```

The certified theorem source blob is:

```math
\texttt{7244cb18dd652c02619f6b56061443e00097df5f}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T24 target module;
- unfinished-proof/project-axiom rejection.

The repair passes resolved Lean parser and real/complex module-instance
ambiguities only; no theorem statement or mathematical hypothesis was weakened.

## WD-T25 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T25: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.problemOneDenominator;
- WeilDefect.problemOneL;
- WeilDefect.problemOneL_realExpMode;
- WeilDefect.problemOneMode;
- WeilDefect.problemOneDenominator_half;
- WeilDefect.problemOneDenominator_neg_half;
- WeilDefect.problemOneL_problemOneMode;
- WeilDefect.problemOneL_const_mul_problemOneMode;
- WeilDefect.problemOneL_fin_sum;
- WeilDefect.wd_t25_finite_problem_one_relation_trivial;
- WeilDefect.wd_t25_no_exact_finite_positive_compensation.

Lean represents the Problem-1 differential operator as

```math
L=-\frac{d^2}{dx^2}+\frac14.
```

For an exponential mode $e^{\lambda x}$, it certifies

```math
L e^{\lambda x}
=
\left(\frac14-\lambda^2\right)e^{\lambda x}.
```

A Green-preconditioned Problem-1 coordinate is represented as one reciprocal
particular solution plus arbitrary boundary-homogeneous terms at frequencies
$\pm 1/2$.  Lean proves that the two boundary terms are killed by $L$, and
that a reciprocal coefficient satisfying

```math
q\left(\frac14-\lambda^2\right)=1
```

is mapped back to the raw exponential mode.

Consequently, any finite exact relation among distinct-frequency
Green-preconditioned coordinates on a nonempty interval is sent by $L$ to a
finite distinct-frequency exponential relation.  WD-T24 then forces every
coefficient to vanish.

The anchored corollary therefore proves that if one selected channel has a
nonzero coefficient, no finite family of distinct-frequency compensating
channels can cancel it exactly on a nontrivial interval.

No imported project theorem premise is consumed by WD-T25.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.ProblemOneIndependence}.
```

Certificate run:

```math
\boxed{\texttt{36093665687}}
```

at repository head:

```math
\boxed{\texttt{ae100c2bfd4fddcc45296f52e0b38d844344477d}}.
```

The certified theorem source blob is:

```math
\texttt{a799e0931c557a977b8163fc21940defa366fdee}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T25 target module;
- rebuilding and rechecking the WD-T24 dependency;
- unfinished-proof/project-axiom rejection.

The single repair pass changed Lean representation only; no theorem statement
or mathematical hypothesis was weakened.

## WD-T26 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T26: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.rawResiduesOfNegativePairs;
- WeilDefect.wd_t26_zero_moment;
- WeilDefect.wd_t26_coefficient_mem_rawResidues;
- WeilDefect.wd_t26_nonzero_raw_residue_of_nonzero_coefficient;
- WeilDefect.wd_t26_selected_zero_moment_residue.

For a finite list of selected negative pair coefficients

```math
(\alpha_1,\dots,\alpha_m),
```

the raw residue map is represented as

```math
(\alpha_1,-\alpha_1,\dots,\alpha_m,-\alpha_m).
```

Lean certifies the zero-moment identity

```math
\sum_j v_j=0
```

by pairwise antisymmetry.

The nondegeneracy half is also certified: if at least one selected negative
coefficient is nonzero, then at least one raw residue is nonzero.  The custody
bridge is direct: each coefficient $\alpha$ occurs verbatim as one of the
two raw residues $(\alpha,-\alpha)$.

Thus the associated raw residue vector has zero total residue and cannot
collapse to the zero residue vector when the selected negative coefficient
vector is genuinely nonzero.

No imported project theorem premise, prime-side input, pole term, or
archimedean input is consumed by WD-T26.

Dedicated theorem CI built:

```math
\texttt{WeilDefect.PairGeometry}.
```

Certificate run:

```math
\boxed{\texttt{36095464414}}
```

at repository head:

```math
\boxed{\texttt{a02e9176ca3f6dd071ab9b43226d025efb5f7592}}.
```

The certified WD-T26 source commit is:

```math
\texttt{61110e7fc77722dbfa0a1459f101d98ae90efff8}.
```

The certified theorem source blob is:

```math
\texttt{5361e8384880fcd799fbd62151b65be7a11f3cf8}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T26 target module;
- unfinished-proof/project-axiom rejection.

No stable theorem statement or mathematical hypothesis was weakened.

## WD-T27 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T27: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.rationalResponse;
- WeilDefect.residueFirstMoment;
- WeilDefect.residueSecondMomentNorm;
- WeilDefect.inv_sub_laurent_two;
- WeilDefect.weighted_inv_sub_laurent_two;
- WeilDefect.rationalResponse_laurent_two;
- WeilDefect.rationalResponse_zero_moment_expansion;
- WeilDefect.rationalResponse_remainder_term_bound;
- WeilDefect.rationalResponse_zero_moment_remainder_bound;
- WeilDefect.residueRadius;
- WeilDefect.norm_le_residueRadius;
- WeilDefect.rationalResponse_zero_moment_remainder_isBigO;
- WeilDefect.rationalResponse_zero_moment_isBigO;
- WeilDefect.wd_t27_universal_inverse_square_far_decay;
- WeilDefect.wd_t27_universal_inverse_square_isBigO.

For a finite residue vector $v$ at locations $\rho_i$, Lean certifies the
exact Laurent decomposition

```math
R_v(z)
=
\frac{\sum_i v_i}{z}
+
\frac{M_1(v)}{z^2}
+
\sum_i
\frac{v_i\rho_i^2}{z^2(z-\rho_i)},
```

where

```math
M_1(v)=\sum_i \rho_i v_i.
```

Under the WD-T26 zero-moment condition

```math
\sum_i v_i=0,
```

the inverse-linear term disappears exactly.

Lean then proves the quantitative far-field bound: whenever

```math
2\|\rho_i\|\le \|z\|
```

for every selected pole,

```math
\left\|
R_v(z)-\frac{M_1(v)}{z^2}
\right\|
\le
\frac{
2\sum_i \|v_i\|\|\rho_i\|^2
}{
\|z\|^3
}.
```

Thus the precise first-moment refinement is kernel-checked, with no hidden
uniformity beyond the fixed finite packet.

The same module also certifies the literal Landau statements on the complex
cobounded filter:

```math
R_v(z)-\frac{M_1(v)}{z^2}
=
O(\|z\|^{-3}),
```

and

```math
\boxed{
R_v(z)=O(\|z\|^{-2}).
}
```

No imported project theorem premise is consumed by WD-T27.

The quantitative core first passed in CI run:

```math
\texttt{36096310211}.
```

The final certificate including the literal Landau corollaries is:

```math
\boxed{\texttt{36097347267}}
```

at repository head:

```math
\boxed{\texttt{3990122ea425e7bb84b6093cd5e1b5a791c11e8c}}.
```

The certified theorem source blob is:

```math
\texttt{aed1edaa7734adb0a1ede11aac2683053a1345da}.
```

The final run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T27 target module;
- rebuilding and checking the WD-T26 dependency;
- unfinished-proof/project-axiom rejection.

The repair passes affected only finite-sum normalization, Bornology scope, and
triangle-inequality elaboration.  No theorem statement or mathematical
hypothesis was weakened.

## WD-T28 criterion-layer certificate evidence

Stable ID remains:

```math
\boxed{
\text{WD-T28: LEAN-IN-PROGRESS}.
}
```

The Hilbert--Schmidt **criterion layer** is kernel-checked.

Formal declarations include:

- WeilDefect.ZetaShellIndex;
- WeilDefect.ZetaZeroShellCountData;
- WeilDefect.NativeProblemOneResolventData;
- WeilDefect.NativeHilbertSchmidtCriterion;
- WeilDefect.NativeTraceClassCovarianceCriterion;
- WeilDefect.nativeShellEnergy;
- WeilDefect.summable_shifted_rpow_neg_three_halves;
- WeilDefect.nativeShellEnergy_le_three_halves;
- WeilDefect.nativeShellEnergy_summable;
- WeilDefect.wd_t28_native_basis_square_summable;
- WeilDefect.wd_t28_native_problem_one_hilbert_schmidt.

The pinned Mathlib version does not expose a native Hilbert--Schmidt or
trace-class operator type.  Accordingly WD-T28 is represented at the standard
$\ell^2$-basis criterion level:

```math
\sum_\gamma
\|E_t e_\gamma\|_{H^{-1}_L}^2
<
\infty.
```

The zero-count input is explicit.  The Titchmarsh
$O(\log T)$ unit-shell estimate is packaged through its elementary weaker
consequence

```math
\#\Gamma_n
\ll
(n+1)^{1/2},
```

which is sufficient for summability.

The native column estimate is also explicit:

```math
\|E_t e_\gamma\|_{H^{-1}_L}^2
\le
A(n+1)^{-2}
```

for a coordinate in unit shell $n$.

Lean then verifies internally that one shell contributes at most

```math
AC(n+1)^{-3/2},
```

and proves summability via the $p$-series with exponent $3/2$.
The Sigma-type shell decomposition then yields summability over all zero
coordinates.

At the criterion level Lean therefore verifies both:

```math
\text{Hilbert--Schmidt basis-square summability},
```

and the corresponding covariance trace-sum criterion.

Dedicated criterion CI built:

```math
\texttt{WeilDefect.NativeHilbertSchmidt}.
```

Certificate run:

```math
\boxed{\texttt{36100254156}}
```

at repository head:

```math
\boxed{\texttt{b919ea890dfb83236cdb6ec0de625b5e59fd9e24}}.
```

The checked theorem source blob is:

```math
\texttt{d94c9020fdd9c3acadf0e143735b21bb12bd8598}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of the WD-T28 criterion module;
- rebuilding the finite Problem-1 dependencies;
- unfinished-proof/project-axiom rejection.

### WD-T28 resolvent-realization certificate

The previously abstract native-column premise has now been discharged by an
explicit compact-window Dirichlet construction.

Additional formal declarations include:

- WeilDefect.problemOneFreq;
- WeilDefect.problemOneGreenDenom;
- WeilDefect.problemOneGreenQ;
- WeilDefect.dirichletRightReal;
- WeilDefect.dirichletLeftReal;
- WeilDefect.dirichletRightBasis;
- WeilDefect.dirichletLeftBasis;
- WeilDefect.problemOneL_dirichletRightBasis;
- WeilDefect.problemOneL_dirichletLeftBasis;
- WeilDefect.problemOneGreenQ_shell_bound;
- WeilDefect.norm_problemOne_source_le;
- WeilDefect.dirichletProblemOneColumn;
- WeilDefect.dirichletProblemOneColumn_pos;
- WeilDefect.dirichletProblemOneColumn_neg;
- WeilDefect.problemOneL_dirichletProblemOneColumn;
- WeilDefect.norm_dirichletProblemOneColumn_le;
- WeilDefect.problemOneGreenPairing;
- WeilDefect.problemOneColumnEnergySq;
- WeilDefect.problemOneColumnEnergySq_le;
- WeilDefect.ActualProblemOneShellData;
- WeilDefect.actualProblemOneEnergySq;
- WeilDefect.nativeProblemOneResolventData_of_actual;
- WeilDefect.wd_t28_native_problem_one_hilbert_schmidt_actual.

For fixed $t>0$, the explicit Green column is

```math
F_\gamma(x)
=
q_\gamma e^{-i\gamma x}
-q_\gamma e^{-i\gamma t}h_+(x)
-q_\gamma e^{i\gamma t}h_-(x),
```

where

```math
q_\gamma
=
\left(\frac14+\gamma^2\right)^{-1}
```

and $h_\pm$ are the canonical hyperbolic-sine Dirichlet interpolation
functions.

Lean certifies

```math
F_\gamma(\pm t)=0
```

and

```math
\left(-\partial_x^2+\frac14\right)F_\gamma
=
e^{-i\gamma x}.
```

Inside the fixed zeta strip

```math
|\Im\gamma|\le\frac12,
```

Lean proves the compact-window source and boundary-correction bounds and the
shell-height reciprocal estimate

```math
\|q_\gamma\|
\le
(n+1)^{-2}
```

whenever the coordinate is assigned to a shell satisfying

```math
n+1\le |\Re\gamma|.
```

Consequently the Green pairing obeys the explicit bound

```math
\left|
\int_{-t}^{t}
\overline{e^{-i\gamma x}}\,F_\gamma(x)\,dx
\right|
\le
6t\,e^t\,\|q_\gamma\|,
```

which supplies the inverse-square column-energy estimate consumed by the
already-certified shell-summability theorem.

The direct resolvent target passed in:

```math
\boxed{\texttt{36106100832}}
```

at repository head:

```math
\boxed{\texttt{b4f66285b0060afce5af47310e98cbb5fef41cc9}}.
```

The checked resolvent source blob is:

```math
\texttt{2564a66892ed3c623249d621d54a556bcec8857b}.
```

This run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of $\texttt{WeilDefect.DirichletResolvent}$;
- rebuilding the WD-T28 criterion dependencies;
- unfinished-proof/project-axiom rejection.

The former abstract premise

```math
\texttt{NativeProblemOneResolventData}
```

is therefore internally realized for the explicit shell data by

```math
\texttt{nativeProblemOneResolventData_of_actual}.
```

### Remaining WD-T28 semantic obligation

WD-T28 remains

```math
\boxed{\text{LEAN-IN-PROGRESS}}
```

for one narrower reason.

The current scalar

```math
\texttt{problemOneColumnEnergySq}
```

is defined as the norm of the Green pairing.  The mathematical native
$H^{-1}_L$ statement additionally identifies the pairing itself with the
positive Dirichlet energy:

```math
\boxed{
\langle f_\gamma,Gf_\gamma\rangle
=
\int_{-t}^{t}
\left(
|F_\gamma'(x)|^2
+
\frac14|F_\gamma(x)|^2
\right)\,dx
\ge0.
}
```

The next kernel obligation is therefore no longer the resolvent estimate.
It is only this integration-by-parts positivity/energy identification.

Cursor at this checkpoint:

```math
\boxed{
\texttt{WD-T28 / ENERGY IDENTIFICATION — GREEN PAIRING = POSITIVE }H^{-1}_L\texttt{ ENERGY}
}
```


## WD-T28 final certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T28: LEAN-CERTIFIED}.
}
```

The remaining semantic obligation was the native Green-pairing / positive
Dirichlet-energy identification. Lean now certifies the chain

```math
\langle f_\gamma,Gf_\gamma\rangle
=
\int_{-t}^{t}
\left(
|F_\gamma'(x)|^2+\frac14|F_\gamma(x)|^2
\right)\,dx
\ge 0,
```

together with the real/complex cast and the identification of
`problemOneColumnEnergySq` with the positive Dirichlet energy.

Final declarations include:

- WeilDefect.problemOneDirichletEnergy;
- WeilDefect.problemOneDirichletEnergyComplex;
- WeilDefect.dirichlet_second_derivative_pairing;
- WeilDefect.problemOneDirichletEnergyComplex_eq_ofReal;
- WeilDefect.problemOneDirichletEnergy_nonneg;
- WeilDefect.problemOneGreenPairing_eq_dirichletEnergyComplex;
- WeilDefect.problemOneGreenPairing_eq_dirichletEnergy;
- WeilDefect.problemOneColumnEnergySq_eq_dirichletEnergy;
- WeilDefect.actualProblemOneEnergySq_eq_dirichletEnergy;
- WeilDefect.wd_t28_actual_dirichlet_energy_summable.

The final cast repair was proof-engineering only: after `push_cast`, the goal
was reflexive and is closed by `rfl`. No mathematical statement or hypothesis
was weakened.

The final WD-T28 dependency was rebuilt successfully as part of the WD-T29
certificate run:

```math
\boxed{\texttt{36149246351}}
```

at repository head:

```math
\boxed{\texttt{766ddd2297e5d884a532e09379b7c2e6ad82db86}}.
```

The final Dirichlet-energy source blob is:

```math
\texttt{68c53704d15038b6365a9835d79b7c6d4a3d548b}.
```


## WD-T29 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T29: LEAN-CERTIFIED}.
}
```

Formal declarations:

- WeilDefect.wd_t29_finite_head_approximation;
- WeilDefect.wd_t29_quantitative_finite_head_approximation.

Lean formalizes the exact necessary-condition mechanism. If

```math
y=S_{\le G}x_{\le G}+S_{>G}x_{>G},
\qquad
\|x_{>G}\|\le 1,
```

then

```math
\operatorname{dist}
\bigl(y,\operatorname{Ran}S_{\le G}\bigr)
\le
\|S_{>G}\|.
```

Any quantitative operator-tail bound
$\|S_{>G}\|\le\varepsilon_G$ therefore transfers immediately to the
same finite-head approximation rate.

Certificate run:

```math
\boxed{\texttt{36149246351}}
```

at repository head:

```math
\boxed{\texttt{766ddd2297e5d884a532e09379b7c2e6ad82db86}}.
```

The WD-T29 source blob is:

```math
\texttt{1f0222e44d03a9b23d0ae3900c3f884893f2eaa1}.
```

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- direct Lake build of `WeilDefect.FiniteHeadApproximation`;
- rebuilding the WD-T28 Dirichlet-energy dependency;
- unfinished-proof/project-axiom rejection.

WD-T30 is already independently Lean-certified.

## WD-T31 analytic tail-kernel subpass

The analytic summation core of WD-T31 is now kernel-checked. Lean certifies the
nonnegative antitone kernel

```math
k(x)=\frac{1+\log x}{x^2},
```

its exact improper integral

```math
\int_R^\infty k(x)\,dx
=
\frac{\log R+2}{R},
```

and the discrete shifted-tail estimate

```math
\sum_{n\ge R+1} k(n)
\le
\frac{\log R+2}{R}.
```

Formal declarations include:

- WeilDefect.logarithmicTailKernel;
- WeilDefect.logarithmicTailKernel_nonneg;
- WeilDefect.logarithmicTailKernel_antitoneOn;
- WeilDefect.logarithmicTailKernel_integrableOn_Ioi;
- WeilDefect.integral_logarithmicTailKernel_Ioi;
- WeilDefect.logarithmicTail_tsum_le.

This subpass passed pinned CI in:

```math
\boxed{\texttt{36155524899}}
```

at repository head:

```math
\boxed{\texttt{ddb689c21d9278c05dc792f08b44d7d7e6feed01}}.
```

The checked source blob is:

```math
\texttt{439db969240a2534e15709c9bf27c998421acb12}.
```

The shell aggregation and WD-T27 bridge are now complete.

## WD-T31 final certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T31: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Additional declarations include:

- WeilDefect.FarShellIndex;
- WeilDefect.ZetaLogShellCountData;
- WeilDefect.FarShellResponseData;
- WeilDefect.farShellResponse;
- WeilDefect.logarithmicTailKernel_summable_nat;
- WeilDefect.logarithmicTailKernel_shift_summable;
- WeilDefect.farShellResponse_norm_le_logarithmic_kernel;
- WeilDefect.wd_t31_shell_aggregation;
- WeilDefect.zeroMomentResponseConstant;
- WeilDefect.rationalResponse_zero_moment_norm_le_inverse_square;
- WeilDefect.zeroMomentShellTerm;
- WeilDefect.farShellResponseData_of_zero_moment;
- WeilDefect.wd_t31_zero_moment_zero_count_far_tail.

The final theorem consumes the selected zero-moment law directly. WD-T27 gives
the pointwise inverse-square response bound on each sufficiently far
complementary zero; a uniformly bounded multiplier preserves that rate; the
imported logarithmic unit-shell zero-count premise supplies the shell
multiplicity bound. Lean then proves

```math
\left\|
\sum_{n\ge R}\mathcal S_n
\right\|
\le
AC\,\frac{\log R+2}{R},
```

with the constants explicitly assembled from the multiplier bound, selected
residue moments, and shell-count constant.

The imported part is exactly the source-pinned logarithmic unit-shell zero
count represented by $\texttt{ZetaLogShellCountData}$. It is not introduced
as a project axiom.

The generic shell aggregation first passed in CI run:

```math
\boxed{\texttt{36159321679}}.
```

The final zero-moment bridge and full WD-T31 target passed in:

```math
\boxed{\texttt{36160324368}}
```

at repository head:

```math
\boxed{\texttt{2e36689aba0b8825c6ed553ca04849fa6fd3f511}}.
```

The final theorem source blob is:

```math
\texttt{d0461bbf09d2928f43807abc8e347c36883f231b}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
the dedicated $\texttt{WeilDefect.Arithmetic.FarTail}$ build, and
unfinished-proof/project-axiom rejection.

WD-T31 is therefore closed.

## WD-T32 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T32: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.completedResponseLift;
- WeilDefect.iteratedDeriv_centered_power;
- WeilDefect.iteratedDeriv_centered_power_mul;
- WeilDefect.wd_t32_complementary_next_jet_identity;
- WeilDefect.nearComplementaryResponse;
- WeilDefect.weightedNearNextJetField;
- WeilDefect.wd_t32_weighted_near_next_jet_representation.

For a local multiplicity factorization

```math
\Xi(z)=(z-\mu)^m g(z),
\qquad g(\mu)\ne0,
```

Lean proves directly from the pinned iterated-derivative shift and Leibniz
rules that

```math
\Xi^{(m)}(\mu)=m!\,g(\mu),
```

and, for the completed lift $H=\Xi R$,

```math
H^{(m)}(\mu)=m!\,g(\mu)R(\mu).
```

The nonzero local factor therefore gives the exact quotient identity

```math
R(\mu)
=
\frac{H^{(m)}(\mu)}{\Xi^{(m)}(\mu)}.
```

Lean then substitutes this identity termwise over an arbitrary finite
complementary packet, certifying the ZW2-T4 weighted near next-jet
representation.

No project axiom or imported theorem premise is consumed by WD-T32. The local
factorization, smoothness, and nonvanishing conditions appear explicitly as
the mathematical hypotheses of the theorem.

Dedicated theorem CI passed in:

```math
\boxed{\texttt{36167018245}}
```

at repository head:

```math
\boxed{\texttt{c8d35dfef95e7e9989ca07faa5dbd531332c22ff}}.
```

The certified theorem source blob is:

```math
\texttt{df0d86d7c86f7b6ae8ae142f6a5018bacb65a0b6}.
```

The run passed pinned dependency resolution, mathlib cache retrieval, direct
Lake build of $\texttt{WeilDefect.Arithmetic.NextJet}$, and
unfinished-proof/project-axiom rejection.

WD-T33 is already independently Lean-certified.

## WD-T34 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T34: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.activePrimePowers;
- WeilDefect.wd_t34_active_prime_powers_finite;
- WeilDefect.activePrimePowerFinset;
- WeilDefect.mem_activePrimePowerFinset;
- WeilDefect.activePrimeTranslationShifts;
- WeilDefect.wd_t34_active_prime_translation_shifts_finite;
- WeilDefect.translateBy;
- WeilDefect.symmetricPrimeTranslation;
- WeilDefect.compactPrimeTranslationSum;
- WeilDefect.wd_t34_finite_prime_power_translations;
- WeilDefect.primePowerThreshold;
- WeilDefect.primePowerThreshold_subsingleton.

Lean first certifies directly that, for every fixed real support radius
$c$, the compact-window threshold condition

```math
\log n<2c
```

selects only finitely many natural prime powers.  The proof exponentiates the
support inequality and places every active index in one finite natural
interval.

The corresponding physical arithmetic shifts

```math
\{\pm\log n:
n\text{ prime-power active at }c\}
```

are therefore a finite set.  The module packages the arithmetic contribution
as an actual finite sum of scalar-weighted symmetric translations.

The exact threshold set

```math
\{n:
n\text{ prime power},\ \log n=2c\}
```

is also certified to be subsingleton, so a fixed support boundary can contain
at most one natural prime-power threshold event.

The identification of this threshold set as the prime part of the
compact-window Weil formula remains the source-pinned specialization recorded
in the theorem ledger; no external theorem is introduced as a project axiom
inside the Lean module.

The core theorem build first passed in:

```math
\boxed{\texttt{36168682600}}.
```

After correcting the finite operator helper so its arithmetic coefficient acts
by scalar multiplication, the final certificate run passed in:

```math
\boxed{\texttt{36168986069}}
```

at repository head:

```math
\boxed{\texttt{3bb1f99e923b0b80729144bb2eb8e374c7f15ade}}.
```

The final WD-T34 source blob is:

```math
\texttt{ed91ac08a670ae1405cb994b05d06065f5452b5b}.
```

The run passed pinned dependency resolution, mathlib cache retrieval, direct
Lake build of $\texttt{WeilDefect.Arithmetic.PrimeSupport}$, and
unfinished-proof/project-axiom rejection.

WD-T34 is therefore closed.

## WD-T35 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T35: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.logarithmicFourierWeight;
- WeilDefect.one_le_logarithmicFourierWeight;
- WeilDefect.logarithmicFourierEnergy;
- WeilDefect.spectralMass;
- WeilDefect.shiftedCompactWeilForm;
- WeilDefect.wd_t35_shifted_form_logarithmic_order;
- WeilDefect.wd_t35_compact_weil_logarithmic_form_order.

The canonical Fourier weight is represented exactly as

```math
w(t)=\log(e+|t|),
```

and Lean certifies $w(t)\ge1$ everywhere.

For a nonnegative spectral density, the imported compact-window specialization
is isolated into explicit hypotheses:

1. the shifted symbol comparison
   ```math
   a\,w(t)\le \Psi_c(t)+C\le b\,w(t);
   ```
2. the shifted geometric-form identity;
3. a nonnegative pole/evaluation contribution bounded by
   $K\|F\|_2^2$.

The symbol comparison is the source-pinned consequence of the digamma
asymptotic together with WD-T34 finite prime support. The geometric identity
is the source-pinned compact-window Weil formula. Neither is installed as a
project axiom.

Lean proves internally that spectral mass is bounded by logarithmic Fourier
energy, absorbs the pole term, and obtains the two-sided estimate

```math
a
\int_{\mathbb R}
\log(e+|t|)\,|F(t)|^2\,dt
\le
Q_c(f)+C\|f\|_2^2
```

and

```math
Q_c(f)+C\|f\|_2^2
\le
(b+K)
\int_{\mathbb R}
\log(e+|t|)\,|F(t)|^2\,dt.
```

All integration is explicitly against Lebesgue volume; no ambient measure
instance is left implicit.

Dedicated theorem CI passed in:

```math
\boxed{\texttt{36171526106}}
```

at repository head:

```math
\boxed{\texttt{37b89dd60cfe1963abc58c04c6113319fea383c1}}.
```

The certified WD-T35 source blob is:

```math
\texttt{ae932d4f3f7e4d6d06dbd778a5708927172238dc}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
direct Lake build of $\texttt{WeilDefect.Arithmetic.LogarithmicForm}$,
rebuilding WD-T34, and unfinished-proof/project-axiom rejection.

WD-T35 is therefore closed.

## WD-T36 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T36: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.positiveSobolevFrequencyWeight;
- WeilDefect.logarithmicFourierWeight_isBigO_log;
- WeilDefect.logarithmicFourierWeight_isLittleO_positiveSobolev;
- WeilDefect.positiveSobolevFrequencyWeight_not_isBigO_logarithmic;
- WeilDefect.wd_t36_no_uniform_positive_sobolev_coercivity_of_witness;
- WeilDefect.wd_t36_no_positive_sobolev_bootstrap;
- WeilDefect.finitePrimeTrigCorrection;
- WeilDefect.finitePrimeTrigBound;
- WeilDefect.finitePrimeTrigBound_nonneg;
- WeilDefect.abs_finitePrimeTrigCorrection_le;
- WeilDefect.finitePrimeTrigCorrection_isBigO_logarithmic;
- WeilDefect.logarithmicPlusFinitePrimeCorrection_isBigO;
- WeilDefect.wd_t36_finite_prime_translations_add_no_smoothing.

For every $\varepsilon>0$, Lean certifies the asymptotic separation

```math
\log(e+|N|)
=
o\!\left(N^{2\varepsilon}\right),
```

in the precise Landau sense needed for the squared positive-Sobolev frequency
weight. Consequently,

```math
N^{2\varepsilon}
\not=
O\!\left(\log(e+|N|)\right).
```

The witness-transfer theorem then proves that any fixed-support oscillatory
family satisfying the canonical growth inputs

```math
\text{shifted Weil-form energy}
=
O(\log(e+N))
```

and

```math
N^{2\varepsilon}
=
O(\text{Sobolev energy})
```

cannot obey a uniform positive-Sobolev coercive estimate.

The concrete compact-support construction
$f_N(x)=\phi(x)\cos(Nx)$, together with its Fourier concentration
asymptotics, is not separately rebuilt in the current Lean corpus. Those
standard witness asymptotics are therefore the explicit premise represented
by the transfer theorem, which is why WD-T36 receives the
LEAN-CERTIFIED-FROM-IMPORTED-PREMISE label rather than an unconditional
physical-space certification.

The finite-arithmetic clause is kernel-checked internally. For every fixed
WD-T34 active prime set and coefficient family, Lean defines the finite cosine
correction

```math
P_c(t)
=
\sum_{n\in S_c}
a_n\cos(t\log n)
```

and proves

```math
|P_c(t)|
\le
\sum_{n\in S_c}|a_n|.
```

Hence

```math
P_c
=
O\!\left(\log(e+|t|)\right)
```

and even

```math
\log(e+|t|)+P_c(t)
=
O\!\left(\log(e+|t|)\right).
```

Thus the finitely many prime translations do not raise the principal order and
cannot repair the positive-Sobolev mismatch.

The core asymptotic obstruction first passed in CI run:

```math
\boxed{\texttt{36176761127}}.
```

The completed WD-T36 target, including the finite-prime order-zero clause,
passed in:

```math
\boxed{\texttt{36177620078}}
```

at repository head:

```math
\boxed{\texttt{ad575eded95f8b50e05aca512611f4f6db9cc190}}.
```

The final WD-T36 source blob is:

```math
\texttt{57153cd26db57d683b5603913e9c1ace42ca8035}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
direct Lake build of $\texttt{WeilDefect.Arithmetic.NoSobolevBootstrap}$,
the WD-T34/WD-T35 dependencies, and unfinished-proof/project-axiom rejection.

WD-T36 is therefore closed.

## WD-T37 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T37: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.SelectedSourceData;
- WeilDefect.wd_t37_selected_source_zero_moment_of_wd_t26;
- WeilDefect.wd_t37_selected_source_nonzero_of_wd_t26;
- WeilDefect.wd_t37_p3_n1_endpoint_ray;
- WeilDefect.wd_t37_p3_n2_normalized_representative_blowup;
- WeilDefect.wd_t37_p3_n3_normalized_full_negativity;
- WeilDefect.wd_t37_p3_n4_zero_moment_source_far_decay;
- WeilDefect.wd_t37_p3_n5_far_localization;
- WeilDefect.wd_t37_p3_n6_weighted_next_jet_morphology;
- WeilDefect.wd_t37_p3_n7_no_adaptive_scalar_bypass;
- WeilDefect.NegativeArithmeticMorphology;
- WeilDefect.NegativeDefectMorphology;
- WeilDefect.wd_t37_fixed_packet_persistent_negative_morphology.

Lean now packages the complete conditional negative morphology from persistent
selected negativity through endpoint persistence, normalized representative
blow-up, full-Weil negativity, selected raw-residue formation, inverse-square
far decay, quantitative far localization, weighted completed-Xi next-jet
morphology, and no adaptive scalar bypass.

The final residue-custody repair is load-bearing. SelectedSourceData no longer
stores a free zero-moment proof. The composite constructor instead receives
the negative-pair coefficient specialization and requires the exact identity

```math
\operatorname{List.ofFn}(v)
=
\operatorname{rawResiduesOfNegativePairs}(x).
```

Lean derives both zero moment and source nontriviality from the certified
WD-T26 raw-residue lemmas before WD-T27 or WD-T31 can be applied. The output
package retains this equality and the nonzero pair-coefficient witness, so the
source cannot be replaced by an unrelated zero-moment look-alike.

The only imported analytic-number-theory premise inherited by the arithmetic
localization is the logarithmic unit-shell zero-count interface
$\texttt{ZetaLogShellCountData}$ already isolated in WD-T31. No imported
result is installed as a project axiom.

The composite intentionally contains no actual-zeta exclusion field. Its exact
formal stop remains

```math
\boxed{\texttt{AZ-NEXTJET-LOC}}.
```

The data-valued endpoint-package repair first passed pinned CI in:

```math
\boxed{\texttt{36182014916}}.
```

The completed residue-custody target passed in:

```math
\boxed{\texttt{36182444478}}
```

at repository head:

```math
\boxed{\texttt{144bef98b0f66dd7f6f82eb523c06c8eec85479e}}.
```

The certified WD-T37 source blob is:

```math
\texttt{ff0bae40f6aba4c04a8d3fd75a8fe309f8ea79ae}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
direct Lake build of $\texttt{WeilDefect.Morphology.Negative}$, and
unfinished-proof/project-axiom rejection.

WD-T37 is therefore closed.

## WD-T38 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T38: LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

Formal declarations include:

- WeilDefect.wd_t38_p3_u1_fixed_packet_critical_dichotomy;
- WeilDefect.wd_t38_attained_neutral_selected_coordinate_nonzero;
- WeilDefect.rightLimitPrimePowers;
- WeilDefect.wd_t38_p3_u3_right_limit_prime_decomposition;
- WeilDefect.wd_t38_p3_u3_right_limit_prime_support_finite;
- WeilDefect.wd_t38_p3_u4_logarithmic_order_neutral_carrier;
- WeilDefect.wd_t38_p3_u5_no_free_positive_sobolev_control;
- WeilDefect.wd_t38_p3_u5_finite_prime_translations_no_smoothing;
- WeilDefect.wd_t38_p3_u6_global_cancellation_not_termwise;
- WeilDefect.neutralNegativeSynthesis;
- WeilDefect.neutralWeilOperator;
- WeilDefect.wd_t38_p3_u2_negative_adjoint_identity;
- WeilDefect.wd_t38_p3_u2_physical_neutral_null_mode;
- WeilDefect.NeutralNullExtensionInterface;
- WeilDefect.NeutralNullExtensionInterface.persistenceGoal;
- WeilDefect.wd_t38_p3_u7_neutral_null_extension_reduction;
- WeilDefect.NeutralArithmeticMorphology;
- WeilDefect.wd_t38_neutral_arithmetic_morphology;
- WeilDefect.NeutralDefectMorphology;
- WeilDefect.wd_t38_attained_unit_gain_neutral_morphology.

The composite preserves the audited attained-neutral branch distinction from
WD-T17. In particular, the retained selected coordinate is explicitly proved
nonzero from the neutral branch equations rather than left as an implicit
custody fact.

For the finite-exception realization, Lean proves

```math
C^\ast C u=u,\qquad Cu=P^\ast k,\qquad N=-PC
```

implies

```math
N^\ast k=-u
```

and therefore

```math
(PP^\ast-NN^\ast)k=0,
\qquad k\ne0.
```

The arithmetic continuation is threshold-aware. Lean defines the strict
right-limit prime support by

```math
\{n:\operatorname{IsPrimePow}(n),\ \log n\le 2c\}
```

and proves it is exactly the endpoint strict-active set
$\log n<2c$ union the equality-threshold set. The latter is subsingleton, so
the strict-right correction is finite and contains at most one natural prime
power.

The logarithmic-order and no-bootstrap clauses are transferred from WD-T35 and
WD-T36 with their hypotheses preserved. Consequently WD-T38 inherits the
source-pinned compact-window formula/symbol-comparison premise from WD-T35,
which is why the composite receives
LEAN-CERTIFIED-FROM-IMPORTED-PREMISE rather than an unconditional label.

The global-cancellation scope theorem remains purely logical: a zero total
cancellation does not imply termwise vanishing. No prime, pole, or
archimedean term is separately forced to vanish.

Most importantly, the null-extension endpoint is represented as a typed open
interface. It records:

- the nonzero zero-extended fixed vector;
- distinct endpoint and strict-right operators;
- the endpoint interior null equation;
- equality of endpoint/right-limit operators only under the explicit
  no-threshold carrier-identification premise;
- finite right-limit prime support and subsingleton threshold support.

The unresolved statement

```math
\texttt{NeutralNullExtensionInterface.persistenceGoal}
```

is deliberately a proposition attached to the returned data, not a field
proved by WD-T38. Thus no support-rigidity or unique-continuation theorem is
silently imported upstream.

The assembled composite first passed pinned CI in:

```math
\boxed{\texttt{36187216321}}
```

at repository head:

```math
\boxed{\texttt{ec71653408d8254844039f851cab429d5c32ebb9}}.
```

The final selected-coordinate custody refinement passed in:

```math
\boxed{\texttt{36187705896}}
```

at repository head:

```math
\boxed{\texttt{1d09fa5c85b1a5970376db5adcda0c1b0872da75}}.
```

The certified WD-T38 source blob is:

```math
\texttt{2f6f05486f61fd8be18d444f9ef1e2bde5ae1abd}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
direct Lake build of $\texttt{WeilDefect.Morphology.Neutral}$, and
unfinished-proof/project-axiom rejection.

WD-T38 is therefore closed.

## WD-T39 certificate evidence

Stable ID:

```math
\boxed{
\text{WD-T39: LEAN-CERTIFIED}.
}
```

Formal declarations include:

- WeilDefect.FullNegativeSpace;
- WeilDefect.fullNegativeCoeff;
- WeilDefect.fullCoeff;
- WeilDefect.fullJValue;
- WeilDefect.wd_t39_p3_b1_anchored_mass;
- WeilDefect.FullCoordinateExhaustion;
- WeilDefect.wd_t39_p3_b2_full_coordinate_escape_weak_zero;
- WeilDefect.wd_t39_p3_b3_fixed_packet_custody;
- WeilDefect.normEscapeSubsequence;
- WeilDefect.wd_t39_p3_b4_norm_escape_of_unbounded;
- WeilDefect.BoundedBackgroundRegime;
- WeilDefect.wd_t39_p3_b4_bounded_background_dichotomy;
- WeilDefect.BackgroundCompactnessRegime;
- WeilDefect.wd_t39_p3_b4_background_compactness_trichotomy;
- WeilDefect.wd_t39_p3_b5_fixed_selected_ray_stability;
- WeilDefect.wd_t39_p3_b6_fixed_full_divisor_negative_weak_limit;
- WeilDefect.wd_t39_p3_b7_finite_shadow_separation;
- WeilDefect.NoncompactDefectMorphology;
- WeilDefect.wd_t39_noncompact_background_morphology.

The full-carrier escape theorem uses a self-adjoint finite-coordinate exhaustion
converging strongly to the identity. If every fixed full-coordinate block
vanishes on a uniformly bounded sequence, Lean proves that the entire
coefficient sequence converges weakly to zero. The exhaustion is explicitly
on the full carrier, preserving composite correction B-1.

For one fixed finite selected packet, any frequently retained positive amount
of selected negative norm admits a strongly convergent subsequence with
nonzero selected limit. Thus the moving/full-carrier escape species is kept
separate from fixed-packet custody.

For the unselected background, Lean certifies the complete subsequential
classification:

```math
\boxed{
\text{norm escape}
\;\vee\;
\text{bounded weak/tail escape}
\;\vee\;
\text{strong background compactness}.
}
```

The norm-escape arm is constructed explicitly from failure of every uniform
norm bound. In the bounded case, weak compactness plus a convergent norm-square
subsequence gives either positive weak norm loss or, at equality, strong
convergence.

The fixed selected negative ray remains nonzero and strictly negative after
any bounded background weak limit. In the strong-background regime the entire
negative sector converges strongly, while the positive coordinate is retained
only weakly unless an additional positive-coordinate compactness hypothesis is
supplied. This preserves composite correction B-2.

Finite positive shadows preserve the algebraic selected negative margin but
retain a separate graph-admissibility condition, so no background compactness
is inferred from a finite positive projection.

WD-T39 introduces no imported analytic-number-theory premise and no new
RH-facing interface. The assembled universal morphology packages the audited
branch theorems separately rather than asserting that one sequence
simultaneously realizes incompatible compactness species.

The complete core/trichotomy checkpoint passed pinned CI in:

```math
\boxed{\texttt{36190887350}}.
```

The final assembled WD-T39 target passed in:

```math
\boxed{\texttt{36191325215}}
```

at repository head:

```math
\boxed{\texttt{9f883eef5ec8cee9c8fd092576a5e0fff3326872}}.
```

The certified WD-T39 source blob is:

```math
\texttt{f5b029598b0b80c5fc8ef292a858bb63d9c3a076}.
```

The final run passed pinned dependency resolution, mathlib cache retrieval,
direct Lake build of $\texttt{WeilDefect.Morphology.Noncompact}$, and
unfinished-proof/project-axiom rejection.

WD-T39 is therefore closed. The next unfinished stable formalization cursor is:

```math
\boxed{
\texttt{WD-X02 / CRITICAL SCREENING WITHOUT AN ATTAINED NEUTRAL VECTOR}
}
```


## WD-X02 certificate evidence

Stable ID:

```math
\boxed{\text{WD-X02: LEAN-CERTIFIED}.}
```

Lean certifies an explicit diagonal $\ell^2(\mathbb N;\mathbb C)$ realization
of the same critical nonattainment geometry as the canonical
$L^2(0,1)$ multiplication-by-$t$ witness in the audit document.

The coordinate gains are

```math
r_n=1-\frac1{n+2},
\qquad
0\le r_n<1,
\qquad
r_n\to1.
```

The induced coordinatewise operator $X$ satisfies

```math
\boxed{\|X\|=1}
```

while every nonzero vector obeys

```math
\boxed{\|Xf\|<\|f\|}.
```

Thus the critical operator norm is not attained by any nonzero vector.
At the same time the standard basis vectors are unit vectors and satisfy

```math
\|Xe_n\|=r_n\to1,
```

so the associated critical defect can be made arbitrarily small without an
actual neutral vector.

This is exactly the sharpness role required by WD-X02:

```math
\|X\|=1
\not\Rightarrow
\text{norm attainment / actual neutrality}
```

in infinite dimension.

Certificate run:

```math
\boxed{\texttt{36193606439}}
```

at repository head:

```math
\boxed{\texttt{e29b843f20125f4a43152459b9c77a4bb60f8f1b}}.
```

The certified source blob is:

```math
\texttt{eb98e663282551b1dfede47f148132d93051d079}.
```

The run passed pinned dependency resolution, direct Lake build of
$\texttt{WeilDefect.Examples.CriticalNonattainment}$, and the
unfinished-proof/project-axiom rejection gate.

WD-X02 is therefore closed. The next unfinished stable example cursor is:

```math
\boxed{\texttt{WD-X05 / MOVING SECTORS CAN LOSE EVERY PERSISTENT RAY}}
```


## WD-X05 certificate evidence

Stable ID:

```math
\boxed{\text{WD-X05: LEAN-CERTIFIED}.}
```

Lean certifies an explicit moving-sector witness on
$\ell^2(\mathbb N)\oplus\ell^2(\mathbb N)$. For

```math
\delta_n=\frac1{n+2},
```

the positive and negative amplitudes are chosen with squared norms

```math
\|a_n\|^2=\frac{1-\delta_n}{2},
\qquad
\|u_n\|^2=\frac{1+\delta_n}{2}.
```

Hence every coefficient vector is normalized,

```math
\boxed{\|y_n\|=1},
```

while its Krein signature is exactly

```math
\boxed{[y_n,y_n]_J=-\delta_n<0},
\qquad
[y_n,y_n]_J\to0.
```

The moving-sector custody is encoded by nested coordinate-tail predicates
$\texttt{wdX05Tail}\,N$. Lean proves

```math
N\le k \Longrightarrow y_k\in \texttt{wdX05Tail}\,N
```

and, crucially,

```math
\boxed{
\left(\forall N,\ y\in\texttt{wdX05Tail}\,N\right)
\Longrightarrow y=0.
}
```

Thus stagewise finite-dimensional negative directions can move through
infinitely many coordinates while the total nested intersection loses every
nonzero persistent ray. This is the exact sharpness role of WD-X05 for the
fixed-sector hypothesis in WD-T16/WD-T17 and for the moving/full-coordinate
escape side of WD-T39.

Certificate run:

```math
\boxed{\texttt{36196053927}}
```

at theorem head:

```math
\boxed{\texttt{a1fe7296738e48065c1e393723bf22b251c9728e}}.
```

Certified source blob:

```math
\texttt{e51c450d99e35d59e56ffc5803dc48ad9654302b}.
```

The run passed pinned dependency resolution, direct Lake build of
$\texttt{WeilDefect.Examples.MovingSectors}$, and the
unfinished-proof/project-axiom rejection gate.

WD-X05 is therefore closed. The next unfinished stable example cursor is:

```math
\boxed{
\texttt{WD-X06 / POSITIVE-COORDINATE MASS LOSS STRENGTHENS CRITICALITY TO NEGATIVITY}
}
```


## WD-X06 certificate evidence

Stable ID:

```math
\boxed{\text{WD-X06: LEAN-CERTIFIED}.}
```

Lean certifies the critical weak-fall-through witness on
$\ell^2(\mathbb N)\oplus\mathbb C$.

For

```math
y_n=\left(\frac1{\sqrt2}e_n,\frac1{\sqrt2}\right),
```

the formal witness satisfies

```math
\boxed{\|y_n\|=1}
\qquad
\boxed{[y_n,y_n]_J=0}
```

for every $n$. Lean also proves the standard-basis weak convergence

```math
e_n\rightharpoonup0
```

directly from the $\ell^2$ coordinate square-summability identity. Therefore

```math
y_n\rightharpoonup
y=\left(0,\frac1{\sqrt2}\right).
```

The limit has exact signature

```math
\boxed{[y,y]_J=-\frac12<0}.
```

Thus WD-X06 formally realizes the negative-fall-through branch of WD-T17:
positive-coordinate mass can disappear under weak convergence while the
selected negative coordinate remains fixed, strengthening criticality to
strict negativity.

Certificate run:

```math
\boxed{\texttt{36196899652}}
```

at theorem head:

```math
\boxed{\texttt{39353ab8185c99959481c334aa67d42c88e8f859}}.
```

Certified source blob:

```math
\texttt{746b1d4716e72a0f607c38c8412d61771d9acae2}.
```

The run passed pinned dependency resolution, direct Lake build of
$\texttt{WeilDefect.Examples.WeakCriticalFallthrough}$, and the
unfinished-proof/project-axiom rejection gate.

WD-X06 is therefore closed.

All stable Horizon-1 theorem/example rows now have durable final Lean states.
Accordingly:

```math
\boxed{\texttt{LEAN-H1 EXHAUSTED}}
```

The next project cursor is recorded, but no H1-P5 work has been started:

```math
\boxed{\texttt{H1-P5.0 / PUBLIC PACKAGE ARCHITECTURE}}
```
