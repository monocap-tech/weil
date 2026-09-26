import Mathlib

namespace WeilDefect

/--
WD-T33: cutoffwise explicit-formula co-adaptation is pure scalar algebra.
If selected preservation has reduced the balance to N + F = P + A,
and the adaptive multiplier makes N = A, then P = F.
-/
theorem wd_t33_adaptive_cocancellation
    (N F P A : ℂ)
    (hBalance : N + F = P + A)
    (hCancel : N = A) :
    P = F := by
  calc
    P = (P + A) - A := by ring
    _ = (N + F) - A := by rw [← hBalance]
    _ = F := by rw [hCancel]; ring

end WeilDefect
