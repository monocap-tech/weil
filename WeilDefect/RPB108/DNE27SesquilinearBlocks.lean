import WeilDefect.RPB108.DNE27FiniteSchur
import WeilDefect.RPB108.SesquilinearBlocks
open scoped BigOperators
noncomputable section
namespace WeilDefect.RPB108

namespace DNE27Even

/-- Native low/retained block identity from the actual finite form entries. -/
theorem native_block_of_sesquilinear_entries {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hherm : ∀ u v, F u v = star (F v u)) (x : Fin 4 → E)
    (V G : Fin 3 → Fin 3 → ℝ) (a : Fin 3 → ℝ) (lowDiag : ℝ)
    (hd : (F (x 0) (x 0)).re = lowDiag)
    (hrow : ∀ i : Fin 3, F (x 0) (x i.succ) = ((gramScales i*a i : ℝ) : ℂ))
    (hret : ∀ i j : Fin 3, F (x i.succ) (x j.succ) =
      ((gramScales i*gramScales j*(V i j+G i j/highFloor) : ℝ) : ℂ))
    (z : Fin 4 → ℂ) :
    (F (∑ i, z i • x i) (∑ i, z i • x i)).re =
      lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+retainedNativeEnergy V G z := by
  have hs : (∑ i, z i • x i) = z 0 • x 0+(∑ i : Fin 3, z i.succ • x i.succ) :=
    Fin.sum_univ_succ _
  have hc : F (z 0 • x 0) (∑ i : Fin 3, z i.succ • x i.succ) =
      star (z 0)*nativePairing a z := by
    rw [LinearMap.map_smulₛₗ₂]
    simp only [map_sum, map_smul, smul_eq_mul, hrow]
    change star (z 0)*(∑ i : Fin 3, z i.succ*((gramScales i*a i : ℝ) : ℂ)) = _
    congr 1
    unfold nativePairing
    apply Finset.sum_congr rfl
    intro i _
    ring
  have hg := sesquilinear_gram F (fun i : Fin 3 => x i.succ)
    (fun i j => gramScales i*gramScales j*(V i j+G i j/highFloor)) hret
    (fun i => z i.succ)
  have hr : (F (∑ i : Fin 3, z i.succ • x i.succ)
      (∑ i : Fin 3, z i.succ • x i.succ)).re = retainedNativeEnergy V G z := by
    simpa only [retainedNativeEnergy, scaled_retained_gram] using hg
  rw [hs, hermitian_form_add F hherm, sesquilinear_smul_diagonal, hd, hc, hr]
  ring

/-- Raw form block identity from form realization, local high restriction and
column source coupling at the actual high vector. -/
theorem raw_block_of_sesquilinear_coupling {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hherm : ∀ u v, F u v = star (F v u)) (Q : E → ℝ) (B : E → E → ℂ)
    (x source : Fin 4 → E) (z : Fin 4 → ℂ) (v : E)
    (hQ : Q ((∑ i, z i • x i)+v) =
      (F ((∑ i, z i • x i)+v) ((∑ i, z i • x i)+v)).re)
    (hc : ∀ i, F (x i) v = inner ℂ (source i) v)
    (hhigh : (F v v).re = (B v v).re) :
    Q ((∑ i, z i • x i)+v) = (F (∑ i, z i • x i) (∑ i, z i • x i)).re+
      2*(inner ℂ (∑ i, z i • source i) v).re+(B v v).re := by
  rw [hQ, hermitian_form_add F hherm, sesquilinear_source_coupling F x source z v hc, hhigh]

