import WeilDefect.Screening.Quadratic
import WeilDefect.Screening.DefectIndex
import WeilDefect.Screening.Douglas
import Mathlib

namespace WeilDefect.WDT07

open scoped InnerProduct
open ContinuousLinearMap
open WeilDefect
open WeilDefect.WDT01

variable {H Kpos Kneg B : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace ℂ Kneg] [CompleteSpace Kneg]
variable [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]

/--
WD-T07 pointwise operator-form custody:
adding an unselected negative background can only decrease the quadratic form.
-/
theorem wd_t07_full_le_selected
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (h : H) :
    fullQuadratic Spos Sneg S_B h
      ≤ selectedQuadratic Spos Sneg h := by
  unfold fullQuadratic
  have hsquare : 0 ≤ ‖(S_B†) h‖ ^ 2 := sq_nonneg _
  linarith

/--
Every k-dimensional selected negative witness remains a k-dimensional
negative witness after aggregation with an arbitrary negative background.
This is the finite-rank-spectrum form of ind₋(D_full) ≥ ind₋(D_M).
-/
theorem wd_t07_negative_rank_custody
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (k : ℕ) :
    HasNegativeRank
        (selectedQuadratic Spos Sneg)
        (Set.univ : Set H) k
      →
    HasNegativeRank
        (fullQuadratic Spos Sneg S_B)
        (Set.univ : Set H) k := by
  rintro ⟨T, hcarrier, hneg⟩
  refine ⟨T, hcarrier, ?_⟩
  intro x hx
  exact wd_t07_selected_negative_implies_full
    Spos Sneg S_B (T x) (hneg x hx)

/--
The converse custody implication fails already in one complex dimension:
the selected defect can be identically zero while a background channel creates
strict full negativity.
-/
theorem wd_t07_converse_failure :
    let Z : ℂ →L[ℂ] ℂ := 0
    let I : ℂ →L[ℂ] ℂ := ContinuousLinearMap.id ℂ ℂ
    selectedQuadratic Z Z 1 = 0
      ∧ fullQuadratic Z Z I 1 < 0 := by
  simp [selectedQuadratic, fullQuadratic, ContinuousLinearMap.adjoint_id]

/--
A sharper scalar custody witness: full negativity is present at h=1 while
selected negativity is absent at that same vector.
-/
theorem wd_t07_full_negative_without_selected_negative :
    let Z : ℂ →L[ℂ] ℂ := 0
    let I : ℂ →L[ℂ] ℂ := ContinuousLinearMap.id ℂ ℂ
    fullQuadratic Z Z I 1 < 0
      ∧ ¬ selectedQuadratic Z Z 1 < 0 := by
  simp [selectedQuadratic, fullQuadratic, ContinuousLinearMap.adjoint_id]

/--
WD-T07 assembled:
the full quadratic form is the selected form minus a background norm square;
selected finite negative rank is inherited by the full defect; but full
negativity does not determine selected-sector ownership.
-/
theorem wd_t07_selected_background_monotonicity_and_custody :
    (∀
      (Spos : Kpos →L[ℂ] H)
      (Sneg : Kneg →L[ℂ] H)
      (S_B : B →L[ℂ] H)
      (h : H),
      fullQuadratic Spos Sneg S_B h
        =
      selectedQuadratic Spos Sneg h - ‖(S_B†) h‖ ^ 2)
    ∧
    (∀
      (Spos : Kpos →L[ℂ] H)
      (Sneg : Kneg →L[ℂ] H)
      (S_B : B →L[ℂ] H)
      (h : H),
      fullQuadratic Spos Sneg S_B h
        ≤ selectedQuadratic Spos Sneg h)
    ∧
    (∀
      (Spos : Kpos →L[ℂ] H)
      (Sneg : Kneg →L[ℂ] H)
      (S_B : B →L[ℂ] H)
      (k : ℕ),
      HasNegativeRank
          (selectedQuadratic Spos Sneg)
          (Set.univ : Set H) k
        →
      HasNegativeRank
          (fullQuadratic Spos Sneg S_B)
          (Set.univ : Set H) k)
    ∧
    (let Z : ℂ →L[ℂ] ℂ := 0
     let I : ℂ →L[ℂ] ℂ := ContinuousLinearMap.id ℂ ℂ
     fullQuadratic Z Z I 1 < 0
       ∧ ¬ selectedQuadratic Z Z 1 < 0) := by
  refine ⟨?_, ?_, ?_, wd_t07_full_negative_without_selected_negative⟩
  · intro Spos Sneg S_B h
    exact wd_t07_selected_full_identity Spos Sneg S_B h
  · intro Spos Sneg S_B h
    exact wd_t07_full_le_selected Spos Sneg S_B h
  · intro Spos Sneg S_B k
    exact wd_t07_negative_rank_custody Spos Sneg S_B k

end WeilDefect.WDT07


namespace WeilDefect.WDT09

open Set
open scoped InnerProduct Topology
open ContinuousLinearMap
open WeilDefect
open WeilDefect.WDT02

variable {H Kpos M B : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
variable [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]

noncomputable def sharedDefect
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H) : H →L[ℂ] H :=
  Spos ∘L Spos† - S_M ∘L S_M† - S_B ∘L S_B†

def JointBudget (X_M : M →L[ℂ] Kpos) (X_B : B →L[ℂ] Kpos) : Prop :=
  ∀ a : Kpos, ‖(X_M†) a‖ ^ 2 + ‖(X_B†) a‖ ^ 2 ≤ ‖a‖ ^ 2

def FullNonnegative
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H) : Prop :=
  ∀ h : H, 0 ≤ fullQuadratic Spos S_M S_B h

