import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Order.Filter.AtTopBot.Archimedean
import Mathlib.Tactic

namespace WeilDefect

open Filter
open scoped Topology

/-- Squared positive-channel weight used in WD-X01, indexed from zero. -/
noncomputable def wdX01WeightSq (j : ℕ) : ℝ :=
  1 / (((j : ℝ) + 1) * ((j : ℝ) + 2))

/-- The WD-X01 weights telescope. -/
theorem wd_x01_weight_sq_telescope (j : ℕ) :
    wdX01WeightSq j
      = 1 / ((j : ℝ) + 1) - 1 / ((j : ℝ) + 2) := by
  have h₁ : (j : ℝ) + 1 ≠ 0 := by positivity
  have h₂ : (j : ℝ) + 2 ≠ 0 := by positivity
  unfold wdX01WeightSq
  field_simp [h₁, h₂]
  ring

/-- Exact partial-sum formula for the positive screening budget in WD-X01. -/
theorem wd_x01_partial_sum (N : ℕ) :
    (Finset.range N).sum wdX01WeightSq
      = 1 - 1 / ((N : ℝ) + 1) := by
  induction N with
  | zero =>
      norm_num
  | succ N ih =>
      rw [Finset.sum_range_succ, ih, wd_x01_weight_sq_telescope]
      norm_num [Nat.cast_succ]
      ring

/-- Every finite truncation in WD-X01 is strictly negative. -/
theorem wd_x01_finite_defect_negative (N : ℕ) :
    (Finset.range N).sum wdX01WeightSq - 1 < 0 := by
  rw [wd_x01_partial_sum]
  have hden : 0 < (N : ℝ) + 1 := by positivity
  have hinv : 0 < 1 / ((N : ℝ) + 1) := one_div_pos.mpr hden
  linarith

/-- The exact finite defect is (-1/(N+1)). -/
theorem wd_x01_finite_defect_formula (N : ℕ) :
    (Finset.range N).sum wdX01WeightSq - 1
      = -1 / ((N : ℝ) + 1) := by
  rw [wd_x01_partial_sum]
  ring

/-- WD-X01: the finite negative defects converge to zero. -/
theorem wd_x01_defect_tendsto_zero :
    Tendsto (fun N : ℕ => -1 / ((N : ℝ) + 1)) atTop (𝓝 0) := by
  have hden :
      Tendsto (fun N : ℕ => (N : ℝ) + 1) atTop atTop :=
    tendsto_atTop_add_const_right _ _ tendsto_natCast_atTop_atTop
  have hinv :
      Tendsto (fun N : ℕ => (((N : ℝ) + 1)⁻¹)) atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp hden
  simpa [div_eq_mul_inv] using hinv.neg

end WeilDefect
