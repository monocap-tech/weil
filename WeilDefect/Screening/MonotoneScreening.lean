import WeilDefect.Screening.DefectIndex
import Mathlib

namespace WeilDefect.WDT06

open Filter Set
open scoped InnerProduct Topology
open ContinuousLinearMap
open InnerProductSpace
open WeilDefect.WDT01

variable {H Kpos Kneg : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup Kneg] [InnerProductSpace ℂ Kneg] [CompleteSpace Kneg]

/--
The explicit data used for an increasing strongly exhaustive family of
orthogonal projections.  Contractivity is recorded as a standard projection
property so the downstream WD-T06 proof does not import any external theorem.
-/
structure ProjectionChainData
    (P : ℕ → Kpos →L[ℂ] Kpos) : Prop where
  selfAdjoint : ∀ n, (P n)† = P n
  idempotent : ∀ n, (P n) ∘L (P n) = P n
  nested : ∀ n, (P n) ∘L (P (n + 1)) = P n
  contractive : ∀ n x, ‖P n x‖ ≤ ‖x‖
  strongToId : ∀ x, Tendsto (fun n => P n x) atTop (𝓝 x)

/-- The truncated physical defect operator D_N. -/
noncomputable def truncatedDefect
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : Kpos →L[ℂ] Kpos) : H →L[ℂ] H :=
  Spos ∘L (P ∘L Spos†) - Sneg ∘L Sneg†

/-- Quadratic form of the truncated defect, in projection coordinates. -/
noncomputable def truncatedQuadratic
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : Kpos →L[ℂ] Kpos)
    (h : H) : ℝ :=
  ‖P ((Spos†) h)‖ ^ 2 - ‖(Sneg†) h‖ ^ 2

/-- Quadratic-form order on operators. -/
def FormLe (A B : H →L[ℂ] H) : Prop :=
  ∀ h, (inner ℂ (A h) h).re ≤ (inner ℂ (B h) h).re

/-- A self-adjoint idempotent has the expected projection inner-product identity. -/
theorem projection_inner_self
    (P : Kpos →L[ℂ] Kpos)
    (hself : P† = P)
    (hidemp : P ∘L P = P)
    (x : Kpos) :
    inner ℂ (P x) x = inner ℂ (P x) (P x) := by
  calc
    inner ℂ (P x) x = inner ℂ ((P ∘L P) x) x := by rw [hidemp]
    _ = inner ℂ (P x) ((P†) x) := by
      rw [ContinuousLinearMap.comp_apply]
      exact (ContinuousLinearMap.adjoint_inner_right P (P x) x).symm
    _ = inner ℂ (P x) (P x) := by rw [hself]

/-- The operator D_N has exactly the projection-norm quadratic form. -/
theorem wd_t06_truncated_inner_identity
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : Kpos →L[ℂ] Kpos)
    (hself : P† = P)
    (hidemp : P ∘L P = P)
    (h : H) :
    inner ℂ (truncatedDefect Spos Sneg P h) h
      = ((truncatedQuadratic Spos Sneg P h : ℝ) : ℂ) := by
  simp only [truncatedDefect, truncatedQuadratic,
    ContinuousLinearMap.sub_apply, ContinuousLinearMap.comp_apply]
  rw [inner_sub_left]
  have hpos :
      inner ℂ (Spos (P ((Spos†) h))) h
        = ((‖P ((Spos†) h)‖ ^ 2 : ℝ) : ℂ) := by
    calc
      inner ℂ (Spos (P ((Spos†) h))) h
          = inner ℂ (P ((Spos†) h)) ((Spos†) h) :=
            (ContinuousLinearMap.adjoint_inner_right
              Spos (P ((Spos†) h)) h).symm
      _ = inner ℂ (P ((Spos†) h)) (P ((Spos†) h)) :=
            projection_inner_self P hself hidemp ((Spos†) h)
      _ = ((‖P ((Spos†) h)‖ ^ 2 : ℝ) : ℂ) := by
            simp [inner_self_eq_norm_sq_to_K]
  have hneg :
      inner ℂ (Sneg ((Sneg†) h)) h
        = ((‖(Sneg†) h‖ ^ 2 : ℝ) : ℂ) := by
    rw [← ContinuousLinearMap.adjoint_inner_right Sneg ((Sneg†) h) h]
    simp [inner_self_eq_norm_sq_to_K]
  rw [hpos, hneg]
  norm_num

