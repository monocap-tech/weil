import WeilDefect.Filtration.FiniteNegativeSector
import Mathlib

namespace WeilDefect.WDT17

open Filter
open scoped Topology InnerProduct

open WeilDefect.WDT16

variable {Kpos M : Type*}
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]

/--
Weak convergence plus convergence of squared norms upgrades to strong
convergence in a Hilbert space.
-/
theorem weaklyTendsto_strong_of_norm_sq_tendsto
    {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {v : ℕ → E} {x : E}
    (hweak : WeaklyTendsto v x)
    (hnorm :
      Tendsto (fun n => ‖v n‖ ^ 2)
        atTop (𝓝 (‖x‖ ^ 2))) :
    Tendsto v atTop (𝓝 x) := by
  have hre :
      Tendsto
        (fun n => RCLike.re (inner ℂ (v n) x))
        atTop
        (𝓝 (RCLike.re (inner ℂ x x))) := by
    exact
      (Complex.continuous_re.tendsto (inner ℂ x x)).comp
        (hweak x)
  have htwo :
      Tendsto
        (fun n => 2 * RCLike.re (inner ℂ (v n) x))
        atTop
        (𝓝 (2 * RCLike.re (inner ℂ x x))) :=
    tendsto_const_nhds.mul hre
  have hsq :
      Tendsto
        (fun n => ‖v n - x‖ ^ 2)
        atTop
        (𝓝 0) := by
    have hinnerSelfRe :
        RCLike.re (inner ℂ x x) = ‖x‖ ^ 2 := by
      exact (norm_sq_eq_re_inner (𝕜 := ℂ) x).symm
    have hzero :
        ‖x‖ ^ 2 - 2 * RCLike.re (inner ℂ x x) + ‖x‖ ^ 2 = 0 := by
      rw [hinnerSelfRe]
      ring
    have hcalc :=
      (hnorm.sub htwo).add_const (‖x‖ ^ 2)
    rw [hzero] at hcalc
    simpa only [norm_sub_sq (𝕜 := ℂ)] using hcalc
  have hnormSub :
      Tendsto
        (fun n => ‖v n - x‖)
        atTop
        (𝓝 0) := by
    have hsqrt := hsq.sqrt
    simpa only [Real.sqrt_sq (norm_nonneg _), Real.sqrt_zero] using hsqrt
  exact tendsto_iff_norm_sub_tendsto_zero.mpr hnormSub

/-- The neutral branch of WD-C4. -/
def NeutralCriticalBranch
    (a : ℕ → Kpos) (u : ℕ → M)
    (φ : ℕ → ℕ) (aLim : Kpos) (uLim : M) : Prop :=
  ‖aLim‖ ^ 2 = (1 : ℝ) / 2
    ∧ jValue aLim uLim = 0
    ∧ Tendsto (fun n => a (φ n)) atTop (𝓝 aLim)
    ∧ Tendsto
        (fun n => coeff (a (φ n)) (u (φ n)))
        atTop
        (𝓝 (coeff aLim uLim))

/-- The positive-mass-loss branch of WD-C4. -/
def NegativeFallthroughBranch
    (aLim : Kpos) (uLim : M) : Prop :=
  ‖aLim‖ ^ 2 < (1 : ℝ) / 2
    ∧ jValue aLim uLim < 0

/--
At critical signature, every compactness limit from WD-C3 has positive
coordinate mass at most one half.
-/
theorem wd_t17_critical_positive_mass_le_half
    [FiniteDimensional ℂ M]
    (a : ℕ → Kpos) (u : ℕ → M)
    (φ : ℕ → ℕ)
    (aLim : Kpos)
    (haWeak : WeaklyTendsto (fun n => a (φ n)) aLim)
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto (fun n => jValue (a n) (u n))
        atTop (𝓝 0))
    (hφ : StrictMono φ) :
    ‖aLim‖ ^ 2 ≤ (1 : ℝ) / 2 := by
  have hcoord :
      ∀ n, ‖a n‖ ^ 2 + ‖u n‖ ^ 2 = 1 := by
    intro n
    have hs := congrArg (fun r : ℝ => r ^ 2) (hnorm n)
    simpa [coeff, WithLp.prod_norm_sq_eq_of_L2] using hs
  have hqφ :
      Tendsto
        (fun n => jValue (a (φ n)) (u (φ n)))
        atTop
        (𝓝 0) :=
    hq.comp hφ.tendsto_atTop
  have hone :
      Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ)) :=
    tendsto_const_nhds
  have haSqTendsto :
      Tendsto
        (fun n => ‖a (φ n)‖ ^ 2)
        atTop
        (𝓝 ((1 : ℝ) / 2)) := by
    have hlim :
        Tendsto
          (fun n =>
            ((1 : ℝ) + jValue (a (φ n)) (u (φ n))) / 2)
          atTop
          (𝓝 (((1 : ℝ) + 0) / 2)) :=
      Tendsto.div_const (hone.add hqφ) (2 : ℝ)
    have hev :
        (fun n =>
          ((1 : ℝ) + jValue (a (φ n)) (u (φ n))) / 2)
          =ᶠ[atTop]
        (fun n => ‖a (φ n)‖ ^ 2) :=
      Eventually.of_forall fun n => by
        have hc := hcoord (φ n)
        unfold jValue
        nlinarith
    have h := hlim.congr' hev
    norm_num at h
    exact h
  exact
    weaklyTendsto_norm_sq_le_of_tendsto
      haWeak haSqTendsto

