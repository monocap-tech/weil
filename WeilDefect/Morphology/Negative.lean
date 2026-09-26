import WeilDefect.Filtration.FiniteNegativeSector
import WeilDefect.PairGeometry
import WeilDefect.RationalResponse
import WeilDefect.Arithmetic.FarTail
import WeilDefect.Arithmetic.NextJet
import WeilDefect.Arithmetic.Coadaptation

namespace WeilDefect

open Filter Asymptotics Bornology
open scoped Topology BigOperators

/--
Finite indexed selected source used by the WD-T37 arithmetic morphology.
Zero moment is not stored here: WD-T37 must derive it from the canonical
WD-T26 raw-residue specialization before the arithmetic continuation.
-/
structure SelectedSourceData where
  n : ℕ
  rho : Fin n → ℂ
  v : Fin n → ℂ

namespace SelectedSourceData

def Nonzero (src : SelectedSourceData) : Prop :=
  ∃ i, src.v i ≠ 0

end SelectedSourceData

/--
WD-T37 residue-custody bridge, zero-moment half.

If the indexed source coefficients are exactly the canonical WD-T26 raw
residues of finitely many negative pair coefficients, their indexed sum
vanishes.
-/
theorem wd_t37_selected_source_zero_moment_of_wd_t26
    (src : SelectedSourceData)
    (xs : List ℂ)
    (hraw :
      List.ofFn src.v =
        rawResiduesOfNegativePairs xs) :
    (∑ i : Fin src.n, src.v i) = 0 := by
  have hsum : (List.ofFn src.v).sum = 0 := by
    rw [hraw]
    exact wd_t26_zero_moment xs
  simpa [List.sum_ofFn] using hsum

/--
WD-T37 residue-custody bridge, nondegeneracy half.

A nonzero selected negative pair coefficient survives verbatim among the
canonical WD-T26 raw residues, hence the indexed selected source is nonzero.
-/
theorem wd_t37_selected_source_nonzero_of_wd_t26
    (src : SelectedSourceData)
    (xs : List ℂ)
    (hraw :
      List.ofFn src.v =
        rawResiduesOfNegativePairs xs)
    (hxs : ∃ α ∈ xs, α ≠ 0) :
    src.Nonzero := by
  rcases
      wd_t26_nonzero_raw_residue_of_nonzero_coefficient xs hxs with
    ⟨r, hr, hr0⟩
  have hr' : r ∈ List.ofFn src.v := by
    rw [hraw]
    exact hr
  rcases List.mem_ofFn.mp hr' with ⟨i, hi⟩
  exact ⟨i, fun hzero => hr0 (hi.symm.trans hzero)⟩

