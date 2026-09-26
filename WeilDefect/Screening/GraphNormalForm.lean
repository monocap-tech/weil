import WeilDefect.Screening.Douglas
import Mathlib

namespace WeilDefect.WDT03

open scoped InnerProduct
open ContinuousLinearMap
open WeilDefect.WDT01
open WeilDefect.WDT02

variable {H Kpos Kneg : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace ℂ Kneg] [CompleteSpace Kneg]

/-- Synthesis map E(x,u)=Spos x + Sneg u. -/
def synthesisMap
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H) :
    (Kpos × Kneg) →L[ℂ] H :=
  Spos.coprod Sneg

/-- Direct-sum Hilbert inner form on coefficient pairs. -/
noncomputable def pairInner
    (z w : Kpos × Kneg) : ℂ :=
  inner ℂ z.1 w.1 + inner ℂ z.2 w.2

/--
Membership in A=(ker E)⊥, expressed against the direct-sum Hilbert inner
form without imposing the Banach product norm as a Hilbert norm.
-/
noncomputable def AnalysisMember
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (z : Kpos × Kneg) : Prop :=
  ∀ w, synthesisMap Spos Sneg w = 0 → pairInner z w = 0

/--
Imported Douglas range-inclusion interface used by WD-T03.

It is an explicit theorem premise, not a project axiom.
-/
structure DouglasRangeData
    (A : Kneg →L[ℂ] H)
    (B : Kpos →L[ℂ] H) : Prop where
  reduced_of_range :
    Set.range A ⊆ Set.range B →
      ∃! C : Kneg →L[ℂ] Kpos,
        A = B ∘L C ∧ IsReducedFor B C

/--
Douglas reduced solution transferred to the project's sign convention.
-/
theorem signed_reduced_of_range
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasRangeData Sneg Spos)
    (hrange : Set.range Sneg ⊆ Set.range Spos) :
    ∃! X : Kneg →L[ℂ] Kpos,
      Sneg = -(Spos ∘L X) ∧ IsReducedFor Spos X := by
  rcases hDouglas.reduced_of_range hrange with ⟨C, hC, huniq⟩
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

/-- Kernel characterization under an exact reduced screening relation. -/
theorem kernel_iff
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (X : Kneg →L[ℂ] Kpos)
    (hfac : Sneg = -(Spos ∘L X))
    (x : Kpos) (u : Kneg) :
    synthesisMap Spos Sneg (x,u) = 0 ↔
      ∃ k : Kpos, Spos k = 0 ∧ x = k + X u := by
  constructor
  · intro h
    refine ⟨x - X u, ?_, ?_⟩
    · have h' := h
      simp [synthesisMap, hfac] at h'
      simpa [sub_eq_add_neg, map_sub] using h'
    · abel
  · rintro ⟨k, hk, rfl⟩
    simp [synthesisMap, hfac, hk]

/-- The two kernel summands are orthogonal when X is reduced. -/
theorem kernel_summands_orthogonal
    (Spos : Kpos →L[ℂ] H)
    (X : Kneg →L[ℂ] Kpos)
    (hred : IsReducedFor Spos X)
    (k : Kpos) (u : Kneg)
    (hk : Spos k = 0) :
    pairInner (k, (0 : Kneg)) (X u, u) = 0 := by
  simpa [pairInner] using hred u k hk

/--
WD-T03 kernel split, expressed pointwise:
every kernel vector decomposes uniquely as a kernel-positive component plus
the graph component (Xu,u).
-/
theorem wd_t03_kernel_decomposition
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (X : Kneg →L[ℂ] Kpos)
    (hfac : Sneg = -(Spos ∘L X))
    (hred : IsReducedFor Spos X)
    (x : Kpos) (u : Kneg) :
    synthesisMap Spos Sneg (x,u) = 0 ↔
      ∃! k : Kpos,
        Spos k = 0 ∧
        (x,u) = (k,0) + (X u,u) ∧
        pairInner (k,(0 : Kneg)) (X u,u) = 0 := by
  constructor
  · intro h
    rcases (kernel_iff Spos Sneg X hfac x u).mp h with ⟨k, hk, hx⟩
    refine ⟨k, ?_, ?_⟩
    · refine ⟨hk, ?_, kernel_summands_orthogonal Spos X hred k u hk⟩
      ext <;> simp [hx]
    · intro k' hk'
      have h1 := congrArg Prod.fst hk'.2.1
      have h2 := congrArg Prod.fst (show (x,u) = (k,0) + (X u,u) by
        ext <;> simp [hx])
      simp at h1 h2
      exact add_right_cancel (h1.symm.trans h2)
  · rintro ⟨k, ⟨hk, hsplit, _⟩, _⟩
    apply (kernel_iff Spos Sneg X hfac x u).mpr
    refine ⟨k, hk, ?_⟩
    have := congrArg Prod.fst hsplit
    simpa using this