/-- Nested contractive projections have nondecreasing projected norms. -/
theorem projection_norm_mono
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ)
    (x : Kpos) :
    ‖P n x‖ ≤ ‖P (n + 1) x‖ := by
  have hnested := congrArg (fun T : Kpos →L[ℂ] Kpos => T x) (hP.nested n)
  have heq : P n x = P n (P (n + 1) x) := by
    simpa [ContinuousLinearMap.comp_apply] using hnested.symm
  rw [heq]
  exact hP.contractive n (P (n + 1) x)

/-- Projected norms are also bounded by the full positive channel. -/
theorem projection_norm_le_full
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ)
    (x : Kpos) :
    ‖P n x‖ ≤ ‖x‖ :=
  hP.contractive n x

/-- D_N ≤ D_{N+1} at the quadratic-form level. -/
theorem wd_t06_quadratic_mono
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ)
    (h : H) :
    truncatedQuadratic Spos Sneg (P n) h
      ≤ truncatedQuadratic Spos Sneg (P (n + 1)) h := by
  have hnorm :=
    projection_norm_mono P hP n ((Spos†) h)
  have hsq :
      ‖P n ((Spos†) h)‖ ^ 2
        ≤ ‖P (n + 1) ((Spos†) h)‖ ^ 2 := by
    nlinarith [norm_nonneg (P n ((Spos†) h)),
      norm_nonneg (P (n + 1) ((Spos†) h))]
  unfold truncatedQuadratic
  linarith

/-- D_N ≤ D at the quadratic-form level. -/
theorem wd_t06_quadratic_le_full
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ)
    (h : H) :
    truncatedQuadratic Spos Sneg (P n) h
      ≤ physicalQ Spos Sneg h := by
  have hnorm :=
    projection_norm_le_full P hP n ((Spos†) h)
  have hsq :
      ‖P n ((Spos†) h)‖ ^ 2
        ≤ ‖(Spos†) h‖ ^ 2 := by
    nlinarith [norm_nonneg (P n ((Spos†) h)),
      norm_nonneg ((Spos†) h)]
  unfold truncatedQuadratic physicalQ coeffQ analysisMap
  simp only [ContinuousLinearMap.prod_apply]
  linarith

/-- Operator-form statement D_N ≼ D_{N+1}. -/
theorem wd_t06_defect_mono
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ) :
    FormLe
      (truncatedDefect Spos Sneg (P n))
      (truncatedDefect Spos Sneg (P (n + 1))) := by
  intro h
  rw [wd_t06_truncated_inner_identity Spos Sneg (P n)
    (hP.selfAdjoint n) (hP.idempotent n) h]
  rw [wd_t06_truncated_inner_identity Spos Sneg (P (n + 1))
    (hP.selfAdjoint (n + 1)) (hP.idempotent (n + 1)) h]
  simp only [Complex.ofReal_re]
  exact wd_t06_quadratic_mono Spos Sneg P hP n h

/-- Operator-form statement D_N ≼ D. -/
theorem wd_t06_defect_le_full
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n : ℕ) :
    FormLe
      (truncatedDefect Spos Sneg (P n))
      (physicalDefect Spos Sneg) := by
  intro h
  rw [wd_t06_truncated_inner_identity Spos Sneg (P n)
    (hP.selfAdjoint n) (hP.idempotent n) h]
  rw [wd_t01_defect_inner_identity Spos Sneg h]
  simp only [Complex.ofReal_re]
  exact wd_t06_quadratic_le_full Spos Sneg P hP n h

