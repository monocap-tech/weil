import WeilDefect.Filtration.RightLimit
import Mathlib.Analysis.InnerProductSpace.Dual
import Mathlib.Analysis.InnerProductSpace.ProdL2
import Mathlib.Analysis.Normed.Module.WeakDual
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib

namespace WeilDefect.WDT16

open Filter
open scoped Topology InnerProduct

variable {Kpos M : Type*}
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]

abbrev CoeffSpace (Kpos M : Type*) [NormedAddCommGroup Kpos]
    [InnerProductSpace ℂ Kpos] [NormedAddCommGroup M] [InnerProductSpace ℂ M] :=
  WithLp 2 (Kpos × M)

def coeff (a : Kpos) (u : M) : CoeffSpace Kpos M :=
  WithLp.toLp 2 (a, u)

@[simp] theorem coeff_fst (a : Kpos) (u : M) :
    (coeff a u).fst = a := rfl

@[simp] theorem coeff_snd (a : Kpos) (u : M) :
    (coeff a u).snd = u := rfl

/-- Krein-signature value for the fixed positive/negative splitting. -/
def jValue (a : Kpos) (u : M) : ℝ :=
  ‖a‖ ^ 2 - ‖u‖ ^ 2

/-- Weak convergence expressed by convergence of all Hilbert pairings. -/
def WeaklyTendsto {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (v : ℕ → E) (x : E) : Prop :=
  ∀ z : E,
    Tendsto (fun n => inner ℂ (v n) z) atTop (𝓝 (inner ℂ x z))

/--
Every norm-bounded sequence in an arbitrary complex Hilbert space has a
weakly convergent subsequence. The proof localizes to the separable closed
span of the sequence and applies sequential Banach-Alaoglu through the Riesz
isometry.
-/
theorem exists_weaklyTendsto_subseq_of_norm_le
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    (v : ℕ → E) (R : ℝ) (hR : 0 ≤ R)
    (hv : ∀ n, ‖v n‖ ≤ R) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ x : E, WeaklyTendsto (fun n => v (φ n)) x ∧ ‖x‖ ≤ R := by
  let S : Submodule ℂ E :=
    (Submodule.span ℂ (Set.range v)).topologicalClosure
  letI : CompleteSpace S :=
    (Submodule.isClosed_topologicalClosure _).completeSpace_coe
  have hsepS : TopologicalSpace.IsSeparable (S : Set E) := by
    simpa [S] using (Set.countable_range v).isSeparable.span.closure
  letI : TopologicalSpace.SeparableSpace S := hsepS.separableSpace
  let vS : ℕ → S := fun n =>
    ⟨v n, by
      apply Submodule.le_topologicalClosure
      exact Submodule.subset_span (Set.mem_range_self n)⟩
  let f : ℕ → WeakDual ℂ S := fun n =>
    StrongDual.toWeakDual (InnerProductSpace.toDual ℂ S (vS n))
  have hfmem :
      ∀ n, f n ∈
        WeakDual.toStrongDual ⁻¹'
          Metric.closedBall (0 : StrongDual ℂ S) R := by
    intro n
    change dist (WeakDual.toStrongDual (f n)) 0 ≤ R
    change dist (InnerProductSpace.toDual ℂ S (vS n)) 0 ≤ R
    rw [dist_zero_right, (InnerProductSpace.toDual ℂ S).norm_map]
    simpa [vS] using hv n
  rcases
      (WeakDual.isSeqCompact_closedBall
        ℂ S (0 : StrongDual ℂ S) R) hfmem with
    ⟨fLim, hfLim, φ, hφ, hconv⟩
  let xS : S :=
    (InnerProductSpace.toDual ℂ S).symm
      (WeakDual.toStrongDual fLim)
  have hxSnorm : ‖xS‖ ≤ R := by
    have hf := hfLim
    change dist (WeakDual.toStrongDual fLim) 0 ≤ R at hf
    simpa [xS] using hf
  have hweakS :
      WeaklyTendsto (fun n => vS (φ n)) xS := by
    intro z
    have heval :=
      (tendsto_iff_forall_eval_tendsto_topDualPairing.mp hconv) z
    have heval' :
        Tendsto
          (fun n => inner ℂ (vS (φ n)) z)
          atTop
          (𝓝 (fLim z)) := by
      change
        Tendsto
          (fun n => (f (φ n)) z)
          atTop
          (𝓝 (fLim z)) at heval
      simpa [f] using heval
    have hlimEval : inner ℂ xS z = fLim z := by
      simpa [xS] using
        (InnerProductSpace.toDual_symm_apply
          (𝕜 := ℂ) (E := S)
          (x := z) (y := WeakDual.toStrongDual fLim))
    rw [hlimEval]
    exact heval'
  haveI : S.HasOrthogonalProjection := inferInstance
  let x : E := (xS : E)
  have hweak : WeaklyTendsto (fun n => v (φ n)) x := by
    intro z
    have h :=
      hweakS (S.orthogonalProjectionOnto z)
    simpa [vS, x] using h
  refine ⟨φ, hφ, x, hweak, ?_⟩
  simpa [x] using hxSnorm

/-- Weak limits inherit a uniform norm bound. -/
theorem weaklyTendsto_norm_le
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {v : ℕ → E} {x : E} {R : ℝ}
    (hR : 0 ≤ R)
    (hv : ∀ n, ‖v n‖ ≤ R)
    (hweak : WeaklyTendsto v x) :
    ‖x‖ ≤ R := by
  by_cases hx : x = 0
  · simpa [hx] using hR
  have hxpos : 0 < ‖x‖ := norm_pos_iff.mpr hx
  have hinner := (hweak x).norm
  have hbound :
      ∀ᶠ n in atTop, ‖inner ℂ (v n) x‖ ≤ R * ‖x‖ :=
    Eventually.of_forall fun n =>
      (norm_inner_le_norm (v n) x).trans
        (mul_le_mul_of_nonneg_right (hv n) (norm_nonneg x))
  have hlim :
      ‖inner ℂ x x‖ ≤ R * ‖x‖ :=
    le_of_tendsto hinner hbound
  have hlim' : ‖x‖ ^ 2 ≤ R * ‖x‖ := by
    simpa [inner_self_eq_norm_sq_to_K] using hlim
  nlinarith

/-- Weak limits inherit any uniform squared-norm upper bound. -/
theorem weaklyTendsto_norm_sq_le
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {v : ℕ → E} {x : E} {B : ℝ}
    (hB : 0 ≤ B)
    (hv : ∀ n, ‖v n‖ ^ 2 ≤ B)
    (hweak : WeaklyTendsto v x) :
    ‖x‖ ^ 2 ≤ B := by
  let R := Real.sqrt B
  have hR : 0 ≤ R := Real.sqrt_nonneg B
  have hR2 : R ^ 2 = B := Real.sq_sqrt hB
  have hvR : ∀ n, ‖v n‖ ≤ R := by
    intro n
    nlinarith [hv n, norm_nonneg (v n)]
  have hxR := weaklyTendsto_norm_le hR hvR hweak
  nlinarith [hR2, norm_nonneg x]

/--
Weak lower semicontinuity of the squared norm, in the sequential Hilbert
form needed by WD-C3.
-/
theorem weaklyTendsto_norm_sq_le_of_tendsto
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {v : ℕ → E} {x : E} {B : ℝ}
    (hweak : WeaklyTendsto v x)
    (hsq : Tendsto (fun n => ‖v n‖ ^ 2) atTop (𝓝 B)) :
    ‖x‖ ^ 2 ≤ B := by
  have hB : 0 ≤ B :=
    ge_of_tendsto hsq
      (Eventually.of_forall fun n => sq_nonneg ‖v n‖)
  have hnorm :
      Tendsto (fun n => ‖v n‖) atTop (𝓝 (Real.sqrt B)) := by
    have hsqrt := hsq.sqrt
    simpa only [Real.sqrt_sq (norm_nonneg _)] using hsqrt
  by_cases hx : x = 0
  · simpa [hx] using hB
  have hinner := (hweak x).norm
  have hrhs := hnorm.mul_const ‖x‖
  have hle :
      ∀ᶠ n in atTop,
        ‖inner ℂ (v n) x‖ ≤ ‖v n‖ * ‖x‖ :=
    Eventually.of_forall fun n => norm_inner_le_norm (v n) x
  have hlim :=
    le_of_tendsto_of_tendsto hinner hrhs hle
  have hleft : ‖inner ℂ x x‖ = ‖x‖ ^ 2 := by
    simp [inner_self_eq_norm_sq_to_K]
  rw [hleft] at hlim
  have hsqrtB : (Real.sqrt B) ^ 2 = B :=
    Real.sq_sqrt hB
  nlinarith [norm_pos_iff.mpr hx, Real.sqrt_nonneg B]

/-- A bounded sequence in a finite-dimensional sector has a strongly convergent subsequence. -/
theorem exists_tendsto_subseq_finiteDimensional
    [FiniteDimensional ℂ M]
    (u : ℕ → M) (R : ℝ)
    (hu : ∀ n, ‖u n‖ ≤ R) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ uLim : M, Tendsto (fun n => u (φ n)) atTop (𝓝 uLim) := by
  have hcompact : IsCompact (Metric.closedBall (0 : M) R) :=
    isCompact_closedBall (0 : M) R
  have hmem : ∀ n, u n ∈ Metric.closedBall (0 : M) R := by
    intro n
    simpa [Metric.mem_closedBall] using hu n
  rcases hcompact.tendsto_subseq hmem with
    ⟨uLim, _, φ, hφ, hconv⟩
  exact ⟨φ, hφ, uLim, hconv⟩

/-- Coordinate convergence gives weak convergence in the L2 product. -/
theorem weaklyTendsto_coeff
    {a : ℕ → Kpos} {u : ℕ → M}
    {aLim : Kpos} {uLim : M}
    (ha : WeaklyTendsto a aLim)
    (hu : Tendsto u atTop (𝓝 uLim)) :
    WeaklyTendsto
      (fun n => coeff (a n) (u n))
      (coeff aLim uLim) := by
  intro z
  have huinner :
      Tendsto
        (fun n => inner ℂ (u n) z.snd)
        atTop
        (𝓝 (inner ℂ uLim z.snd)) := by
    have hc : Continuous (fun w : M => inner ℂ w z.snd) := by
      fun_prop
    exact (hc.tendsto uLim).comp hu
  have hsum := (ha z.fst).add huinner
  simpa [coeff, WithLp.prod_inner_apply] using hsum

/--
A weak limit of right-approaching analysis vectors belongs to the right-limit
space.
-/
theorem weak_limit_mem_rightLimit
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    {y : ℕ → CoeffSpace Kpos M}
    {yLim : CoeffSpace Kpos M}
    (hmem : ∀ n, y n ∈ A (t n))
    (hweak : WeaklyTendsto y yLim) :
    yLim ∈ WeilDefect.WDT15.rightLimit A c := by
  rw [WeilDefect.WDT15.rightLimit]
  rw [ClosedSubmodule.mem_iInf]
  intro s
  have hev : ∀ᶠ n in atTop, t n < s.1 :=
    ht.eventually (Iio_mem_nhds s.2)
  have hevMem : ∀ᶠ n in atTop, y n ∈ A s.1 :=
    hev.mono fun n hn => hA hn.le (hmem n)
  have hyoo : yLim ∈ (A s.1)ᗮᗮ := by
    rw [((A s.1)ᗮ).mem_orthogonal']
    intro z hz
    have hzA :=
      ((A s.1).mem_orthogonal z).mp hz
    have heq :
        (fun n => inner ℂ (y n) z) =ᶠ[atTop] (fun _ => 0) :=
      hevMem.mono fun n hn => hzA (y n) hn
    have hzero :
        Tendsto (fun n => inner ℂ (y n) z) atTop (𝓝 0) :=
      tendsto_const_nhds.congr' heq.symm
    exact tendsto_nhds_unique (hweak z) hzero
  simpa using hyoo

/--
WD-C3 compactness core: from a unit-normalized sequence in a fixed finite
negative sector, extract a subsequence whose positive coordinate converges
weakly, whose negative coordinate converges strongly, and whose assembled
limit lies in the right-limit analysis space.
-/
theorem wd_t16_fixed_negative_sector_compactness
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ aLim : Kpos, ∃ uLim : M,
        WeaklyTendsto (fun n => a (φ n)) aLim
        ∧ Tendsto (fun n => u (φ n)) atTop (𝓝 uLim)
        ∧ coeff aLim uLim ∈ WeilDefect.WDT15.rightLimit A c := by
  have hcoord :
      ∀ n, ‖a n‖ ^ 2 + ‖u n‖ ^ 2 = 1 := by
    intro n
    have hs := congrArg (fun r : ℝ => r ^ 2) (hnorm n)
    simpa [coeff, WithLp.prod_norm_sq_eq_of_L2] using hs
  have haBound : ∀ n, ‖a n‖ ≤ 1 := by
    intro n
    nlinarith [hcoord n, sq_nonneg ‖u n‖, norm_nonneg (a n)]
  have huBound : ∀ n, ‖u n‖ ≤ 1 := by
    intro n
    nlinarith [hcoord n, sq_nonneg ‖a n‖, norm_nonneg (u n)]
  rcases
      exists_tendsto_subseq_finiteDimensional
        u 1 huBound with
    ⟨φ₁, hφ₁, uLim, huLim⟩
  let a₁ : ℕ → Kpos := fun n => a (φ₁ n)
  have ha₁Bound : ∀ n, ‖a₁ n‖ ≤ 1 := fun n => haBound (φ₁ n)
  rcases
      exists_weaklyTendsto_subseq_of_norm_le
        a₁ 1 zero_le_one ha₁Bound with
    ⟨φ₂, hφ₂, aLim, haLim, _⟩
  let φ : ℕ → ℕ := φ₁ ∘ φ₂
  have hφ : StrictMono φ := hφ₁.comp hφ₂
  have huLim' :
      Tendsto (fun n => u (φ n)) atTop (𝓝 uLim) := by
    exact huLim.comp hφ₂.tendsto_atTop
  have haLim' :
      WeaklyTendsto (fun n => a (φ n)) aLim := by
    simpa [φ, a₁, Function.comp_def] using haLim
  have hyWeak :
      WeaklyTendsto
        (fun n => coeff (a (φ n)) (u (φ n)))
        (coeff aLim uLim) :=
    weaklyTendsto_coeff haLim' huLim'
  have htφ : Tendsto (fun n => t (φ n)) atTop (𝓝 c) :=
    ht.comp hφ.tendsto_atTop
  have hmemφ :
      ∀ n, coeff (a (φ n)) (u (φ n)) ∈ A (t (φ n)) :=
    fun n => hmem (φ n)
  have hright :=
    weak_limit_mem_rightLimit
      A c (fun n => t (φ n)) hA htφ hmemφ hyWeak
  exact ⟨φ, hφ, aLim, uLim, haLim', huLim', hright⟩

/--
WD-C3: if the normalized signatures converge to qStar <= 0, the extracted
right-limit vector is nonzero and has signature at most qStar.
-/
theorem wd_t16_nonpositive_limit_persists
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (qStar : ℝ) (hqStar : qStar ≤ 0)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto (fun n => jValue (a n) (u n))
        atTop (𝓝 qStar)) :
    ∃ y : CoeffSpace Kpos M,
      y ≠ 0
      ∧ y ∈ WeilDefect.WDT15.rightLimit A c
      ∧ jValue y.fst y.snd ≤ qStar := by
  rcases
      wd_t16_fixed_negative_sector_compactness
        A c t hA ht a u hmem hnorm with
    ⟨φ, hφ, aLim, uLim, haWeak, huStrong, hright⟩
  have hcoord :
      ∀ n, ‖a n‖ ^ 2 + ‖u n‖ ^ 2 = 1 := by
    intro n
    have hs := congrArg (fun r : ℝ => r ^ 2) (hnorm n)
    simpa [coeff, WithLp.prod_norm_sq_eq_of_L2] using hs
  have hqφ :
      Tendsto
        (fun n => jValue (a (φ n)) (u (φ n)))
        atTop
        (𝓝 qStar) :=
    hq.comp hφ.tendsto_atTop
  have haSqTendsto :
      Tendsto
        (fun n => ‖a (φ n)‖ ^ 2)
        atTop
        (𝓝 ((1 + qStar) / 2)) := by
    have hone :
        Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ)) :=
      tendsto_const_nhds
    have hlim :=
      Tendsto.div_const
        (hone.add hqφ) (2 : ℝ)
    apply hlim.congr'
    filter_upwards with n
    have hc := hcoord (φ n)
    unfold jValue
    nlinarith
  have huSqTendsto :
      Tendsto
        (fun n => ‖u (φ n)‖ ^ 2)
        atTop
        (𝓝 ((1 - qStar) / 2)) := by
    have hone :
        Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ)) :=
      tendsto_const_nhds
    have hlim :=
      Tendsto.div_const
        (hone.sub hqφ) (2 : ℝ)
    apply hlim.congr'
    filter_upwards with n
    have hc := hcoord (φ n)
    unfold jValue
    nlinarith
  have haSq :
      ‖aLim‖ ^ 2 ≤ (1 + qStar) / 2 :=
    weaklyTendsto_norm_sq_le_of_tendsto haWeak haSqTendsto
  have huStrongSq :
      Tendsto
        (fun n => ‖u (φ n)‖ ^ 2)
        atTop
        (𝓝 (‖uLim‖ ^ 2)) :=
    huStrong.norm.pow 2
  have huEq :
      ‖uLim‖ ^ 2 = (1 - qStar) / 2 :=
    tendsto_nhds_unique huStrongSq huSqTendsto
  have huSqPos : 0 < ‖uLim‖ ^ 2 := by
    rw [huEq]
    linarith
  have huNonzero : uLim ≠ 0 := by
    intro hu0
    have hz : ‖uLim‖ ^ 2 = 0 := by simp [hu0]
    rw [hz] at huSqPos
    exact (lt_irrefl 0 huSqPos)
  have hj :
      jValue aLim uLim ≤ qStar := by
    unfold jValue
    rw [huEq]
    linarith
  have hyNonzero : coeff aLim uLim ≠ 0 := by
    intro hy0
    have hsnd := congrArg
      (fun y : CoeffSpace Kpos M => y.snd) hy0
    simpa using huNonzero hsnd
  exact ⟨coeff aLim uLim, hyNonzero, hright, by simpa using hj⟩

