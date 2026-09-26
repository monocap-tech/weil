import WeilDefect.Filtration.FiniteNegativeSector
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.Tactic

namespace WeilDefect

noncomputable section

open Filter
open scoped Topology ENNReal lp InnerProduct

abbrev WDX06Positive :=
  lp (fun _ : ℕ => ℂ) 2

abbrev WDX06Carrier :=
  WeilDefect.WDT16.CoeffSpace WDX06Positive ℂ

def wdX06Amp : ℝ :=
  Real.sqrt (1 / 2)

theorem wd_x06_amp_nonneg :
    0 ≤ wdX06Amp := by
  unfold wdX06Amp
  exact Real.sqrt_nonneg _

theorem wd_x06_amp_pos :
    0 < wdX06Amp := by
  unfold wdX06Amp
  exact Real.sqrt_pos.2 (by norm_num)

theorem wd_x06_amp_sq :
    wdX06Amp ^ 2 = 1 / 2 := by
  unfold wdX06Amp
  exact Real.sq_sqrt (by norm_num)

def wdX06Pos (n : ℕ) : WDX06Positive :=
  lp.single (E := fun _ : ℕ => ℂ) 2 n (wdX06Amp : ℂ)

def wdX06Neg : ℂ :=
  (wdX06Amp : ℂ)

def wdX06Vector (n : ℕ) : WDX06Carrier :=
  WeilDefect.WDT16.coeff (wdX06Pos n) wdX06Neg

def wdX06Limit : WDX06Carrier :=
  WeilDefect.WDT16.coeff (0 : WDX06Positive) wdX06Neg

theorem wd_x06_pos_norm (n : ℕ) :
    ‖wdX06Pos n‖ = wdX06Amp := by
  unfold wdX06Pos
  have hsingle :=
    lp.norm_single
      (E := fun _ : ℕ => ℂ)
      (p := (2 : ℝ≥0∞))
      (by norm_num : (0 : ℝ≥0∞) < 2)
      n (wdX06Amp : ℂ)
  simpa [wd_x06_amp_nonneg, abs_of_nonneg] using hsingle

theorem wd_x06_neg_norm :
    ‖wdX06Neg‖ = wdX06Amp := by
  simp [wdX06Neg, wd_x06_amp_nonneg, abs_of_nonneg]

theorem wd_x06_vector_norm_eq_one (n : ℕ) :
    ‖wdX06Vector n‖ = 1 := by
  have hsq :
      ‖wdX06Vector n‖ ^ 2 = 1 := by
    rw [WithLp.prod_norm_sq_eq_of_L2]
    simp only [wdX06Vector, WeilDefect.WDT16.coeff_fst,
      WeilDefect.WDT16.coeff_snd]
    rw [wd_x06_pos_norm, wd_x06_neg_norm, wd_x06_amp_sq]
    ring
  nlinarith [norm_nonneg (wdX06Vector n)]

theorem wd_x06_vector_critical (n : ℕ) :
    WeilDefect.WDT16.jValue (wdX06Pos n) wdX06Neg = 0 := by
  unfold WeilDefect.WDT16.jValue
  rw [wd_x06_pos_norm, wd_x06_neg_norm]
  ring

theorem wd_x06_limit_jvalue :
    WeilDefect.WDT16.jValue
      (0 : WDX06Positive) wdX06Neg = -(1 / 2) := by
  unfold WeilDefect.WDT16.jValue
  rw [norm_zero, zero_pow (by norm_num : (2 : ℕ) ≠ 0),
    wd_x06_neg_norm, wd_x06_amp_sq]
  ring

theorem wd_x06_limit_strictly_negative :
    WeilDefect.WDT16.jValue
      (0 : WDX06Positive) wdX06Neg < 0 := by
  rw [wd_x06_limit_jvalue]
  norm_num

/-- Every fixed coordinate of an ℓ² vector vanishes at infinity. -/
theorem wd_x06_lp_coordinate_tendsto_zero
    (z : WDX06Positive) :
    Tendsto (fun n : ℕ => z n) atTop (𝓝 0) := by
  have hs :
      Summable (fun n : ℕ => ‖z n‖ ^ (2 : ℕ)) := by
    simpa [Real.rpow_two] using
      (lp.hasSum_norm
        (p := (2 : ℝ≥0∞))
        (by norm_num)
        z).summable
  have hsq :
      Tendsto (fun n : ℕ => ‖z n‖ ^ (2 : ℕ))
        atTop (𝓝 0) :=
    hs.tendsto_atTop_zero
  have hsqrt :=
    hsq.sqrt
  have hnorm :
      Tendsto (fun n : ℕ => ‖z n‖)
        atTop (𝓝 0) := by
    simpa [Real.sqrt_sq_eq_abs,
      abs_of_nonneg (norm_nonneg _)] using hsqrt
  exact tendsto_zero_iff_norm_tendsto_zero.mpr hnorm

/-- The moving positive standard-basis mass converges weakly to zero. -/
theorem wd_x06_positive_weakly_tendsto_zero :
    WeilDefect.WDT16.WeaklyTendsto wdX06Pos 0 := by
  intro z
  have hz := wd_x06_lp_coordinate_tendsto_zero z
  have hc :
      Continuous
        (fun w : ℂ => inner ℂ (wdX06Amp : ℂ) w) := by
    fun_prop
  have hinner :=
    (hc.tendsto 0).comp hz
  simpa [wdX06Pos, lp.inner_single_left,
    Function.comp_def] using hinner

/-- The full critical sequence converges weakly to the retained negative mode. -/
theorem wd_x06_vector_weakly_tendsto_limit :
    WeilDefect.WDT16.WeaklyTendsto
      wdX06Vector wdX06Limit := by
  unfold wdX06Vector wdX06Limit
  exact
    WeilDefect.WDT16.weaklyTendsto_coeff
      wd_x06_positive_weakly_tendsto_zero
      tendsto_const_nhds

/--
WD-X06: positive-coordinate mass can disappear weakly while the selected
negative coordinate remains fixed.  Every approximant is normalized and
critical, but the weak limit is strictly negative.
-/
theorem wd_x06_positive_mass_loss_fallthrough :
    (∀ n, ‖wdX06Vector n‖ = 1)
      ∧ (∀ n,
        WeilDefect.WDT16.jValue (wdX06Pos n) wdX06Neg = 0)
      ∧ WeilDefect.WDT16.WeaklyTendsto
          wdX06Vector wdX06Limit
      ∧ WeilDefect.WDT16.jValue
          (0 : WDX06Positive) wdX06Neg = -(1 / 2)
      ∧ WeilDefect.WDT16.jValue
          (0 : WDX06Positive) wdX06Neg < 0 := by
  exact ⟨wd_x06_vector_norm_eq_one,
    wd_x06_vector_critical,
    wd_x06_vector_weakly_tendsto_limit,
    wd_x06_limit_jvalue,
    wd_x06_limit_strictly_negative⟩

end

end WeilDefect
