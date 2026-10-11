import WeilDefect.RPB108.FiniteSchur
import Mathlib.LinearAlgebra.BilinearMap
open scoped BigOperators
namespace WeilDefect.RPB108

/-- The real quadratic block identity for an algebraic Hermitian form. -/
theorem hermitian_form_add {E : Type*} [AddCommGroup E] [Module ℂ E]
    (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hherm : ∀ u v, F u v = star (F v u)) (u v : E) :
    (F (u+v) (u+v)).re = (F u u).re+2*(F u v).re+(F v v).re := by
  have hs : (F v u).re = (F u v).re := by rw [hherm]; simp
  simp only [map_add, LinearMap.add_apply, Complex.add_re]
  linarith

/-- Complex low coefficients carry the exact norm-square diagonal weight. -/
theorem sesquilinear_smul_diagonal {E : Type*} [AddCommGroup E] [Module ℂ E]
    (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ) (z : ℂ) (u : E) :
    (F (z • u) (z • u)).re = ‖z‖^2*(F u u).re := by
  have hz : ‖z‖^2 = z.re^2+z.im^2 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    ring
  simp only [LinearMap.map_smulₛₗ₂, map_smul, smul_eq_mul]
  rw [hz]
  simp only [Complex.mul_re, Complex.mul_im, Complex.conj_re, Complex.conj_im]
  ring

/-- Full finite Gram realization identifies the form on arbitrary complex
combinations; no continuity of the full form is required. -/
theorem sesquilinear_gram {E : Type*} [AddCommGroup E] [Module ℂ E]
    (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ) (x : Fin 3 → E)
    (M : Fin 3 → Fin 3 → ℝ) (hM : ∀ i j, F (x i) (x j) = (M i j : ℂ))
    (z : Fin 3 → ℂ) :
    (F (∑ i, z i • x i) (∑ i, z i • x i)).re = complexGram M z := by
  rw [LinearMap.map_sum₂]
  simp only [map_sum, LinearMap.map_smulₛₗ₂,
    map_smul, smul_eq_mul, hM, Complex.re_sum, complexGram]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  simp only [Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.star_def, Complex.conj_re, Complex.conj_im]
  ring

/-- Source coupling at the actual high vector extends from the finite columns
to their full complex combination. No global source representation is assumed. -/
theorem sesquilinear_source_coupling {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (x source : Fin 4 → E) (z : Fin 4 → ℂ) (v : E)
    (hc : ∀ i, F (x i) v = inner ℂ (source i) v) :
    F (∑ i, z i • x i) v = inner ℂ (∑ i, z i • source i) v := by
  simp only [LinearMap.map_sum₂, LinearMap.map_smulₛₗ₂, smul_eq_mul, hc,
    sum_inner, inner_smul_left]

#print axioms hermitian_form_add
#print axioms sesquilinear_smul_diagonal
#print axioms sesquilinear_gram
#print axioms sesquilinear_source_coupling
end WeilDefect.RPB108
