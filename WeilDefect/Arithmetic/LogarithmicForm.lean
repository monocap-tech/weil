import WeilDefect.Arithmetic.PrimeSupport
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

namespace WeilDefect

open MeasureTheory
open scoped Topology

/-- Canonical logarithmic Fourier weight log(e + |t|). -/
noncomputable def logarithmicFourierWeight (t : ℝ) : ℝ :=
  Real.log (Real.exp 1 + |t|)

/-- The canonical logarithmic Fourier weight is everywhere at least one. -/
theorem one_le_logarithmicFourierWeight (t : ℝ) :
    1 ≤ logarithmicFourierWeight t := by
  unfold logarithmicFourierWeight
  rw [Real.le_log_iff_exp_le]
  · exact le_add_of_nonneg_right (abs_nonneg t)
  · positivity

/-- Logarithmic Fourier energy for a nonnegative spectral density. -/
noncomputable def logarithmicFourierEnergy
    (density : ℝ → ℝ) : ℝ :=
  ∫ t : ℝ, logarithmicFourierWeight t * density t ∂volume

/-- Spectral mass, corresponding to the L2 Fourier mass in the application. -/
noncomputable def spectralMass
    (density : ℝ → ℝ) : ℝ :=
  ∫ t : ℝ, density t ∂volume

/--
Shifted compact-window form model.  In the Weil application, density is
|F(t)|^2, symbol is Psi_c(t), shift is the scalar L2 renormalization, and pole
is the nonnegative finite-rank pole/evaluation contribution.
-/
noncomputable def shiftedCompactWeilForm
    (symbol density : ℝ → ℝ)
    (shift pole : ℝ) : ℝ :=
  pole + ∫ t : ℝ, (symbol t + shift) * density t ∂volume

/--
Core WD-T35 comparison: a symbol comparable to log(e+|t|), together with a
bounded nonnegative pole term, gives a two-sided logarithmic form estimate.
-/
theorem wd_t35_shifted_form_logarithmic_order
    (symbol density : ℝ → ℝ)
    (shift pole a b K : ℝ)
    (hdensity : ∀ t, 0 ≤ density t)
    (ha : 0 ≤ a)
    (hK : 0 ≤ K)
    (hlower :
      ∀ t,
        a * logarithmicFourierWeight t
          ≤ symbol t + shift)
    (hupper :
      ∀ t,
        symbol t + shift
          ≤ b * logarithmicFourierWeight t)
    (hpole0 : 0 ≤ pole)
    (hpole :
      pole ≤ K * spectralMass density)
    (hdensity_int : Integrable density volume)
    (hlog_int :
      Integrable
        (fun t : ℝ =>
          logarithmicFourierWeight t * density t) volume)
    (hsymbol_int :
      Integrable
        (fun t : ℝ =>
          (symbol t + shift) * density t) volume) :
    a * logarithmicFourierEnergy density
      ≤ shiftedCompactWeilForm symbol density shift pole
      ∧
    shiftedCompactWeilForm symbol density shift pole
      ≤ (b + K) * logarithmicFourierEnergy density := by
  have hlow :
      a * logarithmicFourierEnergy density
        ≤
      ∫ t : ℝ, (symbol t + shift) * density t ∂volume := by
    calc
      a * logarithmicFourierEnergy density
          =
        ∫ t : ℝ,
          a * (logarithmicFourierWeight t * density t) ∂volume := by
        unfold logarithmicFourierEnergy
        rw [integral_const_mul]
      _ ≤
        ∫ t : ℝ, (symbol t + shift) * density t ∂volume := by
        apply integral_mono (hlog_int.const_mul a) hsymbol_int
        intro t
        calc
          a * (logarithmicFourierWeight t * density t)
              =
            (a * logarithmicFourierWeight t) * density t := by ring
          _ ≤ (symbol t + shift) * density t :=
            mul_le_mul_of_nonneg_right (hlower t) (hdensity t)
  have hupp :
      (∫ t : ℝ, (symbol t + shift) * density t ∂volume)
        ≤
      b * logarithmicFourierEnergy density := by
    calc
      (∫ t : ℝ, (symbol t + shift) * density t ∂volume)
          ≤
        ∫ t : ℝ,
          b * (logarithmicFourierWeight t * density t) ∂volume := by
        apply integral_mono hsymbol_int (hlog_int.const_mul b)
        intro t
        calc
          (symbol t + shift) * density t
              ≤
            (b * logarithmicFourierWeight t) * density t :=
            mul_le_mul_of_nonneg_right (hupper t) (hdensity t)
          _ = b * (logarithmicFourierWeight t * density t) := by ring
      _ = b * logarithmicFourierEnergy density := by
        unfold logarithmicFourierEnergy
        rw [integral_const_mul]
  have hmass :
      spectralMass density ≤ logarithmicFourierEnergy density := by
    unfold spectralMass logarithmicFourierEnergy
    exact integral_mono hdensity_int hlog_int (fun t => by
      calc
        density t = 1 * density t := by ring
        _ ≤ logarithmicFourierWeight t * density t :=
          mul_le_mul_of_nonneg_right
            (one_le_logarithmicFourierWeight t)
            (hdensity t))
  have hpole_log :
      pole ≤ K * logarithmicFourierEnergy density :=
    hpole.trans (mul_le_mul_of_nonneg_left hmass hK)
  constructor
  · unfold shiftedCompactWeilForm
    linarith
  · unfold shiftedCompactWeilForm
    nlinarith

/--
WD-T35 / ZW2-T7 transfer to the canonical shifted Weil form statement.
The source-pinned compact-window formula supplies hQ, while the symbol
comparison comes from the digamma asymptotic plus WD-T34 finite prime support.
-/
theorem wd_t35_compact_weil_logarithmic_form_order
    (Q : ℝ)
    (symbol density : ℝ → ℝ)
    (shift pole a b K : ℝ)
    (hdensity : ∀ t, 0 ≤ density t)
    (ha : 0 ≤ a)
    (hK : 0 ≤ K)
    (hlower :
      ∀ t,
        a * logarithmicFourierWeight t
          ≤ symbol t + shift)
    (hupper :
      ∀ t,
        symbol t + shift
          ≤ b * logarithmicFourierWeight t)
    (hpole0 : 0 ≤ pole)
    (hpole :
      pole ≤ K * spectralMass density)
    (hdensity_int : Integrable density volume)
    (hlog_int :
      Integrable
        (fun t : ℝ =>
          logarithmicFourierWeight t * density t) volume)
    (hsymbol_int :
      Integrable
        (fun t : ℝ =>
          (symbol t + shift) * density t) volume)
    (hQ :
      Q + shift * spectralMass density
        =
      shiftedCompactWeilForm symbol density shift pole) :
    a * logarithmicFourierEnergy density
      ≤ Q + shift * spectralMass density
      ∧
    Q + shift * spectralMass density
      ≤ (b + K) * logarithmicFourierEnergy density := by
  rw [hQ]
  exact wd_t35_shifted_form_logarithmic_order
    symbol density shift pole a b K
    hdensity ha hK hlower hupper hpole0 hpole
    hdensity_int hlog_int hsymbol_int

end WeilDefect