/--
P3-N1. A convergent strictly negative normalized signature in a fixed finite
negative sector produces a genuine negative right-limit endpoint jump.
-/
theorem wd_t37_p3_n1_endpoint_ray
    {Kpos M : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (κ : ℝ) (hκ : 0 < κ)
    (hmem :
      ∀ n,
        WeilDefect.WDT16.coeff (a n) (u n) ∈ A (t n))
    (hnorm :
      ∀ n,
        ‖WeilDefect.WDT16.coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto
        (fun n => WeilDefect.WDT16.jValue (a n) (u n))
        atTop (𝓝 (-κ)))
    (hendpoint :
      ∀ y : WeilDefect.WDT16.CoeffSpace Kpos M,
        y ∈ A c →
        0 ≤ WeilDefect.WDT16.jValue y.fst y.snd) :
    ∃ y : WeilDefect.WDT16.CoeffSpace Kpos M,
      y ≠ 0
      ∧ y ∈ WeilDefect.WDT15.rightLimit A c
      ∧ y ∉ A c
      ∧ WeilDefect.WDT16.jValue y.fst y.snd ≤ -κ
      ∧ y.snd ≠ 0 := by
  have hqStar : -κ ≤ 0 := by linarith
  rcases
      WeilDefect.WDT16.wd_t16_nonpositive_limit_persists
        A c t hA ht a u (-κ) hqStar hmem hnorm hq with
    ⟨y, hy0, hyRight, hyNeg⟩
  have hyNot : y ∉ A c := by
    intro hy
    have hnonneg := hendpoint y hy
    linarith
  have hySnd : y.snd ≠ 0 := by
    intro hsnd
    have hnonneg :
        0 ≤ WeilDefect.WDT16.jValue y.fst y.snd := by
      have hsq : 0 ≤ ‖y.fst‖ ^ 2 := sq_nonneg _
      simpa [WeilDefect.WDT16.jValue, hsnd] using hsq
    linarith
  exact ⟨y, hy0, hyRight, hyNot, hyNeg, hySnd⟩

/--
P3-N2. Reciprocal normalization of unit physical representatives with
vanishing positive amplitude forces norm blow-up.
-/
theorem wd_t37_p3_n2_normalized_representative_blowup
    {P : Type*}
    [NormedAddCommGroup P] [NormedSpace ℂ P]
    (g : ℕ → P)
    (ε : ℕ → ℝ)
    (hεpos : ∀ n, 0 < ε n)
    (hε0 : Tendsto ε atTop (𝓝 0))
    (hgnorm : ∀ n, ‖g n‖ = 1) :
    Tendsto
      (fun n => ‖((ε n : ℂ)⁻¹) • g n‖)
      atTop atTop := by
  have hnorm :
      ∀ n, ‖((ε n : ℂ)⁻¹) • g n‖ = (ε n)⁻¹ := by
    intro n
    rw [norm_smul, hgnorm n, mul_one]
    have hpos := hεpos n
    simp [Complex.norm_real, abs_of_pos hpos]
  have hεWithin : Tendsto ε atTop (𝓝[>] (0 : ℝ)) := by
    refine tendsto_nhdsWithin_iff.mpr ⟨hε0, ?_⟩
    exact Eventually.of_forall hεpos
  have hinv :
      Tendsto (fun n => (ε n)⁻¹) atTop atTop :=
    tendsto_inv_nhdsGT_zero.comp hεWithin
  exact hinv.congr' (Eventually.of_forall fun n => (hnorm n).symm)

/-- Normalized full selected-plus-background signature used in P3-N3. -/
def normalizedFullSignature
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos]
    [NormedAddCommGroup M]
    [NormedAddCommGroup B]
    (a : ℕ → Kpos) (u : ℕ → M) (b : ℕ → B)
    (n : ℕ) : ℝ :=
  WeilDefect.WDT16.jValue (a n) (u n) - ‖b n‖ ^ 2

/--
P3-N3. The unselected negative background can only make the normalized full
signature more negative.  This eventual formulation is the direct sequential
content of limsup <= -kappa.
-/
theorem wd_t37_p3_n3_normalized_full_negativity
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M]
    [NormedAddCommGroup B] [NormedSpace ℂ B]
    (a : ℕ → Kpos) (u : ℕ → M) (b : ℕ → B)
    (κ : ℝ)
    (hq :
      Tendsto
        (fun n => WeilDefect.WDT16.jValue (a n) (u n))
        atTop (𝓝 (-κ))) :
    ∀ δ : ℝ, 0 < δ →
      ∀ᶠ n in atTop,
        normalizedFullSignature a u b n ≤ -κ + δ := by
  intro δ hδ
  have hsel :
      ∀ᶠ n in atTop,
        WeilDefect.WDT16.jValue (a n) (u n) < -κ + δ :=
    hq.eventually (Iio_mem_nhds (by linarith))
  exact hsel.mono fun n hn => by
    unfold normalizedFullSignature
    nlinarith [sq_nonneg ‖b n‖]

/-- P3-N4: WD-T27 applied to an indexed nonzero zero-moment selected source. -/
theorem wd_t37_p3_n4_zero_moment_source_far_decay
    (src : SelectedSourceData)
    (hzero : (∑ i : Fin src.n, src.v i) = 0)
    (hsrc : src.Nonzero) :
    src.Nonzero
      ∧
    (fun z : ℂ => rationalResponse src.rho src.v z)
      =O[cobounded ℂ]
    (fun z : ℂ => z⁻¹ ^ 2) := by
  exact ⟨hsrc,
    wd_t27_universal_inverse_square_isBigO
      src.rho src.v hzero⟩

