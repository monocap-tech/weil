import Mathlib.Analysis.Normed.Lp.lpHolder
import Mathlib.Tactic

namespace WeilDefect

noncomputable section

open Filter
open scoped Topology ENNReal lp

/-- The coordinate gains for the WD-X02 discrete critical-screening witness. -/
noncomputable def wdX02Weight (n : ℕ) : ℝ :=
  1 - 1 / ((n : ℝ) + 2)

theorem wd_x02_weight_nonneg (n : ℕ) :
    0 ≤ wdX02Weight n := by
  unfold wdX02Weight
  have hden : 0 < (n : ℝ) + 2 := by positivity
  have hinv : 1 / ((n : ℝ) + 2) ≤ 1 := by
    exact (div_le_one hden).2 (by linarith)
  linarith

theorem wd_x02_weight_lt_one (n : ℕ) :
    wdX02Weight n < 1 := by
  unfold wdX02Weight
  have hden : 0 < (n : ℝ) + 2 := by positivity
  have hinv : 0 < 1 / ((n : ℝ) + 2) := one_div_pos.mpr hden
  linarith

theorem wd_x02_weight_tendsto_one :
    Tendsto wdX02Weight atTop (𝓝 1) := by
  have hden :
      Tendsto (fun n : ℕ => (n : ℝ) + 2) atTop atTop :=
    tendsto_atTop_add_const_right _ _ tendsto_natCast_atTop_atTop
  have hinv :
      Tendsto (fun n : ℕ => (((n : ℝ) + 2)⁻¹)) atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp hden
  have hone :
      Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1) :=
    tendsto_const_nhds
  change
    Tendsto (fun n : ℕ => wdX02Weight n) atTop (𝓝 1)
  simpa [wdX02Weight] using hone.sub hinv

/--
The Hilbert carrier used for the discrete WD-X02 realization.

This is the diagonal ℓ² model of the same non-attained critical geometry as
the canonical L²(0,1) multiplication-by-t witness in the audit document.
-/
abbrev WDX02Space :=
  lp (fun _ : ℕ => ℂ) 2

/-- Coordinatewise scalar contraction with gain approaching one. -/
noncomputable def wdX02Coord (n : ℕ) : ℂ →L[ℂ] ℂ :=
  (wdX02Weight n : ℂ) • ContinuousLinearMap.id ℂ ℂ

theorem wd_x02_coord_norm_le_one (n : ℕ) :
    ‖wdX02Coord n‖ ≤ 1 := by
  have h0 := wd_x02_weight_nonneg n
  have h1 := (wd_x02_weight_lt_one n).le
  simp [wdX02Coord, norm_smul, abs_of_nonneg h0, h1]

/-- The infinite-dimensional critical screening operator. -/
noncomputable def wdX02Operator : WDX02Space →L[ℂ] WDX02Space :=
  lp.mapCLM 2 wdX02Coord zero_le_one wd_x02_coord_norm_le_one

theorem wd_x02_operator_norm_le_one :
    ‖wdX02Operator‖ ≤ 1 := by
  exact lp.norm_mapCLM_le
    2 wdX02Coord zero_le_one wd_x02_coord_norm_le_one


theorem wd_x02_operator_apply
    (x : WDX02Space) (n : ℕ) :
    (wdX02Operator x) n = (wdX02Weight n : ℂ) * x n := by
  rfl

theorem wd_x02_operator_single
    (n : ℕ) :
    wdX02Operator (lp.single 2 n (1 : ℂ))
      =
    lp.single 2 n (wdX02Weight n : ℂ) := by
  ext i
  by_cases h : n = i
  · subst i
    simp [wd_x02_operator_apply, lp.single_apply]
  · simp [wd_x02_operator_apply, lp.single_apply, h]

