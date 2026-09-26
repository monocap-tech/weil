import Mathlib
import WeilDefect.NativeHilbertSchmidt

namespace WeilDefect

attribute [local instance 1100] NormedSpace.complexToReal

open Filter Set Bornology
open scoped Topology BigOperators Interval ComplexConjugate

/-- Bombieri ordinate gamma corresponds to the exponential frequency -i gamma. -/
noncomputable def problemOneFreq (gamma : ℂ) : ℂ :=
  -Complex.I * gamma

/-- Native Problem-1 Green denominator in Bombieri ordinate coordinates. -/
noncomputable def problemOneGreenDenom (gamma : ℂ) : ℂ :=
  (1 / 4 : ℂ) + gamma ^ 2

/-- Reciprocal Green coefficient. -/
noncomputable def problemOneGreenQ (gamma : ℂ) : ℂ :=
  (problemOneGreenDenom gamma)⁻¹

theorem problemOneDenominator_problemOneFreq (gamma : ℂ) :
    problemOneDenominator (problemOneFreq gamma) =
      problemOneGreenDenom gamma := by
  simp [problemOneDenominator, problemOneFreq, problemOneGreenDenom, mul_pow, Complex.I_sq]

/-- Real Dirichlet basis equal to 0 at -t and 1 at t. -/
noncomputable def dirichletRightReal (t x : ℝ) : ℝ :=
  Real.sinh ((t + x) / 2) / Real.sinh t

/-- Real Dirichlet basis equal to 1 at -t and 0 at t. -/
noncomputable def dirichletLeftReal (t x : ℝ) : ℝ :=
  Real.sinh ((t - x) / 2) / Real.sinh t

noncomputable def dirichletRightBasis (t x : ℝ) : ℂ :=
  Complex.ofRealCLM (dirichletRightReal t x)

noncomputable def dirichletLeftBasis (t x : ℝ) : ℂ :=
  Complex.ofRealCLM (dirichletLeftReal t x)

theorem dirichletRightReal_neg (t : ℝ) :
    dirichletRightReal t (-t) = 0 := by
  simp [dirichletRightReal]

theorem dirichletLeftReal_pos (t : ℝ) :
    dirichletLeftReal t t = 0 := by
  simp [dirichletLeftReal]

theorem dirichletRightReal_pos
    (t : ℝ) (ht : t ≠ 0) :
    dirichletRightReal t t = 1 := by
  have hs : Real.sinh t ≠ 0 := Real.sinh_ne_zero.mpr ht
  simp [dirichletRightReal, hs]

theorem dirichletLeftReal_neg
    (t : ℝ) (ht : t ≠ 0) :
    dirichletLeftReal t (-t) = 1 := by
  have hs : Real.sinh t ≠ 0 := Real.sinh_ne_zero.mpr ht
  simp [dirichletLeftReal, hs]

theorem dirichletRightBasis_neg (t : ℝ) :
    dirichletRightBasis t (-t) = 0 := by
  simp [dirichletRightBasis, dirichletRightReal_neg]

theorem dirichletLeftBasis_pos (t : ℝ) :
    dirichletLeftBasis t t = 0 := by
  simp [dirichletLeftBasis, dirichletLeftReal_pos]

theorem dirichletRightBasis_pos
    (t : ℝ) (ht : t ≠ 0) :
    dirichletRightBasis t t = 1 := by
  simp [dirichletRightBasis, dirichletRightReal_pos t ht]

theorem dirichletLeftBasis_neg
    (t : ℝ) (ht : t ≠ 0) :
    dirichletLeftBasis t (-t) = 1 := by
  simp [dirichletLeftBasis, dirichletLeftReal_neg t ht]

