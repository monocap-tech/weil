import Mathlib

namespace WeilDefect.WDT13

open scoped InnerProduct ComplexOrder NNReal
open ContinuousLinearMap
open InnerProductSpace

variable {W V : Type*}
variable [NormedAddCommGroup W] [InnerProductSpace ℂ W] [CompleteSpace W]
variable [NormedAddCommGroup V] [InnerProductSpace ℂ V] [CompleteSpace V]

/--
Scalar form of uniform positivity for the self-adjoint block operator
`[[A, B], [B†, C]]` on the Hilbert direct sum `W ⊕ V`.

We state the Hilbert-sum norm explicitly as `‖w‖² + ‖v‖²` rather than
using Lean's generic product norm.
-/
def BlockUniformlyPositive
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V) : Prop :=
  ∀ w v,
    m * (‖w‖ ^ 2 + ‖v‖ ^ 2) ≤
      RCLike.re
        (inner ℂ (A w + B v) w +
          inner ℂ ((B†) w + C v) v)

/-- Canonical ring inverse of a bounded endomorphism. -/
noncomputable def operatorInverse
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) : E →L[ℂ] E :=
  Ring.inverse T

/-- The Schur correction `B C⁻¹ B†`. -/
noncomputable def schurCorrection
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V) : W →L[ℂ] W :=
  B ∘L operatorInverse C ∘L B†

/-- The shortened covariance `A - B C⁻¹ B†`. -/
noncomputable def schurShort
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V) : W →L[ℂ] W :=
  A - schurCorrection B C

/-- Uniform positivity of the full block gives the same lower bound on C. -/
theorem wd_t13_complement_lower_bound
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hblock : BlockUniformlyPositive m A B C) :
    ∀ v, m * ‖v‖ ^ 2 ≤ RCLike.re (inner ℂ (C v) v) := by
  intro v
  have h := hblock (0 : W) v
  simpa [BlockUniformlyPositive] using h

/--
The corrected uniform lower bound `m > 0` forces the complementary block C
to be a unit in the bounded-operator algebra, hence boundedly invertible.
-/
theorem wd_t13_complement_isUnit
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hblock : BlockUniformlyPositive m A B C) :
    IsUnit C := by
  let c : ℝ≥0 := ⟨m, hm.le⟩
  apply ContinuousLinearMap.isUnit_of_forall_le_norm_inner_map
    C (c := c)
  · exact_mod_cast hm
  · intro v
    change ‖v‖ ^ 2 * m ≤ ‖inner ℂ (C v) v‖
    calc
      ‖v‖ ^ 2 * m = m * ‖v‖ ^ 2 := by ring
      _ ≤ RCLike.re (inner ℂ (C v) v) :=
        wd_t13_complement_lower_bound m A B C hblock v
      _ ≤ ‖inner ℂ (C v) v‖ := RCLike.re_le_norm _

/-- The canonical inverse is a right inverse of C. -/
theorem wd_t13_complement_mul_inverse
    (C : V →L[ℂ] V)
    (hC : IsUnit C) :
    C ∘L operatorInverse C = ContinuousLinearMap.id ℂ V := by
  change C * Ring.inverse C = 1
  exact Ring.mul_inverse_cancel C hC

/-- The canonical inverse is a left inverse of C. -/
theorem wd_t13_inverse_mul_complement
    (C : V →L[ℂ] V)
    (hC : IsUnit C) :
    operatorInverse C ∘L C = ContinuousLinearMap.id ℂ V := by
  change Ring.inverse C * C = 1
  exact Ring.inverse_mul_cancel C hC

/-- Uniform positivity makes C nonnegative in the Loewner order. -/
theorem wd_t13_complement_nonnegative
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hCself : IsSelfAdjoint C)
    (hblock : BlockUniformlyPositive m A B C) :
    0 ≤ C := by
  rw [ContinuousLinearMap.nonneg_iff_isPositive,
    ContinuousLinearMap.isPositive_def']
  refine ⟨hCself, ?_⟩
  intro v
  rw [ContinuousLinearMap.reApplyInnerSelf_apply]
  exact
    (mul_nonneg hm.le (sq_nonneg ‖v‖)).trans
      (wd_t13_complement_lower_bound m A B C hblock v)

/-- The canonical bounded inverse C⁻¹ is nonnegative. -/
theorem wd_t13_complement_inverse_nonnegative
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hCself : IsSelfAdjoint C)
    (hblock : BlockUniformlyPositive m A B C) :
    0 ≤ operatorInverse C := by
  have hCunit := wd_t13_complement_isUnit m A B C hm hblock
  have hCnonneg :=
    wd_t13_complement_nonnegative m A B C hm hCself hblock
  unfold operatorInverse
  rw [Ring.inverse_of_isUnit hCunit]
  exact CFC.inv_nonneg_of_nonneg hCunit.unit (by
    simpa only [IsUnit.unit_spec] using hCnonneg)

