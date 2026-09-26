import Mathlib.Analysis.InnerProductSpace.Adjoint
import Mathlib.Tactic

namespace WeilDefect

open scoped InnerProduct

variable {𝕜 H Kpos Kneg B : Type*}
variable [RCLike 𝕜]
variable [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace 𝕜 Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace 𝕜 Kneg] [CompleteSpace Kneg]
variable [NormedAddCommGroup B] [InnerProductSpace 𝕜 B] [CompleteSpace B]

/-- The coefficient-space indefinite signature used by the defect calculus. -/
def coeffSignature (a : Kpos) (u : Kneg) : ℝ :=
  ‖a‖ ^ 2 - ‖u‖ ^ 2

/-- Selected physical quadratic defect written through Hilbert adjoints. -/
noncomputable def selectedQuadratic
    (Spos : Kpos →L[𝕜] H)
    (Sneg : Kneg →L[𝕜] H)
    (h : H) : ℝ :=
  ‖(ContinuousLinearMap.adjoint Spos) h‖ ^ 2 -
    ‖(ContinuousLinearMap.adjoint Sneg) h‖ ^ 2

/-- Algebraic core of WD-T01: analysis coefficients reproduce the physical defect value. -/
theorem wd_t01_quadratic_identity
    (Spos : Kpos →L[𝕜] H)
    (Sneg : Kneg →L[𝕜] H)
    (h : H) :
    coeffSignature ((ContinuousLinearMap.adjoint Spos) h)
        ((ContinuousLinearMap.adjoint Sneg) h)
      = selectedQuadratic Spos Sneg h := by
  rfl

/-- Full quadratic defect after adding an unselected negative background channel. -/
noncomputable def fullQuadratic
    (Spos : Kpos →L[𝕜] H)
    (Sneg : Kneg →L[𝕜] H)
    (S_B : B →L[𝕜] H)
    (h : H) : ℝ :=
  selectedQuadratic Spos Sneg h -
    ‖(ContinuousLinearMap.adjoint S_B) h‖ ^ 2

/-- WD-T07 identity: the unselected negative background subtracts a norm square. -/
theorem wd_t07_selected_full_identity
    (Spos : Kpos →L[𝕜] H)
    (Sneg : Kneg →L[𝕜] H)
    (S_B : B →L[𝕜] H)
    (h : H) :
    fullQuadratic Spos Sneg S_B h
      = selectedQuadratic Spos Sneg h -
        ‖(ContinuousLinearMap.adjoint S_B) h‖ ^ 2 := by
  rfl

/-- WD-T07 sign custody: a selected negative witness stays negative after background aggregation. -/
theorem wd_t07_selected_negative_implies_full
    (Spos : Kpos →L[𝕜] H)
    (Sneg : Kneg →L[𝕜] H)
    (S_B : B →L[𝕜] H)
    (h : H)
    (hneg : selectedQuadratic Spos Sneg h < 0) :
    fullQuadratic Spos Sneg S_B h < 0 := by
  unfold fullQuadratic
  have hsquare : 0 ≤ ‖(ContinuousLinearMap.adjoint S_B) h‖ ^ 2 := sq_nonneg _
  linarith

/--
WD-T14 algebraic signature-shadow inequality:
shrinking the positive-coordinate norm can only strengthen the negative margin.
-/
theorem wd_t14_signature_shadow
    (a qa : Kpos)
    (u : Kneg)
    (hqa : ‖qa‖ ≤ ‖a‖) :
    ‖u‖ ^ 2 - ‖a‖ ^ 2 ≤ ‖u‖ ^ 2 - ‖qa‖ ^ 2 := by
  have hsquare : ‖qa‖ ^ 2 ≤ ‖a‖ ^ 2 := by
    simpa [pow_two] using mul_self_le_mul_self (norm_nonneg qa) hqa
  linarith


/--
WD-T14 sharpness: a positive-coordinate shadow can preserve the negative
signature comparison while breaking the graph relation.

Here (x^ast(a₁,a₂)=a₁+a₂), the original point is (a=(1,1)) with
(u=-2=-x^ast a), while the projected shadow (qa=(1,0)) no longer
satisfies that relation.
-/
theorem wd_t14_shadow_can_break_graph :
    let a : ℝ × ℝ := (1, 1)
    let qa : ℝ × ℝ := (1, 0)
    let xstar : (ℝ × ℝ) → ℝ := fun p => p.1 + p.2
    let u : ℝ := -2
    xstar a = -u ∧ xstar qa ≠ -u := by
  norm_num

end WeilDefect
