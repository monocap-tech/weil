import WeilDefect.RationalResponse
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

namespace WeilDefect

open Filter Set MeasureTheory
open scoped Topology BigOperators

/-- Continuous majorant used for the WD-T31 logarithmic shell tail. -/
noncomputable def logarithmicTailKernel (x : ℝ) : ℝ :=
  (1 + Real.log x) / x ^ 2

private theorem hasDerivAt_logarithmicTailKernel
    {x : ℝ} (hx : x ≠ 0) :
    HasDerivAt logarithmicTailKernel
      ((-1 - 2 * Real.log x) / x ^ 3) x := by
  unfold logarithmicTailKernel
  have hnum :
      HasDerivAt (fun y : ℝ => 1 + Real.log y) x⁻¹ x :=
    (Real.hasDerivAt_log hx).const_add 1
  have hden := (hasDerivAt_id x).pow 2
  convert hnum.div hden (by simp [hx]) using 1
  · funext y
    by_cases hy : y = 0
    · simp [hy]
    · simp only [Pi.div_apply, Pi.pow_apply, id_eq]
  · simp only [Pi.pow_apply, id_eq, Nat.cast_ofNat, Nat.reduceSub, pow_one, mul_one]
    field_simp [hx]
    ring

/-- The logarithmic tail kernel is nonnegative on [1,∞). -/
theorem logarithmicTailKernel_nonneg
    {x : ℝ} (hx : 1 ≤ x) :
    0 ≤ logarithmicTailKernel x := by
  unfold logarithmicTailKernel
  have hx0 : 0 < x := lt_of_lt_of_le zero_lt_one hx
  have hlog : 0 ≤ Real.log x := Real.log_nonneg hx
  positivity

/-- The logarithmic tail kernel is decreasing on [1,∞). -/
theorem logarithmicTailKernel_antitoneOn :
    AntitoneOn logarithmicTailKernel (Ici (1 : ℝ)) := by
  apply antitoneOn_of_deriv_nonpos (convex_Ici (1 : ℝ))
  · intro x hx
    have hx0 : x ≠ 0 := by
      have : 0 < x := lt_of_lt_of_le zero_lt_one hx
      exact this.ne'
    exact (hasDerivAt_logarithmicTailKernel hx0).continuousAt.continuousWithinAt
  · intro x hx
    have hx1 : 1 < x := by
      simpa only [interior_Ici, mem_Ioi] using hx
    have hx0 : x ≠ 0 := (lt_trans zero_lt_one hx1).ne'
    exact (hasDerivAt_logarithmicTailKernel hx0).differentiableAt.differentiableWithinAt
  · intro x hx
    have hx1 : 1 < x := by
      simpa only [interior_Ici, mem_Ioi] using hx
    have hx0 : x ≠ 0 := (lt_trans zero_lt_one hx1).ne'
    rw [(hasDerivAt_logarithmicTailKernel hx0).deriv]
    have hlog : 0 ≤ Real.log x := Real.log_nonneg hx1.le
    have hden : 0 ≤ x ^ 3 := by positivity
    exact div_nonpos_of_nonpos_of_nonneg (by linarith) hden

private theorem hasDerivAt_logarithmicTailAntideriv
    {x : ℝ} (hx : x ≠ 0) :
    HasDerivAt
      (fun y : ℝ => -(Real.log y + 2) / y)
      (logarithmicTailKernel x) x := by
  have hnum :
      HasDerivAt (fun y : ℝ => Real.log y + 2) x⁻¹ x :=
    (Real.hasDerivAt_log hx).add_const 2
  have hquot :=
    hnum.div (hasDerivAt_id x) hx
  convert hquot.neg using 1
  · funext y
    simp only [Pi.neg_apply, Pi.mul_apply, Pi.inv_apply, id_eq, div_eq_mul_inv]
    ring
  · unfold logarithmicTailKernel
    simp only [id_eq]
    field_simp [hx]
    ring

private theorem tendsto_logarithmicTailAntideriv :
    Tendsto (fun x : ℝ => -(Real.log x + 2) / x) atTop (𝓝 0) := by
  have hlog :
      Tendsto (fun x : ℝ => Real.log x / x) atTop (𝓝 0) := by
    simpa [Real.rpow_one] using
      (isLittleO_log_rpow_atTop (r := (1 : ℝ)) zero_lt_one).tendsto_div_nhds_zero
  have hconst :
      Tendsto (fun x : ℝ => (2 : ℝ) / x) atTop (𝓝 0) := by
    exact tendsto_const_nhds.div_atTop tendsto_id
  have hadd := hlog.add hconst
  simpa [add_div, add_comm, neg_div] using hadd.neg

