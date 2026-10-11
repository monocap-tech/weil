import WeilDefect.RPB108.CompletedColumns
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.Normed.Operator.Basic

namespace WeilDefect.RPB108

/-- Exact squared inequalities certify a sum of two square roots without
introducing an approximate root as a mathematical premise. -/
theorem sqrt_add_le_of_squared_certificate (a b M : ℝ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hM : 0 ≤ M)
    (he : 0 ≤ M^2-a-b) (hc : 4*a*b ≤ (M^2-a-b)^2) :
    Real.sqrt a + Real.sqrt b ≤ M := by
  have hp : (2*Real.sqrt a*Real.sqrt b)^2 = 4*a*b := by
    simp only [mul_pow, Real.sq_sqrt ha, Real.sq_sqrt hb]
    ring
  have hn : 0 ≤ 2*Real.sqrt a*Real.sqrt b := by positivity
  have ht : 2*Real.sqrt a*Real.sqrt b ≤ M^2-a-b := by
    nlinarith only [he, hc, hp, hn]
  have hsa := Real.sq_sqrt ha
  have hsb := Real.sq_sqrt hb
  have hna := Real.sqrt_nonneg a
  have hnb := Real.sqrt_nonneg b
  nlinarith

/-- The rational completed-column test bounds the exact root expression. -/
theorem completed_mass_bound_of_squared_certificate (m q k B : ℝ)
    (hk : 0 < k) (hm : m ≤ B) (hq : q ≤ (k*(B-m))^2) :
    m + Real.sqrt q/k ≤ B := by
  have hs : Real.sqrt q ≤ k*(B-m) :=
    (Real.sqrt_le_left (mul_nonneg hk.le (sub_nonneg.mpr hm))).mpr hq
  have hd : Real.sqrt q/k ≤ B-m := by
    apply (div_le_iff₀ hk).mpr
    nlinarith
  linarith

/-- A completed column is bounded from its actual native vector, source-square
bound and a bounded high inverse. The original form must realize these inputs. -/
theorem completed_column_norm_le {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (T : E →L[ℂ] E) (x source : E) (m q k B : ℝ)
    (hk : 0 < k) (hT : ‖T‖ ≤ 1/k) (hx : ‖x‖ ≤ m)
    (hsource : ‖source‖^2 ≤ q) (hm : m ≤ B)
    (hq : q ≤ (k*(B-m))^2) : ‖x-T source‖ ≤ B := by
  have hs : ‖source‖ ≤ Real.sqrt q := Real.le_sqrt_of_sq_le hsource
  have ht : ‖T source‖ ≤ Real.sqrt q/k := by
    calc
      ‖T source‖ ≤ ‖T‖*‖source‖ := T.le_opNorm source
      _ ≤ (1/k)*‖source‖ := mul_le_mul_of_nonneg_right hT (norm_nonneg _)
      _ ≤ (1/k)*Real.sqrt q := mul_le_mul_of_nonneg_left hs (by positivity)
      _ = Real.sqrt q/k := by ring
  calc
    ‖x-T source‖ ≤ ‖x‖+‖T source‖ := norm_sub_le _ _
    _ ≤ m+Real.sqrt q/k := add_le_add hx ht
    _ ≤ B := completed_mass_bound_of_squared_certificate m q k B hk hm hq

/-- Source-square certificates supply all four completed-column norm bounds.
The remaining actual-form inputs are the inverse bound, source realization,
completed-square energy lower bound, and authenticated numerical inequalities. -/
theorem source_completed_columns_physical_gap {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℂ E]
    (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (m q B L : Fin 4 → ℝ) (k gap : ℝ)
    (hk : 0 < k) (hT : ‖T‖ ≤ 1/k)
    (hx : ∀ i, ‖x i‖ ≤ m i) (hsource : ∀ i, ‖source i‖^2 ≤ q i)
    (hm : ∀ i, m i ≤ B i) (hq : ∀ i, q i ≤ (k*(B i-m i))^2)
    (hL : ∀ i, 0 < L i) (hgap : 0 ≤ gap)
    (hbound : gap * ((∑ i, (B i)^2/L i) + 1/k) ≤ 1)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ)
    (henergy : (∑ i, L i * ‖z i‖^2) + k*‖h‖^2 ≤ energy) :
    gap * ‖(∑ i, z i • (x i-T (source i))) + h‖^2 ≤ energy := by
  apply completed_columns_physical_gap (fun i => x i-T (source i)) B L k gap
    (fun i => completed_column_norm_le T (x i) (source i) (m i) (q i) k (B i)
      hk hT (hx i) (hsource i) (hm i) (hq i)) hL hk hgap hbound z h energy henergy

#print axioms sqrt_add_le_of_squared_certificate
#print axioms completed_mass_bound_of_squared_certificate
#print axioms completed_column_norm_le
#print axioms source_completed_columns_physical_gap
end WeilDefect.RPB108