theorem wd_x02_operator_single_norm
    (n : ℕ) :
    ‖wdX02Operator (lp.single 2 n (1 : ℂ))‖ = wdX02Weight n := by
  rw [wd_x02_operator_single]
  have hsingle :=
    lp.norm_single
      (E := fun _ : ℕ => ℂ)
      (p := (2 : ℝ≥0∞))
      (by norm_num : (0 : ℝ≥0∞) < 2)
      n (wdX02Weight n : ℂ)
  simpa [wd_x02_weight_nonneg n, abs_of_nonneg] using hsingle

theorem wd_x02_weight_le_operator_norm (n : ℕ) :
    wdX02Weight n ≤ ‖wdX02Operator‖ := by
  let e : WDX02Space :=
    lp.single (E := fun _ : ℕ => ℂ) 2 n (1 : ℂ)
  have he : ‖e‖ = 1 := by
    dsimp [e]
    simpa using
      (lp.norm_single
        (E := fun _ : ℕ => ℂ)
        (p := (2 : ℝ≥0∞))
        (by norm_num : (0 : ℝ≥0∞) < 2)
        n (1 : ℂ))
  have hTe :
      ‖wdX02Operator e‖ = wdX02Weight n := by
    dsimp [e]
    exact wd_x02_operator_single_norm n
  calc
    wdX02Weight n = ‖wdX02Operator e‖ := hTe.symm
    _ ≤ ‖wdX02Operator‖ * ‖e‖ :=
      wdX02Operator.le_opNorm e
    _ = ‖wdX02Operator‖ := by rw [he, mul_one]

theorem wd_x02_operator_norm_eq_one :
    ‖wdX02Operator‖ = 1 := by
  apply le_antisymm wd_x02_operator_norm_le_one
  exact le_of_tendsto_of_tendsto'
    wd_x02_weight_tendsto_one
    (tendsto_const_nhds :
      Tendsto (fun _ : ℕ => ‖wdX02Operator‖) atTop
        (𝓝 ‖wdX02Operator‖))
    wd_x02_weight_le_operator_norm



theorem wd_x02_operator_coord_norm
    (x : WDX02Space) (n : ℕ) :
    ‖(wdX02Operator x) n‖
      = wdX02Weight n * ‖x n‖ := by
  rw [wd_x02_operator_apply, norm_mul]
  simp [wd_x02_weight_nonneg]

theorem wd_x02_operator_coord_sq_le
    (x : WDX02Space) (n : ℕ) :
    ‖(wdX02Operator x) n‖ ^ (2 : ℝ)
      ≤ ‖x n‖ ^ (2 : ℝ) := by
  rw [wd_x02_operator_coord_norm, Real.rpow_two, Real.rpow_two]
  have hw0 := wd_x02_weight_nonneg n
  have hw1 := (wd_x02_weight_lt_one n).le
  have hw2 : wdX02Weight n ^ 2 ≤ 1 := by
    nlinarith
  calc
    (wdX02Weight n * ‖x n‖) ^ 2
        = wdX02Weight n ^ 2 * ‖x n‖ ^ 2 := by ring
    _ ≤ 1 * ‖x n‖ ^ 2 :=
      mul_le_mul_of_nonneg_right hw2 (sq_nonneg _)
    _ = ‖x n‖ ^ 2 := one_mul _

theorem wd_x02_operator_coord_sq_lt
    (x : WDX02Space) (n : ℕ)
    (hx0 : x n ≠ 0) :
    ‖(wdX02Operator x) n‖ ^ (2 : ℝ)
      < ‖x n‖ ^ (2 : ℝ) := by
  rw [wd_x02_operator_coord_norm, Real.rpow_two, Real.rpow_two]
  have hw0 := wd_x02_weight_nonneg n
  have hw1 := wd_x02_weight_lt_one n
  have hw2 : wdX02Weight n ^ 2 < 1 := by
    nlinarith
  have hx : 0 < ‖x n‖ := norm_pos_iff.mpr hx0
  have hx2 : 0 < ‖x n‖ ^ 2 := sq_pos_of_pos hx
  calc
    (wdX02Weight n * ‖x n‖) ^ 2
        = wdX02Weight n ^ 2 * ‖x n‖ ^ 2 := by ring
    _ < 1 * ‖x n‖ ^ 2 :=
      mul_lt_mul_of_pos_right hw2 hx2
    _ = ‖x n‖ ^ 2 := one_mul _

