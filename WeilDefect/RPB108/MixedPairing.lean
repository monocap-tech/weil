import WeilDefect.RPB108.PaidYoung

namespace WeilDefect.RPB108

/-- A source Cauchy bound transports through a complete Gram domination. -/
theorem source_cross_square_of_gram_domination (q : ℂ) (c rho G V : ℝ)
    (hc : 0 ≤ c) (hG : G ≤ rho*V) (hq : ‖q‖^2 ≤ c*G) :
    ‖q‖^2 ≤ (c*rho)*V := by
  calc
    ‖q‖^2 ≤ c*G := hq
    _ ≤ c*(rho*V) := mul_le_mul_of_nonneg_left hG hc
    _ = (c*rho)*V := by ring

/-- Independent native and source pairing squares bound the entire mixed row.
V is the actual retained-form energy, not its coordinate lower bound. -/
theorem mixed_pairing_norm_le (p q : ℂ) (a b V M : ℝ)
    (ha : 0 ≤ a) (hb : 0 ≤ b) (hV : 0 ≤ V)
    (hp : ‖p‖^2 ≤ a*V) (hq : ‖q‖^2 ≤ b*V)
    (hM : Real.sqrt a+Real.sqrt b ≤ M) :
    ‖p-q‖ ≤ M*Real.sqrt V := by
  have bound (r : ℂ) (c : ℝ) (hc : 0 ≤ c) (hr : ‖r‖^2 ≤ c*V) :
      ‖r‖ ≤ Real.sqrt c*Real.sqrt V := by
    have he : (Real.sqrt c*Real.sqrt V)^2 = c*V := by
      rw [mul_pow, Real.sq_sqrt hc, Real.sq_sqrt hV]
    have hn : 0 ≤ Real.sqrt c*Real.sqrt V := by positivity
    nlinarith only [he, hn, hr, norm_nonneg r]
  calc
    ‖p-q‖ ≤ ‖p‖+‖q‖ := norm_sub_le _ _
    _ ≤ Real.sqrt a*Real.sqrt V+Real.sqrt b*Real.sqrt V :=
      add_le_add (bound p a ha hp) (bound q b hb hq)
    _ = (Real.sqrt a+Real.sqrt b)*Real.sqrt V := by ring
    _ ≤ M*Real.sqrt V := mul_le_mul_of_nonneg_right hM (Real.sqrt_nonneg _)

/-- Pay the mixed row against actual energy before using a lower bound on V. -/
theorem paid_actual_energy_lower (A M theta x V v : ℝ) (p q : ℂ)
    (ht0 : 0 ≤ theta) (ht1 : theta < 1) (hx : 0 ≤ x)
    (hV : 0 ≤ V) (hv : v ≤ V) (hpq : ‖p-q‖ ≤ M*Real.sqrt V) :
    (A-M^2/(1-theta))*x^2+theta*v ≤ A*x^2-2*x*‖p-q‖+V := by
  have hy := paid_young_lower A M theta x (Real.sqrt V) ht1
  rw [abs_of_nonneg (mul_nonneg hx (Real.sqrt_nonneg _)), Real.sq_sqrt hV] at hy
  have hcross := mul_le_mul_of_nonneg_left hpq (show 0 ≤ 2*x by positivity)
  have hlower := mul_le_mul_of_nonneg_left hv ht0
  nlinarith only [hy, hcross, hlower]

#print axioms source_cross_square_of_gram_domination
#print axioms mixed_pairing_norm_le
#print axioms paid_actual_energy_lower
end WeilDefect.RPB108
