import WeilDefect.RPB108.MixedPairing
open scoped BigOperators
namespace WeilDefect.RPB108

/-- Finite complex row Cauchy bound from entrywise norm envelopes. -/
theorem complex_row_square_le {ι : Type*} [Fintype ι]
    (a z : ι → ℂ) (b : ι → ℝ) (hb : ∀ i, ‖a i‖ ≤ b i) :
    ‖∑ i, a i*z i‖^2 ≤ (∑ i, (b i)^2)*(∑ i, ‖z i‖^2) := by
  have ht : ‖∑ i, a i*z i‖ ≤ ∑ i, b i*‖z i‖ := by
    calc
      ‖∑ i, a i*z i‖ ≤ ∑ i, ‖a i*z i‖ := norm_sum_le _ _
      _ ≤ ∑ i, b i*‖z i‖ := by
        apply Finset.sum_le_sum
        intro i _
        rw [norm_mul]
        exact mul_le_mul_of_nonneg_right (hb i) (norm_nonneg _)
  have hn : 0 ≤ ∑ i, b i*‖z i‖ := (norm_nonneg _).trans ht
  have hs : ‖∑ i, a i*z i‖^2 ≤ (∑ i, b i*‖z i‖)^2 := by
    nlinarith only [ht, hn, norm_nonneg (∑ i, a i*z i)]
  have hc := weighted_mass_sq_le_energy Finset.univ b (fun _ => 1)
    (fun i => ‖z i‖) (by intros; norm_num)
  simp only [Finset.mem_univ, forall_const, one_mul, div_one,
    abs_of_nonneg (norm_nonneg _)] at hc
  exact hs.trans hc

/-- A checked dual budget and positive coordinate-energy floor bound the row
against actual V-energy, without assuming the resulting pairing inequality. -/
theorem native_row_square_of_energy_floor {ι : Type*} [Fintype ι]
    (a z : ι → ℂ) (b : ι → ℝ) (g d V : ℝ)
    (hb : ∀ i, ‖a i‖ ≤ b i) (hd : 0 ≤ d)
    (hbudget : (∑ i, (b i)^2) ≤ d*g)
    (hfloor : g*(∑ i, ‖z i‖^2) ≤ V) :
    ‖∑ i, a i*z i‖^2 ≤ d*V := by
  calc
    ‖∑ i, a i*z i‖^2 ≤ (∑ i, (b i)^2)*(∑ i, ‖z i‖^2) :=
      complex_row_square_le a z b hb
    _ ≤ (d*g)*(∑ i, ‖z i‖^2) :=
      mul_le_mul_of_nonneg_right hbudget (Finset.sum_nonneg (fun _ _ => sq_nonneg _))
    _ = d*(g*(∑ i, ‖z i‖^2)) := by ring
    _ ≤ d*V := mul_le_mul_of_nonneg_left hfloor hd

#print axioms complex_row_square_le
#print axioms native_row_square_of_energy_floor
end WeilDefect.RPB108