/-- The right Dirichlet basis is bounded by one on the support interval. -/
theorem norm_dirichletRightBasis_le_one
    (t x : ℝ) (ht : 0 < t)
    (hx : x ∈ Set.Icc (-t) t) :
    ‖dirichletRightBasis t x‖ ≤ 1 := by
  have hspos : 0 < Real.sinh t := Real.sinh_pos_iff.mpr ht
  have ha0 : 0 ≤ (t + x) / 2 := by linarith [hx.1]
  have hat : (t + x) / 2 ≤ t := by linarith [hx.2]
  have hs0 : 0 ≤ Real.sinh ((t + x) / 2) :=
    Real.sinh_nonneg_iff.mpr ha0
  have hsle :
      Real.sinh ((t + x) / 2) ≤ Real.sinh t :=
    Real.sinh_le_sinh.mpr hat
  have hdiv :
      Real.sinh ((t + x) / 2) / Real.sinh t ≤ 1 := by
    rw [div_le_one hspos]
    exact hsle
  rw [dirichletRightBasis, Complex.ofRealCLM_apply,
    Complex.norm_real, Real.norm_eq_abs]
  rw [dirichletRightReal, abs_of_nonneg (div_nonneg hs0 hspos.le)]
  exact hdiv

/-- The left Dirichlet basis is bounded by one on the support interval. -/
theorem norm_dirichletLeftBasis_le_one
    (t x : ℝ) (ht : 0 < t)
    (hx : x ∈ Set.Icc (-t) t) :
    ‖dirichletLeftBasis t x‖ ≤ 1 := by
  have hspos : 0 < Real.sinh t := Real.sinh_pos_iff.mpr ht
  have ha0 : 0 ≤ (t - x) / 2 := by linarith [hx.2]
  have hat : (t - x) / 2 ≤ t := by linarith [hx.1]
  have hs0 : 0 ≤ Real.sinh ((t - x) / 2) :=
    Real.sinh_nonneg_iff.mpr ha0
  have hsle :
      Real.sinh ((t - x) / 2) ≤ Real.sinh t :=
    Real.sinh_le_sinh.mpr hat
  have hdiv :
      Real.sinh ((t - x) / 2) / Real.sinh t ≤ 1 := by
    rw [div_le_one hspos]
    exact hsle
  rw [dirichletLeftBasis, Complex.ofRealCLM_apply,
    Complex.norm_real, Real.norm_eq_abs]
  rw [dirichletLeftReal, abs_of_nonneg (div_nonneg hs0 hspos.le)]
  exact hdiv

/-- First derivative of the right real Dirichlet basis. -/
theorem hasDerivAt_dirichletRightReal
    (t x : ℝ) :
    HasDerivAt
      (dirichletRightReal t)
      (Real.cosh ((t + x) / 2) / (2 * Real.sinh t))
      x := by
  change HasDerivAt
    (fun y : ℝ => Real.sinh ((t + y) / 2) / Real.sinh t)
    (Real.cosh ((t + x) / 2) / (2 * Real.sinh t)) x
  have hinner :
      HasDerivAt (fun y : ℝ => (t + y) / 2) (1 / 2 : ℝ) x := by
    have h :=
      ((hasDerivAt_const x t).add (hasDerivAt_id x)).div_const 2
    simpa only [Pi.add_apply, id_eq, zero_add] using h
  have hs := hinner.sinh
  convert hs.div_const (Real.sinh t) using 1
  ring

/-- Derivative of the first derivative of the right real Dirichlet basis. -/
theorem hasDerivAt_dirichletRightReal_deriv
    (t x : ℝ) :
    HasDerivAt
      (fun y : ℝ =>
        Real.cosh ((t + y) / 2) / (2 * Real.sinh t))
      ((1 / 4 : ℝ) * dirichletRightReal t x)
      x := by
  have hinner :
      HasDerivAt (fun y : ℝ => (t + y) / 2) (1 / 2 : ℝ) x := by
    have h :=
      ((hasDerivAt_const x t).add (hasDerivAt_id x)).div_const 2
    convert h using 1
    · funext y
      simp only [Pi.add_apply, Pi.sub_apply, id_eq]
    · ring
  have hc := hinner.cosh
  have h := hc.div_const (2 * Real.sinh t)
  convert h using 1 <;>
    simp [dirichletRightReal, div_eq_mul_inv] <;>
    ring_nf