/--
P3-N5. Quantitative finite-neighborhood localization from the zero-moment
source and logarithmic shell counting.
-/
theorem wd_t37_p3_n5_far_localization
    (src : SelectedSourceData)
    (hzero : (∑ i : Fin src.n, src.v i) = 0)
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
        2 * ‖src.rho i‖ ≤ ‖mu gamma‖)
    (R : ℕ) (hR : 1 ≤ R) :
    ‖∑' k : ℕ,
        farShellResponse
          (zeroMomentShellTerm src.rho src.v mu psi)
          (k + R)‖
      ≤
    ((M * zeroMomentResponseConstant src.rho src.v) * C)
      * ((Real.log R + 2) / R) := by
  exact wd_t31_zero_moment_zero_count_far_tail
    src.rho src.v hzero mu psi M C
    hCount hM hPsi hShellNorm hSelectedFar R hR

/--
P3-N6. The finite/intermediate complementary field is exactly the weighted
completed-Xi next-jet field.
-/
theorem wd_t37_p3_n6_weighted_next_jet_morphology
    (src : SelectedSourceData)
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι)
    (mult : ι → ℕ)
    (mu : ι → ℂ)
    (psi : ℂ → ℂ)
    (Xi : ℂ → ℂ)
    (g : ι → ℂ → ℂ)
    (hXi :
      ∀ i ∈ s,
        Xi =ᶠ[𝓝 (mu i)]
          (fun z : ℂ => (z - mu i) ^ (mult i) * g i z))
    (hg :
      ∀ i ∈ s,
        ContDiffAt ℂ (mult i) (g i) (mu i))
    (hResp :
      ∀ i ∈ s,
        ContDiffAt ℂ (mult i)
          (rationalResponse src.rho src.v) (mu i))
    (hg0 :
      ∀ i ∈ s,
        g i (mu i) ≠ 0) :
    nearComplementaryResponse
        s mult mu psi (rationalResponse src.rho src.v)
      =
    weightedNearNextJetField
        s mult mu psi Xi (rationalResponse src.rho src.v) := by
  exact wd_t32_weighted_near_next_jet_representation
    s mult mu psi Xi (rationalResponse src.rho src.v) g
    hXi hg hResp hg0

/-- P3-N7: cutoffwise adaptive near cancellation collapses the prime term to the far tail. -/
theorem wd_t37_p3_n7_no_adaptive_scalar_bypass
    (N F P A : ℂ)
    (hBalance : N + F = P + A)
    (hCancel : N = A) :
    P = F :=
  wd_t33_adaptive_cocancellation N F P A hBalance hCancel

/--
Arithmetic continuation of one persistent negative endpoint source.
There is deliberately no field asserting an actual-zeta exclusion theorem:
this structure ends at the weighted near next-jet morphology.
-/
structure NegativeArithmeticMorphology
    (src : SelectedSourceData) : Prop where
  zeroMoment : (∑ i : Fin src.n, src.v i) = 0
  sourceNonzero : src.Nonzero
  farDecay :
    (fun z : ℂ => rationalResponse src.rho src.v z)
      =O[cobounded ℂ]
    (fun z : ℂ => z⁻¹ ^ 2)
  farLocalization :
    ∀ {count : ℕ → ℕ}
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
          2 * ‖src.rho i‖ ≤ ‖mu gamma‖)
      (R : ℕ),
      1 ≤ R →
      ‖∑' k : ℕ,
          farShellResponse
            (zeroMomentShellTerm src.rho src.v mu psi)
            (k + R)‖
        ≤
      ((M * zeroMomentResponseConstant src.rho src.v) * C)
        * ((Real.log R + 2) / R)
  nextJetMorphology :
    ∀ {ι : Type} [DecidableEq ι]
      (s : Finset ι)
      (mult : ι → ℕ)
      (mu : ι → ℂ)
      (psi : ℂ → ℂ)
      (Xi : ℂ → ℂ)
      (g : ι → ℂ → ℂ)
      (hXi :
        ∀ i ∈ s,
          Xi =ᶠ[𝓝 (mu i)]
            (fun z : ℂ => (z - mu i) ^ (mult i) * g i z))
      (hg :
        ∀ i ∈ s,
          ContDiffAt ℂ (mult i) (g i) (mu i))
      (hResp :
        ∀ i ∈ s,
          ContDiffAt ℂ (mult i)
            (rationalResponse src.rho src.v) (mu i))
      (hg0 :
        ∀ i ∈ s,
          g i (mu i) ≠ 0),
      nearComplementaryResponse
          s mult mu psi (rationalResponse src.rho src.v)
        =
      weightedNearNextJetField
          s mult mu psi Xi (rationalResponse src.rho src.v)
  noAdaptiveBypass :
    ∀ N F P A : ℂ,
      N + F = P + A →
      N = A →
      P = F