/--
WD-C5: a uniform negative margin in a fixed finite negative sector produces
an actual nonzero negative right-limit vector with at least the same margin.
-/
theorem wd_t16_uniform_negative_margin_persists
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (κ : ℝ) (hκ : 0 < κ)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hneg : ∀ n, jValue (a n) (u n) ≤ -κ) :
    ∃ y : CoeffSpace Kpos M,
      y ≠ 0
      ∧ y ∈ WeilDefect.WDT15.rightLimit A c
      ∧ jValue y.fst y.snd ≤ -κ := by
  rcases
      wd_t16_fixed_negative_sector_compactness
        A c t hA ht a u hmem hnorm with
    ⟨φ, hφ, aLim, uLim, haWeak, huStrong, hright⟩
  have hcoord :
      ∀ n, ‖a n‖ ^ 2 + ‖u n‖ ^ 2 = 1 := by
    intro n
    have hs := congrArg (fun r : ℝ => r ^ 2) (hnorm n)
    simpa [coeff, WithLp.prod_norm_sq_eq_of_L2] using hs
  have hapos :
      ∀ n, 2 * ‖a n‖ ^ 2 ≤ 1 - κ := by
    intro n
    have hn := hneg n
    unfold jValue at hn
    nlinarith [hcoord n]
  have huneg :
      ∀ n, 1 + κ ≤ 2 * ‖u n‖ ^ 2 := by
    intro n
    have hn := hneg n
    unfold jValue at hn
    nlinarith [hcoord n]
  have hB : 0 ≤ (1 - κ) / 2 := by
    have h0 := hapos 0
    nlinarith [sq_nonneg ‖a 0‖]
  have haSq :
      ‖aLim‖ ^ 2 ≤ (1 - κ) / 2 := by
    apply weaklyTendsto_norm_sq_le
      (v := fun n => a (φ n)) (x := aLim)
      (B := (1 - κ) / 2) hB
    · intro n
      have h := hapos (φ n)
      linarith
    · exact haWeak
  have huSqTendsto :
      Tendsto
        (fun n => ‖u (φ n)‖ ^ 2)
        atTop
        (𝓝 (‖uLim‖ ^ 2)) := by
    exact (huStrong.norm.pow 2)
  have huSq :
      (1 + κ) / 2 ≤ ‖uLim‖ ^ 2 := by
    have hle :
        ∀ᶠ n in atTop,
          (1 + κ) / 2 ≤ ‖u (φ n)‖ ^ 2 :=
      Eventually.of_forall fun n => by
        have h := huneg (φ n)
        linarith
    exact ge_of_tendsto huSqTendsto hle
  have hj :
      jValue aLim uLim ≤ -κ := by
    unfold jValue
    linarith
  have huNonzero : uLim ≠ 0 := by
    intro hu0
    subst uLim
    norm_num at huSq
    linarith
  have hyNonzero : coeff aLim uLim ≠ 0 := by
    intro hy0
    have hsnd := congrArg (fun y : CoeffSpace Kpos M => y.snd) hy0
    simpa using huNonzero hsnd
  exact ⟨coeff aLim uLim, hyNonzero, hright, by simpa using hj⟩