theorem wd_x02_nonzero_has_coordinate
    (x : WDX02Space) (hx : x ≠ 0) :
    ∃ n : ℕ, x n ≠ 0 := by
  by_contra h
  push Not at h
  apply hx
  ext n
  simpa using h n

theorem wd_x02_strict_norm_loss
    (x : WDX02Space) (hx : x ≠ 0) :
    ‖wdX02Operator x‖ < ‖x‖ := by
  rcases wd_x02_nonzero_has_coordinate x hx with ⟨i, hi⟩
  have hsummable :
      Summable (fun n : ℕ => ‖x n‖ ^ (2 : ℝ)) :=
    (lp.hasSum_norm (p := (2 : ℝ≥0∞)) (by norm_num) x).summable
  have hsum :
      (∑' n : ℕ, ‖(wdX02Operator x) n‖ ^ (2 : ℝ))
        <
      ∑' n : ℕ, ‖x n‖ ^ (2 : ℝ) := by
    exact Summable.tsum_lt_tsum_of_nonneg
      (fun n => Real.rpow_nonneg (norm_nonneg _) _)
      (fun n => wd_x02_operator_coord_sq_le x n)
      (wd_x02_operator_coord_sq_lt x i hi)
      hsummable
  have hnormTx :
      ‖wdX02Operator x‖ ^ (2 : ℝ)
        =
      ∑' n : ℕ, ‖(wdX02Operator x) n‖ ^ (2 : ℝ) := by
    simpa using
      (lp.norm_rpow_eq_tsum
        (p := (2 : ℝ≥0∞))
        (by norm_num)
        (wdX02Operator x))
  have hnormX :
      ‖x‖ ^ (2 : ℝ)
        =
      ∑' n : ℕ, ‖x n‖ ^ (2 : ℝ) := by
    simpa using
      (lp.norm_rpow_eq_tsum
        (p := (2 : ℝ≥0∞))
        (by norm_num)
        x)
  have hsq :
      ‖wdX02Operator x‖ ^ (2 : ℝ) < ‖x‖ ^ (2 : ℝ) := by
    calc
      ‖wdX02Operator x‖ ^ (2 : ℝ)
          = ∑' n : ℕ, ‖(wdX02Operator x) n‖ ^ (2 : ℝ) := hnormTx
      _ < ∑' n : ℕ, ‖x n‖ ^ (2 : ℝ) := hsum
      _ = ‖x‖ ^ (2 : ℝ) := hnormX.symm
  rw [Real.rpow_two, Real.rpow_two] at hsq
  exact
    (sq_lt_sq₀
      (norm_nonneg (wdX02Operator x))
      (norm_nonneg x)).mp hsq

theorem wd_x02_no_nonzero_norm_attainer :
    ¬ ∃ x : WDX02Space, x ≠ 0 ∧ ‖wdX02Operator x‖ = ‖x‖ := by
  rintro ⟨x, hx, heq⟩
  exact (ne_of_lt (wd_x02_strict_norm_loss x hx)) heq

/--
WD-X02 discrete critical screening witness:
the contraction has norm exactly one, every nonzero vector loses norm
strictly, while standard basis directions approach the critical value.
-/
theorem wd_x02_critical_nonattainment :
    ‖wdX02Operator‖ = 1
      ∧ (∀ x : WDX02Space, x ≠ 0 →
          ‖wdX02Operator x‖ < ‖x‖)
      ∧ Tendsto
          (fun n : ℕ =>
            ‖wdX02Operator (lp.single 2 n (1 : ℂ))‖)
          atTop (𝓝 1) := by
  refine ⟨wd_x02_operator_norm_eq_one, wd_x02_strict_norm_loss, ?_⟩
  convert wd_x02_weight_tendsto_one using 1
  funext n
  exact wd_x02_operator_single_norm n


end

end WeilDefect