theorem adjoint_of_signed_factor
    (Spos : Kpos →L[ℂ] H) (Sneg : M →L[ℂ] H) (X : M →L[ℂ] Kpos)
    (hfac : Sneg = -(Spos ∘L X)) :
    Sneg† = -(X† ∘L Spos†) := by
  have h := congrArg (fun T : M →L[ℂ] H => T†) hfac
  simpa [ContinuousLinearMap.adjoint_comp] using h

theorem wd_t09_full_quadratic_factorization
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H)
    (X_M : M →L[ℂ] Kpos) (X_B : B →L[ℂ] Kpos)
    (hM : S_M = -(Spos ∘L X_M)) (hB : S_B = -(Spos ∘L X_B)) (h : H) :
    fullQuadratic Spos S_M S_B h =
      ‖(Spos†) h‖ ^ 2 - ‖(X_M†) ((Spos†) h)‖ ^ 2 - ‖(X_B†) ((Spos†) h)‖ ^ 2 := by
  have hMadj := adjoint_of_signed_factor Spos S_M X_M hM
  have hBadj := adjoint_of_signed_factor Spos S_B X_B hB
  unfold fullQuadratic selectedQuadratic
  rw [hMadj, hBadj]
  simp [ContinuousLinearMap.comp_apply]

theorem wd_t09_shared_defect_factorization
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H)
    (X_M : M →L[ℂ] Kpos) (X_B : B →L[ℂ] Kpos)
    (hM : S_M = -(Spos ∘L X_M)) (hB : S_B = -(Spos ∘L X_B)) :
    sharedDefect Spos S_M S_B =
      Spos ∘L ((ContinuousLinearMap.id ℂ Kpos) - (X_M ∘L X_M†) - (X_B ∘L X_B†)) ∘L Spos† := by
  have hMadj := adjoint_of_signed_factor Spos S_M X_M hM
  have hBadj := adjoint_of_signed_factor Spos S_B X_B hB
  ext h
  simp only [sharedDefect, ContinuousLinearMap.sub_apply, ContinuousLinearMap.comp_apply]
  rw [hMadj, hBadj, hM, hB]
  simp [map_sub]

theorem wd_t09_full_nonnegative_iff_joint_budget
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H)
    (X_M : M →L[ℂ] Kpos) (X_B : B →L[ℂ] Kpos)
    (hker : Spos.ker = ⊥)
    (hM : S_M = -(Spos ∘L X_M)) (hB : S_B = -(Spos ∘L X_B)) :
    FullNonnegative Spos S_M S_B ↔ JointBudget X_M X_B := by
  constructor
  · intro hfull
    let C : Set Kpos := {a | ‖(X_M†) a‖ ^ 2 + ‖(X_B†) a‖ ^ 2 ≤ ‖a‖ ^ 2}
    have hleft :
        Continuous (fun a : Kpos =>
          ‖(X_M†) a‖ ^ 2 + ‖(X_B†) a‖ ^ 2) := by
      fun_prop
    have hright : Continuous (fun a : Kpos => ‖a‖ ^ 2) := by
      fun_prop
    have hclosed : IsClosed C := by
      exact isClosed_le hleft hright
    have hrange : ((Spos†).range : Set Kpos) ⊆ C := by
      rintro a ⟨h, rfl⟩
      have hh := hfull h
      rw [wd_t09_full_quadratic_factorization Spos S_M S_B X_M X_B hM hB h] at hh
      dsimp [C]
      linarith
    have hclosure : closure ((Spos†).range : Set Kpos) ⊆ C :=
      closure_minimal hrange hclosed
    intro a
    have ha : a ∈ closure ((Spos†).range : Set Kpos) := by
      rw [← Submodule.topologicalClosure_coe, ← ContinuousLinearMap.orthogonal_ker Spos, hker]
      simp
    exact hclosure ha
  · intro hbudget h
    rw [wd_t09_full_quadratic_factorization Spos S_M S_B X_M X_B hM hB h]
    have hb := hbudget ((Spos†) h)
    linarith

theorem wd_t09_separate_contractions_not_joint :
    let I : ℂ →L[ℂ] ℂ := ContinuousLinearMap.id ℂ ℂ
    IsContraction I ∧ IsContraction I ∧ ¬ JointBudget I I := by
  dsimp
  constructor
  · simp [IsContraction]
  constructor
  · simp [IsContraction]
  · intro hjoint
    have h := hjoint (1 : ℂ)
    simp [ContinuousLinearMap.adjoint_id] at h
    norm_num at h

theorem wd_t09_shared_screening_budget
    (Spos : Kpos →L[ℂ] H) (S_M : M →L[ℂ] H) (S_B : B →L[ℂ] H)
    (X_M : M →L[ℂ] Kpos) (X_B : B →L[ℂ] Kpos)
    (hker : Spos.ker = ⊥)
    (hM : S_M = -(Spos ∘L X_M)) (hB : S_B = -(Spos ∘L X_B)) :
    sharedDefect Spos S_M S_B =
      Spos ∘L ((ContinuousLinearMap.id ℂ Kpos) - (X_M ∘L X_M†) - (X_B ∘L X_B†)) ∘L Spos†
    ∧ (FullNonnegative Spos S_M S_B ↔ JointBudget X_M X_B)
    ∧ (let I : ℂ →L[ℂ] ℂ := ContinuousLinearMap.id ℂ ℂ
       IsContraction I ∧ IsContraction I ∧ ¬ JointBudget I I) := by
  exact ⟨wd_t09_shared_defect_factorization Spos S_M S_B X_M X_B hM hB,
    wd_t09_full_nonnegative_iff_joint_budget Spos S_M S_B X_M X_B hker hM hB,
    wd_t09_separate_contractions_not_joint⟩

end WeilDefect.WDT09
