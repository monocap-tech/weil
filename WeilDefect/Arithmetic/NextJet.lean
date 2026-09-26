import WeilDefect.RationalResponse
import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas

namespace WeilDefect

open Filter
open scoped Topology BigOperators

/-- Completed lift H = Xi * R used in WD-T32. -/
def completedResponseLift
    (Xi R : ℂ → ℂ) (z : ℂ) : ℂ :=
  Xi z * R z

/--
All derivatives below the multiplicity vanish for the centered power, while
the multiplicity-order derivative is m!.
-/
theorem iteratedDeriv_centered_power
    (mu : ℂ) (m k : ℕ) :
    iteratedDeriv k (fun z : ℂ => (z - mu) ^ m) mu
      =
    if k = m then (m.factorial : ℂ) else 0 := by
  have hshift :=
    congrFun
      (iteratedDeriv_comp_const_add
        (n := k)
        (f := fun z : ℂ => (z - mu) ^ m)
        (s := mu))
      0
  have hpow :
      iteratedDeriv k (fun z : ℂ => z ^ m) 0
        =
      if k = m then (m.factorial : ℂ) else 0 := by
    simpa using
      (iteratedDeriv_fun_pow_zero
        (𝕜 := ℂ) (n := k) (m := m))
  have hshift0 :
      iteratedDeriv k (fun z : ℂ => z ^ m) 0
        =
      iteratedDeriv k (fun z : ℂ => (z - mu) ^ m) mu := by
    simpa only [add_zero, add_sub_cancel_left] using hshift
  exact hshift0.symm.trans hpow

/--
Multiplicity-order derivative of a locally factored zero:
D^m ((z-mu)^m g(z)) at mu = m! g(mu).
-/
theorem iteratedDeriv_centered_power_mul
    (mu : ℂ) (m : ℕ) (g : ℂ → ℂ)
    (hg : ContDiffAt ℂ m g mu) :
    iteratedDeriv m
        (fun z : ℂ => (z - mu) ^ m * g z) mu
      =
    (m.factorial : ℂ) * g mu := by
  have hp :
      ContDiffAt ℂ m (fun z : ℂ => (z - mu) ^ m) mu := by
    fun_prop
  change
    iteratedDeriv m
      ((fun z : ℂ => (z - mu) ^ m) * g) mu
      =
    (m.factorial : ℂ) * g mu
  rw [iteratedDeriv_mul hp hg]
  classical
  rw [Finset.sum_eq_single m]
  · rw [iteratedDeriv_centered_power]
    simp
  · intro i hi him
    have hi_lt : i < m := by
      have hi_le : i ≤ m := by
        simpa [Nat.lt_succ_iff] using hi
      exact lt_of_le_of_ne hi_le him
    rw [iteratedDeriv_centered_power]
    simp [ne_of_lt hi_lt]
  · simp

/--
ZW2-T3 / WD-T32: complementary next-jet identity.

