import WeilDefect.Screening.ShortedCovariance
import Mathlib

namespace WeilDefect.WDT14

open scoped InnerProduct
open ContinuousLinearMap
open InnerProductSpace

variable {Kpos M : Type*}
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]

/-- Algebraic negative margin of a coefficient pair (a,u). -/
def shadowMargin (a : Kpos) (u : M) : ℝ :=
  ‖u‖ ^ 2 - ‖a‖ ^ 2

/--
Orthogonal projection of the positive coordinate can only increase the
algebraic negative margin.
-/
theorem wd_t14_positive_shadow_margin
    (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
    (a : Kpos) (u : M) :
    shadowMargin (U.starProjection a) u ≥ shadowMargin a u := by
  have hnorm : ‖U.starProjection a‖ ≤ ‖a‖ :=
    U.norm_starProjection_apply_le a
  have hsq : ‖U.starProjection a‖ ^ 2 ≤ ‖a‖ ^ 2 := by
    nlinarith [norm_nonneg (U.starProjection a), norm_nonneg a]
  unfold shadowMargin
  linarith

/--
If the original coefficient vector has positive negative margin kappa, every
positive-coordinate shadow keeps at least that margin.
-/
theorem wd_t14_positive_shadow_preserves_negative_margin
    (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
    (a : Kpos) (u : M) (κ : ℝ)
    (hmargin : shadowMargin a u = κ)
    (hκ : 0 < κ) :
    shadowMargin (U.starProjection a) u ≥ κ
      ∧ 0 < shadowMargin (U.starProjection a) u := by
  have hmono := wd_t14_positive_shadow_margin U a u
  constructor
  · linarith
  · linarith

/--
For a graph vector u = -X† a, its positive shadow is still graph-admissible
exactly when the discarded positive component is annihilated by X†.
-/
theorem wd_t14_graph_shadow_admissible_iff
    (X : M →L[ℂ] Kpos)
    (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
    (a : Kpos) (u : M)
    (hgraph : u = -((X†) a)) :
    u = -((X†) (U.starProjection a))
      ↔
    (X†) (a - U.starProjection a) = 0 := by
  rw [hgraph]
  simp only [map_sub]
  constructor
  · intro h
    have heq : (X†) a = (X†) (U.starProjection a) := by
      exact neg_injective h
    exact sub_eq_zero.mpr heq
  · intro h
    have heq : (X†) a = (X†) (U.starProjection a) :=
      sub_eq_zero.mp h
    rw [heq]

/--
Explicit negative graph vector whose zero positive shadow is not graph
admissible. This certifies that signature preservation does not imply
preservation of the graph relation.
-/
theorem wd_t14_graph_admissibility_failure_example :
    let X : ℂ →L[ℂ] ℂ :=
      (2 : ℂ) • ContinuousLinearMap.id ℂ ℂ
    let a : ℂ := 1
    let u : ℂ := -2
    u = -((X†) a)
      ∧ 0 < shadowMargin a u
      ∧ u ≠ -((X†) ((⊥ : Submodule ℂ ℂ).starProjection a)) := by
  dsimp
  have hXadj :
      (((2 : ℂ) • ContinuousLinearMap.id ℂ ℂ)†)
        =
      (2 : ℂ) • ContinuousLinearMap.id ℂ ℂ := by
    change star ((2 : ℂ) • ContinuousLinearMap.id ℂ ℂ) =
      (2 : ℂ) • ContinuousLinearMap.id ℂ ℂ
    rw [star_smul]
    have hid :
        star (ContinuousLinearMap.id ℂ ℂ) =
          ContinuousLinearMap.id ℂ ℂ := by
      change (ContinuousLinearMap.id ℂ ℂ)† =
        ContinuousLinearMap.id ℂ ℂ
      exact ContinuousLinearMap.adjoint_id
    rw [hid, star_ofNat]
  constructor
  · rw [hXadj]
    norm_num
  constructor
  · norm_num [shadowMargin, Complex.norm_real]
  · simp

/--
WD-T14 / WD-B8: finite positive shadows preserve the algebraic negative
signature, but graph admissibility is a separate relational condition and can
fail under the same projection.
-/
theorem wd_t14_finite_positive_shadows_preserve_signature_not_admissibility :
    (∀ (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
        (a : Kpos) (u : M) (κ : ℝ),
      shadowMargin a u = κ →
      0 < κ →
      shadowMargin (U.starProjection a) u ≥ κ)
    ∧
    (∃ (X : ℂ →L[ℂ] ℂ) (a u : ℂ),
      u = -((X†) a)
        ∧ 0 < shadowMargin a u
        ∧ u ≠ -((X†) ((⊥ : Submodule ℂ ℂ).starProjection a))) := by
  constructor
  · intro U _ a u κ hmargin hκ
    exact
      (wd_t14_positive_shadow_preserves_negative_margin
        U a u κ hmargin hκ).1
  · refine ⟨
      (2 : ℂ) • ContinuousLinearMap.id ℂ ℂ,
      1,
      -2,
      ?_
    ⟩
    simpa using wd_t14_graph_admissibility_failure_example

end WeilDefect.WDT14
