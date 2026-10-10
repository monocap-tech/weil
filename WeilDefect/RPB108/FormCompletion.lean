import WeilDefect.RPB108.SourcePairing
open scoped BigOperators
namespace WeilDefect.RPB108

/-- High-form square completion uses subtraction, real symmetry and the weak
inverse identity. It requires no boundedness of the high form itself. -/
theorem high_form_square_completion {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hsym : ∀ u v, (B u v).re = (B v u).re)
    (R h : E) (hsolve : ∀ u, B (T R) u = inner ℂ R u) :
    (B (h-T R) (h-T R)).re+2*(inner ℂ R (h-T R)).re =
      (B h h).re-(inner ℂ R (T R)).re := by
  rw [hleft, hright, hright]
  simp only [Complex.sub_re, inner_sub_right, hsolve]
  have hs := hsym h (T R)
  rw [hsolve] at hs
  linarith

/-- Exact physical-vector identity for the same four completed columns. -/
theorem completed_column_identity {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (z : Fin 4 → ℂ) (h : E) :
    (∑ i, z i • (x i-T (source i)))+h =
      (∑ i, z i • x i)+(h-T (∑ i, z i • source i)) := by
  simp only [smul_sub, Finset.sum_sub_distrib, map_sum, map_smul]
  abel

/-- Pay the real mixed cross by its complex norm, retaining the exact sign. -/
theorem complex_mixed_cross_lower (z w : ℂ) :
    -2*‖z‖*‖w‖ ≤ 2*(star z*w).re := by
  have hr := (abs_le.mp (Complex.abs_re_le_norm (star z*w))).1
  rw [norm_mul, norm_star] at hr
  linarith

/-- A raw block identity and actual finite Schur decomposition give the energy
bound used by the gap theorem after high-form completion. Every finite block
and weak inverse attachment is explicit rather than a final energy premise. -/
theorem energy_lower_of_form_blocks {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hsym : ∀ u v, (B u v).re = (B v u).re)
    (R h : E) (hsolve : ∀ u, B (T R) u = inner ℂ R u)
    (N D V actualRetained A k energy : ℝ) (z p q : ℂ)
    (hraw : energy = N+2*(inner ℂ R (h-T R)).re+(B (h-T R) (h-T R)).re)
    (hfinite : N-(inner ℂ R (T R)).re =
      D*‖z‖^2+2*(star z*(p-q)).re+actualRetained)
    (hD : A ≤ D) (hretained : V ≤ actualRetained)
    (hhigh : k*‖h‖^2 ≤ (B h h).re) :
    A*‖z‖^2-2*‖z‖*‖p-q‖+V+k*‖h‖^2 ≤ energy := by
  have hc := high_form_square_completion B T hleft hright hsym R h hsolve
  have hx := complex_mixed_cross_lower z (p-q)
  have hd := mul_le_mul_of_nonneg_right hD (sq_nonneg ‖z‖)
  linarith

#print axioms high_form_square_completion
#print axioms completed_column_identity
#print axioms complex_mixed_cross_lower
#print axioms energy_lower_of_form_blocks
end WeilDefect.RPB108
