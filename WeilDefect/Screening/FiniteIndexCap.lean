import WeilDefect.Screening.BackgroundCustody
import WeilDefect.Screening.DefectIndex
import Mathlib

namespace WeilDefect.WDT08

open scoped InnerProduct
open ContinuousLinearMap
open WeilDefect
open WeilDefect.WDT01

variable {H Kpos M B : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
variable [NormedAddCommGroup Kpos] [InnerProductSpace ℂ Kpos] [CompleteSpace Kpos]
variable [NormedAddCommGroup M] [InnerProductSpace ℂ M] [CompleteSpace M]
variable [NormedAddCommGroup B] [InnerProductSpace ℂ B] [CompleteSpace B]

/--
A selected k-negative witness forces the selected adjoint channel to be
injective on the witness coordinates.
-/
theorem selected_adjoint_comp_injective
    [FiniteDimensional ℂ M]
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    {k : ℕ}
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H)
    (hneg : ∀ x, ‖x‖ = 1 → selectedQuadratic Spos S_M (T x) < 0) :
    Function.Injective ((S_M†) ∘L T) := by
  intro x y hxy
  by_contra hne
  have hdne : x - y ≠ 0 := sub_ne_zero.mpr hne
  let u : EuclideanSpace ℂ (Fin k) := NormedSpace.normalize (x - y)
  have hu : ‖u‖ = 1 := NormedSpace.norm_normalize hdne
  have hFsub : (((S_M†) ∘L T) (x - y)) = 0 := by
    rw [map_sub, hxy, sub_self]
  have hFu : (((S_M†) ∘L T) u) = 0 := by
    rw [show u = ‖x - y‖⁻¹ • (x - y) by rfl]
    rw [ContinuousLinearMap.map_smul_of_tower, hFsub, smul_zero]
  have hSM : (S_M†) (T u) = 0 := by
    simpa using hFu
  have hn := hneg u hu
  unfold selectedQuadratic at hn
  rw [hSM, norm_zero] at hn
  nlinarith [sq_nonneg ‖(Spos†) (T u)‖]

/--
WD-T08 selected-sector cap:
a k-dimensional selected negative witness can exist only when
k ≤ dim M.
-/
theorem wd_t08_selected_negative_rank_le_finrank
    [FiniteDimensional ℂ M]
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (k : ℕ)
    (hneg : HasNegativeRank
      (selectedQuadratic Spos S_M)
      (Set.univ : Set H) k) :
    k ≤ Module.finrank ℂ M := by
  rcases hneg with ⟨T, -, hTneg⟩
  have hinj :
      Function.Injective ((((S_M†) ∘L T).toLinearMap)) :=
    selected_adjoint_comp_injective Spos S_M T hTneg
  have hdim :=
    LinearMap.finrank_le_finrank_of_injective hinj
  simpa using hdim

/--
For a full negative witness T, the background-null coordinate subspace.
On this subspace the full and selected quadratic forms coincide.
-/
noncomputable def backgroundNullCoords
    (S_B : B →L[ℂ] H)
    {k : ℕ}
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H) :
    Submodule ℂ (EuclideanSpace ℂ (Fin k)) :=
  LinearMap.ker (((S_B†) ∘L T).toLinearMap)

/--
The background-null slice of a k-dimensional witness has codimension at most
dim B, hence dimension at least k - dim B.
-/
theorem wd_t08_background_null_finrank_lower
    [FiniteDimensional ℂ B]
    (S_B : B →L[ℂ] H)
    {k : ℕ}
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H) :
    k - Module.finrank ℂ B
      ≤ Module.finrank ℂ (backgroundNullCoords S_B T) := by
  let F : EuclideanSpace ℂ (Fin k) →ₗ[ℂ] B :=
    (((S_B†) ∘L T).toLinearMap)
  have hrank := F.finrank_range_add_finrank_ker
  have hrange :
      Module.finrank ℂ (LinearMap.range F) ≤ Module.finrank ℂ B :=
    (LinearMap.range F).finrank_le
  have hdom :
      Module.finrank ℂ (EuclideanSpace ℂ (Fin k)) = k := by
    exact finrank_euclideanSpace_fin
  change k - Module.finrank ℂ B
      ≤ Module.finrank ℂ (LinearMap.ker F)
  omega

