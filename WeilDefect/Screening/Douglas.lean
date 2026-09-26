import WeilDefect.Screening.DefectIndex
import Mathlib

namespace WeilDefect.WDT02

open scoped InnerProduct
open ContinuousLinearMap
open WeilDefect.WDT01

variable {H Kpos Kneg : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace ℂ Kneg] [CompleteSpace Kneg]

/-- Quadratic-form encoding of Sneg Sneg† ≤ Spos Spos†. -/
def CovarianceLe
    (Sneg : Kneg →L[ℂ] H)
    (Spos : Kpos →L[ℂ] H) : Prop :=
  ∀ h : H, ‖(Sneg†) h‖ ^ 2 ≤ ‖(Spos†) h‖ ^ 2

/-- Unit coefficient budget. -/
def IsContraction (X : Kneg →L[ℂ] Kpos) : Prop :=
  ‖X‖ ≤ 1

/--
Reduced-range condition written without introducing a second orthogonal-complement
carrier: every output of C is orthogonal to ker B.
-/
def IsReducedFor
    (B : Kpos →L[ℂ] H)
    (C : Kneg →L[ℂ] Kpos) : Prop :=
  ∀ u k, B k = 0 → inner ℂ k (C u) = 0

/--
Explicit imported Douglas interface for the unit-majorization case.

This is a theorem premise, not a project axiom.  It records exactly the
external input needed by WD-T02:
  * unit covariance majorization iff contractive factorization;
  * existence and uniqueness of the reduced exact factor.
-/
structure DouglasUnitData
    (A : Kneg →L[ℂ] H)
    (B : Kpos →L[ℂ] H) : Prop where
  factorization_iff :
    CovarianceLe A B ↔
      ∃ C : Kneg →L[ℂ] Kpos,
        IsContraction C ∧ A = B ∘L C
  reduced_exists_unique :
    ∃! C : Kneg →L[ℂ] Kpos,
      A = B ∘L C ∧ IsReducedFor B C

/-- Physical nonnegativity is exactly covariance majorization. -/
theorem physicalNonnegative_iff_covarianceLe
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H) :
    PhysicalNonnegative Spos Sneg ↔ CovarianceLe Sneg Spos := by
  constructor
  · intro h hvec
    have hh := h hvec
    simpa [physicalQ, coeffQ, analysisMap] using hh
  · intro h hvec
    have hh := h hvec
    simpa [physicalQ, coeffQ, analysisMap] using sub_nonneg.mpr hh

/--
Contractive Douglas factorization with the project sign convention:
A = B C is equivalent to Sneg = -Spos X after X := -C.
-/
theorem covarianceLe_iff_signed_contractive_factorization
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasUnitData Sneg Spos) :
    CovarianceLe Sneg Spos ↔
      ∃ X : Kneg →L[ℂ] Kpos,
        IsContraction X ∧ Sneg = -(Spos ∘L X) := by
  constructor
  · intro h
    rcases hDouglas.factorization_iff.mp h with ⟨C, hCnorm, hfac⟩
    refine ⟨-C, ?_, ?_⟩
    · simpa [IsContraction] using hCnorm
    · rw [ContinuousLinearMap.comp_neg]
      simpa using hfac
  · rintro ⟨X, hXnorm, hfac⟩
    apply hDouglas.factorization_iff.mpr
    refine ⟨-X, ?_, ?_⟩
    · simpa [IsContraction] using hXnorm
    · rw [ContinuousLinearMap.comp_neg]
      simpa using hfac

/-- Reducedness is invariant under the project sign flip. -/
theorem reduced_neg_iff
    (B : Kpos →L[ℂ] H)
    (C : Kneg →L[ℂ] Kpos) :
    IsReducedFor B (-C) ↔ IsReducedFor B C := by
  simp [IsReducedFor]

/--
Unique reduced solution in the signed project convention.
-/
theorem signed_reduced_exists_unique
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasUnitData Sneg Spos) :
    ∃! X : Kneg →L[ℂ] Kpos,
      Sneg = -(Spos ∘L X) ∧ IsReducedFor Spos X := by
  rcases hDouglas.reduced_exists_unique with ⟨C, hC, huniq⟩
  refine ⟨-C, ?_, ?_⟩
  · constructor
    · rw [ContinuousLinearMap.comp_neg]
      simpa using hC.1
    · exact (reduced_neg_iff Spos C).2 hC.2
  · intro X hX
    have hminusX :
        Sneg = Spos ∘L (-X) ∧ IsReducedFor Spos (-X) := by
      constructor
      · rw [ContinuousLinearMap.comp_neg]
        simpa using hX.1
      · exact (reduced_neg_iff Spos X).2 hX.2
    have hEq : -X = C := huniq (-X) hminusX
    have := congrArg Neg.neg hEq
    simpa using this

/--
WD-T02: contractive screening equivalence, fully checked downstream from the
explicit Douglas theorem premise.
-/
theorem wd_t02_contractive_screening_equivalence
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasUnitData Sneg Spos) :
    AnalysisNonnegative Spos Sneg ↔
      PhysicalNonnegative Spos Sneg ∧
      CovarianceLe Sneg Spos ∧
      (∃ X : Kneg →L[ℂ] Kpos,
        IsContraction X ∧ Sneg = -(Spos ∘L X)) := by
  rw [wd_t01_nonnegative_iff]
  constructor
  · intro hphys
    have hcov := (physicalNonnegative_iff_covarianceLe Spos Sneg).mp hphys
    exact ⟨hphys, hcov,
      (covarianceLe_iff_signed_contractive_factorization Spos Sneg hDouglas).mp hcov⟩
  · rintro ⟨hphys, -, -⟩
    exact hphys

/--
WD-T02 reduced-solution clause in the project sign convention.
-/
theorem wd_t02_unique_reduced_solution
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasUnitData Sneg Spos) :
    ∃! X : Kneg →L[ℂ] Kpos,
      Sneg = -(Spos ∘L X) ∧ IsReducedFor Spos X :=
  signed_reduced_exists_unique Spos Sneg hDouglas

end WeilDefect.WDT02
