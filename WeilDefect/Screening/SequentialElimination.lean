import WeilDefect.Screening.ResidualBudget
import Mathlib

namespace WeilDefect.WDT12

open scoped InnerProduct ComplexOrder
open ContinuousLinearMap
open WeilDefect
open WeilDefect.WDT02
open WeilDefect.WDT10

variable {H Kpos B1 B2 : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup B1] [InnerProductSpace ℂ B1] [CompleteSpace B1]
variable [NormedAddCommGroup B2] [InnerProductSpace ℂ B2] [CompleteSpace B2]

/--
Residual coefficient-space budget after first consuming `X1` and then
consuming `Y2` through the residual positive synthesis.
-/
noncomputable def sequentialResidualBudget
    (X1 : B1 →L[ℂ] Kpos)
    (Y2 : B2 →L[ℂ] Kpos) : Kpos →L[ℂ] Kpos :=
  residualBudget X1 -
    residualSqrt X1 ∘L Y2 ∘L Y2† ∘L residualSqrt X1

/--
The second residual budget written on the first effective synthesis is exactly
the coefficient-space sequential budget pulled back through the original
positive synthesis.
-/
theorem wd_t12_sequential_budget_covariance
    (Spos : Kpos →L[ℂ] H)
    (X1 : B1 →L[ℂ] Kpos)
    (Y2 : B2 →L[ℂ] Kpos)
    (hX1 : IsContraction X1) :
    effectivePositive Spos X1 ∘L residualBudget Y2 ∘L
        (effectivePositive Spos X1)†
      =
    Spos ∘L sequentialResidualBudget X1 Y2 ∘L Spos† := by
  have hself := wd_t10_residual_sqrt_selfAdjoint X1 hX1
  have hsq :
      ∀ z : Kpos,
        residualSqrt X1 (residualSqrt X1 z) = residualBudget X1 z := by
    intro z
    have h :=
      congrArg
        (fun T : Kpos →L[ℂ] Kpos => T z)
        (wd_t10_residual_sqrt_sq X1 hX1)
    simpa [ContinuousLinearMap.comp_apply] using h
  rw [effectivePositive, ContinuousLinearMap.adjoint_comp]
  rw [show (residualSqrt X1)† = residualSqrt X1 from hself]
  ext h
  simp only [ContinuousLinearMap.comp_apply]
  simp [sequentialResidualBudget, residualBudget, map_sub, hsq]

/--
If the second background factors through the first residual synthesis, then
eliminating it leaves exactly the second residual covariance.
-/
theorem wd_t12_second_background_elimination
    (Spos : Kpos →L[ℂ] H)
    (S_B1 : B1 →L[ℂ] H)
    (S_B2 : B2 →L[ℂ] H)
    (X1 : B1 →L[ℂ] Kpos)
    (Y2 : B2 →L[ℂ] Kpos)
    (hX1 : IsContraction X1)
    (hY2 : IsContraction Y2)
    (hB1 : S_B1 = -(Spos ∘L X1))
    (hB2 : S_B2 = -(effectivePositive Spos X1 ∘L Y2)) :
    Spos ∘L Spos† - S_B1 ∘L S_B1† - S_B2 ∘L S_B2†
      =
    Spos ∘L sequentialResidualBudget X1 Y2 ∘L Spos† := by
  calc
    Spos ∘L Spos† - S_B1 ∘L S_B1† - S_B2 ∘L S_B2†
        =
      effectivePositive Spos X1 ∘L (effectivePositive Spos X1)† -
        S_B2 ∘L S_B2† := by
          rw [wd_t10_background_covariance_elimination
            Spos S_B1 X1 hX1 hB1]
    _ =
      effectivePositive (effectivePositive Spos X1) Y2 ∘L
        (effectivePositive (effectivePositive Spos X1) Y2)† := by
          exact wd_t10_background_covariance_elimination
            (effectivePositive Spos X1) S_B2 Y2 hY2 hB2
    _ =
      effectivePositive Spos X1 ∘L residualBudget Y2 ∘L
        (effectivePositive Spos X1)† := by
          exact wd_t10_effective_covariance
            (effectivePositive Spos X1) Y2 hY2
    _ =
      Spos ∘L sequentialResidualBudget X1 Y2 ∘L Spos† := by
          exact wd_t12_sequential_budget_covariance Spos X1 Y2 hX1

/--
WD-T12: admissible background elimination is closed under sequential
consumption. The residual covariance after two stages has both canonical
representations from WD-B6.
-/
theorem wd_t12_sequential_background_consumption
    (Spos : Kpos →L[ℂ] H)
    (S_B1 : B1 →L[ℂ] H)
    (S_B2 : B2 →L[ℂ] H)
    (X1 : B1 →L[ℂ] Kpos)
    (Y2 : B2 →L[ℂ] Kpos)
    (hX1 : IsContraction X1)
    (hY2 : IsContraction Y2)
    (hB1 : S_B1 = -(Spos ∘L X1))
    (hB2 : S_B2 = -(effectivePositive Spos X1 ∘L Y2)) :
    (Spos ∘L Spos† - S_B1 ∘L S_B1† - S_B2 ∘L S_B2†
      =
      Spos ∘L sequentialResidualBudget X1 Y2 ∘L Spos†)
    ∧
    (Spos ∘L sequentialResidualBudget X1 Y2 ∘L Spos†
      =
      effectivePositive Spos X1 ∘L residualBudget Y2 ∘L
        (effectivePositive Spos X1)†) := by
  constructor
  · exact wd_t12_second_background_elimination
      Spos S_B1 S_B2 X1 Y2 hX1 hY2 hB1 hB2
  · exact (wd_t12_sequential_budget_covariance Spos X1 Y2 hX1).symm

end WeilDefect.WDT12