/-- First derivative of the left real Dirichlet basis. -/
theorem hasDerivAt_dirichletLeftReal
    (t x : ℝ) :
    HasDerivAt
      (dirichletLeftReal t)
      (-Real.cosh ((t - x) / 2) / (2 * Real.sinh t))
      x := by
  change HasDerivAt
    (fun y : ℝ => Real.sinh ((t - y) / 2) / Real.sinh t)
    (-Real.cosh ((t - x) / 2) / (2 * Real.sinh t)) x
  have hinner :
      HasDerivAt (fun y : ℝ => (t - y) / 2) (-1 / 2 : ℝ) x := by
    have h :=
      ((hasDerivAt_const x t).sub (hasDerivAt_id x)).div_const 2
    simpa only [Pi.sub_apply, id_eq, zero_sub] using h
  have hs := hinner.sinh
  convert hs.div_const (Real.sinh t) using 1
  ring

/-- Derivative of the first derivative of the left real Dirichlet basis. -/
theorem hasDerivAt_dirichletLeftReal_deriv
    (t x : ℝ) :
    HasDerivAt
      (fun y : ℝ =>
        -Real.cosh ((t - y) / 2) / (2 * Real.sinh t))
      ((1 / 4 : ℝ) * dirichletLeftReal t x)
      x := by
  have hinner :
      HasDerivAt (fun y : ℝ => (t - y) / 2) (-1 / 2 : ℝ) x := by
    have h :=
      ((hasDerivAt_const x t).sub (hasDerivAt_id x)).div_const 2
    convert h using 1
    · funext y
      simp only [Pi.add_apply, Pi.sub_apply, id_eq]
    · ring
  have hc := hinner.cosh
  have hneg := hc.neg
  have h := hneg.div_const (2 * Real.sinh t)
  convert h using 1 <;>
    simp [dirichletLeftReal, div_eq_mul_inv] <;>
    ring_nf

theorem hasDerivAt_dirichletRightBasis
    (t x : ℝ) :
    HasDerivAt
      (dirichletRightBasis t)
      ((Real.cosh ((t + x) / 2) / (2 * Real.sinh t) : ℝ) : ℂ)
      x := by
  change HasDerivAt
    (fun y : ℝ => (dirichletRightReal t y : ℂ))
    ((Real.cosh ((t + x) / 2) / (2 * Real.sinh t) : ℝ) : ℂ) x
  exact (hasDerivAt_dirichletRightReal t x).ofReal_comp

theorem hasDerivAt_dirichletLeftBasis
    (t x : ℝ) :
    HasDerivAt
      (dirichletLeftBasis t)
      ((-Real.cosh ((t - x) / 2) / (2 * Real.sinh t) : ℝ) : ℂ)
      x := by
  change HasDerivAt
    (fun y : ℝ => (dirichletLeftReal t y : ℂ))
    ((-Real.cosh ((t - x) / 2) / (2 * Real.sinh t) : ℝ) : ℂ) x
  exact (hasDerivAt_dirichletLeftReal t x).ofReal_comp

theorem iteratedDeriv_two_dirichletRightBasis
    (t x : ℝ) :
    iteratedDeriv 2 (dirichletRightBasis t) x =
      (1 / 4 : ℂ) * dirichletRightBasis t x := by
  have h1 :
      deriv (dirichletRightBasis t) =
        fun y : ℝ =>
          ((Real.cosh ((t + y) / 2) / (2 * Real.sinh t) : ℝ) : ℂ) := by
    funext y
    exact (hasDerivAt_dirichletRightBasis t y).deriv
  rw [iteratedDeriv_succ, iteratedDeriv_one, h1]
  have h2 :=
    (hasDerivAt_dirichletRightReal_deriv t x).ofReal_comp
  simpa [dirichletRightBasis] using h2.deriv

