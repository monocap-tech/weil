import WeilDefect.Screening.GraphNormalForm
import Mathlib

namespace WeilDefect.WDT04

open scoped InnerProduct
open ContinuousLinearMap
open WeilDefect.WDT01
open WeilDefect.WDT02
open WeilDefect.WDT03

variable {H Kpos Kneg : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace ℂ Kneg] [CompleteSpace Kneg]

/-- The Hilbert direct-sum squared norm of a reduced graph vector. -/
noncomputable def graphNormSq
    (X : Kneg →L[ℂ] Kpos)
    (a : Kpos) : ℝ :=
  ‖a‖ ^ 2 + ‖(X†) a‖ ^ 2

/-- The adjoint has the same operator norm. -/
theorem norm_adjoint_eq
    (X : Kneg →L[ℂ] Kpos) :
    ‖X†‖ = ‖X‖ := by
  exact ContinuousLinearMap.adjoint.norm_map X

/--
Range defect: failure of Ran(Sneg) ⊆ Ran(Spos) rules out every exact
screening factor, independently of any norm budget.
-/
theorem wd_t04_range_defect_no_exact_screening
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hnotrange : ¬ Set.range Sneg ⊆ Set.range Spos) :
    ¬ ∃ X : Kneg →L[ℂ] Kpos, Sneg = -(Spos ∘L X) := by
  rintro ⟨X, hfac⟩
  apply hnotrange
  rintro y ⟨u, rfl⟩
  refine ⟨-X u, ?_⟩
  simp [hfac]

/--
The physical negative-direction consequence of the range-defect branch,
checked downstream from the explicit Douglas unit-factorization premise.
-/
theorem wd_t04_range_defect_negative
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasUnitData Sneg Spos)
    (hnotrange : ¬ Set.range Sneg ⊆ Set.range Spos) :
    ∃ h : H, physicalQ Spos Sneg h < 0 := by
  have hnotphys : ¬ PhysicalNonnegative Spos Sneg := by
    intro hphys
    have hcov :=
      (physicalNonnegative_iff_covarianceLe Spos Sneg).mp hphys
    rcases hDouglas.factorization_iff.mp hcov with ⟨C, -, hfac⟩
    apply hnotrange
    rintro y ⟨u, rfl⟩
    exact ⟨C u, by simpa [hfac]⟩
  simp only [PhysicalNonnegative] at hnotphys
  push_neg at hnotphys
  exact hnotphys

/--
Over-budget defect: if the reduced factor has norm strictly larger than one,
its graph contains a strictly negative coefficient direction.
-/
theorem wd_t04_over_budget_negative
    (X : Kneg →L[ℂ] Kpos)
    (hX : 1 < ‖X‖) :
    ∃ a : Kpos,
      coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) < 0 := by
  have hex : ∃ a : Kpos, ‖a‖ < ‖(X†) a‖ := by
    by_contra h
    push_neg at h
    have hop : ‖X†‖ ≤ 1 := by
      apply (X†).opNorm_le_bound (by norm_num)
      intro a
      simpa using h a
    rw [norm_adjoint_eq X] at hop
    linarith
  rcases hex with ⟨a, ha⟩
  refine ⟨a, ?_⟩
  rw [wd_t03_graph_signature]
  nlinarith [norm_nonneg a, norm_nonneg ((X†) a)]

/--
Strict screening: the graph form is uniformly positive in the explicit
Hilbert direct-sum metric.
-/
theorem wd_t04_strict_screened_lower_bound
    (X : Kneg →L[ℂ] Kpos)
    (r : ℝ)
    (hX : ‖X‖ = r)
    (hr : r < 1)
    (a : Kpos) :
    ((1 - r ^ 2) / (1 + r ^ 2)) * graphNormSq X a
      ≤ coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) := by
  have hr0 : 0 ≤ r := by
    rw [← hX]
    exact norm_nonneg X
  have hadj : ‖X†‖ = r := by
    rw [norm_adjoint_eq X, hX]
  have hb : ‖(X†) a‖ ≤ r * ‖a‖ := by
    calc
      ‖(X†) a‖ ≤ ‖X†‖ * ‖a‖ := ContinuousLinearMap.le_opNorm (X†) a
      _ = r * ‖a‖ := by rw [hadj]
  have hsq : ‖(X†) a‖ ^ 2 ≤ r ^ 2 * ‖a‖ ^ 2 := by
    nlinarith [norm_nonneg a, norm_nonneg ((X†) a)]
  have hden : 0 < 1 + r ^ 2 := by
    nlinarith [sq_nonneg r]
  rw [wd_t03_graph_signature]
  unfold graphNormSq
  rw [div_mul_eq_mul_div]
  apply (div_le_iff₀ hden).2
  nlinarith

/--
Attained critical screening produces a nonzero neutral graph vector.
-/
theorem wd_t04_attained_critical_neutral
    (X : Kneg →L[ℂ] Kpos)
    (a : Kpos)
    (ha : a ≠ 0)
    (hattain : ‖(X†) a‖ = ‖a‖) :
    (a, -(X†) a) ≠ (0 : Kpos × Kneg) ∧
      coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) = 0 := by
  constructor
  · intro hzero
    have := congrArg Prod.fst hzero
    exact ha (by simpa using this)
  · rw [wd_t03_graph_signature, hattain]
    ring

