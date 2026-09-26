import WeilDefect.Screening.BackgroundCustody
import WeilDefect.Screening.Douglas
import Mathlib.Analysis.SpecialFunctions.ContinuousFunctionalCalculus.Rpow.Basic
import Mathlib.Analysis.InnerProductSpace.StarOrder
import Mathlib

namespace WeilDefect.WDT10

open scoped InnerProduct ComplexOrder
open ContinuousLinearMap
open InnerProductSpace
open WeilDefect
open WeilDefect.WDT01
open WeilDefect.WDT02
open WeilDefect.WDT09

variable {H Kpos M B : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
variable [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]

/-- Residual positive budget after paying for the background screen. -/
noncomputable def residualBudget
    (X_B : B →L[ℂ] Kpos) : Kpos →L[ℂ] Kpos :=
  ContinuousLinearMap.id ℂ Kpos - X_B ∘L X_B†

/-- A contractive background leaves a positive residual budget. -/
theorem wd_t10_residual_budget_positive
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B) :
    (residualBudget X_B).IsPositive := by
  rw [ContinuousLinearMap.isPositive_iff']
  constructor
  · exact
      ContinuousLinearMap.isPositive_id.isSelfAdjoint.sub
        (ContinuousLinearMap.isPositive_self_comp_adjoint X_B).isSelfAdjoint
  · intro a
    unfold residualBudget
    simp only [ContinuousLinearMap.sub_apply,
      ContinuousLinearMap.id_apply,
      ContinuousLinearMap.comp_apply]
    rw [inner_sub_left]
    rw [← ContinuousLinearMap.adjoint_inner_right
      X_B ((X_B†) a) a]
    simp only [inner_self_eq_norm_sq_to_K]
    apply sub_nonneg.mpr
    have hle :
        ‖(X_B†) a‖ ≤ ‖X_B†‖ * ‖a‖ :=
      ContinuousLinearMap.le_opNorm (X_B†) a
    rw [ContinuousLinearMap.adjoint.norm_map] at hle
    have hx : ‖X_B‖ * ‖a‖ ≤ ‖a‖ := by
      calc
        ‖X_B‖ * ‖a‖ ≤ 1 * ‖a‖ :=
          mul_le_mul_of_nonneg_right hXB (norm_nonneg a)
        _ = ‖a‖ := one_mul _
    have hnorm : ‖(X_B†) a‖ ≤ ‖a‖ := hle.trans hx
    have hsquare : ‖(X_B†) a‖ ^ 2 ≤ ‖a‖ ^ 2 := by
      nlinarith [norm_nonneg ((X_B†) a), norm_nonneg a]
    exact_mod_cast hsquare

/-- The canonical positive square root of the residual budget. -/
noncomputable def residualSqrt
    (X_B : B →L[ℂ] Kpos) : Kpos →L[ℂ] Kpos :=
  CFC.sqrt (residualBudget X_B)

/-- The residual square root is self-adjoint. -/
theorem wd_t10_residual_sqrt_selfAdjoint
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B) :
    IsSelfAdjoint (residualSqrt X_B) := by
  exact (CFC.sqrt_nonneg (residualBudget X_B)).isSelfAdjoint

/-- The residual square root squares back to the residual budget. -/
theorem wd_t10_residual_sqrt_sq
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B) :
    residualSqrt X_B ∘L residualSqrt X_B = residualBudget X_B := by
  have hpos := wd_t10_residual_budget_positive X_B hXB
  have hnonneg : 0 ≤ residualBudget X_B :=
    ContinuousLinearMap.nonneg_iff_isPositive.mpr hpos
  simpa [residualSqrt, ContinuousLinearMap.mul_def] using
    (CFC.sqrt_mul_sqrt_self (residualBudget X_B) hnonneg)

/-- Effective positive synthesis after consuming the background budget. -/
noncomputable def effectivePositive
    (Spos : Kpos →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos) : Kpos →L[ℂ] H :=
  Spos ∘L residualSqrt X_B

/--
The effective positive covariance is exactly the original positive covariance
minus the paid background covariance in coefficient coordinates.
-/
theorem wd_t10_effective_covariance
    (Spos : Kpos →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B) :
    effectivePositive Spos X_B ∘L (effectivePositive Spos X_B)†
      =
    Spos ∘L residualBudget X_B ∘L Spos† := by
  unfold effectivePositive
  rw [ContinuousLinearMap.adjoint_comp]
  have hself := wd_t10_residual_sqrt_selfAdjoint X_B hXB
  rw [show (residualSqrt X_B)† = residualSqrt X_B from hself]
  ext h
  simp only [ContinuousLinearMap.comp_apply]
  change
    Spos
        ((residualSqrt X_B ∘L residualSqrt X_B)
          ((Spos†) h))
      =
    Spos (residualBudget X_B ((Spos†) h))
  rw [wd_t10_residual_sqrt_sq X_B hXB]