/-- Physical gap with native/raw block identities derived from an algebraic
form realization. F is not required to be bounded on physical L2. -/
theorem physical_gap_of_sesquilinear_realization {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hFherm : ∀ u v, F u v = star (F v u))
    (Q : E → ℝ) (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hBherm : ∀ u v, B u v = star (B v u))
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
    (z : Fin 4 → ℂ) (h : E) (lowDiag : ℝ)
    (hlow : lowNativeLower ≤ lowDiag)
    (hd : (F (x 0) (x 0)).re = lowDiag)
    (hrow : ∀ i : Fin 3, F (x 0) (x i.succ) = ((gramScales i*a i : ℝ) : ℂ))
    (hret : ∀ i j : Fin 3, F (x i.succ) (x j.succ) =
      ((gramScales i*gramScales j*(V i j+G i j/highFloor) : ℝ) : ℂ))
    (hsolve : ∀ u, B (T (∑ i, z i • source i)) u =
      inner ℂ (∑ i, z i • source i) u)
    (hsolveLow : ∀ u, B (T (source 0)) u = inner ℂ (source 0) u)
    (hsolveRetained : ∀ u, B (T (∑ i : Fin 3, z i.succ • source i.succ)) u =
      inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) u)
    (hQ : Q ((∑ i, z i • x i)+(h-T (∑ i, z i • source i))) =
      (F ((∑ i, z i • x i)+(h-T (∑ i, z i • source i)))
        ((∑ i, z i • x i)+(h-T (∑ i, z i • source i)))).re)
    (hc : ∀ i, F (x i) (h-T (∑ j, z j • source j)) =
      inner ℂ (source i) (h-T (∑ j, z j • source j)))
    (hhighRestriction : (F (h-T (∑ i, z i • source i))
      (h-T (∑ i, z i • source i))).re =
      (B (h-T (∑ i, z i • source i)) (h-T (∑ i, z i • source i))).re)
    (hhigh : highFloor*‖h‖^2 ≤ (B h h).re) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤
      Q ((∑ i, z i • (x i-T (source i)))+h) := by
  exact physical_gap_of_native_form_blocks Q B T hleft hright hBherm x source hT hx hsource
    V G hV hG hGram a ha z h (F (∑ i, z i • x i) (∑ i, z i • x i)).re lowDiag hlow
    hsolve hsolveLow hsolveRetained
    (raw_block_of_sesquilinear_coupling F hFherm Q B x source z _ hQ hc hhighRestriction)
    (native_block_of_sesquilinear_entries F hFherm x V G a lowDiag hd hrow hret z) hhigh

#print axioms native_block_of_sesquilinear_entries
#print axioms raw_block_of_sesquilinear_coupling
#print axioms physical_gap_of_sesquilinear_realization
end DNE27Even

namespace DNE27Odd

/-- Native low/retained block identity from the actual finite form entries. -/
theorem native_block_of_sesquilinear_entries {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hherm : ∀ u v, F u v = star (F v u)) (x : Fin 4 → E)
    (V G : Fin 3 → Fin 3 → ℝ) (a : Fin 3 → ℝ) (lowDiag : ℝ)
    (hd : (F (x 0) (x 0)).re = lowDiag)
    (hrow : ∀ i : Fin 3, F (x 0) (x i.succ) = ((gramScales i*a i : ℝ) : ℂ))
    (hret : ∀ i j : Fin 3, F (x i.succ) (x j.succ) =
      ((gramScales i*gramScales j*(V i j+G i j/highFloor) : ℝ) : ℂ))
    (z : Fin 4 → ℂ) :
    (F (∑ i, z i • x i) (∑ i, z i • x i)).re =
      lowDiag*‖z 0‖^2+2*(star (z 0)*nativePairing a z).re+retainedNativeEnergy V G z := by
  have hs : (∑ i, z i • x i) = z 0 • x 0+(∑ i : Fin 3, z i.succ • x i.succ) :=
    Fin.sum_univ_succ _
  have hc : F (z 0 • x 0) (∑ i : Fin 3, z i.succ • x i.succ) =
      star (z 0)*nativePairing a z := by
    rw [LinearMap.map_smulₛₗ₂]
    simp only [map_sum, map_smul, smul_eq_mul, hrow]
    change star (z 0)*(∑ i : Fin 3, z i.succ*((gramScales i*a i : ℝ) : ℂ)) = _
    congr 1
    unfold nativePairing
    apply Finset.sum_congr rfl
    intro i _
    ring
  have hg := sesquilinear_gram F (fun i : Fin 3 => x i.succ)
    (fun i j => gramScales i*gramScales j*(V i j+G i j/highFloor)) hret
    (fun i => z i.succ)
  have hr : (F (∑ i : Fin 3, z i.succ • x i.succ)
      (∑ i : Fin 3, z i.succ • x i.succ)).re = retainedNativeEnergy V G z := by
    simpa only [retainedNativeEnergy, scaled_retained_gram] using hg
  rw [hs, hermitian_form_add F hherm, sesquilinear_smul_diagonal, hd, hc, hr]
  ring

