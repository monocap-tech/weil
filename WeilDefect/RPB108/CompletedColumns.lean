import WeilDefect.RPB108.PhysicalGap
import Mathlib.Analysis.Normed.Module.Basic

open scoped BigOperators
namespace WeilDefect.RPB108

/-- Four completed columns and an unrestricted high norm contribute the exact
DNE27 denominator. The final coordinate is a norm, not a truncation of high modes. -/
theorem four_column_tail_gap (w L : Fin 4 → ℝ) (k gap : ℝ)
    (hL : ∀ i, 0 < L i) (hk : 0 < k) (hgap : 0 ≤ gap)
    (hbound : gap * ((∑ i, (w i)^2 / L i) + 1/k) ≤ 1)
    (z : Fin 4 → ℝ) (r : ℝ) (hr : 0 ≤ r) :
    gap * ((∑ i, w i * |z i|) + r)^2 ≤
      (∑ i, L i * (z i)^2) + k*r^2 := by
  let w' : Option (Fin 4) → ℝ := fun i => i.elim 1 w
  let L' : Option (Fin 4) → ℝ := fun i => i.elim k L
  let z' : Option (Fin 4) → ℝ := fun i => i.elim r z
  have hL' : ∀ i ∈ (Finset.univ : Finset (Option (Fin 4))), 0 < L' i := by
    intro i _
    cases i with
    | none => exact hk
    | some i => exact hL i
  have hb : gap * (∑ i ∈ (Finset.univ : Finset (Option (Fin 4))), (w' i)^2/L' i) ≤ 1 := by
    simpa [w', L', Fintype.sum_option, add_comm] using hbound
  have h := physical_gap_of_denominator_bound Finset.univ w' L' hL' gap hgap hb z'
  simpa [w', L', z', Fintype.sum_option, abs_of_nonneg hr, add_comm] using h

/-- The physical triangle estimate follows from actual norm bounds on the four
completed columns in any complex normed space. -/
theorem completed_columns_norm_bound {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (v : Fin 4 → E) (b : Fin 4 → ℝ) (hv : ∀ i, ‖v i‖ ≤ b i)
    (z : Fin 4 → ℂ) (h : E) :
    ‖(∑ i, z i • v i) + h‖ ≤ (∑ i, b i * ‖z i‖) + ‖h‖ := by
  calc
    ‖(∑ i, z i • v i) + h‖ ≤ ‖∑ i, z i • v i‖ + ‖h‖ := norm_add_le _ _
    _ ≤ (∑ i, ‖z i • v i‖) + ‖h‖ := add_le_add (norm_sum_le _ _) (le_refl _)
    _ ≤ (∑ i, b i * ‖z i‖) + ‖h‖ := by
      apply add_le_add _ (le_refl _)
      apply Finset.sum_le_sum
      intro i _
      rw [norm_smul, mul_comm (b i)]
      exact mul_le_mul_of_nonneg_left (hv i) (norm_nonneg _)

/-- A checked denominator and an explicit completed-square energy bound imply
a physical gap for all high vectors. Original Weil energy/source attachment
must supply `hv` and `henergy`; no original arithmetic certificate is assumed. -/
theorem completed_columns_physical_gap {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (v : Fin 4 → E) (b L : Fin 4 → ℝ) (k gap : ℝ)
    (hv : ∀ i, ‖v i‖ ≤ b i) (hL : ∀ i, 0 < L i) (hk : 0 < k)
    (hgap : 0 ≤ gap)
    (hbound : gap * ((∑ i, (b i)^2/L i) + 1/k) ≤ 1)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ)
    (henergy : (∑ i, L i * ‖z i‖^2) + k*‖h‖^2 ≤ energy) :
    gap * ‖(∑ i, z i • v i) + h‖^2 ≤ energy := by
  have hu := completed_columns_norm_bound v b hv z h
  have hs : ‖(∑ i, z i • v i) + h‖^2 ≤ ((∑ i, b i * ‖z i‖) + ‖h‖)^2 := by
    have hn := norm_nonneg ((∑ i, z i • v i) + h)
    nlinarith
  have hc := four_column_tail_gap b L k gap hL hk hgap hbound
    (fun i => ‖z i‖) ‖h‖ (norm_nonneg _)
  simp only [abs_of_nonneg (norm_nonneg _)] at hc
  exact ((mul_le_mul_of_nonneg_left hs hgap).trans hc).trans henergy

#print axioms four_column_tail_gap
#print axioms completed_columns_norm_bound
#print axioms completed_columns_physical_gap
end WeilDefect.RPB108