/-- The Schur correction is positive. -/
theorem wd_t13_schur_correction_positive
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hCself : IsSelfAdjoint C)
    (hblock : BlockUniformlyPositive m A B C) :
    (schurCorrection B C).IsPositive := by
  have hinv :
      (operatorInverse C).IsPositive :=
    ContinuousLinearMap.nonneg_iff_isPositive.mp
      (wd_t13_complement_inverse_nonnegative
        m A B C hm hCself hblock)
  simpa [schurCorrection] using hinv.conj_adjoint B

/-- The shortened covariance is bounded above by the direct compression A. -/
theorem wd_t13_schur_le_compression
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hCself : IsSelfAdjoint C)
    (hblock : BlockUniformlyPositive m A B C) :
    schurShort A B C ≤ A := by
  rw [ContinuousLinearMap.le_def]
  simpa [schurShort] using
    wd_t13_schur_correction_positive
      m A B C hm hCself hblock

/-- Pointwise right-inverse identity for the complementary block. -/
theorem wd_t13_complement_inverse_apply
    (C : V →L[ℂ] V)
    (hC : IsUnit C)
    (v : V) :
    C (operatorInverse C v) = v := by
  have h :=
    congrArg
      (fun T : V →L[ℂ] V => T v)
      (wd_t13_complement_mul_inverse C hC)
  simpa [ContinuousLinearMap.comp_apply] using h

/-- Pointwise left-inverse identity for the complementary block. -/
theorem wd_t13_inverse_complement_apply
    (C : V →L[ℂ] V)
    (hC : IsUnit C)
    (v : V) :
    operatorInverse C (C v) = v := by
  have h :=
    congrArg
      (fun T : V →L[ℂ] V => T v)
      (wd_t13_inverse_mul_complement C hC)
  simpa [ContinuousLinearMap.comp_apply] using h

/--
The Schur-shortened block inherits a uniform lower bound from the full block.
This is the minimizing-complement calculation.
-/
theorem wd_t13_schur_lower_bound
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hblock : BlockUniformlyPositive m A B C) :
    ∀ w, m * ‖w‖ ^ 2 ≤
      RCLike.re (inner ℂ (schurShort A B C w) w) := by
  have hCunit := wd_t13_complement_isUnit m A B C hm hblock
  intro w
  let z : V := operatorInverse C ((B†) w)
  have hz : C z = (B†) w := by
    simpa [z] using
      wd_t13_complement_inverse_apply C hCunit ((B†) w)
  have h := hblock w (-z)
  have hfirst :
      A w + B (-z) = schurShort A B C w := by
    simp [schurShort, schurCorrection, z,
      ContinuousLinearMap.comp_apply, sub_eq_add_neg]
  have hsecond :
      (B†) w + C (-z) = 0 := by
    rw [map_neg, hz]
    simp
  rw [hfirst, hsecond, inner_zero_left, add_zero] at h
  calc
    m * ‖w‖ ^ 2 ≤
        m * (‖w‖ ^ 2 + ‖z‖ ^ 2) := by
          nlinarith [sq_nonneg ‖z‖, hm.le]
    _ ≤ RCLike.re (inner ℂ (schurShort A B C w) w) := by
      simpa using h

/-- The Schur-shortened block is itself boundedly invertible. -/
theorem wd_t13_schur_isUnit
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hblock : BlockUniformlyPositive m A B C) :
    IsUnit (schurShort A B C) := by
  let c : ℝ≥0 := ⟨m, hm.le⟩
  apply ContinuousLinearMap.isUnit_of_forall_le_norm_inner_map
    (schurShort A B C) (c := c)
  · exact_mod_cast hm
  · intro w
    change ‖w‖ ^ 2 * m ≤
      ‖inner ℂ (schurShort A B C w) w‖
    calc
      ‖w‖ ^ 2 * m = m * ‖w‖ ^ 2 := by ring
      _ ≤ RCLike.re (inner ℂ (schurShort A B C w) w) :=
        wd_t13_schur_lower_bound m A B C hm hblock w
      _ ≤ ‖inner ℂ (schurShort A B C w) w‖ :=
        RCLike.re_le_norm _