/--
Typed output of the fixed-packet persistent negative morphology theorem.
The package stops at NegativeArithmeticMorphology; no AZ-NEXTJET-LOC
exclusion field is present.
-/
structure NegativeDefectMorphology
    {Kpos M P B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup P] [NormedSpace ℂ P]
    [NormedAddCommGroup B] [NormedSpace ℂ B]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ)
    (a : ℕ → Kpos) (u : ℕ → M)
    (gPhys : ℕ → P) (ε : ℕ → ℝ)
    (b : ℕ → B)
    (κ : ℝ)
    (sourceOf : M → SelectedSourceData)
    (pairCoefficientsOf : M → List ℂ) where
  endpoint : WeilDefect.WDT16.CoeffSpace Kpos M
  endpoint_nonzero : endpoint ≠ 0
  endpoint_right :
    endpoint ∈ WeilDefect.WDT15.rightLimit A c
  endpoint_not_old : endpoint ∉ A c
  endpoint_negative :
    WeilDefect.WDT16.jValue endpoint.fst endpoint.snd ≤ -κ
  negative_coordinate_nonzero : endpoint.snd ≠ 0
  raw_residue_custody :
    List.ofFn (sourceOf endpoint.snd).v =
      rawResiduesOfNegativePairs (pairCoefficientsOf endpoint.snd)
  pair_coefficients_nonzero :
    ∃ α ∈ pairCoefficientsOf endpoint.snd, α ≠ 0
  representatives_blowup :
    Tendsto
      (fun n => ‖((ε n : ℂ)⁻¹) • gPhys n‖)
      atTop atTop
  normalized_full_negative :
    ∀ δ : ℝ, 0 < δ →
      ∀ᶠ n in atTop,
        normalizedFullSignature a u b n ≤ -κ + δ
  arithmetic :
    NegativeArithmeticMorphology (sourceOf endpoint.snd)

/--
WD-T37 / P3-N1...P3-N7.

