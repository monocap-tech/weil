import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Tactic

open scoped BigOperators
namespace WeilDefect.RPB108

/-- Universal weighted Cauchy bound used by the physical-mass certificate.
This concerns arbitrary real coefficients; it is not a finite grid test. -/
theorem weighted_mass_sq_le_energy {ι : Type*} (s : Finset ι)
    (w L z : ι → ℝ) (hL : ∀ i ∈ s, 0 < L i) :
    (∑ i ∈ s, w i * |z i|) ^ 2 ≤
      (∑ i ∈ s, (w i) ^ 2 / L i) * (∑ i ∈ s, L i * (z i) ^ 2) := by
  apply Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul s
    (fun i hi => div_nonneg (sq_nonneg _) (hL i hi).le)
    (fun i hi => mul_nonneg (hL i hi).le (sq_nonneg _))
  intro i hi
  have hn : L i ≠ 0 := ne_of_gt (hL i hi)
  rw [mul_pow, sq_abs]
  exact le_of_eq (by field_simp)

/-- A rational denominator bound entails a gap for every coefficient vector. -/
theorem physical_gap_of_denominator_bound {ι : Type*} (s : Finset ι)
    (w L : ι → ℝ) (hL : ∀ i ∈ s, 0 < L i) (gap : ℝ)
    (hgap : 0 ≤ gap)
    (hbound : gap * (∑ i ∈ s, (w i) ^ 2 / L i) ≤ 1)
    (z : ι → ℝ) :
    gap * (∑ i ∈ s, w i * |z i|) ^ 2 ≤ ∑ i ∈ s, L i * (z i) ^ 2 := by
  have he : 0 ≤ ∑ i ∈ s, L i * (z i) ^ 2 :=
    Finset.sum_nonneg (fun i hi => mul_nonneg (hL i hi).le (sq_nonneg _))
  calc
    gap * (∑ i ∈ s, w i * |z i|) ^ 2 ≤
        gap * ((∑ i ∈ s, (w i) ^ 2 / L i) *
          (∑ i ∈ s, L i * (z i) ^ 2)) :=
      mul_le_mul_of_nonneg_left (weighted_mass_sq_le_energy s w L z hL) hgap
    _ = (gap * (∑ i ∈ s, (w i) ^ 2 / L i)) *
        (∑ i ∈ s, L i * (z i) ^ 2) := by ring
    _ ≤ 1 * (∑ i ∈ s, L i * (z i) ^ 2) := mul_le_mul_of_nonneg_right hbound he
    _ = _ := one_mul _

/-- Transport a certified coefficient gap to any nonnegative physical norm
bounded by the completed-column triangle estimate. Analytic attachment of that
estimate remains a separate hypothesis. -/
theorem physical_gap_of_mass_upper_bound {ι : Type*} (s : Finset ι)
    (w L : ι → ℝ) (hL : ∀ i ∈ s, 0 < L i) (gap : ℝ)
    (hgap : 0 ≤ gap)
    (hbound : gap * (∑ i ∈ s, (w i) ^ 2 / L i) ≤ 1)
    (z : ι → ℝ) (mass : ℝ) (hmass : 0 ≤ mass)
    (hupper : mass ≤ ∑ i ∈ s, w i * |z i|) :
    gap * mass ^ 2 ≤ ∑ i ∈ s, L i * (z i) ^ 2 := by
  have hu : 0 ≤ ∑ i ∈ s, w i * |z i| := hmass.trans hupper
  have hs : mass ^ 2 ≤ (∑ i ∈ s, w i * |z i|) ^ 2 := by
    nlinarith
  exact (mul_le_mul_of_nonneg_left hs hgap).trans
    (physical_gap_of_denominator_bound s w L hL gap hgap hbound z)

#print axioms weighted_mass_sq_le_energy
#print axioms physical_gap_of_denominator_bound
#print axioms physical_gap_of_mass_upper_bound
end WeilDefect.RPB108
