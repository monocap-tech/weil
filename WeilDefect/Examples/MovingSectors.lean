import WeilDefect.Filtration.FiniteNegativeSector
import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Tactic

namespace WeilDefect

noncomputable section

open Filter
open scoped Topology ENNReal lp

abbrev WDX05OneSide :=
  lp (fun _ : ℕ => ℂ) 2

abbrev WDX05Carrier :=
  WeilDefect.WDT16.CoeffSpace WDX05OneSide WDX05OneSide

/-- Small positive signature gap in the moving-sector witness. -/
def wdX05Delta (n : ℕ) : ℝ :=
  1 / ((n : ℝ) + 2)

def wdX05PosAmp (n : ℕ) : ℝ :=
  Real.sqrt ((1 - wdX05Delta n) / 2)

def wdX05NegAmp (n : ℕ) : ℝ :=
  Real.sqrt ((1 + wdX05Delta n) / 2)

theorem wd_x05_delta_pos (n : ℕ) :
    0 < wdX05Delta n := by
  unfold wdX05Delta
  positivity

theorem wd_x05_delta_le_half (n : ℕ) :
    wdX05Delta n ≤ 1 / 2 := by
  unfold wdX05Delta
  have hn : (0 : ℝ) ≤ (n : ℝ) := by positivity
  have hden : (2 : ℝ) ≤ (n : ℝ) + 2 := by linarith
  exact one_div_le_one_div_of_le (by positivity) hden

theorem wd_x05_delta_tendsto_zero :
    Tendsto wdX05Delta atTop (𝓝 0) := by
  have hden :
      Tendsto (fun n : ℕ => (n : ℝ) + 2) atTop atTop :=
    tendsto_atTop_add_const_right _ _ tendsto_natCast_atTop_atTop
  have hinv :
      Tendsto (fun n : ℕ => (((n : ℝ) + 2)⁻¹))
        atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp hden
  change
    Tendsto (fun n : ℕ => wdX05Delta n)
      atTop (𝓝 0)
  simpa [wdX05Delta] using hinv

theorem wd_x05_pos_argument_nonneg (n : ℕ) :
    0 ≤ (1 - wdX05Delta n) / 2 := by
  have h := wd_x05_delta_le_half n
  linarith

theorem wd_x05_neg_argument_nonneg (n : ℕ) :
    0 ≤ (1 + wdX05Delta n) / 2 := by
  have h := wd_x05_delta_pos n
  linarith

theorem wd_x05_pos_amp_nonneg (n : ℕ) :
    0 ≤ wdX05PosAmp n := by
  unfold wdX05PosAmp
  exact Real.sqrt_nonneg _

theorem wd_x05_neg_amp_nonneg (n : ℕ) :
    0 ≤ wdX05NegAmp n := by
  unfold wdX05NegAmp
  exact Real.sqrt_nonneg _

theorem wd_x05_pos_amp_sq (n : ℕ) :
    wdX05PosAmp n ^ 2 = (1 - wdX05Delta n) / 2 := by
  unfold wdX05PosAmp
  exact Real.sq_sqrt (wd_x05_pos_argument_nonneg n)

theorem wd_x05_neg_amp_sq (n : ℕ) :
    wdX05NegAmp n ^ 2 = (1 + wdX05Delta n) / 2 := by
  unfold wdX05NegAmp
  exact Real.sq_sqrt (wd_x05_neg_argument_nonneg n)

/-- Positive coordinate of the moving normalized negative vector. -/
def wdX05Pos (n : ℕ) : WDX05OneSide :=
  (wdX05PosAmp n : ℂ) •
    lp.single (E := fun _ : ℕ => ℂ) 2 n (1 : ℂ)

/-- Negative coordinate of the moving normalized negative vector. -/
def wdX05Neg (n : ℕ) : WDX05OneSide :=
  (wdX05NegAmp n : ℂ) •
    lp.single (E := fun _ : ℕ => ℂ) 2 n (1 : ℂ)

/-- Canonical moving-sector witness vector. -/
def wdX05Vector (n : ℕ) : WDX05Carrier :=
  WeilDefect.WDT16.coeff (wdX05Pos n) (wdX05Neg n)

theorem wd_x05_pos_norm (n : ℕ) :
    ‖wdX05Pos n‖ = wdX05PosAmp n := by
  rw [wdX05Pos, norm_smul]
  have hsingle :
      ‖lp.single (E := fun _ : ℕ => ℂ) 2 n (1 : ℂ)‖ = 1 := by
    simpa using
      (lp.norm_single
        (E := fun _ : ℕ => ℂ)
        (p := (2 : ℝ≥0∞))
        (by norm_num : (0 : ℝ≥0∞) < 2)
        n (1 : ℂ))
  rw [hsingle, mul_one]
  simp [wd_x05_pos_amp_nonneg n, abs_of_nonneg]

theorem wd_x05_neg_norm (n : ℕ) :
    ‖wdX05Neg n‖ = wdX05NegAmp n := by
  rw [wdX05Neg, norm_smul]
  have hsingle :
      ‖lp.single (E := fun _ : ℕ => ℂ) 2 n (1 : ℂ)‖ = 1 := by
    simpa using
      (lp.norm_single
        (E := fun _ : ℕ => ℂ)
        (p := (2 : ℝ≥0∞))
        (by norm_num : (0 : ℝ≥0∞) < 2)
        n (1 : ℂ))
  rw [hsingle, mul_one]
  simp [wd_x05_neg_amp_nonneg n, abs_of_nonneg]