/--
The canonical Schur solution solves the two block equations with right-hand
side `(w, 0)`.
-/
theorem wd_t13_block_solution_exists
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hblock : BlockUniformlyPositive m A B C)
    (w : W) :
    ∃ x : W, ∃ y : V,
      A x + B y = w ∧
      (B†) x + C y = 0 ∧
      x = operatorInverse (schurShort A B C) w := by
  have hCunit := wd_t13_complement_isUnit m A B C hm hblock
  have hHunit := wd_t13_schur_isUnit m A B C hm hblock
  let H := schurShort A B C
  let x : W := operatorInverse H w
  let y : V := -operatorInverse C ((B†) x)
  have hHx : H x = w := by
    simpa [H, x] using
      wd_t13_complement_inverse_apply H hHunit w
  have hCy : C y = -((B†) x) := by
    simp [y, wd_t13_complement_inverse_apply C hCunit]
  refine ⟨x, y, ?_, ?_, rfl⟩
  · have hHdef :
        H x = A x - B (operatorInverse C ((B†) x)) := by
      simp [H, schurShort, schurCorrection,
        ContinuousLinearMap.comp_apply]
    rw [hHdef] at hHx
    simpa [y, sub_eq_add_neg] using hHx
  · rw [hCy]
    simp

/--
Any solution of the block equations has first component H_W⁻¹ w.
This is the coordinate form of
`P_W K⁻¹|_W = H_W⁻¹`.
-/
theorem wd_t13_block_solution_first_component
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (hblock : BlockUniformlyPositive m A B C)
    {w x : W} {y : V}
    (hfirst : A x + B y = w)
    (hsecond : (B†) x + C y = 0) :
    x = operatorInverse (schurShort A B C) w := by
  have hCunit := wd_t13_complement_isUnit m A B C hm hblock
  have hHunit := wd_t13_schur_isUnit m A B C hm hblock
  have hy :
      y = -operatorInverse C ((B†) x) := by
    have hCy : C y = -((B†) x) := by
      have hsum : C y + (B†) x = 0 := by
        simpa [add_comm] using hsecond
      exact eq_neg_of_add_eq_zero_left hsum
    calc
      y = operatorInverse C (C y) := by
        symm
        exact wd_t13_inverse_complement_apply C hCunit y
      _ = operatorInverse C (-((B†) x)) := by rw [hCy]
      _ = -operatorInverse C ((B†) x) := by
        exact map_neg _ _
  have hHx :
      schurShort A B C x = w := by
    rw [hy] at hfirst
    simpa [schurShort, schurCorrection,
      ContinuousLinearMap.comp_apply, sub_eq_add_neg] using hfirst
  calc
    x = operatorInverse (schurShort A B C)
        (schurShort A B C x) := by
          symm
          exact wd_t13_inverse_complement_apply
            (schurShort A B C) hHunit x
    _ = operatorInverse (schurShort A B C) w := by rw [hHx]

/--
WD-T13 / WD-B7: in the uniformly positive block setting, the complementary
block is boundedly invertible, the Schur-shortened covariance lies below the
direct compression, and the first coordinate of the inverse block problem is
the inverse Schur complement.
-/
theorem wd_t13_direct_compression_versus_shorted_covariance
    (m : ℝ)
    (A : W →L[ℂ] W)
    (B : V →L[ℂ] W)
    (C : V →L[ℂ] V)
    (hm : 0 < m)
    (_hAself : IsSelfAdjoint A)
    (hCself : IsSelfAdjoint C)
    (hblock : BlockUniformlyPositive m A B C) :
    IsUnit C
    ∧ schurShort A B C ≤ A
    ∧ IsUnit (schurShort A B C)
    ∧ (∀ w : W,
        ∃ x : W, ∃ y : V,
          A x + B y = w ∧
          (B†) x + C y = 0 ∧
          x = operatorInverse (schurShort A B C) w)
    ∧ (∀ w x : W, ∀ y : V,
        A x + B y = w →
        (B†) x + C y = 0 →
        x = operatorInverse (schurShort A B C) w) := by
  have hCunit := wd_t13_complement_isUnit m A B C hm hblock
  exact ⟨
    hCunit,
    wd_t13_schur_le_compression m A B C hm hCself hblock,
    wd_t13_schur_isUnit m A B C hm hblock,
    fun w => wd_t13_block_solution_exists m A B C hm hblock w,
    fun w x y h1 h2 =>
      wd_t13_block_solution_first_component
        m A B C hm hblock h1 h2
  ⟩

end WeilDefect.WDT13