/-- The kernel is integrable on every positive tail starting at c>=1. -/
theorem logarithmicTailKernel_integrableOn_Ioi
    {c : ℝ} (hc : 1 ≤ c) :
    IntegrableOn logarithmicTailKernel (Ioi c) := by
  apply integrableOn_Ioi_deriv_of_nonneg'
    (g := fun x : ℝ => -(Real.log x + 2) / x)
    (l := 0)
  · intro x hx
    have hx0 : x ≠ 0 := by
      have : 0 < x := lt_of_lt_of_le zero_lt_one (hc.trans hx)
      exact this.ne'
    exact hasDerivAt_logarithmicTailAntideriv hx0
  · intro x hx
    exact logarithmicTailKernel_nonneg (hc.trans hx.le)
  · exact tendsto_logarithmicTailAntideriv

/-- Exact improper integral of the logarithmic tail kernel. -/
theorem integral_logarithmicTailKernel_Ioi
    {c : ℝ} (hc : 1 ≤ c) :
    ∫ x in Ioi c, logarithmicTailKernel x =
      (Real.log c + 2) / c := by
  have h :=
    integral_Ioi_of_hasDerivAt_of_nonneg'
      (a := c)
      (g := fun x : ℝ => -(Real.log x + 2) / x)
      (g' := logarithmicTailKernel)
      (l := 0)
      (fun x hx => by
        have hx0 : x ≠ 0 := by
          have : 0 < x := lt_of_lt_of_le zero_lt_one (hc.trans hx)
          exact this.ne'
        exact hasDerivAt_logarithmicTailAntideriv hx0)
      (fun x hx => logarithmicTailKernel_nonneg (hc.trans hx.le))
      tendsto_logarithmicTailAntideriv
  convert h using 1 <;> ring

/--
Discrete logarithmic tail estimate.  This is the analytic summation step in
WD-T31: the unit-shell majorant has an explicit O((log R)/R) tail.
-/
theorem logarithmicTail_tsum_le
    (R : ℕ) (hR : 1 ≤ R) :
    (∑' k : ℕ, logarithmicTailKernel (k + R + 1 : ℕ))
      ≤ (Real.log R + 2) / R := by
  have hanti :
      AntitoneOn logarithmicTailKernel (Ici (R : ℝ)) :=
    logarithmicTailKernel_antitoneOn.mono (by
      intro x hx
      have hRreal : (1 : ℝ) ≤ (R : ℝ) := by exact_mod_cast hR
      have hxR : (R : ℝ) ≤ x := hx
      exact hRreal.trans hxR)
  have hint :
      IntegrableOn logarithmicTailKernel (Ioi (R : ℝ)) :=
    logarithmicTailKernel_integrableOn_Ioi (by exact_mod_cast hR)
  have hnonneg :
      ∀ x ∈ Ioi (R : ℝ), 0 ≤ logarithmicTailKernel x := by
    intro x hx
    exact logarithmicTailKernel_nonneg
      (le_trans (by exact_mod_cast hR) hx.le)
  have hbound :=
    hanti.tsum_comp_add_le_integral R hint hnonneg
  rw [integral_logarithmicTailKernel_Ioi (by exact_mod_cast hR)] at hbound
  simpa [Nat.cast_add, Nat.cast_one] using hbound


/-- Unit-height shell index for the WD-T31 complementary divisor model. -/
abbrev FarShellIndex (count : ℕ → ℕ) :=
  Σ n : ℕ, Fin (count n)

/--
Imported unit-height zero-count interface in its sharp logarithmic form.
The intended source input is N(X+1)-N(X)=O(log(2+X)), with multiplicity.
-/
structure ZetaLogShellCountData
    (count : ℕ → ℕ) (C : ℝ) : Prop where
  C_nonneg : 0 ≤ C
  count_le_log :
    ∀ n : ℕ,
      (count n : ℝ)
        ≤ C * (1 + Real.log ((n : ℝ) + 1))

/--
Abstract inverse-square complementary response on each zero coordinate.
WD-T27 supplies this species of bound from the selected zero-moment law.
-/
structure FarShellResponseData
    (count : ℕ → ℕ)
    (response : FarShellIndex count → ℂ)
    (A : ℝ) : Prop where
  A_nonneg : 0 ≤ A
  response_le_inverse_square :
    ∀ gamma,
      ‖response gamma‖
        ≤ A / (((gamma.1 : ℝ) + 1) ^ 2)

/-- Finite response sum in one unit-height shell. -/
noncomputable def farShellResponse
    {count : ℕ → ℕ}
    (response : FarShellIndex count → ℂ)
    (n : ℕ) : ℂ :=
  ∑ i : Fin (count n), response ⟨n, i⟩

/-- The logarithmic tail kernel sampled on natural shells is summable. -/
theorem logarithmicTailKernel_summable_nat :
    Summable (fun n : ℕ => logarithmicTailKernel (n : ℝ)) := by
  have hanti :
      AntitoneOn logarithmicTailKernel (Ici ((1 : ℕ) : ℝ)) := by
    simpa using logarithmicTailKernel_antitoneOn
  exact hanti.summable_of_integrableOn_Ioi
    (N := 1)
    (logarithmicTailKernel_integrableOn_Ioi (by norm_num))
    (fun x hx => by
      norm_num at hx
      exact logarithmicTailKernel_nonneg hx.le)

/-- Every natural shift of the logarithmic shell kernel remains summable. -/
theorem logarithmicTailKernel_shift_summable
    (m : ℕ) :
    Summable
      (fun k : ℕ =>
        logarithmicTailKernel ((k + m : ℕ) : ℝ)) := by
  have h :=
    (summable_nat_add_iff
      (f := fun n : ℕ => logarithmicTailKernel (n : ℝ)) m).2
      logarithmicTailKernel_summable_nat
  simpa [Nat.cast_add] using h

/--
Zero counting times inverse-square response is dominated shellwise by the
logarithmic kernel.
-/
theorem farShellResponse_norm_le_logarithmic_kernel
    {count : ℕ → ℕ}
    (response : FarShellIndex count → ℂ)
    (A C : ℝ)
    (hCount : ZetaLogShellCountData count C)
    (hResponse : FarShellResponseData count response A)
    (n : ℕ) :
    ‖farShellResponse response n‖
      ≤
    (A * C) * logarithmicTailKernel ((n : ℝ) + 1) := by
  let x : ℝ := (n : ℝ) + 1
  have hx : 0 < x := by
    dsimp [x]
    positivity
  calc
    ‖farShellResponse response n‖
        ≤ ∑ i : Fin (count n), ‖response ⟨n, i⟩‖ := by
          unfold farShellResponse
          exact norm_sum_le _ _
    _ ≤ ∑ _i : Fin (count n), A / (x ^ 2) := by
          apply Finset.sum_le_sum
          intro i hi
          simpa [x] using
            hResponse.response_le_inverse_square ⟨n, i⟩
    _ = (count n : ℝ) * (A / (x ^ 2)) := by
          simp
    _ ≤
      (C * (1 + Real.log x)) * (A / (x ^ 2)) := by
        apply mul_le_mul_of_nonneg_right
        · simpa [x] using hCount.count_le_log n
        · exact div_nonneg hResponse.A_nonneg (sq_nonneg x)
    _ = (A * C) * logarithmicTailKernel x := by
      unfold logarithmicTailKernel
      field_simp [hx.ne']

/--
WD-T31 shell aggregation: logarithmic zero counting combined with an
inverse-square complementary response gives the quantitative O((log R)/R)
far-tail bound.
-/
theorem wd_t31_shell_aggregation
    {count : ℕ → ℕ}
    (response : FarShellIndex count → ℂ)
    (A C : ℝ)
    (hCount : ZetaLogShellCountData count C)
    (hResponse : FarShellResponseData count response A)
    (R : ℕ) (hR : 1 ≤ R) :
    ‖∑' k : ℕ, farShellResponse response (k + R)‖
      ≤
    (A * C) * ((Real.log R + 2) / R) := by
  have hAC : 0 ≤ A * C :=
    mul_nonneg hResponse.A_nonneg hCount.C_nonneg
  have hkernel :
      Summable
        (fun k : ℕ =>
          logarithmicTailKernel ((k + R + 1 : ℕ) : ℝ)) := by
    have h :=
      logarithmicTailKernel_shift_summable (R + 1)
    simpa [Nat.add_assoc] using h
  have hmajor :
      Summable
        (fun k : ℕ =>
          (A * C) *
            logarithmicTailKernel ((k + R + 1 : ℕ) : ℝ)) :=
    hkernel.mul_left (A * C)
  have hpoint :
      ∀ k : ℕ,
        ‖farShellResponse response (k + R)‖
          ≤
        (A * C) *
          logarithmicTailKernel ((k + R + 1 : ℕ) : ℝ) := by
    intro k
    simpa [Nat.cast_add, Nat.cast_one] using
      farShellResponse_norm_le_logarithmic_kernel
        response A C hCount hResponse (k + R)
  calc
    ‖∑' k : ℕ, farShellResponse response (k + R)‖
        ≤
      ∑' k : ℕ,
        (A * C) *
          logarithmicTailKernel ((k + R + 1 : ℕ) : ℝ) :=
      tsum_of_norm_bounded hmajor.hasSum hpoint
    _ =
      (A * C) *
        (∑' k : ℕ,
          logarithmicTailKernel ((k + R + 1 : ℕ) : ℝ)) := by
      rw [tsum_mul_left]
    _ ≤
      (A * C) * ((Real.log R + 2) / R) := by
      apply mul_le_mul_of_nonneg_left _ hAC
      simpa [Nat.cast_add, Nat.cast_one] using
        logarithmicTail_tsum_le R hR


/-- Explicit WD-T27 inverse-square constant for one selected zero-moment packet. -/
noncomputable def zeroMomentResponseConstant
    {m : ℕ}
    (rho v : Fin m → ℂ) : ℝ :=
  ‖residueFirstMoment rho v‖
    + 2 * residueSecondMomentNorm rho v

theorem zeroMomentResponseConstant_nonneg
    {m : ℕ}
    (rho v : Fin m → ℂ) :
    0 ≤ zeroMomentResponseConstant rho v := by
  unfold zeroMomentResponseConstant residueSecondMomentNorm
  positivity

/--
Pointwise inverse-square form of WD-T27 on the explicit far region used by
WD-T31.
-/
theorem rationalResponse_zero_moment_norm_le_inverse_square
    {m : ℕ}
    (rho v : Fin m → ℂ)
    (z : ℂ)
    (hv0 : (∑ i : Fin m, v i) = 0)
    (hz1 : 1 ≤ ‖z‖)
    (hfar : ∀ i, 2 * ‖rho i‖ ≤ ‖z‖) :
    ‖rationalResponse rho v z‖
      ≤
    zeroMomentResponseConstant rho v / ‖z‖ ^ 2 := by
  have hzpos : 0 < ‖z‖ := zero_lt_one.trans_le hz1
  have hz0 : z ≠ 0 := norm_pos_iff.mp hzpos
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
    _ =
      zeroMomentResponseConstant rho v / ‖z‖ ^ 2 := by
      unfold zeroMomentResponseConstant
      ring

/-- Weighted complementary response term on one zero coordinate. -/
noncomputable def zeroMomentShellTerm
    {m : ℕ}
    {count : ℕ → ℕ}
    (rho v : Fin m → ℂ)
    (mu : FarShellIndex count → ℂ)
    (psi : ℂ → ℂ)
    (gamma : FarShellIndex count) : ℂ :=
  psi (mu gamma) * rationalResponse rho v (mu gamma)

/--
WD-T27 supplies the inverse-square response-data interface once shell height
controls the zero norm and the multiplier is uniformly bounded.
-/
theorem farShellResponseData_of_zero_moment
    {m : ℕ}
    (rho v : Fin m → ℂ)
    (hv0 : (∑ i : Fin m, v i) = 0)
    {count : ℕ → ℕ}
    (mu : FarShellIndex count → ℂ)
    (psi : ℂ → ℂ)
    (M : ℝ)
    (hM : 0 ≤ M)
    (hPsi : ∀ gamma, ‖psi (mu gamma)‖ ≤ M)
    (hShellNorm :
      ∀ gamma,
        ((gamma.1 : ℝ) + 1) ≤ ‖mu gamma‖)
    (hSelectedFar :
      ∀ gamma i,
        2 * ‖rho i‖ ≤ ‖mu gamma‖) :
    FarShellResponseData count
      (zeroMomentShellTerm rho v mu psi)
      (M * zeroMomentResponseConstant rho v) := by
  constructor
  · exact mul_nonneg hM
      (zeroMomentResponseConstant_nonneg rho v)
  · intro gamma
    let x : ℝ := (gamma.1 : ℝ) + 1
    have hx : 0 < x := by
      dsimp [x]
      positivity
    have hx1 : 1 ≤ x := by
      dsimp [x]
      have hn : 0 ≤ (gamma.1 : ℝ) := Nat.cast_nonneg _
      linarith
    have hmu1 : 1 ≤ ‖mu gamma‖ :=
      hx1.trans (hShellNorm gamma)
    have hresp :=
      rationalResponse_zero_moment_norm_le_inverse_square
        rho v (mu gamma) hv0 hmu1
        (hSelectedFar gamma)
    have hC :
        0 ≤ zeroMomentResponseConstant rho v :=
      zeroMomentResponseConstant_nonneg rho v
    have hden :
        zeroMomentResponseConstant rho v / ‖mu gamma‖ ^ 2
          ≤
        zeroMomentResponseConstant rho v / x ^ 2 := by
      have hmu0 : 0 < ‖mu gamma‖ := zero_lt_one.trans_le hmu1
      have hsquare : x ^ 2 ≤ ‖mu gamma‖ ^ 2 := by
        gcongr
        exact hShellNorm gamma
      exact (div_le_div_iff₀ (sq_pos_of_pos hmu0) (sq_pos_of_pos hx)).2
        (mul_le_mul_of_nonneg_left hsquare hC)
    calc
      ‖zeroMomentShellTerm rho v mu psi gamma‖
          =
        ‖psi (mu gamma)‖ *
          ‖rationalResponse rho v (mu gamma)‖ := by
        simp [zeroMomentShellTerm, norm_mul]
      _ ≤
        M *
          (zeroMomentResponseConstant rho v / ‖mu gamma‖ ^ 2) := by
        exact mul_le_mul
          (hPsi gamma) hresp
          (norm_nonneg _) hM
      _ ≤
        M *
          (zeroMomentResponseConstant rho v / x ^ 2) := by
        exact mul_le_mul_of_nonneg_left hden hM
      _ =
        (M * zeroMomentResponseConstant rho v) / x ^ 2 := by
        ring
      _ =
        (M * zeroMomentResponseConstant rho v) /
          (((gamma.1 : ℝ) + 1) ^ 2) := by
        rfl

/--
WD-T31 / ZW2-T2 in its zero-moment form.

The only imported analytic-number-theory input is the logarithmic unit-shell
zero count encoded by ZetaLogShellCountData.  The inverse-square response is
derived internally from WD-T27.
-/
theorem wd_t31_zero_moment_zero_count_far_tail
    {m : ℕ}
    (rho v : Fin m → ℂ)
    (hv0 : (∑ i : Fin m, v i) = 0)
    {count : ℕ → ℕ}
    (mu : FarShellIndex count → ℂ)
    (psi : ℂ → ℂ)
    (M C : ℝ)
    (hCount : ZetaLogShellCountData count C)
    (hM : 0 ≤ M)
    (hPsi : ∀ gamma, ‖psi (mu gamma)‖ ≤ M)
    (hShellNorm :
      ∀ gamma,
        ((gamma.1 : ℝ) + 1) ≤ ‖mu gamma‖)
    (hSelectedFar :
      ∀ gamma i,
        2 * ‖rho i‖ ≤ ‖mu gamma‖)
    (R : ℕ) (hR : 1 ≤ R) :
    ‖∑' k : ℕ,
        farShellResponse
          (zeroMomentShellTerm rho v mu psi)
          (k + R)‖
      ≤
    ((M * zeroMomentResponseConstant rho v) * C)
      * ((Real.log R + 2) / R) := by
  exact wd_t31_shell_aggregation
    (zeroMomentShellTerm rho v mu psi)
    (M * zeroMomentResponseConstant rho v)
    C
    hCount
    (farShellResponseData_of_zero_moment
      rho v hv0 mu psi M hM hPsi hShellNorm hSelectedFar)
    R hR

end WeilDefect
