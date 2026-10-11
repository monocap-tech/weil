import WeilDefect.RPB108.ThreeGram
import Mathlib.Analysis.InnerProductSpace.Basic
open scoped BigOperators
namespace WeilDefect.RPB108

/-- The complete real Gram of actual source vectors gives their norm square
for arbitrary complex coefficients. Reality of every inner product is explicit. -/
theorem source_gram_norm_sq {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (r : Fin 3 → E) (G : Fin 3 → Fin 3 → ℝ)
    (hG : ∀ i j, inner ℂ (r i) (r j) = (G i j : ℂ)) (z : Fin 3 → ℂ) :
    ‖∑ i, z i • r i‖^2 = complexGram G z := by
  rw [norm_sq_eq_re_inner (𝕜 := ℂ)]
  change (inner ℂ (∑ i, z i • r i) (∑ i, z i • r i)).re = _
  rw [sum_inner]
  simp only [inner_sum, inner_smul_left, inner_smul_right, hG,
    Complex.re_sum, complexGram]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  simp [Complex.mul_re, Complex.mul_im]
  ring

/-- Cauchy and the restricted inverse norm bound control the actual inverse
source pairing; no raw-Gram/inverse-covariance identity is asserted. -/
theorem inverse_source_pairing_square {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (r v : E) (P k : ℝ)
    (hk : 0 < k) (hT : ‖T‖ ≤ 1/k) (hr : ‖r‖^2 ≤ P) :
    ‖inner ℂ r (T v)‖^2 ≤ (P/k^2)*‖v‖^2 := by
  have ht : ‖T v‖ ≤ (1/k)*‖v‖ :=
    (T.le_opNorm v).trans (mul_le_mul_of_nonneg_right hT (norm_nonneg _))
  have hi : ‖inner ℂ r (T v)‖ ≤ ‖r‖*((1/k)*‖v‖) :=
    (norm_inner_le_norm r (T v)).trans (mul_le_mul_of_nonneg_left ht (norm_nonneg _))
  have hn : 0 ≤ ‖r‖*((1/k)*‖v‖) := by positivity
  have hs : ‖inner ℂ r (T v)‖^2 ≤ (‖r‖*((1/k)*‖v‖))^2 := by
    nlinarith only [hi, hn, norm_nonneg (inner ℂ r (T v))]
  calc
    ‖inner ℂ r (T v)‖^2 ≤ (‖r‖*((1/k)*‖v‖))^2 := hs
    _ = ‖r‖^2*((1/k)^2*‖v‖^2) := by ring
    _ ≤ P*((1/k)^2*‖v‖^2) := mul_le_mul_of_nonneg_right hr (by positivity)
    _ = (P/k^2)*‖v‖^2 := by ring

#print axioms source_gram_norm_sq
#print axioms inverse_source_pairing_square
end WeilDefect.RPB108
