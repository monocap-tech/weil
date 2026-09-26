import Mathlib

namespace WeilDefect

/-- Algebraic core of WD-T26 for one antisymmetric raw residue pair. -/
theorem wd_t26_pair_zero_moment (α : ℂ) : α + (-α) = 0 := by
  simp

/--
Finite collections of antisymmetric residue pairs have zero total raw residue.
This is the algebraic core used by WD-T26 after the pair-coordinate map is formalized.
-/
theorem wd_t26_finite_pair_zero_moment (xs : List ℂ) :
    (xs.flatMap fun α => [α, -α]).sum = 0 := by
  induction xs with
  | nil =>
      simp
  | cons α xs ih =>
      simp [ih]

end WeilDefect
