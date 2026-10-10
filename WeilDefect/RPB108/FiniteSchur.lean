import WeilDefect.RPB108.SchurBounds
open scoped BigOperators
namespace WeilDefect.RPB108

/-- Hermitian inverse covariance follows from the actual Hermitian high form
and its weak inverse identities at the two source vectors. -/
theorem inverse_covariance_hermitian {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hherm : ∀ u v, B u v = star (B v u)) (r v : E)
    (hr : B (T r) (T v) = inner ℂ r (T v))
    (hv : B (T v) (T r) = inner ℂ v (T r)) :
    inner ℂ v (T r) = star (inner ℂ r (T v)) := by
  rw [← hv, ← hr]
  exact hherm _ _

/-- Exact low/retained expansion of the actual inverse covariance. -/
theorem inverse_covariance_split {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (r v : E) (z : ℂ)
    (hherm : inner ℂ v (T r) = star (inner ℂ r (T v))) :
    (inner ℂ (z • r+v) (T (z • r+v))).re =
      ‖z‖^2*(inner ℂ r (T r)).re+
      2*(star z*inner ℂ r (T v)).re+(inner ℂ v (T v)).re := by
  have hz : ‖z‖^2 = z.re^2+z.im^2 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    ring
  simp only [map_add, map_smul, inner_add_left, inner_add_right,
    inner_smul_left, inner_smul_right, hherm]
  rw [hz]
  simp only [Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im,
    Complex.star_def, Complex.conj_re, Complex.conj_im]
  ring

/-- The native low/retained block identity transports to the actual finite
Schur identity, with its mixed covariance still expressed using T. -/
theorem finite_schur_split {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (r v : E) (z p : ℂ)
    (N lowDiag retainedNative : ℝ)
    (hherm : inner ℂ v (T r) = star (inner ℂ r (T v)))
    (hnative : N = lowDiag*‖z‖^2+2*(star z*p).re+retainedNative) :
    N-(inner ℂ (z • r+v) (T (z • r+v))).re =
      (lowDiag-(inner ℂ r (T r)).re)*‖z‖^2+
      2*(star z*(p-inner ℂ r (T v))).re+
      (retainedNative-(inner ℂ v (T v)).re) := by
  rw [inverse_covariance_split T r v z hherm, hnative]
  simp only [mul_sub, Complex.sub_re]
  ring

#print axioms inverse_covariance_hermitian
#print axioms inverse_covariance_split
#print axioms finite_schur_split
end WeilDefect.RPB108
