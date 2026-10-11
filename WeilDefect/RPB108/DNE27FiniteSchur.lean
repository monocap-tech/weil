import WeilDefect.RPB108.DNE27SchurBounds
import WeilDefect.RPB108.FiniteSchur
open scoped BigOperators
noncomputable section
namespace WeilDefect.RPB108

namespace DNE27Even

/-- The finite Schur identity is derived from the uncorrected native block
identity and Hermitian covariance on the actual low/retained source pair. -/
theorem finite_schur_identity_of_native_block {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (source : Fin 4 → E) (V G : Fin 3 → Fin 3 → ℝ)
    (a : Fin 3 → ℝ) (z : Fin 4 → ℂ) (N lowDiag : ℝ)
    (hcov : inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) (T (source 0)) =
      star (inner ℂ (source 0) (T (∑ i : Fin 3, z i.succ • source i.succ))))
    (hnative : N = lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+
      retainedNativeEnergy V G z) :
    N-(inner ℂ (∑ i, z i • source i) (T (∑ i, z i • source i))).re =
      actualLowSchur T source lowDiag*‖z 0‖^2+
      2*(star (z 0)*(nativePairing a z-inverseSourcePairing T source z)).re+
      actualRetainedSchur T source V G z := by
  have h := finite_schur_split T (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (z 0) (nativePairing a z)
    N lowDiag (retainedNativeEnergy V G z) hcov hnative
  simpa only [Fin.sum_univ_succ, actualLowSchur, inverseSourcePairing,
    actualRetainedSchur] using h

/-- Physical gap from native/raw block identities. The finite Schur identity
and covariance symmetry are derived from actual weak high-inverse equations. -/
theorem physical_gap_of_native_form_blocks {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (Q : E → ℝ) (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hherm : ∀ u v, B u v = star (B v u))
    (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ))
    (a : Fin 3 → ℝ)
    (ha : ∀ i, nativePairingLower i ≤ a i ∧ a i ≤ nativePairingUpper i)
    (z : Fin 4 → ℂ) (h : E) (N lowDiag : ℝ)
    (hlow : lowNativeLower ≤ lowDiag)
    (hsolve : ∀ u, B (T (∑ i, z i • source i)) u =
      inner ℂ (∑ i, z i • source i) u)
    (hsolveLow : ∀ u, B (T (source 0)) u = inner ℂ (source 0) u)
    (hsolveRetained : ∀ u, B (T (∑ i : Fin 3, z i.succ • source i.succ)) u =
      inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) u)
    (hraw : Q ((∑ i, z i • x i)+(h-T (∑ i, z i • source i))) =
      N+2*(inner ℂ (∑ i, z i • source i) (h-T (∑ i, z i • source i))).re+
      (B (h-T (∑ i, z i • source i)) (h-T (∑ i, z i • source i))).re)
    (hnative : N = lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+
      retainedNativeEnergy V G z)
    (hhigh : highFloor*‖h‖^2 ≤ (B h h).re) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤
      Q ((∑ i, z i • (x i-T (source i)))+h) := by
  have hsym (u v : E) : (B u v).re = (B v u).re := by rw [hherm]; simp
  have hc := inverse_covariance_hermitian B T hherm (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (hsolveLow _) (hsolveRetained _)
  have hf := finite_schur_identity_of_native_block T source V G a z N lowDiag hc hnative
  exact physical_gap_of_actual_schur_blocks Q B T hleft hright hsym x source hT hx hsource
    V G hV hG hGram a ha z h N lowDiag hlow hsolve hraw hf hhigh

#print axioms finite_schur_identity_of_native_block
#print axioms physical_gap_of_native_form_blocks
end DNE27Even

namespace DNE27Odd

/-- The finite Schur identity is derived from the uncorrected native block
identity and Hermitian covariance on the actual low/retained source pair. -/
theorem finite_schur_identity_of_native_block {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (source : Fin 4 → E) (V G : Fin 3 → Fin 3 → ℝ)
    (a : Fin 3 → ℝ) (z : Fin 4 → ℂ) (N lowDiag : ℝ)
    (hcov : inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) (T (source 0)) =
      star (inner ℂ (source 0) (T (∑ i : Fin 3, z i.succ • source i.succ))))
    (hnative : N = lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+
      retainedNativeEnergy V G z) :
    N-(inner ℂ (∑ i, z i • source i) (T (∑ i, z i • source i))).re =
      actualLowSchur T source lowDiag*‖z 0‖^2+
      2*(star (z 0)*(nativePairing a z-inverseSourcePairing T source z)).re+
      actualRetainedSchur T source V G z := by
  have h := finite_schur_split T (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (z 0) (nativePairing a z)
    N lowDiag (retainedNativeEnergy V G z) hcov hnative
  simpa only [Fin.sum_univ_succ, actualLowSchur, inverseSourcePairing,
    actualRetainedSchur] using h

/-- Physical gap from native/raw block identities. The finite Schur identity
and covariance symmetry are derived from actual weak high-inverse equations. -/
theorem physical_gap_of_native_form_blocks {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (Q : E → ℝ) (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hherm : ∀ u v, B u v = star (B v u))
    (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ))
    (a : Fin 3 → ℝ)
    (ha : ∀ i, nativePairingLower i ≤ a i ∧ a i ≤ nativePairingUpper i)
    (z : Fin 4 → ℂ) (h : E) (N lowDiag : ℝ)
    (hlow : lowNativeLower ≤ lowDiag)
    (hsolve : ∀ u, B (T (∑ i, z i • source i)) u =
      inner ℂ (∑ i, z i • source i) u)
    (hsolveLow : ∀ u, B (T (source 0)) u = inner ℂ (source 0) u)
    (hsolveRetained : ∀ u, B (T (∑ i : Fin 3, z i.succ • source i.succ)) u =
      inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) u)
    (hraw : Q ((∑ i, z i • x i)+(h-T (∑ i, z i • source i))) =
      N+2*(inner ℂ (∑ i, z i • source i) (h-T (∑ i, z i • source i))).re+
      (B (h-T (∑ i, z i • source i)) (h-T (∑ i, z i • source i))).re)
    (hnative : N = lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+
      retainedNativeEnergy V G z)
    (hhigh : highFloor*‖h‖^2 ≤ (B h h).re) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤
      Q ((∑ i, z i • (x i-T (source i)))+h) := by
  have hsym (u v : E) : (B u v).re = (B v u).re := by rw [hherm]; simp
  have hc := inverse_covariance_hermitian B T hherm (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (hsolveLow _) (hsolveRetained _)
  have hf := finite_schur_identity_of_native_block T source V G a z N lowDiag hc hnative
  exact physical_gap_of_actual_schur_blocks Q B T hleft hright hsym x source hT hx hsource
    V G hV hG hGram a ha z h N lowDiag hlow hsolve hraw hf hhigh

#print axioms finite_schur_identity_of_native_block
#print axioms physical_gap_of_native_form_blocks
end DNE27Odd
end WeilDefect.RPB108