/--
If the endpoint space is J-nonnegative, the persistent negative ray produced
by WD-C5 is a genuine endpoint jump vector.
-/
theorem wd_t16_uniform_negative_margin_forces_endpoint_jump
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (κ : ℝ) (hκ : 0 < κ)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hneg : ∀ n, jValue (a n) (u n) ≤ -κ)
    (hendpoint :
      ∀ y : CoeffSpace Kpos M,
        y ∈ A c → 0 ≤ jValue y.fst y.snd) :
    ∃ y : CoeffSpace Kpos M,
      y ≠ 0
      ∧ y ∈ WeilDefect.WDT15.rightLimit A c
      ∧ y ∉ A c
      ∧ jValue y.fst y.snd ≤ -κ := by
  rcases
      wd_t16_uniform_negative_margin_persists
        A c t hA ht a u κ hκ hmem hnorm hneg with
    ⟨y, hy0, hyRight, hyNeg⟩
  have hyNot : y ∉ A c := by
    intro hy
    have hnonneg := hendpoint y hy
    linarith
  exact ⟨y, hy0, hyRight, hyNot, hyNeg⟩

/--
WD-T16 / WD-C3+WD-C5: compactness in a fixed finite negative sector together
with a uniform negative margin forces a nonzero negative right-persistent ray;
if the endpoint is J-nonnegative, that ray lies in the endpoint jump.
-/
theorem wd_t16_fixed_finite_negative_sector_persistence
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (κ : ℝ) (hκ : 0 < κ)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hneg : ∀ n, jValue (a n) (u n) ≤ -κ) :
    (∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ aLim : Kpos, ∃ uLim : M,
        WeaklyTendsto (fun n => a (φ n)) aLim
        ∧ Tendsto (fun n => u (φ n)) atTop (𝓝 uLim)
        ∧ coeff aLim uLim ∈ WeilDefect.WDT15.rightLimit A c)
    ∧
    (∃ y : CoeffSpace Kpos M,
      y ≠ 0
      ∧ y ∈ WeilDefect.WDT15.rightLimit A c
      ∧ jValue y.fst y.snd ≤ -κ) := by
  constructor
  · exact wd_t16_fixed_negative_sector_compactness
      A c t hA ht a u hmem hnorm
  · exact wd_t16_uniform_negative_margin_persists
      A c t hA ht a u κ hκ hmem hnorm hneg

end WeilDefect.WDT16
