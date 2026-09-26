import Mathlib

namespace WeilDefect

open Filter
open scoped Topology

/--
WD-X03: separate channel budgets can each be positive while the joint budget is negative.
The hypotheses isolate exactly the scalar inequalities used by the example.
-/
theorem wd_x03_individual_not_compositional
    (r : ℝ)
    (hIndividual : r ^ 2 < 1)
    (hJoint : 1 < 2 * r ^ 2) :
    0 < 1 - r ^ 2 ∧ 1 - 2 * r ^ 2 < 0 := by
  constructor <;> linarith

/-- WD-X03: an explicit jointly-over-budget witness, using (r=3/4). -/
theorem wd_x03_explicit_witness :
    let r : ℝ := 3 / 4
    0 < 1 - r ^ 2 ∧ 1 - 2 * r ^ 2 < 0 := by
  norm_num

/-- WD-X04: the 2×2 Schur complement is exactly (1-r^2). -/
theorem wd_x04_shorted_covariance_identity (r : ℝ) :
    (1 : ℝ) - r * (1 : ℝ)⁻¹ * r = 1 - r ^ 2 := by
  ring

/--
WD-X04: there is no uniform positive lower floor for the shorted covariance
over the family (K_r) as (r) approaches (1) from below.
-/
theorem wd_x04_no_uniform_shorted_floor
    (ε : ℝ)
    (hε : 0 < ε)
    (hε1 : ε < 1) :
    ∃ r : ℝ,
      0 < r ∧
      r < 1 ∧
      0 < 1 - r ^ 2 ∧
      1 - r ^ 2 < ε := by
  refine ⟨1 - ε / 2, ?_⟩
  constructor
  · nlinarith
  constructor
  · nlinarith
  constructor
  · nlinarith [sq_nonneg ε]
  · nlinarith [sq_nonneg ε]

/--
WD-X07: the antisymmetric two-point rational response has the exact
inverse-square numerator.
-/
theorem wd_x07_response_identity
    (z ρ₁ ρ₂ : ℂ)
    (h₁ : z ≠ ρ₁)
    (h₂ : z ≠ ρ₂) :
    1 / (z - ρ₁) - 1 / (z - ρ₂)
      = (ρ₁ - ρ₂) / ((z - ρ₁) * (z - ρ₂)) := by
  field_simp [sub_ne_zero.mpr h₁, sub_ne_zero.mpr h₂]
  ring


/-- Real two-point witness used to certify the sharp inverse-square order in WD-X07. -/
noncomputable def wdX07RealResponse (x : ℝ) : ℝ :=
  1 / x - 1 / (x - 1)

/-- Exact response formula for the explicit WD-X07 witness. -/
theorem wd_x07_real_response_formula
    (x : ℝ)
    (hx0 : x ≠ 0)
    (hx1 : x ≠ 1) :
    wdX07RealResponse x = -1 / (x * (x - 1)) := by
  unfold wdX07RealResponse
  field_simp [hx0, sub_ne_zero.mpr hx1]
  ring

/--
WD-X07 asymptotic sharpness: for the explicit pair (0,1), the response
has a nonzero inverse-square leading coefficient.
-/
theorem wd_x07_scaled_response_tendsto_neg_one :
    Filter.Tendsto
      (fun N : ℕ =>
        let x : ℝ := N + 2
        x ^ 2 * wdX07RealResponse x)
      Filter.atTop
      (𝓝 (-1 : ℝ)) := by
  have hden :
      Filter.Tendsto (fun N : ℕ => (N : ℝ) + 1)
        Filter.atTop Filter.atTop :=
    tendsto_atTop_add_const_right _ _ tendsto_natCast_atTop_atTop
  have hinv :
      Filter.Tendsto (fun N : ℕ => (((N : ℝ) + 1)⁻¹))
        Filter.atTop (𝓝 0) :=
    tendsto_inv_atTop_zero.comp hden
  have hmain :
      Filter.Tendsto
        (fun N : ℕ => -(1 + (((N : ℝ) + 1)⁻¹)))
        Filter.atTop (𝓝 (-1 : ℝ)) := by
    simpa using (tendsto_const_nhds.add hinv).neg
  convert hmain using 1
  · funext N
    dsimp
    have hx0 : (N : ℝ) + 2 ≠ 0 := by positivity
    have hx1 : (N : ℝ) + 2 ≠ 1 := by
      have hN : 0 ≤ (N : ℝ) := by positivity
      nlinarith
    rw [wd_x07_real_response_formula ((N : ℝ) + 2) hx0 hx1]
    field_simp
    ring

end WeilDefect