/--
On the background-null slice of a full negative witness, the selected form is
strictly negative on the unit sphere.
-/
theorem wd_t08_selected_negative_on_background_null
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    {k : ℕ}
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H)
    (hneg : ∀ x, ‖x‖ = 1 → fullQuadratic Spos S_M S_B (T x) < 0) :
    ∀ x : backgroundNullCoords S_B T,
      ‖(x : EuclideanSpace ℂ (Fin k))‖ = 1 →
      selectedQuadratic Spos S_M (T x) < 0 := by
  intro x hx
  have hB : (S_B†) (T (x : EuclideanSpace ℂ (Fin k))) = 0 := by
    exact x.property
  have hn := hneg (x : EuclideanSpace ℂ (Fin k)) hx
  unfold fullQuadratic at hn
  rw [hB, norm_zero] at hn
  simpa using hn

/--
WD-T08 full/background cap in kernel-subspace form:
from any k-dimensional full negative witness, one canonically obtains a
background-null negative slice of dimension at least k - dim B on which the
selected form itself is negative.

This is the formal finite-dimensional content of
ind₋(D_full) ≤ ind₋(D_M) + dim B.
-/
theorem wd_t08_full_negative_rank_background_reduction
    [FiniteDimensional ℂ B]
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H)
    (k : ℕ)
    (hfull : HasNegativeRank
      (fullQuadratic Spos S_M S_B)
      (Set.univ : Set H) k) :
    ∃ T : EuclideanSpace ℂ (Fin k) →L[ℂ] H,
      (k - Module.finrank ℂ B
        ≤ Module.finrank ℂ (backgroundNullCoords S_B T))
      ∧
      (∀ x : backgroundNullCoords S_B T,
        ‖(x : EuclideanSpace ℂ (Fin k))‖ = 1 →
        selectedQuadratic Spos S_M (T x) < 0) := by
  rcases hfull with ⟨T, -, hneg⟩
  exact ⟨T,
    wd_t08_background_null_finrank_lower S_B T,
    wd_t08_selected_negative_on_background_null
      Spos S_M S_B T hneg⟩

/--
WD-T08 assembled finite-sector index cap.
-/
theorem wd_t08_finite_selected_sector_index_cap
    [FiniteDimensional ℂ M]
    [FiniteDimensional ℂ B]
    (Spos : Kpos →L[ℂ] H)
    (S_M : M →L[ℂ] H)
    (S_B : B →L[ℂ] H) :
    (∀ k,
      HasNegativeRank
        (selectedQuadratic Spos S_M)
        (Set.univ : Set H) k →
      k ≤ Module.finrank ℂ M)
    ∧
    (∀ k,
      HasNegativeRank
        (fullQuadratic Spos S_M S_B)
        (Set.univ : Set H) k →
      ∃ T : EuclideanSpace ℂ (Fin k) →L[ℂ] H,
        (k - Module.finrank ℂ B
          ≤ Module.finrank ℂ (backgroundNullCoords S_B T))
        ∧
        (∀ x : backgroundNullCoords S_B T,
          ‖(x : EuclideanSpace ℂ (Fin k))‖ = 1 →
          selectedQuadratic Spos S_M (T x) < 0)) := by
  constructor
  · intro k hk
    exact wd_t08_selected_negative_rank_le_finrank Spos S_M k hk
  · intro k hk
    exact wd_t08_full_negative_rank_background_reduction
      Spos S_M S_B k hk

end WeilDefect.WDT08