/--
Background covariance elimination:
if S_B = -S_+ X_B, the positive covariance left after subtracting the
background equals the effective covariance.
-/
theorem wd_t10_background_covariance_elimination
    (Spos : Kpos →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B)
    (hB : S_B = -(Spos ∘L X_B)) :
    Spos ∘L Spos† - S_B ∘L S_B†
      =
    effectivePositive Spos X_B ∘L (effectivePositive Spos X_B)† := by
  rw [wd_t10_effective_covariance Spos X_B hXB]
  have hBadj := WDT09.adjoint_of_signed_factor Spos S_B X_B hB
  rw [hBadj, hB]
  unfold residualBudget
  ext h
  simp only [ContinuousLinearMap.sub_apply,
    ContinuousLinearMap.comp_apply,
    ContinuousLinearMap.neg_apply,
    ContinuousLinearMap.id_apply]
  simp [map_sub]

/--
The full selected-plus-background defect is exactly the ordinary two-channel
defect for the effective positive synthesis and selected negative channel.
-/
theorem wd_t10_full_defect_reduction
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B)
    (hB : S_B = -(Spos ∘L X_B)) :
    sharedDefect Spos S_M S_B
      =
    physicalDefect (effectivePositive Spos X_B) S_M := by
  have hbg :=
    wd_t10_background_covariance_elimination Spos S_B X_B hXB hB
  unfold sharedDefect physicalDefect
  calc
    Spos ∘L Spos† - S_M ∘L S_M† - S_B ∘L S_B†
        =
      (Spos ∘L Spos† - S_B ∘L S_B†) - S_M ∘L S_M† := by
        abel
    _ =
      effectivePositive Spos X_B ∘L
        (effectivePositive Spos X_B)† - S_M ∘L S_M† := by
        rw [hbg]

/-- The full shared defect has the expected scalar quadratic form. -/
theorem wd_t10_shared_defect_inner_identity
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (h : H) :
    inner ℂ (sharedDefect Spos S_M S_B h) h
      = ((fullQuadratic Spos S_M S_B h : ℝ) : ℂ) := by
  simp only [sharedDefect, fullQuadratic, selectedQuadratic,
    ContinuousLinearMap.sub_apply,
    ContinuousLinearMap.comp_apply]
  rw [inner_sub_left, inner_sub_left]
  rw [← ContinuousLinearMap.adjoint_inner_right
    Spos ((Spos†) h) h]
  rw [← ContinuousLinearMap.adjoint_inner_right
    S_M ((S_M†) h) h]
  rw [← ContinuousLinearMap.adjoint_inner_right
    S_B ((S_B†) h) h]
  simp [inner_self_eq_norm_sq_to_K]

/--
Full quadratic nonnegativity is exactly physical nonnegativity of the reduced
two-channel problem.
-/
theorem wd_t10_full_nonnegative_iff_effective_physical
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B)
    (hB : S_B = -(Spos ∘L X_B)) :
    FullNonnegative Spos S_M S_B
      ↔ PhysicalNonnegative (effectivePositive Spos X_B) S_M := by
  have hop :=
    wd_t10_full_defect_reduction Spos S_M S_B X_B hXB hB
  have hq : ∀ h : H,
      fullQuadratic Spos S_M S_B h
        = physicalQ (effectivePositive Spos X_B) S_M h := by
    intro h
    have hfull :=
      wd_t10_shared_defect_inner_identity Spos S_M S_B h
    rw [hop] at hfull
    have heff :=
      wd_t01_defect_inner_identity
        (effectivePositive Spos X_B) S_M h
    rw [heff] at hfull
    exact_mod_cast hfull.symm
  constructor
  · intro hfull h
    rw [← hq h]
    exact hfull h
  · intro heff h
    rw [hq h]
    exact heff h

/--
WD-T10 residual-budget screening equivalence downstream from the explicit
Douglas premise for the effective positive synthesis.
-/
theorem wd_t10_full_nonnegative_iff_residual_screening
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B)
    (hB : S_B = -(Spos ∘L X_B))
    (hDouglas :
      DouglasUnitData S_M (effectivePositive Spos X_B)) :
    FullNonnegative Spos S_M S_B
      ↔
    ∃ Y : M →L[ℂ] Kpos,
      IsContraction Y
        ∧ S_M = -(effectivePositive Spos X_B ∘L Y) := by
  rw [wd_t10_full_nonnegative_iff_effective_physical
    Spos S_M S_B X_B hXB hB]
  rw [physicalNonnegative_iff_covarianceLe]
  exact covarianceLe_iff_signed_contractive_factorization
    (effectivePositive Spos X_B) S_M hDouglas

/--
WD-T10 assembled background elimination and residual-budget theorem.
-/
theorem wd_t10_background_elimination_and_residual_budget
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (X_B : B →L[ℂ] Kpos)
    (hXB : IsContraction X_B)
    (hB : S_B = -(Spos ∘L X_B))
    (hDouglas :
      DouglasUnitData S_M (effectivePositive Spos X_B)) :
    (residualBudget X_B).IsPositive
    ∧
    sharedDefect Spos S_M S_B
      = physicalDefect (effectivePositive Spos X_B) S_M
    ∧
    (FullNonnegative Spos S_M S_B
      ↔
      ∃ Y : M →L[ℂ] Kpos,
        IsContraction Y
          ∧ S_M = -(effectivePositive Spos X_B ∘L Y)) := by
  exact ⟨
    wd_t10_residual_budget_positive X_B hXB,
    wd_t10_full_defect_reduction Spos S_M S_B X_B hXB hB,
    wd_t10_full_nonnegative_iff_residual_screening
      Spos S_M S_B X_B hXB hB hDouglas
  ⟩

end WeilDefect.WDT10