theorem iteratedDeriv_two_dirichletLeftBasis
    (t x : ℝ) :
    iteratedDeriv 2 (dirichletLeftBasis t) x =
      (1 / 4 : ℂ) * dirichletLeftBasis t x := by
  have h1 :
      deriv (dirichletLeftBasis t) =
        fun y : ℝ =>
          ((-Real.cosh ((t - y) / 2) / (2 * Real.sinh t) : ℝ) : ℂ) := by
    funext y
    exact (hasDerivAt_dirichletLeftBasis t y).deriv
  rw [iteratedDeriv_succ, iteratedDeriv_one, h1]
  have h2 :=
    (hasDerivAt_dirichletLeftReal_deriv t x).ofReal_comp
  simpa [dirichletLeftBasis] using h2.deriv

theorem problemOneL_dirichletRightBasis (t x : ℝ) :
    problemOneL (dirichletRightBasis t) x = 0 := by
  rw [problemOneL, iteratedDeriv_two_dirichletRightBasis]
  ring

theorem problemOneL_dirichletLeftBasis (t x : ℝ) :
    problemOneL (dirichletLeftBasis t) x = 0 := by
  rw [problemOneL, iteratedDeriv_two_dirichletLeftBasis]
  ring

/-- The Green denominator has real part at least Re(gamma)^2 in the zeta strip. -/
theorem problemOneGreenDenom_re_lower
    (gamma : ℂ)
    (hstrip : |gamma.im| ≤ 1 / 2) :
    gamma.re ^ 2 ≤ (problemOneGreenDenom gamma).re := by
  have himlo : -(1 / 2 : ℝ) ≤ gamma.im := (abs_le.mp hstrip).1
  have himhi : gamma.im ≤ (1 / 2 : ℝ) := (abs_le.mp hstrip).2
  simp [problemOneGreenDenom, pow_two, Complex.mul_re]
  nlinarith

/-- Norm lower bound for the Green denominator in the zeta strip. -/
theorem problemOneGreenDenom_norm_lower
    (gamma : ℂ)
    (hstrip : |gamma.im| ≤ 1 / 2) :
    gamma.re ^ 2 ≤ ‖problemOneGreenDenom gamma‖ := by
  calc
    gamma.re ^ 2
        ≤ (problemOneGreenDenom gamma).re :=
      problemOneGreenDenom_re_lower gamma hstrip
    _ ≤ |(problemOneGreenDenom gamma).re| := le_abs_self _
    _ ≤ ‖problemOneGreenDenom gamma‖ := Complex.abs_re_le_norm _

/--
Shell-height inverse-square bound for the reciprocal Green coefficient.
-/
theorem problemOneGreenQ_shell_bound
    (gamma : ℂ) (n : ℕ)
    (hstrip : |gamma.im| ≤ 1 / 2)
    (hheight : (n : ℝ) + 1 ≤ |gamma.re|) :
    ‖problemOneGreenQ gamma‖
      ≤ (((n : ℝ) + 1) ^ (-2 : ℝ)) := by
  have hnpos : 0 < (n : ℝ) + 1 := by positivity
  have hrepos : 0 < |gamma.re| := hnpos.trans_le hheight
  have hsq :
      ((n : ℝ) + 1) ^ 2 ≤ gamma.re ^ 2 := by
    exact sq_le_sq.mpr <| by
      simpa [abs_of_pos hnpos] using hheight
  have hden :
      ((n : ℝ) + 1) ^ 2 ≤ ‖problemOneGreenDenom gamma‖ :=
    hsq.trans (problemOneGreenDenom_norm_lower gamma hstrip)
  have hdenpos : 0 < ‖problemOneGreenDenom gamma‖ :=
    lt_of_lt_of_le (sq_pos_of_pos hnpos) hden
  rw [problemOneGreenQ, norm_inv]
  calc
    ‖problemOneGreenDenom gamma‖⁻¹
        ≤ (((n : ℝ) + 1) ^ 2)⁻¹ := by
      exact (inv_le_inv₀ hdenpos (sq_pos_of_pos hnpos)).2 hden
    _ = (((n : ℝ) + 1) ^ (-2 : ℝ)) := by
      rw [Real.rpow_neg_eq_inv_rpow, Real.rpow_two]
      exact (inv_pow ((n : ℝ) + 1) 2).symm

