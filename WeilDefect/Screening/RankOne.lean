import WeilDefect.Screening.Douglas
import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Analysis.InnerProductSpace.LinearMap

namespace WeilDefect

open scoped InnerProduct
open ContinuousLinearMap
open InnerProductSpace

variable {𝕜 H : Type*}
variable [RCLike 𝕜]
variable [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/--
Native operator identity in WD-T05:
the covariance of the one-dimensional synthesis α ↦ α • g
is the rank-one operator g ⊗ g.
-/
theorem wd_t05_rank_one_covariance (g : H) :
    (toSpanSingleton 𝕜 g) ∘L (toSpanSingleton 𝕜 g)†
      = rankOne 𝕜 g g := by
  rw [adjoint_toSpanSingleton]
  rfl

/-- Pointwise form of the WD-T05 rank-one covariance. -/
theorem wd_t05_rank_one_covariance_apply (g h : H) :
    (((toSpanSingleton 𝕜 g) ∘L (toSpanSingleton 𝕜 g)†) h)
      = inner 𝕜 g h • g := by
  rw [wd_t05_rank_one_covariance]
  rfl

end WeilDefect

namespace WeilDefect.WDT05

open scoped InnerProduct
open ContinuousLinearMap
open InnerProductSpace
open WeilDefect.WDT01
open WeilDefect.WDT02

variable {H Kpos : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]

/-- The one-negative-channel synthesis α ↦ α • g. -/
noncomputable def rankOneNegative (g : H) : ℂ →L[ℂ] H :=
  toSpanSingleton ℂ g

/--
WD-T05 physical defect specialization:
D = S₊S₊† - g⊗g.
-/
theorem wd_t05_defect_rank_one
    (Spos : Kpos →L[ℂ] H)
    (g : H) :
    physicalDefect Spos (rankOneNegative g)
      = Spos ∘L Spos† - rankOne ℂ g g := by
  unfold physicalDefect rankOneNegative
  rw [WeilDefect.wd_t05_rank_one_covariance]

/--
A signed contractive factor from the one-dimensional negative coefficient
space is exactly a coefficient vector c with ‖c‖ ≤ 1 and g = -S₊c.
-/
theorem wd_t05_signed_factor_iff_vector
    (Spos : Kpos →L[ℂ] H)
    (g : H) :
    (∃ X : ℂ →L[ℂ] Kpos,
      IsContraction X ∧
      rankOneNegative g = -(Spos ∘L X))
    ↔
    ∃ c : Kpos, ‖c‖ ≤ 1 ∧ g = -(Spos c) := by
  constructor
  · rintro ⟨X, hX, hfac⟩
    refine ⟨X 1, ?_, ?_⟩
    · have hle : ‖X 1‖ ≤ ‖X‖ * ‖(1 : ℂ)‖ :=
        ContinuousLinearMap.le_opNorm X 1
      have hone : ‖(1 : ℂ)‖ = 1 := norm_one
      rw [hone, mul_one] at hle
      exact le_trans hle hX
    · have hpoint := congrArg (fun T : ℂ →L[ℂ] H => T 1) hfac
      simpa [rankOneNegative] using hpoint
  · rintro ⟨c, hc, hgc⟩
    refine ⟨toSpanSingleton ℂ c, ?_, ?_⟩
    · simpa [IsContraction] using hc
    · apply ContinuousLinearMap.ext
      intro z
      simp [rankOneNegative, hgc, smul_neg]

/--
Rank-one covariance majorization is equivalent, downstream from the explicit
Douglas unit theorem premise, to a unit-budget coefficient vector.
-/
theorem wd_t05_covariance_iff_unit_vector
    (Spos : Kpos →L[ℂ] H)
    (g : H)
    (hDouglas : DouglasUnitData (rankOneNegative g) Spos) :
    CovarianceLe (rankOneNegative g) Spos
      ↔ ∃ c : Kpos, ‖c‖ ≤ 1 ∧ g = -(Spos c) := by
  rw [covarianceLe_iff_signed_contractive_factorization
    Spos (rankOneNegative g) hDouglas]
  exact wd_t05_signed_factor_iff_vector Spos g

/--
WD-T05 positivity specialization:
physical nonnegativity of the rank-one defect is equivalent to a unit-budget
coefficient vector synthesizing -g.
-/
theorem wd_t05_physical_nonnegative_iff_unit_vector
    (Spos : Kpos →L[ℂ] H)
    (g : H)
    (hDouglas : DouglasUnitData (rankOneNegative g) Spos) :
    PhysicalNonnegative Spos (rankOneNegative g)
      ↔ ∃ c : Kpos, ‖c‖ ≤ 1 ∧ g = -(Spos c) := by
  rw [physicalNonnegative_iff_covarianceLe]
  exact wd_t05_covariance_iff_unit_vector Spos g hDouglas

/--
WD-T05 analysis-space specialization:
analysis nonnegativity is equivalent to the same unit-budget rank-one
screening vector.
-/
theorem wd_t05_analysis_nonnegative_iff_unit_vector
    (Spos : Kpos →L[ℂ] H)
    (g : H)
    (hDouglas : DouglasUnitData (rankOneNegative g) Spos) :
    AnalysisNonnegative Spos (rankOneNegative g)
      ↔ ∃ c : Kpos, ‖c‖ ≤ 1 ∧ g = -(Spos c) := by
  rw [wd_t01_nonnegative_iff]
  exact wd_t05_physical_nonnegative_iff_unit_vector Spos g hDouglas

/--
Assembled rank-one specialization of WD-T01/WD-T02:
the defect has the advertised rank-one operator form and positivity is
equivalent to exact unit-budget screening of the single negative vector.
-/
theorem wd_t05_rank_one_specialization
    (Spos : Kpos →L[ℂ] H)
    (g : H)
    (hDouglas : DouglasUnitData (rankOneNegative g) Spos) :
    physicalDefect Spos (rankOneNegative g)
        = Spos ∘L Spos† - rankOne ℂ g g
    ∧
    (AnalysisNonnegative Spos (rankOneNegative g)
      ↔ ∃ c : Kpos, ‖c‖ ≤ 1 ∧ g = -(Spos c)) := by
  exact ⟨wd_t05_defect_rank_one Spos g,
    wd_t05_analysis_nonnegative_iff_unit_vector Spos g hDouglas⟩

end WeilDefect.WDT05
