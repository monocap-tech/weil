import WeilDefect.PairGeometry

namespace WeilDefect

open Filter Set Bornology
open scoped Topology

/-- Finite rational response attached to residues v at locations rho. -/
noncomputable def rationalResponse {n : ℕ}
    (rho v : Fin n → ℂ) (z : ℂ) : ℂ :=
  ∑ i : Fin n, v i / (z - rho i)

/-- First residue moment. -/
noncomputable def residueFirstMoment {n : ℕ}
    (rho v : Fin n → ℂ) : ℂ :=
  ∑ i : Fin n, rho i * v i

/-- Finite norm-weight controlling the cubic Laurent remainder. -/
noncomputable def residueSecondMomentNorm {n : ℕ}
    (rho v : Fin n → ℂ) : ℝ :=
  ∑ i : Fin n, ‖v i‖ * ‖rho i‖ ^ 2

/--
Exact one-pole Laurent identity through order two.
-/
theorem inv_sub_laurent_two
    (z rho : ℂ)
    (hz : z ≠ 0)
    (hzrho : z ≠ rho) :
    1 / (z - rho)
      =
    1 / z + rho / z ^ 2
      + rho ^ 2 / (z ^ 2 * (z - rho)) := by
  field_simp [hz, sub_ne_zero.mpr hzrho]
  ring

/--
Weighted one-pole Laurent identity through order two.
-/
theorem weighted_inv_sub_laurent_two
    (v z rho : ℂ)
    (hz : z ≠ 0)
    (hzrho : z ≠ rho) :
    v / (z - rho)
      =
    v / z + (rho * v) / z ^ 2
      + v * rho ^ 2 / (z ^ 2 * (z - rho)) := by
  calc
    v / (z - rho) = v * (1 / (z - rho)) := by ring
    _ = v * (1 / z + rho / z ^ 2
        + rho ^ 2 / (z ^ 2 * (z - rho))) := by
      rw [inv_sub_laurent_two z rho hz hzrho]
    _ = v / z + (rho * v) / z ^ 2
        + v * rho ^ 2 / (z ^ 2 * (z - rho)) := by
      ring

/--
Exact finite Laurent decomposition of the rational response.
-/
theorem rationalResponse_laurent_two
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (z : ℂ)
    (hz : z ≠ 0)
    (hzrho : ∀ i, z ≠ rho i) :
    rationalResponse rho v z
      =
      (∑ i : Fin n, v i) / z
        + residueFirstMoment rho v / z ^ 2
        + ∑ i : Fin n,
            v i * rho i ^ 2 / (z ^ 2 * (z - rho i)) := by
  unfold rationalResponse residueFirstMoment
  calc
    (∑ i : Fin n, v i / (z - rho i))
        =
      ∑ i : Fin n,
        (v i / z + (rho i * v i) / z ^ 2
          + v i * rho i ^ 2 / (z ^ 2 * (z - rho i))) := by
      apply Finset.sum_congr rfl
      intro i hi
      exact weighted_inv_sub_laurent_two (v i) z (rho i) hz (hzrho i)
    _ =
      (∑ i : Fin n, v i) / z
        + (∑ i : Fin n, rho i * v i) / z ^ 2
        + ∑ i : Fin n,
            v i * rho i ^ 2 / (z ^ 2 * (z - rho i)) := by
      rw [Finset.sum_add_distrib, Finset.sum_add_distrib,
        Finset.sum_div, Finset.sum_div]

/--
Zero residue moment removes the inverse-linear Laurent term exactly.
-/
theorem rationalResponse_zero_moment_expansion
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (z : ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0)
    (hz : z ≠ 0)
    (hzrho : ∀ i, z ≠ rho i) :
    rationalResponse rho v z
      =
      residueFirstMoment rho v / z ^ 2
        + ∑ i : Fin n,
            v i * rho i ^ 2 / (z ^ 2 * (z - rho i)) := by
  rw [rationalResponse_laurent_two rho v z hz hzrho, hv0, zero_div, zero_add]

