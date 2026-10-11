import WeilDefect.RPB108.FormCompletion
open scoped BigOperators
namespace WeilDefect.RPB108

/-- Bound actual inverse covariance by source norm and restricted inverse norm.
No covariance is identified with the raw source Gram. -/
theorem inverse_quadratic_upper {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (r : E) (k : ℝ)
    (hT : ‖T‖ ≤ 1/k) :
    (inner ℂ r (T r)).re ≤ ‖r‖^2/k := by
  have ht : ‖T r‖ ≤ (1/k)*‖r‖ :=
    (T.le_opNorm r).trans (mul_le_mul_of_nonneg_right hT (norm_nonneg _))
  calc
    (inner ℂ r (T r)).re ≤ ‖inner ℂ r (T r)‖ := Complex.re_le_norm _
    _ ≤ ‖r‖*‖T r‖ := norm_inner_le_norm _ _
    _ ≤ ‖r‖*((1/k)*‖r‖) := mul_le_mul_of_nonneg_left ht (norm_nonneg _)
    _ = ‖r‖^2/k := by ring

/-- Source-norm and native diagonal bounds give the actual low Schur bound. -/
theorem low_schur_lower_of_norm_bound {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (r : E) (k P native A : ℝ)
    (hk : 0 < k) (hT : ‖T‖ ≤ 1/k) (hr : ‖r‖^2 ≤ P)
    (hnative : A+P/k ≤ native) : A ≤ native-(inner ℂ r (T r)).re := by
  have hq := inverse_quadratic_upper T r k hT
  have hd := (div_le_div_iff_of_pos_right hk).mpr hr
  linarith

/-- Exact native/coarse/source Gram relation with the original scalar floor. -/
theorem complex_gram_add_div (V G : Fin 3 → Fin 3 → ℝ) (k : ℝ) (z : Fin 3 → ℂ) :
    complexGram (fun i j => V i j+G i j/k) z =
      complexGram V z+complexGram G z/k := by
  simp only [complexGram, add_mul, Finset.sum_add_distrib, Finset.sum_div]
  congr 1
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  ring

#print axioms inverse_quadratic_upper
#print axioms low_schur_lower_of_norm_bound
#print axioms complex_gram_add_div
end WeilDefect.RPB108