/--
At norm one, absence of any nonzero norm-attaining adjoint vector makes every
nonzero reduced graph vector strictly positive.
-/
theorem wd_t04_nonattained_critical_positive
    (X : Kneg →L[ℂ] Kpos)
    (hX : ‖X‖ = 1)
    (hno :
      ∀ a : Kpos, a ≠ 0 → ‖(X†) a‖ ≠ ‖a‖)
    (a : Kpos)
    (ha : a ≠ 0) :
    0 < coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) := by
  have hadj : ‖X†‖ = 1 := by
    rw [norm_adjoint_eq X, hX]
  have hle : ‖(X†) a‖ ≤ ‖a‖ := by
    calc
      ‖(X†) a‖ ≤ ‖X†‖ * ‖a‖ := ContinuousLinearMap.le_opNorm (X†) a
      _ = ‖a‖ := by rw [hadj]; ring
  have hlt : ‖(X†) a‖ < ‖a‖ :=
    lt_of_le_of_ne hle (hno a ha)
  rw [wd_t03_graph_signature]
  nlinarith [norm_nonneg a, norm_nonneg ((X†) a)]

/--
Norm-one screening always has arbitrarily small positive graph defect on unit
base vectors.  In the non-attained branch, this is the approximate-neutral
boundary.
-/
theorem wd_t04_critical_approximate_neutral
    (X : Kneg →L[ℂ] Kpos)
    (hX : ‖X‖ = 1) :
    ∀ ε : ℝ, 0 < ε →
      ∃ a : Kpos,
        ‖a‖ = 1 ∧
        coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) < 2 * ε := by
  intro ε hε
  let δ : ℝ := min ε (1 / 2)
  have hδpos : 0 < δ := by
    dsimp [δ]
    exact lt_min hε (by norm_num)
  have hδleε : δ ≤ ε := by
    dsimp [δ]
    exact min_le_left _ _
  have hδlehalf : δ ≤ 1 / 2 := by
    dsimp [δ]
    exact min_le_right _ _
  have hCnonneg : 0 ≤ 1 - δ := by
    linarith
  have hadj : ‖X†‖ = 1 := by
    rw [norm_adjoint_eq X, hX]
  have hex :
      ∃ a : Kpos, ‖a‖ = 1 ∧ 1 - δ < ‖(X†) a‖ := by
    by_contra h
    push_neg at h
    have hop : ‖X†‖ ≤ 1 - δ := by
      apply (X†).opNorm_le_of_unit_norm hCnonneg
      intro a ha
      exact h a ha
    rw [hadj] at hop
    linarith
  rcases hex with ⟨a, ha, hclose⟩
  have hb : ‖(X†) a‖ ≤ 1 := by
    calc
      ‖(X†) a‖ ≤ ‖X†‖ * ‖a‖ := ContinuousLinearMap.le_opNorm (X†) a
      _ = 1 := by rw [hadj, ha]; norm_num
  have hcloseε : 1 - ε < ‖(X†) a‖ := by
    have : 1 - ε ≤ 1 - δ := by linarith
    exact lt_of_le_of_lt this hclose
  refine ⟨a, ha, ?_⟩
  rw [wd_t03_graph_signature, ha]
  norm_num
  nlinarith [norm_nonneg ((X†) a), sq_nonneg (1 - ‖(X†) a‖)]

/--
Complete reduced-factor morphology: over-budget, strictly screened, attained
critical, or non-attained approximate-neutral.  This is the range-included
part of WD-T04; the range-defect branch is certified separately above.
-/
theorem wd_t04_complete_reduced_taxonomy
    (X : Kneg →L[ℂ] Kpos) :
    (1 < ‖X‖ ∧
      ∃ a : Kpos,
        coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) < 0)
    ∨
    (‖X‖ < 1 ∧
      ∀ a : Kpos,
        ((1 - ‖X‖ ^ 2) / (1 + ‖X‖ ^ 2)) * graphNormSq X a
          ≤ coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a))
    ∨
    (‖X‖ = 1 ∧
      (
        (∃ a : Kpos,
          a ≠ 0 ∧
          ‖(X†) a‖ = ‖a‖ ∧
          coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a) = 0)
        ∨
        ((∀ a : Kpos, a ≠ 0 → ‖(X†) a‖ ≠ ‖a‖) ∧
          (∀ a : Kpos, a ≠ 0 →
            0 < coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a)) ∧
          (∀ ε : ℝ, 0 < ε →
            ∃ a : Kpos,
              ‖a‖ = 1 ∧
              coeffQ (Kpos := Kpos) (Kneg := Kneg)
                (a, -(X†) a) < 2 * ε)))) := by
  rcases lt_trichotomy ‖X‖ 1 with hlt | heq | hgt
  · exact Or.inr <| Or.inl ⟨hlt, fun a =>
      wd_t04_strict_screened_lower_bound X ‖X‖ rfl hlt a⟩
  · refine Or.inr <| Or.inr ⟨heq, ?_⟩
    by_cases hatt : ∃ a : Kpos, a ≠ 0 ∧ ‖(X†) a‖ = ‖a‖
    · rcases hatt with ⟨a, ha, hnorm⟩
      exact Or.inl ⟨a, ha, hnorm,
        (wd_t04_attained_critical_neutral X a ha hnorm).2⟩
    · have hno : ∀ a : Kpos, a ≠ 0 → ‖(X†) a‖ ≠ ‖a‖ := by
        intro a ha hnorm
        exact hatt ⟨a, ha, hnorm⟩
      exact Or.inr ⟨hno,
        fun a ha => wd_t04_nonattained_critical_positive X heq hno a ha,
        wd_t04_critical_approximate_neutral X heq⟩
  · exact Or.inl ⟨hgt, wd_t04_over_budget_negative X hgt⟩

end WeilDefect.WDT04
