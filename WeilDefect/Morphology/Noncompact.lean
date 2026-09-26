import WeilDefect.Filtration.FiniteNegativeSector
import WeilDefect.Filtration.CriticalDichotomy
import WeilDefect.Screening.FinitePositiveShadows
import WeilDefect.Screening.BackgroundCustody

namespace WeilDefect

open Filter
open scoped Topology InnerProduct

/-- The full negative coefficient carrier: selected finite packet plus background. -/
abbrev FullNegativeSpace
    (M B : Type*)
    [NormedAddCommGroup M] [InnerProductSpace ℂ M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] :=
  WithLp 2 (M × B)

/-- Assemble selected and background negative coordinates in the Hilbert L2 product. -/
noncomputable def fullNegativeCoeff
    {M B : Type*}
    [NormedAddCommGroup M] [InnerProductSpace ℂ M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B]
    (u : M) (b : B) : FullNegativeSpace M B :=
  WithLp.toLp 2 (u, b)

/-- Assemble the positive coordinate with the entire negative sector. -/
noncomputable def fullCoeff
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B]
    (a : Kpos) (u : M) (b : B) :
    WeilDefect.WDT16.CoeffSpace Kpos (FullNegativeSpace M B) :=
  WeilDefect.WDT16.coeff a (fullNegativeCoeff u b)

/-- Full coefficient signature for selected plus background negative coordinates. -/
def fullJValue
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [NormedSpace ℂ Kpos]
    [NormedAddCommGroup M] [NormedSpace ℂ M]
    [NormedAddCommGroup B] [NormedSpace ℂ B]
    (a : Kpos) (u : M) (b : B) : ℝ :=
  ‖a‖ ^ 2 - ‖u‖ ^ 2 - ‖b‖ ^ 2

/-- Strong convergence of both negative coordinates gives strong convergence
of the assembled full negative coordinate. -/
theorem tendsto_fullNegativeCoeff
    {M B : Type*}
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    {u : ℕ → M} {b : ℕ → B} {uLim : M} {bLim : B}
    (hu : Tendsto u atTop (𝓝 uLim))
    (hb : Tendsto b atTop (𝓝 bLim)) :
    Tendsto
      (fun n => fullNegativeCoeff (u n) (b n))
      atTop
      (𝓝 (fullNegativeCoeff uLim bLim)) := by
  have hpair :
      Tendsto (fun n => (u n, b n)) atTop (𝓝 (uLim, bLim)) :=
    hu.prodMk_nhds hb
  have hmap :=
    ((WithLp.prodContinuousLinearEquiv 2 ℂ M B).symm.continuous.tendsto
      (uLim, bLim)).comp hpair
  simpa only [fullNegativeCoeff,
    WithLp.prodContinuousLinearEquiv_symm_apply,
    Function.comp_def] using hmap

/-- B-2 custody: weak convergence of the positive coordinate together with
strong convergence on the entire negative sector gives a full weak limit. -/
theorem weaklyTendsto_fullCoeff
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    {a : ℕ → Kpos} {u : ℕ → M} {b : ℕ → B}
    {aLim : Kpos} {uLim : M} {bLim : B}
    (ha : WeilDefect.WDT16.WeaklyTendsto a aLim)
    (hu : Tendsto u atTop (𝓝 uLim))
    (hb : Tendsto b atTop (𝓝 bLim)) :
    WeilDefect.WDT16.WeaklyTendsto
      (fun n => fullCoeff (a n) (u n) (b n))
      (fullCoeff aLim uLim bLim) := by
  have hneg :=
    tendsto_fullNegativeCoeff (u := u) (b := b)
      (uLim := uLim) (bLim := bLim) hu hb
  simpa [fullCoeff] using
    (WeilDefect.WDT16.weaklyTendsto_coeff ha hneg)

/-- Whole full-coefficient strong convergence requires positive-coordinate
strong convergence in addition to strong convergence of both negative parts. -/
theorem tendsto_fullCoeff_of_strong_positive
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    {a : ℕ → Kpos} {u : ℕ → M} {b : ℕ → B}
    {aLim : Kpos} {uLim : M} {bLim : B}
    (ha : Tendsto a atTop (𝓝 aLim))
    (hu : Tendsto u atTop (𝓝 uLim))
    (hb : Tendsto b atTop (𝓝 bLim)) :
    Tendsto
      (fun n => fullCoeff (a n) (u n) (b n))
      atTop
      (𝓝 (fullCoeff aLim uLim bLim)) := by
  have hneg :=
    tendsto_fullNegativeCoeff (u := u) (b := b)
      (uLim := uLim) (bLim := bLim) hu hb
  have hpair :
      Tendsto
        (fun n => (a n, fullNegativeCoeff (u n) (b n)))
        atTop
        (𝓝 (aLim, fullNegativeCoeff uLim bLim)) :=
    ha.prodMk_nhds hneg
  have hmap :=
    ((WithLp.prodContinuousLinearEquiv
      2 ℂ Kpos (FullNegativeSpace M B)).symm.continuous.tendsto
        (aLim, fullNegativeCoeff uLim bLim)).comp hpair
  simpa only [fullCoeff, WeilDefect.WDT16.coeff,
    WithLp.prodContinuousLinearEquiv_symm_apply,
    Function.comp_def] using hmap

