import Mathlib
import WeilDefect.DirichletResolvent

namespace WeilDefect

attribute [local instance 1100] NormedSpace.complexToReal

open Filter Set MeasureTheory
open scoped Topology BigOperators Interval ComplexConjugate

/--
The explicit Dirichlet Green column is globally C².
-/
theorem contDiff_dirichletProblemOneColumn
    (t : ℝ) (gamma : ℂ) :
    ContDiff ℝ 2 (dirichletProblemOneColumn t gamma) := by
  rw [contDiff_iff_contDiffAt]
  intro x
  let q := problemOneGreenQ gamma
  let f0 : ℝ → ℂ :=
    fun y => q * realExpMode (problemOneFreq gamma) y
  let fR : ℝ → ℂ :=
    fun y =>
      (-q * realExpMode (problemOneFreq gamma) t) *
        dirichletRightBasis t y
  let fL : ℝ → ℂ :=
    fun y =>
      (-q * realExpMode (problemOneFreq gamma) (-t)) *
        dirichletLeftBasis t y
  have hf0 : ContDiffAt ℝ 2 f0 x := by
    simpa [f0] using
      contDiffAt_const_mul_realExpMode 2 q (problemOneFreq gamma) x
  have hfR : ContDiffAt ℝ 2 fR x := by
    exact
      (contDiff_const.contDiffAt.mul
        (contDiffAt_dirichletRightBasis 2 t x))
  have hfL : ContDiffAt ℝ 2 fL x := by
    exact
      (contDiff_const.contDiffAt.mul
        (contDiffAt_dirichletLeftBasis 2 t x))
  have hcol :
      dirichletProblemOneColumn t gamma = f0 + fR + fL := by
    funext y
    rfl
  rw [hcol]
  exact (hf0.add hfR).add hfL

/--
The positive real Dirichlet energy associated with the explicit Green column.
-/
noncomputable def problemOneDirichletEnergy
    (t : ℝ) (gamma : ℂ) : ℝ :=
  ∫ x in -t..t,
    ‖iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x‖ ^ 2
      + (1 / 4 : ℝ) * ‖dirichletProblemOneColumn t gamma x‖ ^ 2

/--
Complex-valued form of the same Dirichlet energy, useful for integration by
parts against the Green pairing.
-/
noncomputable def problemOneDirichletEnergyComplex
    (t : ℝ) (gamma : ℂ) : ℂ :=
  ∫ x in -t..t,
    star (iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x) *
        iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x
      + (1 / 4 : ℂ) *
        star (dirichletProblemOneColumn t gamma x) *
        dirichletProblemOneColumn t gamma x

