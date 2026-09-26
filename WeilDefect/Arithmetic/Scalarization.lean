import Mathlib

namespace WeilDefect

/--
WD-T30 algebraic core: from two scalar selected-response values, not both zero,
construct a nonzero coefficient pair whose linear combination cancels the
selected response.
-/
theorem wd_t30_two_mode_selected_preserving
    (c₁ c₂ : ℂ)
    (h : c₁ ≠ 0 ∨ c₂ ≠ 0) :
    ∃ β₁ β₂ : ℂ,
      (β₁ ≠ 0 ∨ β₂ ≠ 0) ∧
      β₁ * c₁ + β₂ * c₂ = 0 := by
  refine ⟨c₂, -c₁, ?_, ?_⟩
  · rcases h with h₁ | h₂
    · exact Or.inr (neg_ne_zero.mpr h₁)
    · exact Or.inl h₂
  · ring

/--
WD-T30 degenerate branch: if both selected-response values vanish, either
basis mode is already selected-preserving.
-/
theorem wd_t30_both_zero_selected_preserving
    (c₁ c₂ : ℂ)
    (h₁ : c₁ = 0)
    (h₂ : c₂ = 0) :
    (1 : ℂ) * c₁ + 0 * c₂ = 0 := by
  simp [h₁, h₂]


/--
WD-T30 in functional form: for any complex-linear selected-response functional
and two modes whose selected responses are not both zero, there is a nontrivial
linear combination of the two modes that is selected-preserving.
-/
theorem wd_t30_two_mode_kernel_combination
    {V : Type*}
    [AddCommMonoid V]
    [Module ℂ V]
    (C : V →ₗ[ℂ] ℂ)
    (ψ₁ ψ₂ : V)
    (h : C ψ₁ ≠ 0 ∨ C ψ₂ ≠ 0) :
    ∃ β₁ β₂ : ℂ,
      (β₁ ≠ 0 ∨ β₂ ≠ 0) ∧
      C (β₁ • ψ₁ + β₂ • ψ₂) = 0 := by
  refine ⟨C ψ₂, -C ψ₁, ?_, ?_⟩
  · rcases h with h₁ | h₂
    · exact Or.inr (neg_ne_zero.mpr h₁)
    · exact Or.inl h₂
  · simp
    ring

/--
WD-T30 degenerate functional branch: if the selected-response functional
vanishes identically, every multiplier mode is selected-preserving.
-/
theorem wd_t30_zero_functional_preserves_every_mode
    {V : Type*}
    [AddCommMonoid V]
    [Module ℂ V]
    (ψ : V) :
    (0 : V →ₗ[ℂ] ℂ) ψ = 0 := by
  simp

end WeilDefect