/-- A nonzero selected negative coordinate makes the assembled full
coefficient vector nonzero, independently of the background. -/
theorem fullCoeff_ne_zero_of_selected_ne
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B]
    (a : Kpos) (u : M) (b : B)
    (hu : u ≠ 0) :
    fullCoeff a u b ≠ 0 := by
  intro hzero
  have hneg :
      fullNegativeCoeff u b = 0 := by
    have hsnd :=
      congrArg
        (fun z : WeilDefect.WDT16.CoeffSpace
          Kpos (FullNegativeSpace M B) => z.snd)
        hzero
    change fullNegativeCoeff u b = 0 at hsnd
    exact hsnd
  have hsel :=
    congrArg (fun z : FullNegativeSpace M B => z.fst) hneg
  apply hu
  change u = 0 at hsel
  exact hsel

/--
P3-B3 / WD-T39 fixed-packet custody in operational form.

A bounded sequence in a finite selected sector that carries a fixed positive
amount of selected mass frequently has a strongly convergent subsequence with
nonzero limit.  This is the exact subsequential content used by the audited
"limsup > 0" statement.
-/
theorem wd_t39_p3_b3_fixed_packet_custody
    {M : Type*}
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [FiniteDimensional ℂ M]
    (u : ℕ → M) (R δ : ℝ)
    (hbound : ∀ n, ‖u n‖ ≤ R)
    (hδ : 0 < δ)
    (hfreq : ∃ᶠ n in atTop, δ ≤ ‖u n‖) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ uLim : M,
        uLim ≠ 0 ∧
        Tendsto (fun n => u (φ n)) atTop (𝓝 uLim) := by
  rcases Filter.extraction_of_frequently_atTop hfreq with
    ⟨φ₁, hφ₁, hlower⟩
  have hbound₁ : ∀ n, ‖u (φ₁ n)‖ ≤ R :=
    fun n => hbound (φ₁ n)
  rcases
      WeilDefect.WDT16.exists_tendsto_subseq_finiteDimensional
        (fun n => u (φ₁ n)) R hbound₁ with
    ⟨φ₂, hφ₂, uLim, huLim⟩
  let φ : ℕ → ℕ := φ₁ ∘ φ₂
  have hφ : StrictMono φ := hφ₁.comp hφ₂
  have huLim' :
      Tendsto (fun n => u (φ n)) atTop (𝓝 uLim) := by
    simpa [φ, Function.comp_def] using huLim
  have hδle : δ ≤ ‖uLim‖ := by
    exact le_of_tendsto_of_tendsto'
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => δ) atTop (𝓝 δ))
      huLim'.norm
      (fun n => hlower (φ₂ n))
  have hu0 : uLim ≠ 0 := by
    intro hzero
    rw [hzero, norm_zero] at hδle
    linarith
  exact ⟨φ, hφ, uLim, hu0, huLim'⟩

/--
P3-B5 / WD-T39: an anchored selected negative ray survives every bounded
background weak limit.  The full coefficient ray is nonzero and its signature
can only become more negative.
-/
theorem wd_t39_p3_b5_fixed_selected_ray_stability
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [NormedSpace ℂ Kpos]
    [NormedAddCommGroup M] [NormedSpace ℂ M]
    [NormedAddCommGroup B] [NormedSpace ℂ B]
    (a : Kpos) (u : M) (b : B)
    (κ : ℝ) (hκ : 0 < κ)
    (hselected :
      WeilDefect.WDT16.jValue a u ≤ -κ) :
    u ≠ 0
      ∧ fullJValue a u b ≤ -κ - ‖b‖ ^ 2
      ∧ fullJValue a u b < 0 := by
  have hu0 : u ≠ 0 := by
    intro hu
    have hsq : 0 ≤ ‖a‖ ^ 2 := sq_nonneg _
    simp [WeilDefect.WDT16.jValue, hu] at hselected
    linarith
  constructor
  · exact hu0
  constructor
  · unfold fullJValue WeilDefect.WDT16.jValue at *
    linarith
  · unfold fullJValue WeilDefect.WDT16.jValue at *
    have hb : 0 ≤ ‖b‖ ^ 2 := sq_nonneg _
    linarith

