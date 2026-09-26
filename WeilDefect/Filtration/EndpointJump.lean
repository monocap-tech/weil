import WeilDefect.Filtration.CriticalDichotomy
import WeilDefect.Screening.DefectIndex
import Mathlib

namespace WeilDefect.WDT18

open scoped InnerProduct
open WeilDefect.WDT01

variable {H : Type*}
variable [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/--
The endpoint space, viewed as a submodule of the right-limit space.
When A0 ≤ Aplus this is canonically just A0 with its codomain restricted
to Aplus.
-/
noncomputable def endpointInside
    (A0 Aplus : ClosedSubmodule ℂ H) :
    Submodule ℂ Aplus :=
  A0.toSubmodule.comap Aplus.toSubmodule.subtype

/-- The algebraic endpoint-jump quotient Aplus / A0. -/
abbrev EndpointQuotient
    (A0 Aplus : ClosedSubmodule ℂ H) :=
  Aplus ⧸ endpointInside A0 Aplus

/--
A finite negative witness whose values lie in Aplus, followed by the canonical
endpoint-jump quotient map.
-/
noncomputable def endpointQuotientMap
    {k : ℕ}
    (A0 Aplus : ClosedSubmodule ℂ H)
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H)
    (hmem : ∀ x, T x ∈ Aplus) :
    EuclideanSpace ℂ (Fin k) →ₗ[ℂ] EndpointQuotient A0 Aplus :=
  (endpointInside A0 Aplus).mkQ.comp
    ((T.codRestrict Aplus.toSubmodule hmem).toLinearMap)

/--
WD-C6 injectivity core: if the endpoint is q-nonnegative while a finite
witness is strictly q-negative on the unit sphere, then no nonzero witness
direction can disappear in the endpoint quotient.
-/
theorem wd_t18_endpoint_quotient_map_injective
    (q : H → ℝ)
    (A0 Aplus : ClosedSubmodule ℂ H)
    (_hinc : A0 ≤ Aplus)
    {k : ℕ}
    (T : EuclideanSpace ℂ (Fin k) →L[ℂ] H)
    (hmem : ∀ x, T x ∈ Aplus)
    (hendpoint : ∀ y : H, y ∈ A0 → 0 ≤ q y)
    (hneg : ∀ x, ‖x‖ = 1 → q (T x) < 0) :
    Function.Injective (endpointQuotientMap A0 Aplus T hmem) := by
  intro x y hxy
  by_contra hne
  have hdne : x - y ≠ 0 := sub_ne_zero.mpr hne
  let u : EuclideanSpace ℂ (Fin k) :=
    NormedSpace.normalize (x - y)
  have hu : ‖u‖ = 1 :=
    NormedSpace.norm_normalize hdne
  let F := endpointQuotientMap A0 Aplus T hmem
  have hFsub : F (x - y) = 0 := by
    rw [map_sub, hxy, sub_self]
  have hFu : F u = 0 := by
    rw [show u = ‖x - y‖⁻¹ • (x - y) by rfl]
    rw [LinearMap.map_smul_of_tower, hFsub, smul_zero]
  have hk :
      ((T.toLinearMap.codRestrict Aplus.toSubmodule hmem) u)
        ∈ LinearMap.ker (endpointInside A0 Aplus).mkQ := by
    rw [LinearMap.mem_ker]
    simpa [F, endpointQuotientMap] using hFu
  rw [Submodule.ker_mkQ] at hk
  have hA0 : T u ∈ A0 := by
    change
      (((T.toLinearMap.codRestrict Aplus.toSubmodule hmem) u : Aplus) : H)
        ∈ A0
    exact hk
  have hnonneg := hendpoint (T u) hA0
  have hstrict := hneg u hu
  linarith

/--
WD-C6 finite-index form. Every k-dimensional strictly negative witness inside
Aplus injects into the finite-dimensional endpoint quotient Aplus / A0.
Hence k is bounded by the dimension of the endpoint jump.
-/
theorem wd_t18_endpoint_jump_negative_rank_le_quotient
    (q : H → ℝ)
    (A0 Aplus : ClosedSubmodule ℂ H)
    (hinc : A0 ≤ Aplus)
    (hendpoint : ∀ y : H, y ∈ A0 → 0 ≤ q y)
    (k : ℕ)
    (hneg :
      HasNegativeRank q (Aplus : Set H) k)
    [Module.Finite ℂ (EndpointQuotient A0 Aplus)] :
    k ≤ Module.finrank ℂ (EndpointQuotient A0 Aplus) := by
  rcases hneg with ⟨T, hmem, hTneg⟩
  have hinj :
      Function.Injective
        (endpointQuotientMap A0 Aplus T hmem) :=
    wd_t18_endpoint_quotient_map_injective
      q A0 Aplus hinc T hmem hendpoint hTneg
  have hdim :=
    LinearMap.finrank_le_finrank_of_injective hinj
  simpa using hdim

/--
One-dimensional endpoint jumps can carry at most one new negative direction.
-/
theorem wd_t18_one_dimensional_jump_rank_cap
    (q : H → ℝ)
    (A0 Aplus : ClosedSubmodule ℂ H)
    (hinc : A0 ≤ Aplus)
    (hendpoint : ∀ y : H, y ∈ A0 → 0 ≤ q y)
    (hjump : Module.finrank ℂ (EndpointQuotient A0 Aplus) = 1)
    (k : ℕ)
    (hneg :
      HasNegativeRank q (Aplus : Set H) k)
    [Module.Finite ℂ (EndpointQuotient A0 Aplus)] :
    k ≤ 1 := by
  rw [← hjump]
  exact
    wd_t18_endpoint_jump_negative_rank_le_quotient
      q A0 Aplus hinc hendpoint k hneg

end WeilDefect.WDT18
