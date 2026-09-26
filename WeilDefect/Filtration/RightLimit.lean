import WeilDefect.Screening.FinitePositiveShadows
import Mathlib.Analysis.InnerProductSpace.Projection.Submodule
import Mathlib

namespace WeilDefect.WDT15

open Filter
open scoped Topology InnerProduct

variable {H : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Parameters strictly to the right of an endpoint. -/
abbrev RightIndex (c : ℝ) := {t : ℝ // c < t}

/-- Closed right-limit analysis space at the endpoint c. -/
def rightLimit
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ) : ClosedSubmodule ℂ H :=
  ⨅ t : RightIndex c, A t.1

/--
Closed limiting gap space. Since suprema in ClosedSubmodule are closed spans,
this is exactly the closure of the union/span of the right-hand gap spaces.
-/
noncomputable def gapLimit
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ) : ClosedSubmodule ℂ H :=
  ⨆ t : RightIndex c, (A t.1)ᗮ

/-- Increasing analysis spaces give decreasing orthogonal gap spaces. -/
theorem wd_t15_gap_antitone
    (A : ℝ → ClosedSubmodule ℂ H)
    (hA : Monotone A)
    {s t : ℝ}
    (hst : s ≤ t) :
    (A t)ᗮ ≤ (A s)ᗮ :=
  ClosedSubmodule.orthogonal_le (hA hst)

/--
WD-C2: the closed right-limit analysis space is the orthogonal complement of
the closed limiting gap space.
-/
theorem wd_t15_right_limit_gap_duality
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ) :
    rightLimit A c = (gapLimit A c)ᗮ := by
  unfold rightLimit gapLimit
  simpa using
    (ClosedSubmodule.iInf_orthogonal
      (fun t : RightIndex c => (A t.1)ᗮ))

/--
Any real sequence approaching c from the right is cofinal for a monotone
real-parameter filtration.
-/
theorem wd_t15_sequence_right_limit_eq
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ)
    (t : ℕ → ℝ)
    (hA : Monotone A)
    (hright : ∀ n, c < t n)
    (ht : Tendsto t atTop (𝓝 c)) :
    (⨅ n, A (t n)) = rightLimit A c := by
  unfold rightLimit
  apply le_antisymm
  · refine le_iInf fun s => ?_
    have hev : ∀ᶠ n in atTop, t n < s.1 :=
      ht.eventually (Iio_mem_nhds s.2)
    rcases (eventually_atTop.1 hev) with ⟨N, hN⟩
    exact
      (iInf_le (fun n => A (t n)) N).trans
        (hA (le_of_lt (hN N le_rfl)))
  · refine le_iInf fun n => ?_
    exact
      iInf_le_of_le
        (⟨t n, hright n⟩ : RightIndex c)
        le_rfl

/--
For a decreasing right-approach sequence, the closed span of its gap spaces is
the orthogonal complement of the right-limit analysis space.
-/
theorem wd_t15_sequence_gap_eq_right_limit_orthogonal
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ)
    (t : ℕ → ℝ)
    (hA : Monotone A)
    (hright : ∀ n, c < t n)
    (ht : Tendsto t atTop (𝓝 c)) :
    (⨆ n, (A (t n))ᗮ) = (rightLimit A c)ᗮ := by
  have hdual :
      (⨅ n, A (t n)) = (⨆ n, (A (t n))ᗮ)ᗮ := by
    simpa using
      (ClosedSubmodule.iInf_orthogonal
        (fun n : ℕ => (A (t n))ᗮ))
  have horth := congrArg ClosedSubmodule.orthogonal hdual
  have hseq :
      (⨆ n, (A (t n))ᗮ) = (⨅ n, A (t n))ᗮ := by
    simpa using horth.symm
  rw [hseq, wd_t15_sequence_right_limit_eq A c t hA hright ht]

