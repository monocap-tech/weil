import WeilDefect.Filtration.CriticalDichotomy
import WeilDefect.Screening.DefectIndex
import WeilDefect.Arithmetic.PrimeSupport
import WeilDefect.Arithmetic.NoSobolevBootstrap

namespace WeilDefect

open Filter Asymptotics MeasureTheory
open scoped Topology InnerProduct

/--
P3-U1 / WD-T38 neutral-branch entry point.

This is the composite-facing form of WD-T17: along the fixed finite-sector
compactness subsequence, critical right-approach has exactly two mutually
exclusive outcomes, attained neutral or strict negative fall-through.
-/
theorem wd_t38_p3_u1_fixed_packet_critical_dichotomy
    {Kpos M : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (hmem :
      ∀ n,
        WeilDefect.WDT16.coeff (a n) (u n) ∈ A (t n))
    (hnorm :
      ∀ n,
        ‖WeilDefect.WDT16.coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto
        (fun n => WeilDefect.WDT16.jValue (a n) (u n))
        atTop (𝓝 0)) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ aLim : Kpos, ∃ uLim : M,
        WeilDefect.WDT16.WeaklyTendsto (fun n => a (φ n)) aLim
        ∧ Tendsto (fun n => u (φ n)) atTop (𝓝 uLim)
        ∧ WeilDefect.WDT16.coeff aLim uLim ∈
            WeilDefect.WDT15.rightLimit A c
        ∧ WeilDefect.WDT16.coeff aLim uLim ≠ 0
        ∧
          (WeilDefect.WDT17.NeutralCriticalBranch
              a u φ aLim uLim
            ∨
           WeilDefect.WDT17.NegativeFallthroughBranch
              aLim uLim)
        ∧ ¬
          (WeilDefect.WDT17.NeutralCriticalBranch
              a u φ aLim uLim
            ∧
           WeilDefect.WDT17.NegativeFallthroughBranch
              aLim uLim) := by
  exact WeilDefect.WDT17.wd_t17_fixed_sector_critical_dichotomy
    A c t hA ht a u hmem hnorm hq


/--
In the attained-neutral WD-T17 branch, the selected negative coordinate is
automatically nonzero: both positive and negative squared norms equal one half.
-/
theorem wd_t38_attained_neutral_selected_coordinate_nonzero
    {Kpos M : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    {aSeq : ℕ → Kpos} {uSeq : ℕ → M}
    {phi : ℕ → ℕ} {aLim : Kpos} {uLim : M}
    (h :
      WeilDefect.WDT17.NeutralCriticalBranch
        aSeq uSeq phi aLim uLim) :
    uLim ≠ 0 := by
  intro hu0
  have ha := h.1
  have hj := h.2.1
  have huSq : ‖uLim‖ ^ 2 = 0 := by simp [hu0]
  unfold WeilDefect.WDT16.jValue at hj
  rw [ha, huSq] at hj
  norm_num at hj

/-- Prime powers present in the strict right-limit compact-window operator. -/
def rightLimitPrimePowers (c : ℝ) : Set ℕ :=
  {n | IsPrimePow n ∧ Real.log (n : ℝ) ≤ 2 * c}

/--
The right-limit prime set is exactly the endpoint strict-active set plus the
equality-threshold correction.
-/
theorem wd_t38_p3_u3_right_limit_prime_decomposition
    (c : ℝ) :
    rightLimitPrimePowers c =
      activePrimePowers c ∪ primePowerThreshold c := by
  ext n
  simp only [rightLimitPrimePowers, activePrimePowers,
    primePowerThreshold, Set.mem_setOf_eq, Set.mem_union]
  constructor
  · rintro ⟨hn, hle⟩
    rcases lt_or_eq_of_le hle with hlt | heq
    · exact Or.inl ⟨hn, hlt⟩
    · exact Or.inr ⟨hn, heq⟩
  · rintro (hactive | hthreshold)
    · exact ⟨hactive.1, le_of_lt hactive.2⟩
    · exact ⟨hthreshold.1, le_of_eq hthreshold.2⟩

/--
P3-U3 threshold-aware finiteness: the strict right-limit arithmetic support
is finite.  Relative to the endpoint strict-< support, the only additional
indices lie in the equality-threshold set, which contains at most one natural
prime power.
-/
theorem wd_t38_p3_u3_right_limit_prime_support_finite
    (c : ℝ) :
    (rightLimitPrimePowers c).Finite
      ∧ (primePowerThreshold c).Subsingleton := by
  constructor
  · rw [wd_t38_p3_u3_right_limit_prime_decomposition]
    exact
      (wd_t34_active_prime_powers_finite c).union
        (primePowerThreshold_subsingleton c).finite
  · exact primePowerThreshold_subsingleton c



/--
P3-U4 / WD-T38: once the physical neutral carrier is identified with the
compact-window Weil form, its shifted quadratic form has logarithmic Fourier
order.  The imported compact-window formula/symbol comparison remain explicit
premises exactly as in WD-T35.
-/
theorem wd_t38_p3_u4_logarithmic_order_neutral_carrier
    (Q : ℝ)
    (symbol density : ℝ → ℝ)
    (shift pole a b K : ℝ)
    (hdensity : ∀ t, 0 ≤ density t)
    (ha : 0 ≤ a)
    (hK : 0 ≤ K)
    (hlower :
      ∀ t,
        a * logarithmicFourierWeight t
          ≤ symbol t + shift)
    (hupper :
      ∀ t,
        symbol t + shift
          ≤ b * logarithmicFourierWeight t)
    (hpole0 : 0 ≤ pole)
    (hpole :
      pole ≤ K * spectralMass density)
    (hdensity_int : Integrable density volume)
    (hlog_int :
      Integrable
        (fun t : ℝ =>
          logarithmicFourierWeight t * density t) volume)
    (hsymbol_int :
      Integrable
        (fun t : ℝ =>
          (symbol t + shift) * density t) volume)
    (hQ :
      Q + shift * spectralMass density
        =
      shiftedCompactWeilForm symbol density shift pole) :
    a * logarithmicFourierEnergy density
      ≤ Q + shift * spectralMass density
      ∧
    Q + shift * spectralMass density
      ≤ (b + K) * logarithmicFourierEnergy density := by
  exact wd_t35_compact_weil_logarithmic_form_order
    Q symbol density shift pole a b K
    hdensity ha hK hlower hupper hpole0 hpole
    hdensity_int hlog_int hsymbol_int hQ

/--
P3-U6 scope guard in its purely logical form: vanishing of a total
cancellation does not imply vanishing of the individual summands.

This theorem intentionally says nothing stronger about the prime, pole, or
archimedean pieces of a particular Weil-form realization.
-/
theorem wd_t38_p3_u6_global_cancellation_not_termwise :
    ¬ (∀ x y : ℝ, x + y = 0 → x = 0 ∧ y = 0) := by
  intro h
  have hbad := h 1 (-1) (by norm_num)
  norm_num at hbad


/--
Typed Horizon-1 stop interface for the neutral branch.

The data deliberately contains no proof of the strict-right persistence goal.
The endpoint and right-limit operators are kept distinct, and their equality
away from a prime-power threshold is an explicit carrier-identification
premise rather than being inferred from abstract criticality.
-/
structure NeutralNullExtensionInterface
    (c : ℝ)
    (H EndpointObs RightObs : Type*)
    [NormedAddCommGroup H] [NormedSpace ℂ H]
    [NormedAddCommGroup EndpointObs] [NormedSpace ℂ EndpointObs]
    [NormedAddCommGroup RightObs] [NormedSpace ℂ RightObs] where
  kExt : H
  kExt_ne : kExt ≠ 0
  endpointOperator : H →L[ℂ] H
  rightLimitOperator : H →L[ℂ] H
  endpointRestriction : H →L[ℂ] EndpointObs
  rightRestriction : H →L[ℂ] RightObs
  endpointInteriorNull :
    endpointRestriction (endpointOperator kExt) = 0
  right_eq_endpoint_of_no_threshold :
    primePowerThreshold c = ∅ →
      rightLimitOperator = endpointOperator
  rightPrimeSupportFinite :
    (rightLimitPrimePowers c).Finite
  thresholdSubsingleton :
    (primePowerThreshold c).Subsingleton

namespace NeutralNullExtensionInterface

/--
The unresolved AZ-FIN-WEIL-NULL-EXTENSION obligation attached to one typed
neutral endpoint package.
-/
def persistenceGoal
    {c : ℝ}
    {H EndpointObs RightObs : Type*}
    [NormedAddCommGroup H] [NormedSpace ℂ H]
    [NormedAddCommGroup EndpointObs] [NormedSpace ℂ EndpointObs]
    [NormedAddCommGroup RightObs] [NormedSpace ℂ RightObs]
    (d : NeutralNullExtensionInterface
      c H EndpointObs RightObs) : Prop :=
  d.rightRestriction (d.rightLimitOperator d.kExt) = 0

end NeutralNullExtensionInterface

/--
P3-U7 / WD-T38 neutral null-extension reduction.

From the endpoint null equation and the carrier-specific statement that the
right-limit operator agrees with the endpoint operator away from arithmetic
thresholds, Lean packages the exact unresolved fixed-vector persistence
problem.  No proof of that persistence goal is returned.
-/
def wd_t38_p3_u7_neutral_null_extension_reduction
    (c : ℝ)
    {H EndpointObs RightObs : Type*}
    [NormedAddCommGroup H] [NormedSpace ℂ H]
    [NormedAddCommGroup EndpointObs] [NormedSpace ℂ EndpointObs]
    [NormedAddCommGroup RightObs] [NormedSpace ℂ RightObs]
    (kExt : H)
    (hk : kExt ≠ 0)
    (Wc Wright : H →L[ℂ] H)
    (Rendpoint : H →L[ℂ] EndpointObs)
    (Rright : H →L[ℂ] RightObs)
    (hendpoint : Rendpoint (Wc kExt) = 0)
    (hAway :
      primePowerThreshold c = ∅ →
        Wright = Wc) :
    NeutralNullExtensionInterface
      c H EndpointObs RightObs := by
  have hprime :=
    wd_t38_p3_u3_right_limit_prime_support_finite c
  exact {
    kExt := kExt
    kExt_ne := hk
    endpointOperator := Wc
    rightLimitOperator := Wright
    endpointRestriction := Rendpoint
    rightRestriction := Rright
    endpointInteriorNull := hendpoint
    right_eq_endpoint_of_no_threshold := hAway
    rightPrimeSupportFinite := hprime.1
    thresholdSubsingleton := hprime.2
  }

/--
P3-U5 / WD-T38: logarithmic form control alone does not uniformly dominate
any positive-Sobolev frequency weight.
-/
theorem wd_t38_p3_u5_no_free_positive_sobolev_control
    {eps : ℝ} (heps : 0 < eps) :
    ¬ (fun x : ℝ => positiveSobolevFrequencyWeight eps x)
        =O[atTop] logarithmicFourierWeight :=
  wd_t36_no_positive_sobolev_bootstrap heps

/--
P3-U5 with the fixed finite prime correction retained: finite arithmetic
translations do not repair the positive-order mismatch.
-/
theorem wd_t38_p3_u5_finite_prime_translations_no_smoothing
    {eps : ℝ} (heps : 0 < eps)
    (c : ℝ) (coeff : ℕ → ℝ) :
    ¬ (fun x : ℝ => positiveSobolevFrequencyWeight eps x)
        =O[atTop]
      (fun t : ℝ =>
        logarithmicFourierWeight t
          + finitePrimeTrigCorrection c coeff t) :=
  wd_t36_finite_prime_translations_add_no_smoothing
    heps c coeff

/--
Negative synthesis attached to a finite-exception neutral compensator:
N_c = -P_c C_c.
-/
noncomputable def neutralNegativeSynthesis
    {H Kpos M : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    (P : Kpos →L[ℂ] H)
    (C : M →L[ℂ] Kpos) :
    M →L[ℂ] H :=
  -(P ∘L C)

/-- Physical finite-exception Weil defect used in the neutral branch. -/
noncomputable def neutralWeilOperator
    {H Kpos M : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    (P : Kpos →L[ℂ] H)
    (C : M →L[ℂ] Kpos) :
    H →L[ℂ] H :=
  WeilDefect.WDT01.physicalDefect P (neutralNegativeSynthesis P C)

/--
The unit-gain plus physical-adjoint realization forces the negative adjoint
coefficient to be exactly -u.
-/
theorem wd_t38_p3_u2_negative_adjoint_identity
    {H Kpos M : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    (P : Kpos →L[ℂ] H)
    (C : M →L[ℂ] Kpos)
    (u : M) (k : H)
    (hunit : (C†) (C u) = u)
    (hreal : C u = (P†) k) :
    ContinuousLinearMap.adjoint (neutralNegativeSynthesis P C) k = -u := by
  simp [neutralNegativeSynthesis,
    ContinuousLinearMap.adjoint_comp, ← hreal, hunit]

/--
P3-U2 / WD-T38 physical neutral null-mode theorem.

Under the finite-exception unit-gain relation C† C u = u and the physical
adjoint realization C u = P† k, with N = -PC, the physical Weil defect
P P† - N N† annihilates the same nonzero physical vector k.
-/
theorem wd_t38_p3_u2_physical_neutral_null_mode
    {H Kpos M : Type*}
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    (P : Kpos →L[ℂ] H)
    (C : M →L[ℂ] Kpos)
    (u : M) (k : H)
    (hunit : (C†) (C u) = u)
    (hreal : C u = (P†) k)
    (hk : k ≠ 0) :
    k ≠ 0 ∧ neutralWeilOperator P C k = 0 := by
  constructor
  · exact hk
  · have hneg :
        ContinuousLinearMap.adjoint (neutralNegativeSynthesis P C) k = -u :=
      wd_t38_p3_u2_negative_adjoint_identity
        P C u k hunit hreal
    unfold neutralWeilOperator WeilDefect.WDT01.physicalDefect
    simp only [ContinuousLinearMap.sub_apply,
      ContinuousLinearMap.comp_apply]
    rw [hneg]
    simp [neutralNegativeSynthesis, ← hreal]

/--
Arithmetic/operator-order package for the retained neutral branch.
All fields are proof data: the right-limit arithmetic support is finite,
the compact-window form has logarithmic order, finite prime translations do
not supply positive-Sobolev coercivity, and global cancellation does not
logically split termwise.
-/
structure NeutralArithmeticMorphology
    (c Q shift lowerC upperC poleC : ℝ)
    (density : ℝ → ℝ)
    (primeCoeff : ℕ → ℝ) : Prop where
  rightPrimeSupportFinite :
    (rightLimitPrimePowers c).Finite
  thresholdSubsingleton :
    (primePowerThreshold c).Subsingleton
  logarithmicOrder :
    lowerC * logarithmicFourierEnergy density
      ≤ Q + shift * spectralMass density
      ∧
    Q + shift * spectralMass density
      ≤ (upperC + poleC) * logarithmicFourierEnergy density
  noPositiveSobolevCoercivity :
    ∀ eps : ℝ, 0 < eps →
      ¬ (fun x : ℝ => positiveSobolevFrequencyWeight eps x)
          =O[atTop]
        (fun t : ℝ =>
          logarithmicFourierWeight t
            + finitePrimeTrigCorrection c primeCoeff t)
  globalCancellationScope :
    ¬ (∀ x y : ℝ, x + y = 0 → x = 0 ∧ y = 0)

/--
P3-U3--U6 assembled arithmetic continuation for one carrier-identified
compact-window neutral branch.
-/
theorem wd_t38_neutral_arithmetic_morphology
    (c Q : ℝ)
    (symbol density : ℝ → ℝ)
    (shift pole lowerC upperC poleC : ℝ)
    (primeCoeff : ℕ → ℝ)
    (hdensity : ∀ t, 0 ≤ density t)
    (hlowerC : 0 ≤ lowerC)
    (hpoleC : 0 ≤ poleC)
    (hlower :
      ∀ t,
        lowerC * logarithmicFourierWeight t
          ≤ symbol t + shift)
    (hupper :
      ∀ t,
        symbol t + shift
          ≤ upperC * logarithmicFourierWeight t)
    (hpole0 : 0 ≤ pole)
    (hpole :
      pole ≤ poleC * spectralMass density)
    (hdensity_int : Integrable density volume)
    (hlog_int :
      Integrable
        (fun t : ℝ =>
          logarithmicFourierWeight t * density t) volume)
    (hsymbol_int :
      Integrable
        (fun t : ℝ =>
          (symbol t + shift) * density t) volume)
    (hQ :
      Q + shift * spectralMass density
        =
      shiftedCompactWeilForm symbol density shift pole) :
    NeutralArithmeticMorphology
      c Q shift lowerC upperC poleC density primeCoeff := by
  have hprime :=
    wd_t38_p3_u3_right_limit_prime_support_finite c
  have hlog :=
    wd_t38_p3_u4_logarithmic_order_neutral_carrier
      Q symbol density shift pole lowerC upperC poleC
      hdensity hlowerC hpoleC hlower hupper hpole0 hpole
      hdensity_int hlog_int hsymbol_int hQ
  refine {
    rightPrimeSupportFinite := hprime.1
    thresholdSubsingleton := hprime.2
    logarithmicOrder := hlog
    noPositiveSobolevCoercivity := ?_
    globalCancellationScope :=
      wd_t38_p3_u6_global_cancellation_not_termwise
  }
  intro eps heps
  exact wd_t38_p3_u5_finite_prime_translations_no_smoothing
    heps c primeCoeff

/--
Typed output of WD-T38.

The compact neutral null vector and its whole-line zero extension are linked by
an explicit extension map.  The extended endpoint equation is an explicit
carrier-identification input, and the returned null-extension interface
contains the unresolved strict-right persistence goal but no proof of it.
-/
structure NeutralDefectMorphology
    {Kpos M H Hext EndpointObs RightObs : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Hext] [NormedSpace ℂ Hext]
    [NormedAddCommGroup EndpointObs] [NormedSpace ℂ EndpointObs]
    [NormedAddCommGroup RightObs] [NormedSpace ℂ RightObs]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ)
    (aSeq : ℕ → Kpos) (uSeq : ℕ → M)
    (phi : ℕ → ℕ) (aLim : Kpos) (uLim : M)
    (P : Kpos →L[ℂ] H) (C : M →L[ℂ] Kpos) (k : H)
    (Q shift lowerC upperC poleC : ℝ)
    (density : ℝ → ℝ) (primeCoeff : ℕ → ℝ)
    (extend : H →L[ℂ] Hext) where
  subsequence_strictMono : StrictMono phi
  attainedNeutral :
    WeilDefect.WDT17.NeutralCriticalBranch
      aSeq uSeq phi aLim uLim
  endpointRight :
    WeilDefect.WDT16.coeff aLim uLim ∈
      WeilDefect.WDT15.rightLimit A c
  endpointNonzero :
    WeilDefect.WDT16.coeff aLim uLim ≠ 0
  selectedCoordinateNonzero : uLim ≠ 0
  coefficientCarrier :
    aLim = C uLim
  physicalNull :
    k ≠ 0 ∧ neutralWeilOperator P C k = 0
  arithmetic :
    NeutralArithmeticMorphology
      c Q shift lowerC upperC poleC density primeCoeff
  nullExtension :
    NeutralNullExtensionInterface
      c Hext EndpointObs RightObs
  nullExtensionVector :
    nullExtension.kExt = extend k

/--
WD-T38 / P3-U1...P3-U7.

Conditional on selection of the attained-neutral WD-T17 branch, the explicit
finite-exception unit-gain/physical realization, and the carrier
identification with the compact-window explicit-formula operator, this
constructor packages the neutral morphology through the exact Horizon-1 stop
interface AZ-FIN-WEIL-NULL-EXTENSION.

No strict-right persistence theorem is assumed or returned.
-/
noncomputable def wd_t38_attained_unit_gain_neutral_morphology
    {Kpos M H Hext EndpointObs RightObs : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    [NormedAddCommGroup Hext] [NormedSpace ℂ Hext]
    [NormedAddCommGroup EndpointObs] [NormedSpace ℂ EndpointObs]
    [NormedAddCommGroup RightObs] [NormedSpace ℂ RightObs]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ)
    (aSeq : ℕ → Kpos) (uSeq : ℕ → M)
    (phi : ℕ → ℕ) (aLim : Kpos) (uLim : M)
    (hphi : StrictMono phi)
    (hneutral :
      WeilDefect.WDT17.NeutralCriticalBranch
        aSeq uSeq phi aLim uLim)
    (hright :
      WeilDefect.WDT16.coeff aLim uLim ∈
        WeilDefect.WDT15.rightLimit A c)
    (hy0 :
      WeilDefect.WDT16.coeff aLim uLim ≠ 0)
    (P : Kpos →L[ℂ] H)
    (C : M →L[ℂ] Kpos)
    (k : H)
    (haCarrier : aLim = C uLim)
    (hunit : (C†) (C uLim) = uLim)
    (hreal : C uLim = (P†) k)
    (hk : k ≠ 0)
    (Q : ℝ)
    (symbol density : ℝ → ℝ)
    (shift pole lowerC upperC poleC : ℝ)
    (primeCoeff : ℕ → ℝ)
    (hdensity : ∀ t, 0 ≤ density t)
    (hlowerC : 0 ≤ lowerC)
    (hpoleC : 0 ≤ poleC)
    (hlower :
      ∀ t,
        lowerC * logarithmicFourierWeight t
          ≤ symbol t + shift)
    (hupper :
      ∀ t,
        symbol t + shift
          ≤ upperC * logarithmicFourierWeight t)
    (hpole0 : 0 ≤ pole)
    (hpole :
      pole ≤ poleC * spectralMass density)
    (hdensity_int : Integrable density volume)
    (hlog_int :
      Integrable
        (fun t : ℝ =>
          logarithmicFourierWeight t * density t) volume)
    (hsymbol_int :
      Integrable
        (fun t : ℝ =>
          (symbol t + shift) * density t) volume)
    (hQ :
      Q + shift * spectralMass density
        =
      shiftedCompactWeilForm symbol density shift pole)
    (extend : H →L[ℂ] Hext)
    (hext0 : extend k ≠ 0)
    (WextEndpoint WextRight : Hext →L[ℂ] Hext)
    (Rendpoint : Hext →L[ℂ] EndpointObs)
    (Rright : Hext →L[ℂ] RightObs)
    (hendpointExt :
      Rendpoint (WextEndpoint (extend k)) = 0)
    (hAway :
      primePowerThreshold c = ∅ →
        WextRight = WextEndpoint) :
    NeutralDefectMorphology
      (Kpos := Kpos) (M := M) (H := H) (Hext := Hext)
      (EndpointObs := EndpointObs) (RightObs := RightObs)
      A c aSeq uSeq phi aLim uLim
      P C k Q shift lowerC upperC poleC density primeCoeff extend := by
  have hu0 : uLim ≠ 0 :=
    wd_t38_attained_neutral_selected_coordinate_nonzero hneutral
  have huNonzero : uLim ≠ 0 := by
    intro hu0
    have hj0 := hneutral.2.1
    have haHalf := hneutral.1
    unfold WeilDefect.WDT16.jValue at hj0
    rw [hu0, norm_zero] at hj0
    nlinarith
  have hnull :=
    wd_t38_p3_u2_physical_neutral_null_mode
      P C uLim k hunit hreal hk
  have harith :=
    wd_t38_neutral_arithmetic_morphology
      c Q symbol density shift pole lowerC upperC poleC
      primeCoeff hdensity hlowerC hpoleC hlower hupper
      hpole0 hpole hdensity_int hlog_int hsymbol_int hQ
  let hnullExt :=
    wd_t38_p3_u7_neutral_null_extension_reduction
      c (extend k) hext0 WextEndpoint WextRight
      Rendpoint Rright hendpointExt hAway
  exact {
    subsequence_strictMono := hphi
    attainedNeutral := hneutral
    endpointRight := hright
    endpointNonzero := hy0
    selectedCoordinateNonzero := hu0
    coefficientCarrier := haCarrier
    physicalNull := hnull
    arithmetic := harith
    nullExtension := hnullExt
    nullExtensionVector := rfl
  }


end WeilDefect