/--
Integration by parts for the explicit Dirichlet column:
the second-derivative term is exactly the first-derivative energy.
-/
theorem dirichlet_second_derivative_pairing
    (t : ℝ) (gamma : ℂ)
    (ht : 0 < t) :
    (∫ x in -t..t,
      star (iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x) *
        iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x)
      =
    -(∫ x in -t..t,
      star (iteratedDeriv 2 (dirichletProblemOneColumn t gamma) x) *
        dirichletProblemOneColumn t gamma x) := by
  let F : ℝ → ℂ := dirichletProblemOneColumn t gamma
  let dF : ℝ → ℂ := iteratedDeriv 1 F
  let ddF : ℝ → ℂ := iteratedDeriv 2 F
  have hF : ContDiff ℝ 2 F := by
    simpa [F] using contDiff_dirichletProblemOneColumn t gamma
  have hFcont : Continuous F := hF.continuous
  have hdFcont : Continuous dF := by
    dsimp [dF]
    exact hF.continuous_iteratedDeriv 1 (by norm_num)
  have hddFcont : Continuous ddF := by
    dsimp [ddF]
    exact hF.continuous_iteratedDeriv 2 (by norm_num)
  have hFdiff : Differentiable ℝ F := by
    have h0 :=
      hF.differentiable_iteratedDeriv 0 (by norm_num)
    simpa using h0
  have hdFdiff : Differentiable ℝ dF := by
    dsimp [dF]
    exact hF.differentiable_iteratedDeriv 1 (by norm_num)
  have hFder :
      ∀ x, HasDerivAt F (dF x) x := by
    intro x
    have hx := (hFdiff x).hasDerivAt
    simpa [dF, iteratedDeriv_one] using hx
  have hsucc : ddF = deriv dF := by
    dsimp [ddF, dF]
    simpa using
      (iteratedDeriv_succ
        (n := 1)
        (f := F))
  have hdFder :
      ∀ x, HasDerivAt dF (ddF x) x := by
    intro x
    have hx := (hdFdiff x).hasDerivAt
    rw [hsucc]
    exact hx
  have hucont :
      Continuous (fun x => star (dF x)) :=
    hdFcont.star
  have hudcont :
      Continuous (fun x => star (ddF x)) :=
    hddFcont.star
  have hip :=
    intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt
      (a := -t) (b := t)
      (u := fun x => star (dF x))
      (v := F)
      (u' := fun x => star (ddF x))
      (v' := dF)
      hucont.continuousOn
      hFcont.continuousOn
      (fun x _ => (hdFder x).star)
      (fun x _ => hFder x)
      (hudcont.intervalIntegrable (-t) t)
      (hdFcont.intervalIntegrable (-t) t)
  have hFt : F t = 0 := by
    simpa [F] using
      dirichletProblemOneColumn_pos t gamma ht.ne'
  have hFnt : F (-t) = 0 := by
    simpa [F] using
      dirichletProblemOneColumn_neg t gamma ht.ne'
  have hip' :
      (∫ x in -t..t, star (dF x) * dF x)
        =
      -(∫ x in -t..t, star (ddF x) * F x) := by
    simpa [hFt, hFnt] using hip
  simpa [F, dF, ddF] using hip'

/--
The complex Dirichlet energy is the real Dirichlet energy embedded in C.
-/
theorem problemOneDirichletEnergyComplex_eq_ofReal
    (t : ℝ) (gamma : ℂ) :
    problemOneDirichletEnergyComplex t gamma
      =
    (problemOneDirichletEnergy t gamma : ℂ) := by
  unfold problemOneDirichletEnergyComplex problemOneDirichletEnergy
  rw [← intervalIntegral.integral_ofReal]
  apply intervalIntegral.integral_congr
  intro x hx
  have hstar (z : ℂ) :
      star z * z = ((‖z‖ ^ 2 : ℝ) : ℂ) := by
    simpa [RCLike.star_def] using Complex.conj_mul' z
  change
    star (iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x) *
          iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x
        + (1 / 4 : ℂ) *
          star (dirichletProblemOneColumn t gamma x) *
          dirichletProblemOneColumn t gamma x
      =
    ((‖iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x‖ ^ 2
        + (1 / 4 : ℝ) *
          ‖dirichletProblemOneColumn t gamma x‖ ^ 2 : ℝ) : ℂ)
  rw [hstar (iteratedDeriv 1 (dirichletProblemOneColumn t gamma) x)]
  rw [mul_assoc, hstar (dirichletProblemOneColumn t gamma x)]
  push_cast
  rfl

/--
The real Dirichlet energy is nonnegative.
-/
theorem problemOneDirichletEnergy_nonneg
    (t : ℝ) (gamma : ℂ)
    (ht : 0 ≤ t) :
    0 ≤ problemOneDirichletEnergy t gamma := by
  unfold problemOneDirichletEnergy
  apply intervalIntegral.integral_nonneg
  · linarith
  · intro x hx
    positivity

/--
Green pairing equals the positive Dirichlet energy once the Green denominator
is nonzero.
-/
theorem problemOneGreenPairing_eq_dirichletEnergyComplex
    (t : ℝ) (gamma : ℂ)
    (ht : 0 < t)
    (hden : problemOneGreenDenom gamma ≠ 0) :
    problemOneGreenPairing t gamma
      =
    problemOneDirichletEnergyComplex t gamma := by
  let F : ℝ → ℂ := dirichletProblemOneColumn t gamma
  let dF : ℝ → ℂ := iteratedDeriv 1 F
  let ddF : ℝ → ℂ := iteratedDeriv 2 F
  have hF : ContDiff ℝ 2 F := by
    simpa [F] using contDiff_dirichletProblemOneColumn t gamma
  have hFcont : Continuous F := hF.continuous
  have hdFcont : Continuous dF := by
    dsimp [dF]
    exact hF.continuous_iteratedDeriv 1 (by norm_num)
  have hddFcont : Continuous ddF := by
    dsimp [ddF]
    exact hF.continuous_iteratedDeriv 2 (by norm_num)
  have hsrc :
      ∀ x,
        realExpMode (problemOneFreq gamma) x
          =
        -ddF x + (1 / 4 : ℂ) * F x := by
    intro x
    have h :=
      (problemOneL_dirichletProblemOneColumn
        t x gamma hden).symm
    simpa [F, ddF, problemOneL] using h
  have hintegrand :
      ∀ x,
        star (realExpMode (problemOneFreq gamma) x) * F x
          =
        -(star (ddF x) * F x)
          + (1 / 4 : ℂ) * star (F x) * F x := by
    intro x
    rw [hsrc x]
    simp
    ring
  have hddprod :
      Continuous (fun x => star (ddF x) * F x) :=
    hddFcont.star.mul hFcont
  have hgradprod :
      Continuous (fun x => star (dF x) * dF x) :=
    hdFcont.star.mul hdFcont
  have hmassprod :
      Continuous
        (fun x =>
          (1 / 4 : ℂ) * star (F x) * F x) :=
    (continuous_const.mul hFcont.star).mul hFcont
  have hibp :=
    dirichlet_second_derivative_pairing t gamma ht
  unfold problemOneGreenPairing
  unfold problemOneDirichletEnergyComplex
  calc
    (∫ x in -t..t,
      star (realExpMode (problemOneFreq gamma) x) * F x)
        =
      ∫ x in -t..t,
        (-(star (ddF x) * F x)
          + (1 / 4 : ℂ) * star (F x) * F x) := by
            apply intervalIntegral.integral_congr
            intro x hx
            exact hintegrand x
    _ =
      -(∫ x in -t..t, star (ddF x) * F x)
        +
      ∫ x in -t..t,
        (1 / 4 : ℂ) * star (F x) * F x := by
          have hnegInt :
              IntervalIntegrable
                (fun x => -(star (ddF x) * F x))
                volume (-t) t :=
            hddprod.neg.intervalIntegrable (-t) t
          have hmassInt :
              IntervalIntegrable
                (fun x => (1 / 4 : ℂ) * star (F x) * F x)
                volume (-t) t :=
            hmassprod.intervalIntegrable (-t) t
          rw [intervalIntegral.integral_add hnegInt hmassInt]
          rw [intervalIntegral.integral_neg]
    _ =
      (∫ x in -t..t, star (dF x) * dF x)
        +
      ∫ x in -t..t,
        (1 / 4 : ℂ) * star (F x) * F x := by
          have hibp' :
              (∫ x in -t..t, star (dF x) * dF x)
                =
              -(∫ x in -t..t, star (ddF x) * F x) := by
            simpa [F, dF, ddF] using hibp
          rw [← hibp']
    _ =
      ∫ x in -t..t,
        (star (dF x) * dF x
          + (1 / 4 : ℂ) * star (F x) * F x) := by
          have hgradInt :
              IntervalIntegrable
                (fun x => star (dF x) * dF x)
                volume (-t) t :=
            hgradprod.intervalIntegrable (-t) t
          have hmassInt :
              IntervalIntegrable
                (fun x => (1 / 4 : ℂ) * star (F x) * F x)
                volume (-t) t :=
            hmassprod.intervalIntegrable (-t) t
          rw [intervalIntegral.integral_add hgradInt hmassInt]

/--
The native Green pairing is literally the real nonnegative H^{-1}_L energy.
-/
theorem problemOneGreenPairing_eq_dirichletEnergy
    (t : ℝ) (gamma : ℂ)
    (ht : 0 < t)
    (hden : problemOneGreenDenom gamma ≠ 0) :
    problemOneGreenPairing t gamma
      =
    (problemOneDirichletEnergy t gamma : ℂ) := by
  rw [
    problemOneGreenPairing_eq_dirichletEnergyComplex
      t gamma ht hden,
    problemOneDirichletEnergyComplex_eq_ofReal
  ]

/--
The previously norm-defined column energy equals the positive real Dirichlet
energy.
-/
theorem problemOneColumnEnergySq_eq_dirichletEnergy
    (t : ℝ) (gamma : ℂ)
    (ht : 0 < t)
    (hden : problemOneGreenDenom gamma ≠ 0) :
    problemOneColumnEnergySq t gamma
      =
    problemOneDirichletEnergy t gamma := by
  rw [problemOneColumnEnergySq,
    problemOneGreenPairing_eq_dirichletEnergy t gamma ht hden]
  rw [Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (problemOneDirichletEnergy_nonneg t gamma ht.le)]

/--
Actual shell ordinates have nonzero Green denominator.
-/
theorem actualProblemOneGreenDenom_ne_zero
    {count : ℕ → ℕ}
    (data : ActualProblemOneShellData count)
    (g : ZetaShellIndex count) :
    problemOneGreenDenom (data.gamma g) ≠ 0 := by
  have hheight := data.shell_height g
  have hnpos : 0 < (g.1 : ℝ) + 1 := by positivity
  have hreabs : 0 < |(data.gamma g).re| :=
    hnpos.trans_le hheight
  have hre : (data.gamma g).re ≠ 0 :=
    abs_pos.mp hreabs
  have hlower :=
    problemOneGreenDenom_norm_lower
      (data.gamma g) (data.strip g)
  intro hzero
  rw [hzero, norm_zero] at hlower
  have hsquare : 0 < (data.gamma g).re ^ 2 :=
    sq_pos_of_ne_zero hre
  linarith

/--
For actual shell data, the coefficient used by WD-T28 is exactly the positive
Dirichlet H^{-1}_L energy.
-/
theorem actualProblemOneEnergySq_eq_dirichletEnergy
    {count : ℕ → ℕ}
    (t : ℝ)
    (ht : 0 < t)
    (data : ActualProblemOneShellData count)
    (g : ZetaShellIndex count) :
    actualProblemOneEnergySq t data g
      =
    problemOneDirichletEnergy t (data.gamma g) := by
  unfold actualProblemOneEnergySq
  exact
    problemOneColumnEnergySq_eq_dirichletEnergy
      t (data.gamma g) ht
      (actualProblemOneGreenDenom_ne_zero data g)

/--
WD-T28 semantic closure: the actual basis-square summability theorem is
summability of the positive Dirichlet H^{-1}_L energies themselves.
-/
theorem wd_t28_actual_dirichlet_energy_summable
    {count : ℕ → ℕ}
    (t : ℝ)
    (ht : 0 < t)
    (data : ActualProblemOneShellData count)
    (C : ℝ)
    (hCount : ZetaZeroShellCountData count C) :
    Summable
      (fun g : ZetaShellIndex count =>
        problemOneDirichletEnergy t (data.gamma g)) := by
  have hs :
      Summable (actualProblemOneEnergySq t data) :=
    wd_t28_native_basis_square_summable
      (actualProblemOneEnergySq t data)
      (6 * t * (Real.exp (t / 2)) ^ 2)
      C
      hCount
      (nativeProblemOneResolventData_of_actual t ht data)
  have heq :
      actualProblemOneEnergySq t data =
        fun g : ZetaShellIndex count =>
          problemOneDirichletEnergy t (data.gamma g) := by
    funext g
    exact actualProblemOneEnergySq_eq_dirichletEnergy t ht data g
  rwa [heq] at hs

end WeilDefect