/-- Membership in ker(Spos)⊥ written pointwise. -/
noncomputable def PosReduced
    (Spos : Kpos →L[ℂ] H)
    (a : Kpos) : Prop :=
  ∀ k, Spos k = 0 → inner ℂ a k = 0

/--
WD-T03 graph normal form:
A=(ker E)⊥ is exactly graph(-X†) over ker(Spos)⊥.
-/
theorem wd_t03_analysis_graph_iff
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (X : Kneg →L[ℂ] Kpos)
    (hfac : Sneg = -(Spos ∘L X))
    (hred : IsReducedFor Spos X)
    (a : Kpos) (v : Kneg) :
    AnalysisMember Spos Sneg (a,v) ↔
      PosReduced Spos a ∧ v = -(X†) a := by
  constructor
  · intro hA
    have ha : PosReduced Spos a := by
      intro k hk
      have hker : synthesisMap Spos Sneg (k,(0 : Kneg)) = 0 := by
        simp [synthesisMap, hk]
      have hh := hA (k,0) hker
      simpa [pairInner] using hh
    have hvEq : v = -(X†) a := by
      apply ext_inner_right ℂ
      intro u
      have hker : synthesisMap Spos Sneg (X u,u) = 0 := by
        simp [synthesisMap, hfac]
      have hh := hA (X u,u) hker
      rw [pairInner, ← ContinuousLinearMap.adjoint_inner_left X u a] at hh
      rw [inner_neg_left]
      exact eq_neg_of_add_eq_zero_right hh
    exact ⟨ha, hvEq⟩
  · rintro ⟨ha, rfl⟩
    intro y hy
    rcases y with ⟨x,u⟩
    rcases (kernel_iff Spos Sneg X hfac x u).mp hy with ⟨k, hk, hx⟩
    have hak : inner ℂ a k = 0 := ha k hk
    subst x
    rw [pairInner, inner_add_right, ← ContinuousLinearMap.adjoint_inner_left X u a]
    simp [hak]

/-- WD-T03 signature identity on the graph. -/
theorem wd_t03_graph_signature
    (X : Kneg →L[ℂ] Kpos)
    (a : Kpos) :
    coeffQ (Kpos := Kpos) (Kneg := Kneg) (a, -(X†) a)
      = ‖a‖ ^ 2 - ‖(X†) a‖ ^ 2 := by
  simp [coeffQ]

/--
WD-T03 defect factorization D=Spos(I-XX†)Spos†.
-/
theorem wd_t03_defect_factorization
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (X : Kneg →L[ℂ] Kpos)
    (hfac : Sneg = -(Spos ∘L X)) :
    physicalDefect Spos Sneg
      =
    Spos ∘L
      ((ContinuousLinearMap.id ℂ Kpos - X ∘L X†) ∘L Spos†) := by
  apply ContinuousLinearMap.ext
  intro h
  simp [physicalDefect, hfac]

/--
WD-T03 assembled from the imported Douglas range-inclusion premise.
-/
theorem wd_t03_reduced_graph_normal_form
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (hDouglas : DouglasRangeData Sneg Spos)
    (hrange : Set.range Sneg ⊆ Set.range Spos) :
    ∃! X : Kneg →L[ℂ] Kpos,
      Sneg = -(Spos ∘L X) ∧
      IsReducedFor Spos X ∧
      (∀ a v,
        AnalysisMember Spos Sneg (a,v) ↔
          PosReduced Spos a ∧ v = -(X†) a) ∧
      physicalDefect Spos Sneg
        =
      Spos ∘L
        ((ContinuousLinearMap.id ℂ Kpos - X ∘L X†) ∘L Spos†) := by
  rcases signed_reduced_of_range Spos Sneg hDouglas hrange with
    ⟨X, hX, huniq⟩
  refine ⟨X, ?_, ?_⟩
  · refine ⟨hX.1, hX.2, ?_, ?_⟩
    · intro a v
      exact wd_t03_analysis_graph_iff Spos Sneg X hX.1 hX.2 a v
    · exact wd_t03_defect_factorization Spos Sneg X hX.1
  · intro Y hY
    exact huniq Y ⟨hY.1, hY.2.1⟩

end WeilDefect.WDT03