/--
WD-C4: a critical sequence in a fixed finite negative sector has exactly one
of two outcomes along the compactness subsequence:

* neutral compact attainment, with strong convergence;
* strict negative fall-through caused by positive-coordinate mass loss.
-/
theorem wd_t17_fixed_sector_critical_dichotomy
    [FiniteDimensional ℂ M]
    (A : ℝ → ClosedSubmodule ℂ (CoeffSpace Kpos M))
    (c : ℝ) (t : ℕ → ℝ)
    (hA : Monotone A)
    (ht : Tendsto t atTop (𝓝 c))
    (a : ℕ → Kpos) (u : ℕ → M)
    (hmem : ∀ n, coeff (a n) (u n) ∈ A (t n))
    (hnorm : ∀ n, ‖coeff (a n) (u n)‖ = 1)
    (hq :
      Tendsto (fun n => jValue (a n) (u n))
        atTop (𝓝 0)) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧
      ∃ aLim : Kpos, ∃ uLim : M,
        WeaklyTendsto (fun n => a (φ n)) aLim
        ∧ Tendsto (fun n => u (φ n)) atTop (𝓝 uLim)
        ∧ coeff aLim uLim ∈ WeilDefect.WDT15.rightLimit A c
        ∧ coeff aLim uLim ≠ 0
        ∧
          (NeutralCriticalBranch a u φ aLim uLim
            ∨ NegativeFallthroughBranch aLim uLim)
        ∧ ¬
          (NeutralCriticalBranch a u φ aLim uLim
            ∧ NegativeFallthroughBranch aLim uLim) := by
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
        (𝓝 0) :=
    hq.comp hφ.tendsto_atTop
  have hone :
      Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ)) :=
    tendsto_const_nhds
  have haSqTendsto :
      Tendsto
        (fun n => ‖a (φ n)‖ ^ 2)
        atTop
        (𝓝 ((1 : ℝ) / 2)) := by
    have hlim :
        Tendsto
          (fun n =>
            ((1 : ℝ) + jValue (a (φ n)) (u (φ n))) / 2)
          atTop
          (𝓝 (((1 : ℝ) + 0) / 2)) :=
      Tendsto.div_const (hone.add hqφ) (2 : ℝ)
    have hev :
        (fun n =>
          ((1 : ℝ) + jValue (a (φ n)) (u (φ n))) / 2)
          =ᶠ[atTop]
        (fun n => ‖a (φ n)‖ ^ 2) :=
      Eventually.of_forall fun n => by
        have hc := hcoord (φ n)
        unfold jValue
        nlinarith
    have h := hlim.congr' hev
    norm_num at h
    exact h
  have huSqTendsto :
      Tendsto
        (fun n => ‖u (φ n)‖ ^ 2)
        atTop
        (𝓝 ((1 : ℝ) / 2)) := by
    have hlim :
        Tendsto
          (fun n =>
            ((1 : ℝ) - jValue (a (φ n)) (u (φ n))) / 2)
          atTop
          (𝓝 (((1 : ℝ) - 0) / 2)) :=
      Tendsto.div_const (hone.sub hqφ) (2 : ℝ)
    have hev :
        (fun n =>
          ((1 : ℝ) - jValue (a (φ n)) (u (φ n))) / 2)
          =ᶠ[atTop]
        (fun n => ‖u (φ n)‖ ^ 2) :=
      Eventually.of_forall fun n => by
        have hc := hcoord (φ n)
        unfold jValue
        nlinarith
    have h := hlim.congr' hev
    norm_num at h
    exact h
  have huStrongSq :
      Tendsto
        (fun n => ‖u (φ n)‖ ^ 2)
        atTop
        (𝓝 (‖uLim‖ ^ 2)) :=
    huStrong.norm.pow 2
  have huEq :
      ‖uLim‖ ^ 2 = (1 : ℝ) / 2 :=
    tendsto_nhds_unique huStrongSq huSqTendsto
  have huNonzero : uLim ≠ 0 := by
    intro hu0
    have hz : ‖uLim‖ ^ 2 = 0 := by simp [hu0]
    rw [hz] at huEq
    norm_num at huEq
  have hyNonzero : coeff aLim uLim ≠ 0 := by
    intro hy0
    have hsnd :=
      congrArg (fun y : CoeffSpace Kpos M => y.snd) hy0
    simpa using huNonzero hsnd
  have haLe :
      ‖aLim‖ ^ 2 ≤ (1 : ℝ) / 2 :=
    weaklyTendsto_norm_sq_le_of_tendsto
      haWeak haSqTendsto
  by_cases haEq : ‖aLim‖ ^ 2 = (1 : ℝ) / 2
  · have haStrong :
        Tendsto (fun n => a (φ n)) atTop (𝓝 aLim) := by
      apply weaklyTendsto_strong_of_norm_sq_tendsto haWeak
      simpa [haEq] using haSqTendsto
    have hyStrong :
        Tendsto
          (fun n => coeff (a (φ n)) (u (φ n)))
          atTop
          (𝓝 (coeff aLim uLim)) := by
      have hpair :
          Tendsto
            (fun n => (a (φ n), u (φ n)))
            atTop
            (𝓝 (aLim, uLim)) :=
        haStrong.prodMk_nhds huStrong
      have hmap :=
        ((WithLp.prodContinuousLinearEquiv
          2 ℂ Kpos M).symm.continuous.tendsto
            (aLim, uLim)).comp hpair
      change
        Tendsto
          (fun n =>
            (WithLp.prodContinuousLinearEquiv
              2 ℂ Kpos M).symm (a (φ n), u (φ n)))
          atTop
          (𝓝 ((WithLp.prodContinuousLinearEquiv
            2 ℂ Kpos M).symm (aLim, uLim)))
      exact hmap
    have hj0 : jValue aLim uLim = 0 := by
      unfold jValue
      rw [haEq, huEq]
      ring
    have hneutral :
        NeutralCriticalBranch a u φ aLim uLim := by
      exact ⟨haEq, hj0, haStrong, hyStrong⟩
    have hnotLoss :
        ¬ NegativeFallthroughBranch aLim uLim := by
      intro hloss
      exact (ne_of_lt hloss.1) haEq
    exact ⟨φ, hφ, aLim, uLim, haWeak, huStrong,
      hright, hyNonzero, Or.inl hneutral, by
        intro hboth
        exact hnotLoss hboth.2⟩
  · have haLt : ‖aLim‖ ^ 2 < (1 : ℝ) / 2 :=
      lt_of_le_of_ne haLe haEq
    have hjNeg : jValue aLim uLim < 0 := by
      unfold jValue
      rw [huEq]
      linarith
    have hloss :
        NegativeFallthroughBranch aLim uLim :=
      ⟨haLt, hjNeg⟩
    have hnotNeutral :
        ¬ NeutralCriticalBranch a u φ aLim uLim := by
      intro hneutral
      exact haEq hneutral.1
    exact ⟨φ, hφ, aLim, uLim, haWeak, huStrong,
      hright, hyNonzero, Or.inr hloss, by
        intro hboth
        exact hnotNeutral hboth.1⟩

/--
Compact neutral attainment branch: equality of the positive weak-limit mass
forces an actual nonzero neutral right-limit vector and strong convergence of
the critical subsequence.
-/
theorem wd_t17_neutral_branch
    {a : ℕ → Kpos} {u : ℕ → M}
    {φ : ℕ → ℕ} {aLim : Kpos} {uLim : M}
    (h : NeutralCriticalBranch a u φ aLim uLim) :
    jValue aLim uLim = 0
      ∧ Tendsto (fun n => a (φ n)) atTop (𝓝 aLim)
      ∧ Tendsto
          (fun n => coeff (a (φ n)) (u (φ n)))
          atTop
          (𝓝 (coeff aLim uLim)) :=
  ⟨h.2.1, h.2.2.1, h.2.2.2⟩

/--
Positive-mass-loss branch: any strict loss below one-half positive mass makes
the right-limit vector strictly negative.
-/
theorem wd_t17_loss_branch
    {aLim : Kpos} {uLim : M}
    (h : NegativeFallthroughBranch aLim uLim) :
    jValue aLim uLim < 0 :=
  h.2

end WeilDefect.WDT17