/-- Every moving witness is Hilbert-normalized. -/
theorem wd_x05_vector_norm_eq_one (n : ℕ) :
    ‖wdX05Vector n‖ = 1 := by
  have hsq :
      ‖wdX05Vector n‖ ^ 2 = 1 := by
    rw [WithLp.prod_norm_sq_eq_of_L2]
    simp only [wdX05Vector, WeilDefect.WDT16.coeff_fst,
      WeilDefect.WDT16.coeff_snd]
    rw [wd_x05_pos_norm, wd_x05_neg_norm,
      wd_x05_pos_amp_sq, wd_x05_neg_amp_sq]
    ring
  nlinarith [norm_nonneg (wdX05Vector n)]

/-- Exact negative Krein signature of the moving witness. -/
theorem wd_x05_jvalue_formula (n : ℕ) :
    WeilDefect.WDT16.jValue (wdX05Pos n) (wdX05Neg n)
      = -wdX05Delta n := by
  unfold WeilDefect.WDT16.jValue
  rw [wd_x05_pos_norm, wd_x05_neg_norm,
    wd_x05_pos_amp_sq, wd_x05_neg_amp_sq]
  ring

theorem wd_x05_jvalue_negative (n : ℕ) :
    WeilDefect.WDT16.jValue (wdX05Pos n) (wdX05Neg n) < 0 := by
  rw [wd_x05_jvalue_formula]
  exact neg_lt_zero.mpr (wd_x05_delta_pos n)

theorem wd_x05_jvalue_tendsto_zero :
    Tendsto
      (fun n =>
        WeilDefect.WDT16.jValue (wdX05Pos n) (wdX05Neg n))
      atTop (𝓝 0) := by
  simpa [wd_x05_jvalue_formula] using wd_x05_delta_tendsto_zero.neg

/--
The canonical nested coordinate-tail sector.  It is stated as a membership
predicate because the sharpness claim only needs exact tail custody and the
triviality of the total intersection.
-/
def wdX05Tail (N : ℕ) (y : WDX05Carrier) : Prop :=
  ∀ i : ℕ, i < N →
    y.fst i = 0 ∧ y.snd i = 0

theorem wd_x05_tail_antitone
    {N M : ℕ} (hNM : N ≤ M)
    {y : WDX05Carrier}
    (hy : wdX05Tail M y) :
    wdX05Tail N y := by
  intro i hi
  exact hy i (lt_of_lt_of_le hi hNM)

/-- The k-th moving vector lies in every earlier tail sector. -/
theorem wd_x05_pos_apply_of_ne
    {i k : ℕ} (hik : i ≠ k) :
    wdX05Pos k i = 0 := by
  unfold wdX05Pos
  rw [show
    ⇑((wdX05PosAmp k : ℂ) •
        lp.single (E := fun _ : ℕ => ℂ) 2 k (1 : ℂ))
      =
    (wdX05PosAmp k : ℂ) •
      ⇑(lp.single (E := fun _ : ℕ => ℂ) 2 k (1 : ℂ))
    from lp.coeFn_smul _ _]
  simp [Pi.smul_apply, lp.coeFn_single, Pi.single_apply, hik]

theorem wd_x05_neg_apply_of_ne
    {i k : ℕ} (hik : i ≠ k) :
    wdX05Neg k i = 0 := by
  unfold wdX05Neg
  rw [show
    ⇑((wdX05NegAmp k : ℂ) •
        lp.single (E := fun _ : ℕ => ℂ) 2 k (1 : ℂ))
      =
    (wdX05NegAmp k : ℂ) •
      ⇑(lp.single (E := fun _ : ℕ => ℂ) 2 k (1 : ℂ))
    from lp.coeFn_smul _ _]
  simp [Pi.smul_apply, lp.coeFn_single, Pi.single_apply, hik]

theorem wd_x05_vector_mem_tail
    {N k : ℕ} (hNk : N ≤ k) :
    wdX05Tail N (wdX05Vector k) := by
  intro i hi
  have hik : i ≠ k := by omega
  exact ⟨wd_x05_pos_apply_of_ne hik,
    wd_x05_neg_apply_of_ne hik⟩

/-- The intersection of all moving tail sectors contains only zero. -/
theorem wd_x05_tail_intersection_trivial
    (y : WDX05Carrier)
    (hy : ∀ N : ℕ, wdX05Tail N y) :
    y = 0 := by
  apply (WithLp.ofLp_injective 2)
  apply Prod.ext
  · ext i
    have hi := (hy (i + 1)) i (Nat.lt_succ_self i)
    simpa using hi.1
  · ext i
    have hi := (hy (i + 1)) i (Nat.lt_succ_self i)
    simpa using hi.2

/--
WD-X05: normalized strictly negative vectors can move through later and later
coordinate sectors while their signature tends to zero and the nested tail
intersection loses every nonzero persistent vector.
-/
theorem wd_x05_moving_sectors_lose_persistent_ray :
    (∀ n, ‖wdX05Vector n‖ = 1)
      ∧ (∀ n,
        WeilDefect.WDT16.jValue (wdX05Pos n) (wdX05Neg n) < 0)
      ∧ Tendsto
          (fun n =>
            WeilDefect.WDT16.jValue (wdX05Pos n) (wdX05Neg n))
          atTop (𝓝 0)
      ∧ (∀ N k, N ≤ k → wdX05Tail N (wdX05Vector k))
      ∧ (∀ y : WDX05Carrier,
          (∀ N, wdX05Tail N y) → y = 0) := by
  exact ⟨wd_x05_vector_norm_eq_one,
    wd_x05_jvalue_negative,
    wd_x05_jvalue_tendsto_zero,
    fun _ _ h => wd_x05_vector_mem_tail h,
    wd_x05_tail_intersection_trivial⟩

end

end WeilDefect