/--
The raw exponential source is uniformly bounded on a fixed compact window
when gamma stays in the zeta strip.
-/
theorem norm_problemOne_source_le
    (t x : ℝ) (gamma : ℂ)
    (ht : 0 ≤ t)
    (hstrip : |gamma.im| ≤ 1 / 2)
    (hx : x ∈ Set.Icc (-t) t) :
    ‖realExpMode (problemOneFreq gamma) x‖
      ≤ Real.exp (t / 2) := by
  have hxabs : |x| ≤ t := by
    rw [abs_le]
    exact ⟨by linarith [hx.1], hx.2⟩
  have himabs : |gamma.im| ≤ (1 / 2 : ℝ) := hstrip
  have hmul : x * gamma.im ≤ t / 2 := by
    calc
      x * gamma.im ≤ |x * gamma.im| := le_abs_self _
      _ = |x| * |gamma.im| := abs_mul _ _
      _ ≤ t * (1 / 2 : ℝ) := by gcongr
      _ = t / 2 := by ring
  simp only [realExpMode, problemOneFreq, Complex.norm_exp]
  apply Real.exp_monotone
  simp [Complex.mul_re, Complex.mul_im]
  ring_nf at *
  exact hmul

/--
Explicit Dirichlet Green column for the Problem-1 source.
-/
noncomputable def dirichletProblemOneColumn
    (t : ℝ) (gamma : ℂ) (x : ℝ) : ℂ :=
  let q := problemOneGreenQ gamma
  q * realExpMode (problemOneFreq gamma) x
    + (-q * realExpMode (problemOneFreq gamma) t) * dirichletRightBasis t x
    + (-q * realExpMode (problemOneFreq gamma) (-t)) * dirichletLeftBasis t x

theorem dirichletProblemOneColumn_pos
    (t : ℝ) (gamma : ℂ) (ht : t ≠ 0) :
    dirichletProblemOneColumn t gamma t = 0 := by
  simp [dirichletProblemOneColumn,
    dirichletRightBasis_pos t ht, dirichletLeftBasis_pos]

theorem dirichletProblemOneColumn_neg
    (t : ℝ) (gamma : ℂ) (ht : t ≠ 0) :
    dirichletProblemOneColumn t gamma (-t) = 0 := by
  simp [dirichletProblemOneColumn,
    dirichletRightBasis_neg, dirichletLeftBasis_neg t ht]

theorem contDiffAt_dirichletRightBasis
    (k : ℕ) (t x : ℝ) :
    ContDiffAt ℝ k (dirichletRightBasis t) x := by
  have hreal : ContDiffAt ℝ k (dirichletRightReal t) x := by
    unfold dirichletRightReal
    fun_prop
  have hcoe :=
    Complex.ofRealCLM.contDiff.contDiffAt.comp x hreal
  change ContDiffAt ℝ k
    (Complex.ofRealCLM ∘ dirichletRightReal t) x
  exact hcoe

theorem contDiffAt_dirichletLeftBasis
    (k : ℕ) (t x : ℝ) :
    ContDiffAt ℝ k (dirichletLeftBasis t) x := by
  have hreal : ContDiffAt ℝ k (dirichletLeftReal t) x := by
    unfold dirichletLeftReal
    fun_prop
  have hcoe :=
    Complex.ofRealCLM.contDiff.contDiffAt.comp x hreal
  change ContDiffAt ℝ k
    (Complex.ofRealCLM ∘ dirichletLeftReal t) x
  exact hcoe