Under the normalized fixed-packet endpoint hypotheses, plus the explicit
negative-coordinate -> indexed selected-source specialization map, Lean
packages the entire negative morphology through the weighted near next-jet
field.  The theorem intentionally stops there.
-/
noncomputable def wd_t37_fixed_packet_persistent_negative_morphology
    {Kpos M P B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [FiniteDimensional ℂ M]
    [NormedAddCommGroup P] [NormedSpace ℂ P]
    [NormedAddCommGroup B] [NormedSpace ℂ B]
    (A : ℝ → ClosedSubmodule ℂ (WeilDefect.WDT16.CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (κ : ℝ) (hκ : 0 < κ)
    (hmem :
      ∀ n,
        WeilDefect.WDT16.coeff (a n) (u n) ∈ A (t n))
    (hnorm :
      ∀ n,
        ‖WeilDefect.WDT16.coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto
        (fun n => WeilDefect.WDT16.jValue (a n) (u n))
        atTop (𝓝 (-κ)))
    (hendpoint :
      ∀ y : WeilDefect.WDT16.CoeffSpace Kpos M,
        y ∈ A c →
        0 ≤ WeilDefect.WDT16.jValue y.fst y.snd)
    (gPhys : ℕ → P)
    (ε : ℕ → ℝ)
    (hεpos : ∀ n, 0 < ε n)
    (hε0 : Tendsto ε atTop (𝓝 0))
    (hgNorm : ∀ n, ‖gPhys n‖ = 1)
    (b : ℕ → B)
    (sourceOf : M → SelectedSourceData)
    (pairCoefficientsOf : M → List ℂ)
    (hsourceRaw :
      ∀ u0 : M,
        List.ofFn (sourceOf u0).v =
          rawResiduesOfNegativePairs (pairCoefficientsOf u0))
    (hpairNonzero :
      ∀ u0 : M, u0 ≠ 0 →
        ∃ α ∈ pairCoefficientsOf u0, α ≠ 0) :
    NegativeDefectMorphology
      A c a u gPhys ε b κ sourceOf pairCoefficientsOf := by
  let hp :=
    wd_t37_p3_n1_endpoint_ray
      A c t hA ht a u κ hκ hmem hnorm hq hendpoint
  let y := Classical.choose hp
  have hySpec := Classical.choose_spec hp
  have hy0 : y ≠ 0 := hySpec.1
  have hyRight : y ∈ WeilDefect.WDT15.rightLimit A c := hySpec.2.1
  have hyNot : y ∉ A c := hySpec.2.2.1
  have hyNeg :
      WeilDefect.WDT16.jValue y.fst y.snd ≤ -κ := hySpec.2.2.2.1
  have hySnd : y.snd ≠ 0 := hySpec.2.2.2.2
  have hblow :=
    wd_t37_p3_n2_normalized_representative_blowup
      gPhys ε hεpos hε0 hgNorm
  have hfull :=
    wd_t37_p3_n3_normalized_full_negativity
      a u b κ hq
  let src := sourceOf y.snd
  have hraw :
      List.ofFn src.v =
        rawResiduesOfNegativePairs (pairCoefficientsOf y.snd) := by
    simpa [src] using hsourceRaw y.snd
  have hpair :
      ∃ α ∈ pairCoefficientsOf y.snd, α ≠ 0 :=
    hpairNonzero y.snd hySnd
  have hsrcZero : (∑ i : Fin src.n, src.v i) = 0 :=
    wd_t37_selected_source_zero_moment_of_wd_t26
      src (pairCoefficientsOf y.snd) hraw
  have hsrcNonzero : src.Nonzero :=
    wd_t37_selected_source_nonzero_of_wd_t26
      src (pairCoefficientsOf y.snd) hraw hpair
  have hfar :
      (fun z : ℂ => rationalResponse src.rho src.v z)
        =O[cobounded ℂ]
      (fun z : ℂ => z⁻¹ ^ 2) :=
    (wd_t37_p3_n4_zero_moment_source_far_decay
      src hsrcZero hsrcNonzero).2
  have harith : NegativeArithmeticMorphology src := by
    refine ⟨hsrcZero, hsrcNonzero, hfar, ?_, ?_, ?_⟩
    · intro count mu psi M0 C hCount hM hPsi
        hShellNorm hSelectedFar R hR
      exact wd_t37_p3_n5_far_localization
        src hsrcZero mu psi M0 C hCount hM hPsi
        hShellNorm hSelectedFar R hR
    · intro ι inst s mult mu psi Xi g0
        hXi hg hResp hg0
      exact wd_t37_p3_n6_weighted_next_jet_morphology
        src s mult mu psi Xi g0 hXi hg hResp hg0
    · intro N F P0 A0 hBalance hCancel
      exact wd_t37_p3_n7_no_adaptive_scalar_bypass
        N F P0 A0 hBalance hCancel
  exact {
    endpoint := y
    endpoint_nonzero := hy0
    endpoint_right := hyRight
    endpoint_not_old := hyNot
    endpoint_negative := hyNeg
    negative_coordinate_nonzero := hySnd
    raw_residue_custody := by simpa [src] using hraw
    pair_coefficients_nonzero := hpair
    representatives_blowup := hblow
    normalized_full_negative := hfull
    arithmetic := by simpa [src] using harith
  }

end WeilDefect