/--
WD-C1, sequential form: along every antitone real sequence t_n decreasing to
c from the right, orthogonal projections onto A_(t_n) converge strongly,
pointwise on H, to the projection onto the right-limit space.
-/
theorem wd_t15_monotone_projection_limit
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ)
    (t : ℕ → ℝ)
    (hA : Monotone A)
    (hright : ∀ n, c < t n)
    (htAnti : Antitone t)
    (ht : Tendsto t atTop (𝓝 c))
    (x : H) :
    Tendsto
      (fun n => (A (t n)).toSubmodule.starProjection x)
      atTop
      (𝓝 ((rightLimit A c).toSubmodule.starProjection x)) := by
  let G : ℕ → Submodule ℂ H :=
    fun n => ((A (t n))ᗮ).toSubmodule
  have hG : Monotone G := by
    intro i j hij
    have hAt : A (t j) ≤ A (t i) :=
      hA (htAnti hij)
    exact ClosedSubmodule.orthogonal_le hAt
  haveI :
      (⨆ n, G n).topologicalClosure.HasOrthogonalProjection := by
    change (((⨆ n, G n).closure : ClosedSubmodule ℂ H) :
      Submodule ℂ H).HasOrthogonalProjection
    infer_instance
  have hgap :=
    Submodule.starProjection_tendsto_closure_iSup G hG x
  have hclosed :
      (⨆ n, G n).topologicalClosure =
        ((rightLimit A c)ᗮ).toSubmodule := by
    calc
      (⨆ n, G n).topologicalClosure
          =
        (⨆ n, (A (t n))ᗮ).toSubmodule := by
          change
            (⨆ n, ((A (t n))ᗮ).toSubmodule).topologicalClosure
              =
            (⨆ n, (A (t n))ᗮ).toSubmodule
          exact
            (ClosedSubmodule.toSubmodule_iSup
              (fun n : ℕ => (A (t n))ᗮ)).symm
      _ =
        ((rightLimit A c)ᗮ).toSubmodule := by
          rw [wd_t15_sequence_gap_eq_right_limit_orthogonal
            A c t hA hright ht]
  let S : Submodule ℂ H := (⨆ n, G n).topologicalClosure
  have hsub :
      Tendsto
        (fun n => x - (G n).starProjection x)
        atTop
        (𝓝 (x - S.starProjection x)) := by
    dsimp [S]
    exact tendsto_const_nhds.sub hgap
  have hy :
      x - S.starProjection x ∈ (rightLimit A c).toSubmodule := by
    have hmem :
        x - S.starProjection x ∈ Sᗮ :=
      Submodule.sub_starProjection_mem_orthogonal x
    have hS :
        S = ((rightLimit A c)ᗮ).toSubmodule := by
      simpa [S] using hclosed
    simpa [hS] using hmem
  have hres :
      x - (x - S.starProjection x) ∈
        ((rightLimit A c).toSubmodule)ᗮ := by
    have hp : S.starProjection x ∈ S :=
      Submodule.starProjection_apply_mem S x
    have hS :
        S = ((rightLimit A c)ᗮ).toSubmodule := by
      simpa [S] using hclosed
    have hp' :
        S.starProjection x ∈
          ((rightLimit A c).toSubmodule)ᗮ := by
      simpa [hS] using hp
    simpa using hp'
  have hproj :
      (rightLimit A c).toSubmodule.starProjection x =
        x - S.starProjection x :=
    Submodule.eq_starProjection_of_mem_orthogonal hy hres
  simpa [G, Submodule.starProjection_orthogonal_val, hproj] using hsub

/--
WD-T15 / WD-C1+WD-C2: right-limit projection convergence and gap-space
duality for a monotone real-parameter filtration of closed Hilbert subspaces.
-/
theorem wd_t15_right_limit_projection_and_gap_duality
    (A : ℝ → ClosedSubmodule ℂ H)
    (c : ℝ)
    (t : ℕ → ℝ)
    (hA : Monotone A)
    (hright : ∀ n, c < t n)
    (htAnti : Antitone t)
    (ht : Tendsto t atTop (𝓝 c)) :
    rightLimit A c = (gapLimit A c)ᗮ
      ∧
    (∀ x : H,
      Tendsto
        (fun n => (A (t n)).toSubmodule.starProjection x)
        atTop
        (𝓝 ((rightLimit A c).toSubmodule.starProjection x))) := by
  constructor
  · exact wd_t15_right_limit_gap_duality A c
  · intro x
    exact wd_t15_monotone_projection_limit
      A c t hA hright htAnti ht x

end WeilDefect.WDT15