The only local analytic input is the standard multiplicity factorization
Xi(z) = (z-mu)^m g(z), with g(mu) nonzero, together with analyticity of the
complementary response at mu.
-/
theorem wd_t32_complementary_next_jet_identity
    (Xi R g : ℂ → ℂ)
    (mu : ℂ) (m : ℕ)
    (hXi :
      Xi =ᶠ[𝓝 mu]
        (fun z : ℂ => (z - mu) ^ m * g z))
    (hg : ContDiffAt ℂ m g mu)
    (hR : ContDiffAt ℂ m R mu)
    (hg0 : g mu ≠ 0) :
    R mu
      =
    iteratedDeriv m (completedResponseLift Xi R) mu
      / iteratedDeriv m Xi mu := by
  have hXiDeriv :
      iteratedDeriv m Xi mu
        =
      (m.factorial : ℂ) * g mu := by
    calc
      iteratedDeriv m Xi mu
          =
        iteratedDeriv m
          (fun z : ℂ => (z - mu) ^ m * g z) mu :=
        hXi.iteratedDeriv_eq m
      _ = (m.factorial : ℂ) * g mu :=
        iteratedDeriv_centered_power_mul mu m g hg
  have hgR : ContDiffAt ℂ m (fun z => g z * R z) mu :=
    hg.mul hR
  have hHLocal :
      completedResponseLift Xi R =ᶠ[𝓝 mu]
        (fun z : ℂ => (z - mu) ^ m * (g z * R z)) := by
    filter_upwards [hXi] with z hz
    simp only [completedResponseLift, hz]
    ring
  have hHDeriv :
      iteratedDeriv m (completedResponseLift Xi R) mu
        =
      (m.factorial : ℂ) * g mu * R mu := by
    calc
      iteratedDeriv m (completedResponseLift Xi R) mu
          =
        iteratedDeriv m
          (fun z : ℂ => (z - mu) ^ m * (g z * R z)) mu :=
        hHLocal.iteratedDeriv_eq m
      _ = (m.factorial : ℂ) * (g mu * R mu) :=
        iteratedDeriv_centered_power_mul mu m
          (fun z => g z * R z) hgR
      _ = (m.factorial : ℂ) * g mu * R mu := by ring
  have hfac : (m.factorial : ℂ) ≠ 0 := by
    exact_mod_cast Nat.factorial_ne_zero m
  have hden :
      (m.factorial : ℂ) * g mu ≠ 0 :=
    mul_ne_zero hfac hg0
  rw [hXiDeriv, hHDeriv]
  field_simp [hden]

/-- Finite near complementary divisor response. -/
noncomputable def nearComplementaryResponse
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι)
    (mult : ι → ℕ)
    (mu : ι → ℂ)
    (psi : ℂ → ℂ)
    (R : ℂ → ℂ) : ℂ :=
  ∑ i ∈ s, (mult i : ℂ) * psi (mu i) * R (mu i)

/-- Finite weighted completed-Xi next-jet field. -/
noncomputable def weightedNearNextJetField
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι)
    (mult : ι → ℕ)
    (mu : ι → ℂ)
    (psi : ℂ → ℂ)
    (Xi R : ℂ → ℂ) : ℂ :=
  ∑ i ∈ s,
    (mult i : ℂ) * psi (mu i)
      * (iteratedDeriv (mult i) (completedResponseLift Xi R) (mu i)
          / iteratedDeriv (mult i) Xi (mu i))

/--
ZW2-T4 / WD-T32: substituting the local next-jet identity at every member of a
finite complementary packet turns the near divisor response exactly into the
weighted completed-Xi next-jet field.
-/
theorem wd_t32_weighted_near_next_jet_representation
    {ι : Type*} [DecidableEq ι]
    (s : Finset ι)
    (mult : ι → ℕ)
    (mu : ι → ℂ)
    (psi : ℂ → ℂ)
    (Xi R : ℂ → ℂ)
    (g : ι → ℂ → ℂ)
    (hXi :
      ∀ i ∈ s,
        Xi =ᶠ[𝓝 (mu i)]
          (fun z : ℂ => (z - mu i) ^ (mult i) * g i z))
    (hg :
      ∀ i ∈ s,
        ContDiffAt ℂ (mult i) (g i) (mu i))
    (hR :
      ∀ i ∈ s,
        ContDiffAt ℂ (mult i) R (mu i))
    (hg0 :
      ∀ i ∈ s,
        g i (mu i) ≠ 0) :
    nearComplementaryResponse s mult mu psi R
      =
    weightedNearNextJetField s mult mu psi Xi R := by
  unfold nearComplementaryResponse weightedNearNextJetField
  apply Finset.sum_congr rfl
  intro i hi
  congr 1
  rw [wd_t32_complementary_next_jet_identity
    Xi R (g i) (mu i) (mult i)
    (hXi i hi) (hg i hi) (hR i hi) (hg0 i hi)]

end WeilDefect