/--
P3-B6 / WD-T39: if the unselected background converges strongly, then the
entire negative sector converges strongly while the full coefficient vector
has a fixed weak limit.  No positive-coordinate strong convergence is claimed.
-/
theorem wd_t39_p3_b6_fixed_full_divisor_negative_weak_limit
    {Kpos M B : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    {a : ℕ → Kpos} {u : ℕ → M} {b : ℕ → B}
    {aLim : Kpos} {uLim : M} {bLim : B}
    (κ : ℝ) (hκ : 0 < κ)
    (ha : WeilDefect.WDT16.WeaklyTendsto a aLim)
    (hu : Tendsto u atTop (𝓝 uLim))
    (hb : Tendsto b atTop (𝓝 bLim))
    (hselected :
      WeilDefect.WDT16.jValue aLim uLim ≤ -κ) :
    WeilDefect.WDT16.WeaklyTendsto
        (fun n => fullCoeff (a n) (u n) (b n))
        (fullCoeff aLim uLim bLim)
      ∧ Tendsto
          (fun n => fullNegativeCoeff (u n) (b n))
          atTop
          (𝓝 (fullNegativeCoeff uLim bLim))
      ∧ fullCoeff aLim uLim bLim ≠ 0
      ∧ fullJValue aLim uLim bLim
          ≤ -κ - ‖bLim‖ ^ 2
      ∧ fullJValue aLim uLim bLim < 0 := by
  have hstable :=
    wd_t39_p3_b5_fixed_selected_ray_stability
      aLim uLim bLim κ hκ hselected
  have hweak :=
    weaklyTendsto_fullCoeff ha hu hb
  have hneg :=
    tendsto_fullNegativeCoeff hu hb
  have hfull0 :=
    fullCoeff_ne_zero_of_selected_ne
      aLim uLim bLim hstable.1
  exact ⟨hweak, hneg, hfull0,
    hstable.2.1, hstable.2.2⟩

/--
P3-B7 / WD-T39 finite-shadow separation.

Finite positive-coordinate shadows preserve the selected algebraic negative
margin, while graph admissibility remains a separate condition controlled by
the discarded positive component.
-/
theorem wd_t39_p3_b7_finite_shadow_separation
    {Kpos M : Type*}
    [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
    [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
    (X : M →L[ℂ] Kpos)
    (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
    (a : Kpos) (u : M) (κ : ℝ)
    (hmargin : WeilDefect.WDT14.shadowMargin a u = κ)
    (hκ : 0 < κ)
    (hgraph : u = -((X†) a)) :
    WeilDefect.WDT14.shadowMargin (U.starProjection a) u ≥ κ
      ∧
    (u = -((X†) (U.starProjection a))
      ↔ (X†) (a - U.starProjection a) = 0) := by
  constructor
  · exact
      (WeilDefect.WDT14.wd_t14_positive_shadow_preserves_negative_margin
        U a u κ hmargin hκ).1
  · exact
      WeilDefect.WDT14.wd_t14_graph_shadow_admissible_iff
        X U a u hgraph

/--
A full-carrier coordinate exhaustion.  Finite-dimensionality of every block
records the finite-rank morphology; the weak-zero implication below uses the
strong approximate-identity and self-adjointness properties.
-/
structure FullCoordinateExhaustion
    (K : Type*)
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K] where
  block : ℕ → K →L[ℂ] K
  rangeFinite : ∀ R, FiniteDimensional ℂ (block R).range
  selfAdjoint : ∀ R, (block R)† = block R
  strongToId : ∀ z : K, Tendsto (fun R => block R z) atTop (𝓝 z)

/--
Continuous linear maps preserve Hilbert weak convergence.  This helper is
used to pass a weak coefficient limit through a synthesis map.
-/
theorem weaklyTendsto_map
    {K H : Type*}
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : K →L[ℂ] H)
    {w : ℕ → K} {wLim : K}
    (hweak : WeilDefect.WDT16.WeaklyTendsto w wLim) :
    WeilDefect.WDT16.WeaklyTendsto
      (fun n => S (w n)) (S wLim) := by
  intro y
  have h := hweak ((S†) y)
  simpa [ContinuousLinearMap.adjoint_inner_right] using h

/-- A weak coefficient limit whose synthesized images converge strongly to
zero lies in the synthesis kernel. -/
theorem weak_limit_mem_kernel_of_image_tendsto_zero
    {K H : Type*}
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : K →L[ℂ] H)
    {w : ℕ → K} {wLim : K}
    (hweak : WeilDefect.WDT16.WeaklyTendsto w wLim)
    (himage : Tendsto (fun n => S (w n)) atTop (𝓝 0)) :
    S wLim = 0 := by
  have hmap := weaklyTendsto_map S hweak
  apply ext_inner_right ℂ
  intro y
  have hweakY := hmap y
  have hc : Continuous (fun x : H => inner ℂ x y) := by
    fun_prop
  have hstrongY :
      Tendsto (fun n => inner ℂ (S (w n)) y)
        atTop (𝓝 0) := by
    simpa only [Function.comp_def, inner_zero_left] using
      (hc.tendsto 0).comp himage
  have heq :=
    tendsto_nhds_unique hweakY hstrongY
  simpa using heq

/--
P3-B1 / WD-T39 anchored-mass theorem.

Once a fixed finite coordinate block converges strongly along the chosen weak
subsequence and retains a positive amount of mass, the weak limit is nonzero.
If the synthesized witnesses simultaneously converge strongly to zero, that
nonzero limit lies in the synthesis kernel.
-/
theorem wd_t39_p3_b1_anchored_mass
    {K H : Type*}
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (S : K →L[ℂ] H)
    (Q : K →L[ℂ] K)
    {w : ℕ → K} {wLim : K}
    (δ : ℝ) (hδ : 0 < δ)
    (hweak : WeilDefect.WDT16.WeaklyTendsto w wLim)
    (hQ :
      Tendsto (fun n => Q (w n)) atTop (𝓝 (Q wLim)))
    (hanchor : ∀ᶠ n in atTop, δ ≤ ‖Q (w n)‖)
    (himage : Tendsto (fun n => S (w n)) atTop (𝓝 0)) :
    wLim ≠ 0 ∧ S wLim = 0 := by
  have hδle : δ ≤ ‖Q wLim‖ :=
    le_of_tendsto_of_tendsto
      (tendsto_const_nhds :
        Tendsto (fun _ : ℕ => δ) atTop (𝓝 δ))
      hQ.norm hanchor
  have hw0 : wLim ≠ 0 := by
    intro hw
    rw [hw, map_zero, norm_zero] at hδle
    linarith
  exact ⟨hw0,
    weak_limit_mem_kernel_of_image_tendsto_zero
      S hweak himage⟩

/--
P3-B2 / WD-T39 full-coefficient moving-sector escape.

For a uniformly normalized sequence in the full coefficient carrier, if every
fixed block of a self-adjoint strong coordinate exhaustion vanishes strongly,
then the whole sequence converges weakly to zero.  The exhaustion acts on the
full carrier; no selected-negative-only projection appears in the statement.
-/
theorem wd_t39_p3_b2_full_coordinate_escape_weak_zero
    {K : Type*}
    [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    (E : FullCoordinateExhaustion K)
    (w : ℕ → K)
    (hbound : ∀ n, ‖w n‖ ≤ 1)
    (hblock :
      ∀ R,
        Tendsto (fun n => E.block R (w n))
          atTop (𝓝 0)) :
    WeilDefect.WDT16.WeaklyTendsto w 0 := by
  intro z
  simp only [inner_zero_left]
  rw [Metric.tendsto_atTop]
  intro ε hε
  have hε4 : 0 < ε / 4 := by linarith
  have hε2 : 0 < ε / 2 := by linarith
  rcases
      Metric.tendsto_atTop.mp (E.strongToId z)
        (ε / 4) hε4 with
    ⟨R, hR⟩
  have hzApprox :
      ‖z - E.block R z‖ < ε / 4 := by
    have hz := hR R le_rfl
    simpa [dist_eq_norm, norm_sub_rev] using hz
  have hinnerBlock :
      Tendsto
        (fun n => inner ℂ (E.block R (w n)) z)
        atTop (𝓝 0) := by
    have hc : Continuous (fun x : K => inner ℂ x z) := by
      fun_prop
    simpa only [Function.comp_def, inner_zero_left] using
      (hc.tendsto 0).comp (hblock R)
  rcases
      Metric.tendsto_atTop.mp hinnerBlock
        (ε / 2) hε2 with
    ⟨N, hN⟩
  refine ⟨N, ?_⟩
  intro n hn
  have hblockInner :
      ‖inner ℂ (E.block R (w n)) z‖ < ε / 2 := by
    have h := hN n hn
    simpa [dist_eq_norm] using h
  have hfirst :
      ‖inner ℂ (w n) (z - E.block R z)‖ < ε / 4 := by
    calc
      ‖inner ℂ (w n) (z - E.block R z)‖
          ≤ ‖w n‖ * ‖z - E.block R z‖ :=
        norm_inner_le_norm _ _
      _ ≤ 1 * ‖z - E.block R z‖ := by
        exact mul_le_mul_of_nonneg_right
          (hbound n) (norm_nonneg _)
      _ < ε / 4 := by
        simpa using hzApprox
  have hsecondEq :
      inner ℂ (w n) (E.block R z)
        =
      inner ℂ (E.block R (w n)) z := by
    calc
      inner ℂ (w n) (E.block R z)
          =
        inner ℂ (w n)
          (ContinuousLinearMap.adjoint (E.block R) z) := by
          rw [E.selfAdjoint R]
      _ = inner ℂ (E.block R (w n)) z :=
        ContinuousLinearMap.adjoint_inner_right
          (E.block R) (w n) z
  have hsecond :
      ‖inner ℂ (w n) (E.block R z)‖ < ε / 2 := by
    rw [hsecondEq]
    exact hblockInner
  have hdecomp :
      inner ℂ (w n) z
        =
      inner ℂ (w n) (z - E.block R z)
        + inner ℂ (w n) (E.block R z) := by
    calc
      inner ℂ (w n) z
          =
        inner ℂ (w n)
          ((z - E.block R z) + E.block R z) := by
            congr 1
            abel
      _ =
        inner ℂ (w n) (z - E.block R z)
          + inner ℂ (w n) (E.block R z) := by
            rw [inner_add_right]
  have htotal :
      ‖inner ℂ (w n) z‖ < ε := by
    rw [hdecomp]
    calc
      ‖inner ℂ (w n) (z - E.block R z)
          + inner ℂ (w n) (E.block R z)‖
          ≤
        ‖inner ℂ (w n) (z - E.block R z)‖
          + ‖inner ℂ (w n) (E.block R z)‖ :=
        norm_add_le _ _
      _ < ε / 4 + ε / 2 :=
        add_lt_add hfirst hsecond
      _ < ε := by linarith
  simpa [dist_eq_norm] using htotal



/--
Explicit index extraction for a norm-unbounded sequence.  The hypothesis says
that after every index and above every real threshold there is a later term
whose norm exceeds that threshold.
-/
noncomputable def normEscapeSubsequence
    {B : Type*}
    [NormedAddCommGroup B]
    (b : ℕ → B)
    (htail :
      ∀ (N : ℕ) (x : ℝ),
        ∃ n : ℕ, N < n ∧ x < ‖b n‖) :
    ℕ → ℕ
  | 0 => Classical.choose (htail 0 0)
  | n + 1 =>
      Classical.choose
        (htail
          (normEscapeSubsequence b htail n)
          ((n + 1 : ℕ) : ℝ))

theorem normEscapeSubsequence_strictMono
    {B : Type*}
    [NormedAddCommGroup B]
    (b : ℕ → B)
    (htail :
      ∀ (N : ℕ) (x : ℝ),
        ∃ n : ℕ, N < n ∧ x < ‖b n‖) :
    StrictMono (normEscapeSubsequence b htail) := by
  apply strictMono_nat_of_lt_succ
  intro n
  simpa [normEscapeSubsequence] using
    (Classical.choose_spec
      (htail
        (normEscapeSubsequence b htail n)
        ((n + 1 : ℕ) : ℝ))).1

theorem normEscapeSubsequence_norm_lower
    {B : Type*}
    [NormedAddCommGroup B]
    (b : ℕ → B)
    (htail :
      ∀ (N : ℕ) (x : ℝ),
        ∃ n : ℕ, N < n ∧ x < ‖b n‖)
    (n : ℕ) :
    (n : ℝ) ≤ ‖b (normEscapeSubsequence b htail n)‖ := by
  cases n with
  | zero =>
      simpa using norm_nonneg (b (normEscapeSubsequence b htail 0))
  | succ n =>
      have h :=
        (Classical.choose_spec
          (htail
            (normEscapeSubsequence b htail n)
            ((n + 1 : ℕ) : ℝ))).2
      exact le_of_lt (by
        simpa [normEscapeSubsequence] using h)

/--
B-infinity extraction: failure of every uniform background norm bound produces
a strictly indexed subsequence whose norms tend to +infinity.
-/
theorem wd_t39_p3_b4_norm_escape_of_unbounded
    {B : Type*}
    [NormedAddCommGroup B]
    (b : ℕ → B)
    (hunbounded :
      ¬ ∃ R : ℝ, ∀ n, ‖b n‖ ≤ R) :
    ∃ φ : ℕ → ℕ,
      StrictMono φ ∧
      Tendsto (fun n => ‖b (φ n)‖) atTop atTop := by
  have hnotRange :
      ¬ BddAbove (Set.range (fun n => ‖b n‖)) := by
    intro h
    rcases h with ⟨R, hR⟩
    apply hunbounded
    refine ⟨R, ?_⟩
    intro n
    exact hR (Set.mem_range_self n)
  have htail :
      ∀ (N : ℕ) (x : ℝ),
        ∃ n : ℕ, N < n ∧ x < ‖b n‖ := by
    intro N x
    let S : ℝ :=
      ∑ i ∈ Finset.range (N + 1), ‖b i‖
    let M : ℝ := max x S
    rcases (not_bddAbove_iff.mp hnotRange M) with
      ⟨y, hy, hMy⟩
    rcases hy with ⟨n, rfl⟩
    refine ⟨n, ?_, ?_⟩
    · by_contra hN
      have hnle : n ≤ N := Nat.le_of_not_gt hN
      have hnmem : n ∈ Finset.range (N + 1) :=
        Finset.mem_range.mpr (Nat.lt_succ_of_le hnle)
      have hnormSum : ‖b n‖ ≤ S := by
        dsimp [S]
        exact Finset.single_le_sum
          (fun i _ => norm_nonneg (b i)) hnmem
      have hSM : S ≤ M := le_max_right _ _
      exact (not_lt_of_ge (hnormSum.trans hSM)) hMy
    · exact (le_max_left x S).trans_lt hMy
  let φ := normEscapeSubsequence b htail
  have hφ : StrictMono φ := by
    simpa [φ] using normEscapeSubsequence_strictMono b htail
  have hlower :
      ∀ n : ℕ, (n : ℝ) ≤ ‖b (φ n)‖ := by
    intro n
    simpa [φ] using
      normEscapeSubsequence_norm_lower b htail n
  have hnorm :
      Tendsto (fun n => ‖b (φ n)‖) atTop atTop :=
    tendsto_atTop_mono hlower tendsto_natCast_atTop_atTop
  exact ⟨φ, hφ, hnorm⟩

/-- The two possible regimes after imposing a uniform background bound. -/
inductive BoundedBackgroundRegime
    {B : Type*}
    [NormedAddCommGroup B] [InnerProductSpace ℂ B]
    (b : ℕ → B) : Prop where
  | weakTailEscape
      (φ : ℕ → ℕ) (bLim : B) (L : ℝ)
      (hφ : StrictMono φ)
      (hweak :
        WeilDefect.WDT16.WeaklyTendsto
          (fun n => b (φ n)) bLim)
      (hnormSq :
        Tendsto (fun n => ‖b (φ n)‖ ^ 2)
          atTop (𝓝 L))
      (defect_pos : 0 < L - ‖bLim‖ ^ 2)
  | strongCompact
      (φ : ℕ → ℕ) (bLim : B)
      (hφ : StrictMono φ)
      (hstrong :
        Tendsto (fun n => b (φ n))
          atTop (𝓝 bLim))

/--
P3-B4 bounded-background dichotomy.

Every uniformly bounded Hilbert-space background sequence has a subsequence
which is either strongly compact, or weakly convergent with a strictly
positive norm-square loss.  This is precisely the BT/BF split after the
unbounded B-infinity regime has been excluded.
-/
theorem wd_t39_p3_b4_bounded_background_dichotomy
    {B : Type*}
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    (b : ℕ → B) (R : ℝ)
    (hbound : ∀ n, ‖b n‖ ≤ R) :
    BoundedBackgroundRegime b := by
  have hR : 0 ≤ R :=
    (norm_nonneg (b 0)).trans (hbound 0)
  rcases
      WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le
        b R hR hbound with
    ⟨φ₁, hφ₁, bLim, hweak₁, hbLim⟩
  let s : ℕ → ℝ := fun n => ‖b (φ₁ n)‖ ^ 2
  have hsMem :
      ∀ n, s n ∈ Set.Icc (0 : ℝ) (R ^ 2) := by
    intro n
    constructor
    · exact sq_nonneg _
    · have hb := hbound (φ₁ n)
      have hbn : 0 ≤ ‖b (φ₁ n)‖ := norm_nonneg _
      nlinarith
  rcases
      (isCompact_Icc :
        IsCompact (Set.Icc (0 : ℝ) (R ^ 2))).tendsto_subseq
          hsMem with
    ⟨L, hLmem, φ₂, hφ₂, hsq⟩
  let φ : ℕ → ℕ := φ₁ ∘ φ₂
  have hφ : StrictMono φ := hφ₁.comp hφ₂
  have hweak :
      WeilDefect.WDT16.WeaklyTendsto
        (fun n => b (φ n)) bLim := by
    intro z
    simpa [φ, Function.comp_def] using
      (hweak₁ z).comp hφ₂.tendsto_atTop
  have hsq' :
      Tendsto (fun n => ‖b (φ n)‖ ^ 2)
        atTop (𝓝 L) := by
    simpa [s, φ, Function.comp_def] using hsq
  have hle :
      ‖bLim‖ ^ 2 ≤ L :=
    WeilDefect.WDT16.weaklyTendsto_norm_sq_le_of_tendsto
      hweak hsq'
  by_cases heq : ‖bLim‖ ^ 2 = L
  · have hsqLim :
        Tendsto (fun n => ‖b (φ n)‖ ^ 2)
          atTop (𝓝 (‖bLim‖ ^ 2)) := by
      simpa [heq] using hsq'
    have hstrong :=
      WeilDefect.WDT17.weaklyTendsto_strong_of_norm_sq_tendsto
        hweak hsqLim
    exact
      BoundedBackgroundRegime.strongCompact
        φ bLim hφ hstrong
  · have hlt : ‖bLim‖ ^ 2 < L :=
      lt_of_le_of_ne hle heq
    exact
      BoundedBackgroundRegime.weakTailEscape
        φ bLim L hφ hweak hsq'
        (sub_pos.mpr hlt)


/-- Full P3-B4 subsequential background compactness classification. -/
inductive BackgroundCompactnessRegime
    {B : Type*}
    [NormedAddCommGroup B] [InnerProductSpace ℂ B]
    (b : ℕ → B) : Prop where
  | normEscape
      (φ : ℕ → ℕ)
      (hφ : StrictMono φ)
      (hnorm :
        Tendsto (fun n => ‖b (φ n)‖) atTop atTop)
  | weakTailEscape
      (φ : ℕ → ℕ) (bLim : B) (L : ℝ)
      (hφ : StrictMono φ)
      (hweak :
        WeilDefect.WDT16.WeaklyTendsto
          (fun n => b (φ n)) bLim)
      (hnormSq :
        Tendsto (fun n => ‖b (φ n)‖ ^ 2)
          atTop (𝓝 L))
      (defect_pos : 0 < L - ‖bLim‖ ^ 2)
  | strongCompact
      (φ : ℕ → ℕ) (bLim : B)
      (hφ : StrictMono φ)
      (hstrong :
        Tendsto (fun n => b (φ n))
          atTop (𝓝 bLim))

/--
P3-B4 / WD-T39 full background trichotomy.

Every Hilbert-space background sequence has a subsequence in exactly one of the
three morphology species produced here: norm escape, bounded weak/tail escape,
or strong background compactness.  The theorem does not claim full positive
coefficient compactness.
-/
theorem wd_t39_p3_b4_background_compactness_trichotomy
    {B : Type*}
    [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
    (b : ℕ → B) :
    BackgroundCompactnessRegime b := by
  by_cases hbdd : ∃ R : ℝ, ∀ n, ‖b n‖ ≤ R
  · rcases hbdd with ⟨R, hR⟩
    cases wd_t39_p3_b4_bounded_background_dichotomy b R hR with
    | weakTailEscape φ bLim L hφ hweak hnormSq hdef =>
        exact BackgroundCompactnessRegime.weakTailEscape
          φ bLim L hφ hweak hnormSq hdef
    | strongCompact φ bLim hφ hstrong =>
        exact BackgroundCompactnessRegime.strongCompact
          φ bLim hφ hstrong
  · rcases wd_t39_p3_b4_norm_escape_of_unbounded b hbdd with
      ⟨φ, hφ, hnorm⟩
    exact BackgroundCompactnessRegime.normEscape φ hφ hnorm



/--
Universal package for WD-T39 / P3-B1...P3-B7.

The fields deliberately quantify the selected/full-carrier and background
problems separately.  In particular, this package does not assert that one
sequence simultaneously realizes moving-sector escape and a fixed selected
negative ray.
-/
structure NoncompactDefectMorphology : Prop where
  anchoredMass :
    ∀ {K H : Type*}
      [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
      [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
      (S : K →L[ℂ] H)
      (Q : K →L[ℂ] K)
      {w : ℕ → K} {wLim : K}
      (δ : ℝ), 0 < δ →
      WeilDefect.WDT16.WeaklyTendsto w wLim →
      Tendsto (fun n => Q (w n)) atTop (𝓝 (Q wLim)) →
      (∀ᶠ n in atTop, δ ≤ ‖Q (w n)‖) →
      Tendsto (fun n => S (w n)) atTop (𝓝 0) →
      wLim ≠ 0 ∧ S wLim = 0
  fullCoordinateEscape :
    ∀ {K : Type*}
      [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
      (E : FullCoordinateExhaustion K)
      (w : ℕ → K),
      (∀ n, ‖w n‖ ≤ 1) →
      (∀ R,
        Tendsto (fun n => E.block R (w n))
          atTop (𝓝 0)) →
      WeilDefect.WDT16.WeaklyTendsto w 0
  fixedPacketCustody :
    ∀ {M : Type*}
      [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
      [FiniteDimensional ℂ M]
      (u : ℕ → M) (R δ : ℝ),
      (∀ n, ‖u n‖ ≤ R) →
      0 < δ →
      (∃ᶠ n in atTop, δ ≤ ‖u n‖) →
      ∃ φ : ℕ → ℕ, StrictMono φ ∧
        ∃ uLim : M,
          uLim ≠ 0 ∧
          Tendsto (fun n => u (φ n)) atTop (𝓝 uLim)
  backgroundTrichotomy :
    ∀ {B : Type*}
      [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
      (b : ℕ → B),
      BackgroundCompactnessRegime b
  selectedRayStability :
    ∀ {Kpos M B : Type*}
      [NormedAddCommGroup Kpos] [NormedSpace ℂ Kpos]
      [NormedAddCommGroup M] [NormedSpace ℂ M]
      [NormedAddCommGroup B] [NormedSpace ℂ B]
      (a : Kpos) (u : M) (b : B)
      (κ : ℝ), 0 < κ →
      WeilDefect.WDT16.jValue a u ≤ -κ →
      u ≠ 0
        ∧ fullJValue a u b ≤ -κ - ‖b‖ ^ 2
        ∧ fullJValue a u b < 0
  fixedFullDivisorWeakLimit :
    ∀ {Kpos M B : Type*}
      [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
      [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
      [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]
      {a : ℕ → Kpos} {u : ℕ → M} {b : ℕ → B}
      {aLim : Kpos} {uLim : M} {bLim : B}
      (κ : ℝ), 0 < κ →
      WeilDefect.WDT16.WeaklyTendsto a aLim →
      Tendsto u atTop (𝓝 uLim) →
      Tendsto b atTop (𝓝 bLim) →
      WeilDefect.WDT16.jValue aLim uLim ≤ -κ →
      WeilDefect.WDT16.WeaklyTendsto
          (fun n => fullCoeff (a n) (u n) (b n))
          (fullCoeff aLim uLim bLim)
        ∧ Tendsto
            (fun n => fullNegativeCoeff (u n) (b n))
            atTop
            (𝓝 (fullNegativeCoeff uLim bLim))
        ∧ fullCoeff aLim uLim bLim ≠ 0
        ∧ fullJValue aLim uLim bLim
            ≤ -κ - ‖bLim‖ ^ 2
        ∧ fullJValue aLim uLim bLim < 0
  finiteShadowSeparation :
    ∀ {Kpos M : Type*}
      [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
      [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
      (X : M →L[ℂ] Kpos)
      (U : Submodule ℂ Kpos) [U.HasOrthogonalProjection]
      (a : Kpos) (u : M) (κ : ℝ),
      WeilDefect.WDT14.shadowMargin a u = κ →
      0 < κ →
      u = -((X†) a) →
      WeilDefect.WDT14.shadowMargin (U.starProjection a) u ≥ κ
        ∧
      (u = -((X†) (U.starProjection a))
        ↔ (X†) (a - U.starProjection a) = 0)

/--
WD-T39 / P3-B1...P3-B7 assembled.

This theorem is purely internal Hilbert-space/operator morphology.  It adds no
new RH-facing interface and preserves the audited distinctions:
full-carrier escape is not selected-negative-only escape, background strong
compactness does not imply positive-coordinate strong compactness, and
background escape cannot erase an already anchored selected negative ray.
-/
theorem wd_t39_noncompact_background_morphology :
    NoncompactDefectMorphology := by
  refine {
    anchoredMass := ?_
    fullCoordinateEscape := ?_
    fixedPacketCustody := ?_
    backgroundTrichotomy := ?_
    selectedRayStability := ?_
    fixedFullDivisorWeakLimit := ?_
    finiteShadowSeparation := ?_
  }
  · intro K H _ _ _ _ _ _ S Q w wLim δ hδ hweak hQ hanchor himage
    exact wd_t39_p3_b1_anchored_mass
      S Q δ hδ hweak hQ hanchor himage
  · intro K _ _ _ E w hbound hblock
    exact wd_t39_p3_b2_full_coordinate_escape_weak_zero
      E w hbound hblock
  · intro M _ _ _ _ u R δ hbound hδ hfreq
    exact wd_t39_p3_b3_fixed_packet_custody
      u R δ hbound hδ hfreq
  · intro B _ _ _ b
    exact wd_t39_p3_b4_background_compactness_trichotomy b
  · intro Kpos M B _ _ _ _ _ _ a u b κ hκ hselected
    exact wd_t39_p3_b5_fixed_selected_ray_stability
      a u b κ hκ hselected
  · intro Kpos M B _ _ _ _ _ _ _ _ _ a u b aLim uLim bLim
      κ hκ ha hu hb hselected
    exact wd_t39_p3_b6_fixed_full_divisor_negative_weak_limit
      κ hκ ha hu hb hselected
  · intro Kpos M _ _ _ _ _ _ X U _ a u κ hmargin hκ hgraph
    exact wd_t39_p3_b7_finite_shadow_separation
      X U a u κ hmargin hκ hgraph


end WeilDefect
