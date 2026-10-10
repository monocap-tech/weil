import WeilDefect.RPB108.PaidYoung
import Mathlib.Analysis.Complex.Norm

open scoped BigOperators
namespace WeilDefect.RPB108

noncomputable def offWeights (u : Fin 3 → ℝ) : Fin 3 → Fin 3 → ℝ :=
  ![![0,u 0,u 1], ![u 0,0,u 2], ![u 1,u 2,0]]
noncomputable def rowMargins (d u : Fin 3 → ℝ) : Fin 3 → ℝ :=
  ![d 0-u 0-u 1, d 1-u 0-u 2, d 2-u 1-u 2]
noncomputable def realGram (A : Fin 3 → Fin 3 → ℝ) (x : Fin 3 → ℝ) : ℝ :=
  ∑ i, ∑ j, A i j*x i*x j
noncomputable def complexGram (A : Fin 3 → Fin 3 → ℝ) (z : Fin 3 → ℂ) : ℝ :=
  ∑ i, ∑ j, A i j*(star (z i)*z j).re

lemma bounded_cross_lower (a u t : ℝ) (ha : |a| ≤ u) : -u*|t| ≤ a*t := by
  have h : |a*t| ≤ u*|t| := by
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_right ha (abs_nonneg _)
  have hn := neg_abs_le (a*t)
  linarith

/-- Strictly positive row margins control every real coefficient vector,
using all six signed off-diagonal entries rather than sampled vectors. -/
theorem real_gram_lower (A : Fin 3 → Fin 3 → ℝ) (d u : Fin 3 → ℝ)
    (hu : ∀ i, 0 ≤ u i) (hd : ∀ i, d i ≤ A i i)
    (ha : ∀ i j, i ≠ j → |A i j| ≤ offWeights u i j)
    (x : Fin 3 → ℝ) :
    (∑ i, rowMargins d u i*(x i)^2) ≤ realGram A x := by
  have hp01 := mul_nonneg (hu 0) (sq_nonneg (|x 0|-|x 1|))
  have hp02 := mul_nonneg (hu 1) (sq_nonneg (|x 0|-|x 2|))
  have hp12 := mul_nonneg (hu 2) (sq_nonneg (|x 1|-|x 2|))
  have hx0 := sq_abs (x 0)
  have hx1 := sq_abs (x 1)
  have hx2 := sq_abs (x 2)
  simp only [sub_sq, hx0, hx1, hx2] at hp01 hp02 hp12
  have hdi (i : Fin 3) := mul_le_mul_of_nonneg_right (hd i) (sq_nonneg (x i))
  have hc (i j : Fin 3) (hij : i ≠ j) :=
    bounded_cross_lower (A i j) (offWeights u i j) (x i*x j) (ha i j hij)
  have hc01 := hc 0 1 (by decide)
  have hc10 := hc 1 0 (by decide)
  have hc02 := hc 0 2 (by decide)
  have hc20 := hc 2 0 (by decide)
  have hc12 := hc 1 2 (by decide)
  have hc21 := hc 2 1 (by decide)
  simp [offWeights, abs_mul] at hc01 hc10 hc02 hc20 hc12 hc21
  simp [rowMargins, realGram, Fin.sum_univ_succ]
  nlinarith [hdi 0, hdi 1, hdi 2]

/-- Real source-Gram enclosure bounds extend to arbitrary complex coefficients. -/
theorem complex_gram_lower (A : Fin 3 → Fin 3 → ℝ) (d u : Fin 3 → ℝ)
    (hu : ∀ i, 0 ≤ u i) (hd : ∀ i, d i ≤ A i i)
    (ha : ∀ i j, i ≠ j → |A i j| ≤ offWeights u i j)
    (z : Fin 3 → ℂ) :
    (∑ i, rowMargins d u i*‖z i‖^2) ≤ complexGram A z := by
  have hre := real_gram_lower A d u hu hd ha (fun i => (z i).re)
  have him := real_gram_lower A d u hu hd ha (fun i => (z i).im)
  have hnorm (i : Fin 3) : ‖z i‖^2 = (z i).re^2+(z i).im^2 := by
    rw [Complex.sq_norm]
    simp [Complex.normSq_apply, pow_two]
  have hid : complexGram A z =
      realGram A (fun i => (z i).re)+realGram A (fun i => (z i).im) := by
    simp [complexGram, realGram, Complex.mul_re, mul_add,
      Finset.sum_add_distrib, mul_assoc]
  rw [hid]
  have hs : (∑ i, rowMargins d u i*‖z i‖^2) =
      (∑ i, rowMargins d u i*(z i).re^2)+
      (∑ i, rowMargins d u i*(z i).im^2) := by
    simp_rw [hnorm, mul_add]
    rw [Finset.sum_add_distrib]
  rw [hs]
  exact add_le_add hre him

/-- Positive row weights give a strict gap for every nonzero complex vector. -/
theorem positive_weighted_norm_sq (m : Fin 3 → ℝ) (hm : ∀ i, 0 < m i)
    (z : Fin 3 → ℂ) (hz : z ≠ 0) : 0 < ∑ i, m i*‖z i‖^2 := by
  have hi : ∃ i, z i ≠ 0 := by
    by_contra! h
    apply hz
    funext i
    exact h i
  obtain ⟨i,hi⟩ := hi
  apply Finset.sum_pos'
  · intro j _
    exact mul_nonneg (hm j).le (sq_nonneg _)
  · exact ⟨i, Finset.mem_univ _, mul_pos (hm i) (sq_pos_of_pos (norm_pos_iff.mpr hi))⟩

/-- Congruence by the physical column scales preserves the exact difference
between rho times the native Gram and the complete source Gram. -/
theorem scaled_gram_difference (V G : Fin 3 → Fin 3 → ℝ) (s : Fin 3 → ℝ)
    (rho : ℝ) (z : Fin 3 → ℂ) :
    complexGram (fun i j => s i*s j*(rho*V i j-G i j)) z =
      rho*complexGram V (fun i => (s i : ℂ)*z i)-
        complexGram G (fun i => (s i : ℂ)*z i) := by
  simp only [complexGram, Finset.mul_sum, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  simp [Complex.mul_re, Complex.mul_im]
  ring

#print axioms bounded_cross_lower
#print axioms positive_weighted_norm_sq
#print axioms scaled_gram_difference
#print axioms real_gram_lower
#print axioms complex_gram_lower
end WeilDefect.RPB108