/-- Raw form block identity from form realization, local high restriction and
column source coupling at the actual high vector. -/
theorem raw_block_of_sesquilinear_coupling {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hherm : ∀ u v, F u v = star (F v u)) (Q : E → ℝ) (B : E → E → ℂ)
    (x source : Fin 4 → E) (z : Fin 4 → ℂ) (v : E)
    (hQ : Q ((∑ i, z i • x i)+v) =
      (F ((∑ i, z i • x i)+v) ((∑ i, z i • x i)+v)).re)
    (hc : ∀ i, F (x i) v = inner ℂ (source i) v)
    (hhigh : (F v v).re = (B v v).re) :
    Q ((∑ i, z i • x i)+v) = (F (∑ i, z i • x i) (∑ i, z i • x i)).re+
      2*(inner ℂ (∑ i, z i • source i) v).re+(B v v).re := by
  rw [hQ, hermitian_form_add F hherm, sesquilinear_source_coupling F x source z v hc, hhigh]

/-- Physical gap with native/raw block identities derived from an algebraic
form realization. F is not required to be bounded on physical L2. -/
theorem physical_gap_of_sesquilinear_realization {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (F : E →ₛₗ[starRingEnd ℂ] E →ₗ[ℂ] ℂ)
    (hFherm : ∀ u v, F u v = star (F v u))
    (Q : E → ℝ) (B : E → E → ℂ) (T : E →L[ℂ] E)
    (hleft : ∀ u v w, B (u-v) w = B u w-B v w)
    (hright : ∀ u v w, B u (v-w) = B u v-B u w)
    (hBherm : ∀ u v, B u v = star (B v u))
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
    (z : Fin 4 → ℂ) (h : E) (lowDiag : ℝ)
    (hlow : lowNativeLower ≤ lowDiag)
    (hd : (F (x 0) (x 0)).re = lowDiag)
    (hrow : ∀ i : Fin 3, F (x 0) (x i.succ) = ((gramScales i*a i : ℝ) : ℂ))
    (hret : ∀ i j : Fin 3, F (x i.succ) (x j.succ) =
      ((gramScales i*gramScales j*(V i j+G i j/highFloor) : ℝ) : ℂ))
    (hsolve : ∀ u, B (T (∑ i, z i • source i)) u =
      inner ℂ (∑ i, z i • source i) u)
    (hsolveLow : ∀ u, B (T (source 0)) u = inner ℂ (source 0) u)
    (hsolveRetained : ∀ u, B (T (∑ i : Fin 3, z i.succ • source i.succ)) u =
      inner ℂ (∑ i : Fin 3, z i.succ • source i.succ) u)
    (hQ : Q ((∑ i, z i • x i)+(h-T (∑ i, z i • source i))) =
      (F ((∑ i, z i • x i)+(h-T (∑ i, z i • source i)))
        ((∑ i, z i • x i)+(h-T (∑ i, z i • source i)))).re)
    (hc : ∀ i, F (x i) (h-T (∑ j, z j • source j)) =
      inner ℂ (source i) (h-T (∑ j, z j • source j)))
    (hhighRestriction : (F (h-T (∑ i, z i • source i))
      (h-T (∑ i, z i • source i))).re =
      (B (h-T (∑ i, z i • source i)) (h-T (∑ i, z i • source i))).re)
    (hhigh : highFloor*‖h‖^2 ≤ (B h h).re) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤
      Q ((∑ i, z i • (x i-T (source i)))+h) := by
  exact physical_gap_of_native_form_blocks Q B T hleft hright hBherm x source hT hx hsource
    V G hV hG hGram a ha z h (F (∑ i, z i • x i) (∑ i, z i • x i)).re lowDiag hlow
    hsolve hsolveLow hsolveRetained
    (raw_block_of_sesquilinear_coupling F hFherm Q B x source z _ hQ hc hhighRestriction)
    (native_block_of_sesquilinear_entries F hFherm x V G a lowDiag hd hrow hret z) hhigh

#print axioms native_block_of_sesquilinear_entries
#print axioms raw_block_of_sesquilinear_coupling
#print axioms physical_gap_of_sesquilinear_realization
end DNE27Odd
end WeilDefect.RPB108