/-- The explicit column solves L F = source whenever the Green denominator is nonzero. -/
theorem problemOneL_dirichletProblemOneColumn
    (t x : ℝ) (gamma : ℂ)
    (hden : problemOneGreenDenom gamma ≠ 0) :
    problemOneL (dirichletProblemOneColumn t gamma) x =
      realExpMode (problemOneFreq gamma) x := by
  let q := problemOneGreenQ gamma
  let f0 : ℝ → ℂ :=
    fun y => q * realExpMode (problemOneFreq gamma) y
  let fR : ℝ → ℂ :=
    fun y =>
      (-q * realExpMode (problemOneFreq gamma) t) * dirichletRightBasis t y
  let fL : ℝ → ℂ :=
    fun y =>
      (-q * realExpMode (problemOneFreq gamma) (-t)) * dirichletLeftBasis t y
  have hq :
      q * problemOneDenominator (problemOneFreq gamma) = 1 := by
    dsimp [q, problemOneGreenQ]
    rw [problemOneDenominator_problemOneFreq]
    exact inv_mul_cancel₀ hden
  have hf0 : ContDiffAt ℝ 2 f0 x := by
    simpa [f0] using
      contDiffAt_const_mul_realExpMode 2 q (problemOneFreq gamma) x
  have hfR : ContDiffAt ℝ 2 fR x := by
    exact (contDiff_const.contDiffAt.mul
      (contDiffAt_dirichletRightBasis 2 t x))
  have hfL : ContDiffAt ℝ 2 fL x := by
    exact (contDiff_const.contDiffAt.mul
      (contDiffAt_dirichletLeftBasis 2 t x))
  have hcol :
      dirichletProblemOneColumn t gamma = f0 + fR + fL := by
    funext y
    rfl
  rw [hcol]
  rw [problemOneL_add (f0 + fR) fL x (hf0.add hfR) hfL]
  rw [problemOneL_add f0 fR x hf0 hfR]
  have h0 :
      problemOneL f0 x =
        realExpMode (problemOneFreq gamma) x := by
    rw [show f0 =
      fun y => q * realExpMode (problemOneFreq gamma) y by rfl]
    rw [problemOneL_const_mul_realExpMode, hq, one_mul]
  have hR : problemOneL fR x = 0 := by
    rw [show fR =
      fun y => (-q * realExpMode (problemOneFreq gamma) t) *
        dirichletRightBasis t y by rfl]
    rw [problemOneL_const_mul, problemOneL_dirichletRightBasis, mul_zero]
  have hL : problemOneL fL x = 0 := by
    rw [show fL =
      fun y => (-q * realExpMode (problemOneFreq gamma) (-t)) *
        dirichletLeftBasis t y by rfl]
    rw [problemOneL_const_mul, problemOneL_dirichletLeftBasis, mul_zero]
  rw [h0, hR, hL, add_zero, add_zero]