/-- Strong convergence D_N h → D h for every physical vector h. -/
theorem wd_t06_defect_strong_tendsto
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (h : H) :
    Tendsto
      (fun n => truncatedDefect Spos Sneg (P n) h)
      atTop
      (𝓝 (physicalDefect Spos Sneg h)) := by
  have hp := hP.strongToId ((Spos†) h)
  have hs :
      Tendsto
        (fun n => Spos (P n ((Spos†) h)))
        atTop
        (𝓝 (Spos ((Spos†) h))) :=
    Spos.continuous.continuousAt.tendsto.comp hp
  have hsub :=
    hs.sub (tendsto_const_nhds :
      Tendsto
        (fun _ : ℕ => Sneg ((Sneg†) h))
        atTop
        (𝓝 (Sneg ((Sneg†) h))))
  simpa [truncatedDefect, physicalDefect] using hsub

/-- The scalar quadratic forms increase pointwise to the full defect form. -/
theorem wd_t06_quadratic_tendsto
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (h : H) :
    Tendsto
      (fun n => truncatedQuadratic Spos Sneg (P n) h)
      atTop
      (𝓝 (physicalQ Spos Sneg h)) := by
  have hp := hP.strongToId ((Spos†) h)
  have hn :
      Tendsto
        (fun n => ‖P n ((Spos†) h)‖)
        atTop
        (𝓝 ‖(Spos†) h‖) :=
    continuous_norm.continuousAt.tendsto.comp hp
  have hsquare := hn.pow 2
  have hsub :=
    hsquare.sub (tendsto_const_nhds :
      Tendsto
        (fun _ : ℕ => ‖(Sneg†) h‖ ^ 2)
        atTop
        (𝓝 (‖(Sneg†) h‖ ^ 2)))
  simpa [truncatedQuadratic, physicalQ, coeffQ, analysisMap] using hsub

/--
Finite negative-rank monotonicity:
every k-dimensional negative witness for D_{N+1} is already a negative
witness for D_N.
-/
theorem wd_t06_negative_rank_antitone
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P)
    (n k : ℕ) :
    HasNegativeRank
        (truncatedQuadratic Spos Sneg (P (n + 1)))
        (Set.univ : Set H) k
      →
    HasNegativeRank
        (truncatedQuadratic Spos Sneg (P n))
        (Set.univ : Set H) k := by
  rintro ⟨T, hcarrier, hneg⟩
  refine ⟨T, hcarrier, ?_⟩
  intro x hx
  have hle :=
    wd_t06_quadratic_mono Spos Sneg P hP n (T x)
  exact lt_of_le_of_lt hle (hneg x hx)

/--
WD-T06 assembled: monotone positive-channel restoration gives
D_N ≼ D_{N+1} ≼ D, strong convergence D_N → D, pointwise convergence of
quadratic forms, and nonincreasing finite negative-rank spectrum.
-/
theorem wd_t06_monotone_positive_screening
    (Spos : Kpos →L[ℂ] H)
    (Sneg : Kneg →L[ℂ] H)
    (P : ℕ → Kpos →L[ℂ] Kpos)
    (hP : ProjectionChainData P) :
    (∀ n,
      FormLe
        (truncatedDefect Spos Sneg (P n))
        (truncatedDefect Spos Sneg (P (n + 1))))
    ∧
    (∀ n,
      FormLe
        (truncatedDefect Spos Sneg (P n))
        (physicalDefect Spos Sneg))
    ∧
    (∀ h,
      Tendsto
        (fun n => truncatedDefect Spos Sneg (P n) h)
        atTop
        (𝓝 (physicalDefect Spos Sneg h)))
    ∧
    (∀ h,
      Tendsto
        (fun n => truncatedQuadratic Spos Sneg (P n) h)
        atTop
        (𝓝 (physicalQ Spos Sneg h)))
    ∧
    (∀ n k,
      HasNegativeRank
          (truncatedQuadratic Spos Sneg (P (n + 1)))
          (Set.univ : Set H) k
        →
      HasNegativeRank
          (truncatedQuadratic Spos Sneg (P n))
          (Set.univ : Set H) k) := by
  exact ⟨
    fun n => wd_t06_defect_mono Spos Sneg P hP n,
    fun n => wd_t06_defect_le_full Spos Sneg P hP n,
    fun h => wd_t06_defect_strong_tendsto Spos Sneg P hP h,
    fun h => wd_t06_quadratic_tendsto Spos Sneg P hP h,
    fun n k => wd_t06_negative_rank_antitone Spos Sneg P hP n k
  ⟩

end WeilDefect.WDT06