/--
Far from every pole, each cubic remainder term has the uniform pointwise
bound needed for WD-T27.
-/
theorem rationalResponse_remainder_term_bound
    (v rho z : ℂ)
    (hz : z ≠ 0)
    (hfar : 2 * ‖rho‖ ≤ ‖z‖) :
    ‖v * rho ^ 2 / (z ^ 2 * (z - rho))‖
      ≤
    2 * (‖v‖ * ‖rho‖ ^ 2) / ‖z‖ ^ 3 := by
  have hzpos : 0 < ‖z‖ := norm_pos_iff.mpr hz
  have hrle : ‖rho‖ ≤ ‖z‖ / 2 := by linarith
  have hsub :
      ‖z‖ / 2 ≤ ‖z - rho‖ := by
    have htri : ‖z‖ - ‖rho‖ ≤ ‖z - rho‖ := norm_sub_norm_le z rho
    linarith
  have hsubpos : 0 < ‖z - rho‖ := lt_of_lt_of_le (half_pos hzpos) hsub
  rw [norm_div, norm_mul, norm_pow, norm_mul, norm_pow]
  have hden :
      ‖z‖ ^ 2 * (‖z‖ / 2)
        ≤ ‖z‖ ^ 2 * ‖z - rho‖ := by
    gcongr
  calc
    ‖v‖ * ‖rho‖ ^ 2 / (‖z‖ ^ 2 * ‖z - rho‖)
        ≤
      ‖v‖ * ‖rho‖ ^ 2 / (‖z‖ ^ 2 * (‖z‖ / 2)) := by
        gcongr
    _ = 2 * (‖v‖ * ‖rho‖ ^ 2) / ‖z‖ ^ 3 := by
      field_simp [hzpos.ne']

/--
Quantitative cubic remainder estimate for a finite zero-moment response.
-/
theorem rationalResponse_zero_moment_remainder_bound
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (z : ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0)
    (hz : z ≠ 0)
    (hfar : ∀ i, 2 * ‖rho i‖ ≤ ‖z‖) :
    ‖rationalResponse rho v z - residueFirstMoment rho v / z ^ 2‖
      ≤
    2 * residueSecondMomentNorm rho v / ‖z‖ ^ 3 := by
  have hzrho : ∀ i, z ≠ rho i := by
    intro i hzr
    subst z
    have hzpos : 0 < ‖rho i‖ := norm_pos_iff.mpr hz
    have hself := hfar i
    linarith
  rw [rationalResponse_zero_moment_expansion rho v z hv0 hz hzrho]
  simp only [add_sub_cancel_left]
  calc
    ‖∑ i : Fin n,
        v i * rho i ^ 2 / (z ^ 2 * (z - rho i))‖
        ≤
      ∑ i : Fin n,
        ‖v i * rho i ^ 2 / (z ^ 2 * (z - rho i))‖ := by
          exact norm_sum_le _ _
    _ ≤
      ∑ i : Fin n,
        (2 * (‖v i‖ * ‖rho i‖ ^ 2) / ‖z‖ ^ 3) := by
          apply Finset.sum_le_sum
          intro i hi
          exact rationalResponse_remainder_term_bound
            (v i) (rho i) z hz (hfar i)
    _ = 2 * residueSecondMomentNorm rho v / ‖z‖ ^ 3 := by
      unfold residueSecondMomentNorm
      rw [← Finset.sum_div]
      congr 1
      rw [Finset.mul_sum]

/-- A coarse finite radius dominating every pole norm. -/
noncomputable def residueRadius {n : ℕ} (rho : Fin n → ℂ) : ℝ :=
  ∑ i : Fin n, ‖rho i‖

theorem norm_le_residueRadius
    {n : ℕ} (rho : Fin n → ℂ) (i : Fin n) :
    ‖rho i‖ ≤ residueRadius rho := by
  unfold residueRadius
  exact Finset.single_le_sum (fun j _ => norm_nonneg (rho j)) (Finset.mem_univ i)

/--
The cubic remainder is literally big-O of z⁻³ at complex infinity.
-/
theorem rationalResponse_zero_moment_remainder_isBigO
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0) :
    (fun z : ℂ =>
      rationalResponse rho v z - residueFirstMoment rho v / z ^ 2)
      =O[cobounded ℂ]
    (fun z : ℂ => z⁻¹ ^ 3) := by
  let C : ℝ := 2 * residueSecondMomentNorm rho v
  refine Asymptotics.IsBigO.of_bound C ?_
  filter_upwards [
    eventually_cobounded_le_norm (max 1 (2 * residueRadius rho))
  ] with z hzlarge
  have hz1 : 1 ≤ ‖z‖ :=
    (le_max_left 1 (2 * residueRadius rho)).trans hzlarge
  have hzpos : 0 < ‖z‖ := zero_lt_one.trans_le hz1
  have hz0 : z ≠ 0 := norm_pos_iff.mp hzpos
  have hfar : ∀ i, 2 * ‖rho i‖ ≤ ‖z‖ := by
    intro i
    calc
      2 * ‖rho i‖ ≤ 2 * residueRadius rho := by
        gcongr
        exact norm_le_residueRadius rho i
      _ ≤ max 1 (2 * residueRadius rho) := le_max_right _ _
      _ ≤ ‖z‖ := hzlarge
  have hb :=
    rationalResponse_zero_moment_remainder_bound
      rho v z hv0 hz0 hfar
  calc
    ‖rationalResponse rho v z - residueFirstMoment rho v / z ^ 2‖
        ≤ C / ‖z‖ ^ 3 := by
          simpa [C] using hb
    _ = C * ‖z⁻¹ ^ 3‖ := by
      rw [norm_pow, norm_inv]
      field_simp [hzpos.ne']

/--
The full zero-moment rational response is literally big-O of z⁻² at complex
infinity.
-/
theorem rationalResponse_zero_moment_isBigO
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0) :
    (fun z : ℂ => rationalResponse rho v z)
      =O[cobounded ℂ]
    (fun z : ℂ => z⁻¹ ^ 2) := by
  let C : ℝ :=
    ‖residueFirstMoment rho v‖ + 2 * residueSecondMomentNorm rho v
  refine Asymptotics.IsBigO.of_bound C ?_
  filter_upwards [
    eventually_cobounded_le_norm (max 1 (2 * residueRadius rho))
  ] with z hzlarge
  have hz1 : 1 ≤ ‖z‖ :=
    (le_max_left 1 (2 * residueRadius rho)).trans hzlarge
  have hzpos : 0 < ‖z‖ := zero_lt_one.trans_le hz1
  have hz0 : z ≠ 0 := norm_pos_iff.mp hzpos
  have hfar : ∀ i, 2 * ‖rho i‖ ≤ ‖z‖ := by
    intro i
    calc
      2 * ‖rho i‖ ≤ 2 * residueRadius rho := by
        gcongr
        exact norm_le_residueRadius rho i
      _ ≤ max 1 (2 * residueRadius rho) := le_max_right _ _
      _ ≤ ‖z‖ := hzlarge
  have hrem :=
    rationalResponse_zero_moment_remainder_bound
      rho v z hv0 hz0 hfar
  let lead : ℂ := residueFirstMoment rho v / z ^ 2
  have htri :
      ‖rationalResponse rho v z‖
        ≤
      ‖rationalResponse rho v z - lead‖ + ‖lead‖ := by
    calc
      ‖rationalResponse rho v z‖ =
          ‖(rationalResponse rho v z - lead) + lead‖ := by
            congr 1
            ring
      _ ≤ ‖rationalResponse rho v z - lead‖ + ‖lead‖ :=
        norm_add_le _ _
  have hcubic :
      2 * residueSecondMomentNorm rho v / ‖z‖ ^ 3
        ≤
      2 * residueSecondMomentNorm rho v / ‖z‖ ^ 2 := by
    have hCnonneg : 0 ≤ 2 * residueSecondMomentNorm rho v := by
      unfold residueSecondMomentNorm
      positivity
    have hzpow : ‖z‖ ^ 2 ≤ ‖z‖ ^ 3 := by
      nlinarith [sq_nonneg ‖z‖]
    gcongr
  calc
    ‖rationalResponse rho v z‖
        ≤ ‖rationalResponse rho v z - lead‖ + ‖lead‖ := htri
    _ ≤
      2 * residueSecondMomentNorm rho v / ‖z‖ ^ 3
        + ‖residueFirstMoment rho v‖ / ‖z‖ ^ 2 := by
      gcongr
      simpa [lead] using hrem
    _ ≤
      2 * residueSecondMomentNorm rho v / ‖z‖ ^ 2
        + ‖residueFirstMoment rho v‖ / ‖z‖ ^ 2 := by
      gcongr
    _ = C * ‖z⁻¹ ^ 2‖ := by
      rw [norm_pow, norm_inv]
      field_simp [hzpos.ne']
      dsimp [C]
      ring

/--
WD-T27 / ZW1-T8, quantitative form.

For a finite zero-moment residue vector, the response equals its first-moment
inverse-square term plus a uniformly cubic remainder once z lies at least twice
as far from the origin as every pole.
-/
theorem wd_t27_universal_inverse_square_far_decay
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (z : ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0)
    (hz : z ≠ 0)
    (hfar : ∀ i, 2 * ‖rho i‖ ≤ ‖z‖) :
    ‖rationalResponse rho v z - residueFirstMoment rho v / z ^ 2‖
      ≤
    2 * residueSecondMomentNorm rho v / ‖z‖ ^ 3 :=
  rationalResponse_zero_moment_remainder_bound rho v z hv0 hz hfar

/--
WD-T27, Landau form: zero moment forces universal inverse-square far decay.
-/
theorem wd_t27_universal_inverse_square_isBigO
    {n : ℕ}
    (rho v : Fin n → ℂ)
    (hv0 : (∑ i : Fin n, v i) = 0) :
    (fun z : ℂ => rationalResponse rho v z)
      =O[cobounded ℂ]
    (fun z : ℂ => z⁻¹ ^ 2) :=
  rationalResponse_zero_moment_isBigO rho v hv0

end WeilDefect