/-- Pointwise Green-column bound on the compact window. -/
theorem norm_dirichletProblemOneColumn_le
    (t x : ℝ) (gamma : ℂ)
    (ht : 0 < t)
    (hstrip : |gamma.im| ≤ 1 / 2)
    (hx : x ∈ Set.Icc (-t) t) :
    ‖dirichletProblemOneColumn t gamma x‖
      ≤
    3 * Real.exp (t / 2) * ‖problemOneGreenQ gamma‖ := by
  have hsx :=
    norm_problemOne_source_le t x gamma ht.le hstrip hx
  have hst :
      ‖realExpMode (problemOneFreq gamma) t‖ ≤ Real.exp (t / 2) := by
    apply norm_problemOne_source_le t t gamma ht.le hstrip
    exact ⟨by linarith, le_rfl⟩
  have hsnt :
      ‖realExpMode (problemOneFreq gamma) (-t)‖ ≤ Real.exp (t / 2) := by
    apply norm_problemOne_source_le t (-t) gamma ht.le hstrip
    exact ⟨le_rfl, by linarith⟩
  have hR := norm_dirichletRightBasis_le_one t x ht hx
  have hL := norm_dirichletLeftBasis_le_one t x ht hx
  unfold dirichletProblemOneColumn
  calc
    ‖problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) x
        + (-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) t) *
            dirichletRightBasis t x
        + (-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) (-t)) *
            dirichletLeftBasis t x‖
        ≤
      ‖problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) x‖
        + ‖(-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) t) *
            dirichletRightBasis t x‖
        + ‖(-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) (-t)) *
            dirichletLeftBasis t x‖ := by
          calc
            ‖(problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) x
                + (-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) t) *
                    dirichletRightBasis t x)
                + (-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) (-t)) *
                    dirichletLeftBasis t x‖
                ≤
              ‖problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) x
                + (-problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) t) *
                    dirichletRightBasis t x‖
                + ‖(-problemOneGreenQ gamma *
                    realExpMode (problemOneFreq gamma) (-t)) *
                    dirichletLeftBasis t x‖ := norm_add_le _ _
            _ ≤
              (‖problemOneGreenQ gamma * realExpMode (problemOneFreq gamma) x‖
                + ‖(-problemOneGreenQ gamma *
                    realExpMode (problemOneFreq gamma) t) *
                    dirichletRightBasis t x‖)
                + ‖(-problemOneGreenQ gamma *
                    realExpMode (problemOneFreq gamma) (-t)) *
                    dirichletLeftBasis t x‖ := by
                  gcongr
                  exact norm_add_le _ _
    _ ≤
      ‖problemOneGreenQ gamma‖ * Real.exp (t / 2)
        + (‖problemOneGreenQ gamma‖ * Real.exp (t / 2)) * 1
        + (‖problemOneGreenQ gamma‖ * Real.exp (t / 2)) * 1 := by
      simp only [norm_mul, norm_neg]
      gcongr
    _ = 3 * Real.exp (t / 2) * ‖problemOneGreenQ gamma‖ := by
      ring

/-- Green pairing defining the native squared column energy. -/
noncomputable def problemOneGreenPairing
    (t : ℝ) (gamma : ℂ) : ℂ :=
  ∫ x in -t..t,
    star (realExpMode (problemOneFreq gamma) x) *
      dirichletProblemOneColumn t gamma x

/--
Nonnegative scalar used as the formal squared H^{-1}_L column energy.
The later integration-by-parts theorem identifies this norm with the positive
Green pairing.
-/
noncomputable def problemOneColumnEnergySq
    (t : ℝ) (gamma : ℂ) : ℝ :=
  ‖problemOneGreenPairing t gamma‖

