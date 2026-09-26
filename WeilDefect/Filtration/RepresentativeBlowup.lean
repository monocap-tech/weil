import WeilDefect.Filtration.EndpointJump
import WeilDefect.Filtration.FiniteNegativeSector
import Mathlib

namespace WeilDefect.WDT19

open Filter
open scoped Topology InnerProduct

variable {P K : Type*}
variable [NormedAddCommGroup P] [InnerProductSpace ℂ P] [CompleteSpace P]
variable [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- Closed coefficient image of a physical closed subspace. -/
noncomputable def analysisSpace
    (T : P →L[ℂ] K)
    (S : ClosedSubmodule ℂ P) : ClosedSubmodule ℂ K :=
  Submodule.closure (S.toSubmodule.map T.toLinearMap)

/-- Strong convergence implies the project weak-convergence predicate. -/
theorem weaklyTendsto_of_tendsto
    {v : ℕ → P} {x : P}
    (h : Tendsto v atTop (𝓝 x)) :
    WeilDefect.WDT16.WeaklyTendsto v x := by
  intro z
  have hc : Continuous (fun w : P => inner ℂ w z) := by
    fun_prop
  exact (hc.tendsto x).comp h

/-- Bounded complex-linear maps preserve weak convergence. -/
theorem weaklyTendsto_map
    (T : P →L[ℂ] K)
    {v : ℕ → P} {x : P}
    (h : WeilDefect.WDT16.WeaklyTendsto v x) :
    WeilDefect.WDT16.WeaklyTendsto (fun n => T (v n)) (T x) := by
  intro z
  have hz := h ((T†) z)
  simpa [ContinuousLinearMap.adjoint_inner_right] using hz

/-- Weak limits are unique in a complex Hilbert space. -/
theorem weaklyTendsto_unique
    {v : ℕ → P} {x y : P}
    (hx : WeilDefect.WDT16.WeaklyTendsto v x)
    (hy : WeilDefect.WDT16.WeaklyTendsto v y) :
    x = y := by
  apply ext_inner_right ℂ
  intro z
  exact tendsto_nhds_unique (hx z) (hy z)

/--
A weak limit of vectors drawn from a monotone physical filtration belongs to
the physical right-limit intersection.
-/
theorem weak_limit_mem_physical_rightLimit
    (S : ℝ → ClosedSubmodule ℂ P)
    (c : ℝ) (t : ℕ → ℝ)
    (hS : Monotone S)
    (ht : Tendsto t atTop (𝓝 c))
    {v : ℕ → P} {x : P}
    (hmem : ∀ n, v n ∈ S (t n))
    (hweak : WeilDefect.WDT16.WeaklyTendsto v x) :
    x ∈ WeilDefect.WDT15.rightLimit S c := by
  rw [WeilDefect.WDT15.rightLimit]
  rw [ClosedSubmodule.mem_iInf]
  intro s
  have hev : ∀ᶠ n in atTop, t n < s.1 :=
    ht.eventually (Iio_mem_nhds s.2)
  have hevMem : ∀ᶠ n in atTop, v n ∈ S s.1 :=
    hev.mono fun n hn => hS hn.le (hmem n)
  have hxoo : x ∈ (S s.1)ᗮᗮ := by
    rw [((S s.1)ᗮ).mem_orthogonal']
    intro z hz
    have hzS := ((S s.1).mem_orthogonal z).mp hz
    have heq :
        (fun n => inner ℂ (v n) z) =ᶠ[atTop] (fun _ => 0) :=
      hevMem.mono fun n hn => hzS (v n) hn
    have hzero :
        Tendsto (fun n => inner ℂ (v n) z) atTop (𝓝 0) :=
      tendsto_const_nhds.congr' heq.symm
    exact tendsto_nhds_unique (hweak z) hzero
  simpa using hxoo

/--
WD-C7: a genuinely new right-limit coefficient vector cannot be represented
arbitrarily close to the endpoint by a norm-bounded physical sequence.
Every convergent representative sequence has norm tending to infinity.
-/
theorem wd_t19_endpoint_representative_blowup
    (S : ℝ → ClosedSubmodule ℂ P)
    (T : P →L[ℂ] K)
    (c : ℝ)
    (hS : Monotone S)
    (hrc : S c = WeilDefect.WDT15.rightLimit S c)
    (y : K)
    (hnew : y ∉ analysisSpace T (S c))
    (t : ℕ → ℝ)
    (ht : Tendsto t atTop (𝓝 c))
    (h : ℕ → P)
    (hmem : ∀ n, h n ∈ S (t n))
    (himage : Tendsto (fun n => T (h n)) atTop (𝓝 y)) :
    Tendsto (fun n => ‖h n‖) atTop atTop := by
  refine tendsto_atTop.2 ?_
  intro R
  by_contra hR
  rw [Filter.not_eventually] at hR
  rcases extraction_of_frequently_atTop hR with
    ⟨φ, hφ, hφR⟩
  have hbound : ∀ n, ‖h (φ n)‖ ≤ R := by
    intro n
    exact le_of_lt (not_le.mp (hφR n))
  have hR0 : 0 ≤ R := by
    have hlt := not_le.mp (hφR 0)
    exact le_trans (norm_nonneg _) hlt.le
  rcases
      WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le
        (fun n => h (φ n)) R hR0 hbound with
    ⟨ψ, hψ, x, hxWeak, _⟩
  let χ : ℕ → ℕ := φ ∘ ψ
  have hχ : StrictMono χ := hφ.comp hψ
  have hxWeak' :
      WeilDefect.WDT16.WeaklyTendsto
        (fun n => h (χ n)) x := by
    simpa [χ, Function.comp_def] using hxWeak
  have htχ :
      Tendsto (fun n => t (χ n)) atTop (𝓝 c) :=
    ht.comp hχ.tendsto_atTop
  have hxRight :
      x ∈ WeilDefect.WDT15.rightLimit S c :=
    weak_limit_mem_physical_rightLimit
      S c (fun n => t (χ n)) hS htχ
      (fun n => hmem (χ n)) hxWeak'
  have hxEndpoint : x ∈ S c := by
    rw [hrc]
    exact hxRight
  have hStrongImage :
      Tendsto (fun n => T (h (χ n))) atTop (𝓝 y) :=
    himage.comp hχ.tendsto_atTop
  have hWeakImageY :
      WeilDefect.WDT16.WeaklyTendsto
        (fun n => T (h (χ n))) y :=
    weaklyTendsto_of_tendsto hStrongImage
  have hWeakImageTx :
      WeilDefect.WDT16.WeaklyTendsto
        (fun n => T (h (χ n))) (T x) :=
    weaklyTendsto_map T hxWeak'
  have hTx : T x = y :=
    weaklyTendsto_unique hWeakImageTx hWeakImageY
  apply hnew
  rw [← hTx]
  unfold analysisSpace
  apply Submodule.le_topologicalClosure
  exact ⟨x, hxEndpoint, rfl⟩

/--
Boundary amplification in explicit local form: every fixed physical norm
budget is eventually excluded when both the support endpoint gap and the
coefficient approximation error are small.
-/
def BoundaryAmplifies
    (S : ℝ → ClosedSubmodule ℂ P)
    (T : P →L[ℂ] K)
    (c : ℝ) (y : K) : Prop :=
  ∀ M : ℝ, 0 < M →
    ∃ δ : ℝ, 0 < δ ∧
      ∃ η : ℝ, 0 < η ∧
        ∀ t : ℝ, c < t → t < c + δ →
          ∀ h : P, h ∈ S t →
            ‖T h - y‖ < η →
              M < ‖h‖

/--
WD-C8: a new endpoint coefficient vector has a boundary-amplification
neighborhood for every finite physical norm budget.
-/
theorem wd_t19_boundary_amplification
    (S : ℝ → ClosedSubmodule ℂ P)
    (T : P →L[ℂ] K)
    (c : ℝ)
    (hS : Monotone S)
    (hrc : S c = WeilDefect.WDT15.rightLimit S c)
    (y : K)
    (hnew : y ∉ analysisSpace T (S c)) :
    BoundaryAmplifies S T c y := by
  by_contra hAmp
  unfold BoundaryAmplifies at hAmp
  push_neg at hAmp
  rcases hAmp with ⟨M, hM, hfail⟩
  let r : ℕ → ℝ := fun n => 1 / ((n : ℝ) + 1)
  have hrpos : ∀ n, 0 < r n := by
    intro n
    dsimp [r]
    positivity
  have hw :
      ∀ n, ∃ t : ℝ,
        c < t ∧ t < c + r n ∧
          ∃ h : P,
            h ∈ S t ∧ ‖T h - y‖ < r n ∧ ‖h‖ ≤ M := by
    intro n
    rcases hfail (r n) (hrpos n) (r n) (hrpos n) with
      ⟨t, hct, htc, h, hhmem, happ, hbudget⟩
    exact ⟨t, hct, htc, h, hhmem, happ, hbudget⟩
  choose t ht using hw
  have hexh : ∀ n, ∃ h : P,
      h ∈ S (t n) ∧ ‖T h - y‖ < r n ∧ ‖h‖ ≤ M :=
    fun n => (ht n).2.2
  choose h hh using hexh
  have hr0 : Tendsto r atTop (𝓝 0) := by
    simpa only [r] using tendsto_one_div_add_atTop_nhds_zero_nat
  have hdiff :
      Tendsto (fun n => t n - c) atTop (𝓝 0) := by
    refine squeeze_zero
      (f := fun n => t n - c) (g := r) ?_ ?_ hr0
    · intro n
      exact sub_nonneg.mpr (ht n).1.le
    · intro n
      exact sub_le_iff_le_add.mpr (by
        simpa [add_comm] using (ht n).2.1.le)
  have ht0 : Tendsto t atTop (𝓝 c) := by
    have hadd := hdiff.add_const c
    simpa [sub_add_cancel] using hadd
  have himage0 :
      Tendsto (fun n => T (h n)) atTop (𝓝 y) := by
    rw [tendsto_iff_norm_sub_tendsto_zero]
    apply squeeze_zero
    · intro n
      exact norm_nonneg _
    · intro n
      exact (hh n).2.1.le
    · exact hr0
  have hblow :=
    wd_t19_endpoint_representative_blowup
      S T c hS hrc y hnew t ht0 h
      (fun n => (hh n).1) himage0
  have hev : ∀ᶠ n in atTop, M + 1 ≤ ‖h n‖ :=
    tendsto_atTop.1 hblow (M + 1)
  rcases (eventually_atTop.1 hev) with ⟨N, hN⟩
  have hlarge := hN N le_rfl
  have hbudget := (hh N).2.2
  linarith

/--
WD-C9 normalized blow-up package. Vanishing coefficient amplitude converts
unit physical vectors into exact normalized representatives with reciprocal
norm growth.
-/
theorem wd_t19_vanishing_amplitude_normalized_blowup
    (T : P →L[ℂ] K)
    (g : ℕ → P)
    (z : ℕ → K)
    (ε : ℕ → ℝ)
    (hεpos : ∀ n, 0 < ε n)
    (hε0 : Tendsto ε atTop (𝓝 0))
    (hgnorm : ∀ n, ‖g n‖ = 1)
    (hscale : ∀ n, T (g n) = (ε n : ℂ) • z n) :
    let h : ℕ → P := fun n => ((ε n : ℂ)⁻¹) • g n
    (∀ n, T (h n) = z n)
      ∧ (∀ n, ‖h n‖ = (ε n)⁻¹)
      ∧ Tendsto (fun n => ‖h n‖) atTop atTop := by
  let h : ℕ → P := fun n => ((ε n : ℂ)⁻¹) • g n
  have hrep : ∀ n, T (h n) = z n := by
    intro n
    simp only [h, map_smul, hscale]
    rw [← mul_smul]
    have hne : (ε n : ℂ) ≠ 0 := by
      exact_mod_cast (ne_of_gt (hεpos n))
    rw [inv_mul_cancel₀ hne, one_smul]
  have hnorm : ∀ n, ‖h n‖ = (ε n)⁻¹ := by
    intro n
    change ‖((ε n : ℂ)⁻¹) • g n‖ = (ε n)⁻¹
    rw [norm_smul, hgnorm n, mul_one]
    have hpos := hεpos n
    simp [Complex.norm_real, abs_of_pos hpos]
  have hεWithin : Tendsto ε atTop (𝓝[>] (0 : ℝ)) := by
    refine tendsto_nhdsWithin_iff.mpr ⟨hε0, ?_⟩
    exact Eventually.of_forall hεpos
  have hinv :
      Tendsto (fun n => (ε n)⁻¹) atTop atTop :=
    tendsto_inv_nhdsGT_zero.comp hεWithin
  refine ⟨hrep, hnorm, ?_⟩
  exact hinv.congr' (Eventually.of_forall fun n => (hnorm n).symm)

end WeilDefect.WDT19
