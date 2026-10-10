import WeilDefect.RPB108.DNE27Gram
import WeilDefect.RPB108.MixedPairing
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace WeilDefect.RPB108

namespace DNE27Even

/-- The actual retained V-energy is paid before its coordinate lower bound.
No monotonicity of the negative square-root expression is assumed. -/
theorem actual_energy_diagonal_lower (z : Fin 4 → ℂ) (Venergy : ℝ) (p q : ℂ)
    (hv : retainedEnergy z ≤ Venergy)
    (hp : ‖p‖^2 ≤ nativeDualSquare*Venergy)
    (hq : ‖q‖^2 ≤ highMixedSquare*Venergy) :
    (∑ i, lower i*‖z i‖^2) ≤
      nativeLow*‖z 0‖^2-2*‖z 0‖*‖p-q‖+Venergy := by
  have hV := (retained_energy_nonneg z).trans hv
  obtain ⟨ha,hb,_,_,_⟩ := mixed_root_certificate
  have hm := mixed_pairing_norm_le p q _ _ _ _ ha hb hV hp hq
    combined_mixed_norm_bound
  have hy := paid_actual_energy_lower nativeLow mixedUpper theta ‖z 0‖
    Venergy (retainedEnergy z) p q theta_bounds.1.le theta_bounds.2
    (norm_nonneg _) hV hv hm
  rw [← lowLower_identity] at hy
  have hs : (∑ i, lower i*‖z i‖^2) = lowLower*‖z 0‖^2+theta*retainedEnergy z := by
    simp [lower, retainedEnergy, Fin.sum_univ_succ, threeLower_identity]
    ring
  exact hs.trans_le hy

/-- Complete Gram arithmetic, native/source pairing squares and the actual
four-column completion imply the physical gap. Each original-form attachment
is explicit; in particular hv is a V-energy bound, not a mixed-energy premise. -/
theorem physical_gap_of_gram_and_pairings {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ) (p q : ℂ)
    (hv : retainedEnergy z ≤ complexGram V
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hp : ‖p‖^2 ≤ nativeDualSquare*complexGram V
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hq : ‖q‖^2 ≤ (rawSourceSquare 0/highFloor^2)*complexGram G
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hcompletion : nativeLow*‖z 0‖^2-2*‖z 0‖*‖p-q‖+
      complexGram V (fun i => (gramScales i : ℂ)*z i.succ)+
      highFloor*‖h‖^2 ≤ energy) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤ energy := by
  have hd := source_gram_domination V G hV hG (fun i => z i.succ)
  rw [scaled_gram_difference] at hd
  have hn : 0 ≤ ∑ i : Fin 3, publishedMargins i*‖z i.succ‖^2 :=
    Finset.sum_nonneg (fun i _ => mul_nonneg (row_margin_certificate i).2.le (sq_nonneg _))
  have hg : complexGram G (fun i => (gramScales i : ℂ)*z i.succ) ≤
      rho*complexGram V (fun i => (gramScales i : ℂ)*z i.succ) := by linarith
  have hc : 0 ≤ rawSourceSquare 0/highFloor^2 := by
    -- The original source-square upper bound is nonnegative independently of rho.
    norm_num [rawSourceSquare, highFloor]
  have hq' := source_cross_square_of_gram_domination q
    (rawSourceSquare 0/highFloor^2) rho _ _ hc hg hq
  have heq : (rawSourceSquare 0/highFloor^2)*rho = highMixedSquare := by
    unfold highMixedSquare
    ring
  rw [heq] at hq'
  have he := actual_energy_diagonal_lower z _ p q hv hp hq'
  apply physical_gap_of_native_source_bounds T x source hT hx hsource z h energy
  exact (add_le_add he (le_refl _)).trans hcompletion

#print axioms actual_energy_diagonal_lower
#print axioms physical_gap_of_gram_and_pairings
end DNE27Even

namespace DNE27Odd

/-- The actual retained V-energy is paid before its coordinate lower bound.
No monotonicity of the negative square-root expression is assumed. -/
theorem actual_energy_diagonal_lower (z : Fin 4 → ℂ) (Venergy : ℝ) (p q : ℂ)
    (hv : retainedEnergy z ≤ Venergy)
    (hp : ‖p‖^2 ≤ nativeDualSquare*Venergy)
    (hq : ‖q‖^2 ≤ highMixedSquare*Venergy) :
    (∑ i, lower i*‖z i‖^2) ≤
      nativeLow*‖z 0‖^2-2*‖z 0‖*‖p-q‖+Venergy := by
  have hV := (retained_energy_nonneg z).trans hv
  obtain ⟨ha,hb,_,_,_⟩ := mixed_root_certificate
  have hm := mixed_pairing_norm_le p q _ _ _ _ ha hb hV hp hq
    combined_mixed_norm_bound
  have hy := paid_actual_energy_lower nativeLow mixedUpper theta ‖z 0‖
    Venergy (retainedEnergy z) p q theta_bounds.1.le theta_bounds.2
    (norm_nonneg _) hV hv hm
  rw [← lowLower_identity] at hy
  have hs : (∑ i, lower i*‖z i‖^2) = lowLower*‖z 0‖^2+theta*retainedEnergy z := by
    simp [lower, retainedEnergy, Fin.sum_univ_succ, threeLower_identity]
    ring
  exact hs.trans_le hy

/-- Complete Gram arithmetic, native/source pairing squares and the actual
four-column completion imply the physical gap. Each original-form attachment
is explicit; in particular hv is a V-energy bound, not a mixed-energy premise. -/
theorem physical_gap_of_gram_and_pairings {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ) (p q : ℂ)
    (hv : retainedEnergy z ≤ complexGram V
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hp : ‖p‖^2 ≤ nativeDualSquare*complexGram V
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hq : ‖q‖^2 ≤ (rawSourceSquare 0/highFloor^2)*complexGram G
      (fun i => (gramScales i : ℂ)*z i.succ))
    (hcompletion : nativeLow*‖z 0‖^2-2*‖z 0‖*‖p-q‖+
      complexGram V (fun i => (gramScales i : ℂ)*z i.succ)+
      highFloor*‖h‖^2 ≤ energy) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤ energy := by
  have hd := source_gram_domination V G hV hG (fun i => z i.succ)
  rw [scaled_gram_difference] at hd
  have hn : 0 ≤ ∑ i : Fin 3, publishedMargins i*‖z i.succ‖^2 :=
    Finset.sum_nonneg (fun i _ => mul_nonneg (row_margin_certificate i).2.le (sq_nonneg _))
  have hg : complexGram G (fun i => (gramScales i : ℂ)*z i.succ) ≤
      rho*complexGram V (fun i => (gramScales i : ℂ)*z i.succ) := by linarith
  have hc : 0 ≤ rawSourceSquare 0/highFloor^2 := by
    -- The original source-square upper bound is nonnegative independently of rho.
    norm_num [rawSourceSquare, highFloor]
  have hq' := source_cross_square_of_gram_domination q
    (rawSourceSquare 0/highFloor^2) rho _ _ hc hg hq
  have heq : (rawSourceSquare 0/highFloor^2)*rho = highMixedSquare := by
    unfold highMixedSquare
    ring
  rw [heq] at hq'
  have he := actual_energy_diagonal_lower z _ p q hv hp hq'
  apply physical_gap_of_native_source_bounds T x source hT hx hsource z h energy
  exact (add_le_add he (le_refl _)).trans hcompletion

#print axioms actual_energy_diagonal_lower
#print axioms physical_gap_of_gram_and_pairings
end DNE27Odd
end WeilDefect.RPB108