/-- Quantitative compact-window Green-pairing estimate. -/
theorem problemOneColumnEnergySq_le
    (t : ℝ) (gamma : ℂ)
    (ht : 0 < t)
    (hstrip : |gamma.im| ≤ 1 / 2) :
    problemOneColumnEnergySq t gamma
      ≤
    (6 * t * (Real.exp (t / 2)) ^ 2) *
      ‖problemOneGreenQ gamma‖ := by
  let E : ℝ := Real.exp (t / 2)
  have hpoint :
      ∀ x ∈ Ι (-t) t,
        ‖star (realExpMode (problemOneFreq gamma) x) *
            dirichletProblemOneColumn t gamma x‖
          ≤ 3 * E ^ 2 * ‖problemOneGreenQ gamma‖ := by
    intro x hx
    have hle : -t ≤ t := by linarith
    have hxioc : x ∈ Set.Ioc (-t) t := by
      simpa [uIoc_of_le hle] using hx
    have hxIcc : x ∈ Set.Icc (-t) t :=
      ⟨hxioc.1.le, hxioc.2⟩
    have hs :=
      norm_problemOne_source_le t x gamma ht.le hstrip hxIcc
    have hF :=
      norm_dirichletProblemOneColumn_le t x gamma ht hstrip hxIcc
    simp only [norm_mul, norm_star]
    calc
      ‖realExpMode (problemOneFreq gamma) x‖ *
          ‖dirichletProblemOneColumn t gamma x‖
          ≤ E * (3 * E * ‖problemOneGreenQ gamma‖) := by
            gcongr
      _ = 3 * E ^ 2 * ‖problemOneGreenQ gamma‖ := by ring
  unfold problemOneColumnEnergySq problemOneGreenPairing
  calc
    ‖∫ x in -t..t,
      star (realExpMode (problemOneFreq gamma) x) *
        dirichletProblemOneColumn t gamma x‖
        ≤
      (3 * E ^ 2 * ‖problemOneGreenQ gamma‖) * |t - (-t)| := by
        exact intervalIntegral.norm_integral_le_of_norm_le_const hpoint
    _ = (6 * t * E ^ 2) * ‖problemOneGreenQ gamma‖ := by
      rw [abs_of_nonneg (by linarith : 0 ≤ t - (-t))]
      ring
    _ = (6 * t * (Real.exp (t / 2)) ^ 2) *
        ‖problemOneGreenQ gamma‖ := by rfl

/--
Actual zeta-shell realization used to instantiate the WD-T28 resolvent premise.
-/
structure ActualProblemOneShellData
    (count : ℕ → ℕ) where
  gamma : ZetaShellIndex count → ℂ
  strip :
    ∀ g, |(gamma g).im| ≤ 1 / 2
  shell_height :
    ∀ g, (g.1 : ℝ) + 1 ≤ |(gamma g).re|

noncomputable def actualProblemOneEnergySq
    {count : ℕ → ℕ}
    (t : ℝ)
    (data : ActualProblemOneShellData count)
    (g : ZetaShellIndex count) : ℝ :=
  problemOneColumnEnergySq t (data.gamma g)

/--
The explicit Green-column construction discharges the formerly abstract
NativeProblemOneResolventData premise.
-/
theorem nativeProblemOneResolventData_of_actual
    {count : ℕ → ℕ}
    (t : ℝ)
    (ht : 0 < t)
    (data : ActualProblemOneShellData count) :
    NativeProblemOneResolventData
      count
      (actualProblemOneEnergySq t data)
      (6 * t * (Real.exp (t / 2)) ^ 2) := by
  refine
    { A_nonneg := by positivity
      energy_nonneg := ?_
      energy_le_inverse_square := ?_ }
  · intro g
    unfold actualProblemOneEnergySq problemOneColumnEnergySq
    exact norm_nonneg _
  · intro g
    have hpair :=
      problemOneColumnEnergySq_le
        t (data.gamma g) ht (data.strip g)
    have hq :=
      problemOneGreenQ_shell_bound
        (data.gamma g) g.1 (data.strip g) (data.shell_height g)
    exact hpair.trans <| by
      gcongr

/--
WD-T28 with the internal resolvent realization discharged.  The only remaining
external premise is the pinned zeta zero-count shell estimate.
-/
theorem wd_t28_native_problem_one_hilbert_schmidt_actual
    {count : ℕ → ℕ}
    (t : ℝ)
    (ht : 0 < t)
    (data : ActualProblemOneShellData count)
    (C : ℝ)
    (hCount : ZetaZeroShellCountData count C) :
    NativeHilbertSchmidtCriterion (actualProblemOneEnergySq t data)
      ∧ NativeTraceClassCovarianceCriterion
          (actualProblemOneEnergySq t data) := by
  exact
    wd_t28_native_problem_one_hilbert_schmidt
      (actualProblemOneEnergySq t data)
      (6 * t * (Real.exp (t / 2)) ^ 2)
      C
      hCount
      (nativeProblemOneResolventData_of_actual t ht data)

end WeilDefect
