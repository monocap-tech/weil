import Mathlib
import WeilDefect.ProblemOneIndependence

namespace WeilDefect

open Filter
open scoped Topology BigOperators

/--
Unit-height shell model for the zeta zeros, counted with multiplicity.

The formal shell type is a Sigma type: shell n contains count n coordinates.
-/
abbrev ZetaShellIndex (count : ℕ → ℕ) :=
  Σ n : ℕ, Fin (count n)

/--
Explicit imported interface for the Titchmarsh unit-height zero count.

The pinned source gives O(log T). For summability we package the elementary
coarser consequence O(sqrt T), which follows because log T = o(T^(1/2)).
No zero-distribution theorem is introduced as a project axiom.
-/
structure ZetaZeroShellCountData
    (count : ℕ → ℕ) (C : ℝ) : Prop where
  C_nonneg : 0 ≤ C
  count_le_half_power :
    ∀ n : ℕ,
      (count n : ℝ)
        ≤ C * (((n : ℝ) + 1) ^ (1 / 2 : ℝ))

/--
Explicit native Dirichlet-resolvent column estimate interface.

energySq gamma represents the squared H^{-1}_L norm of one Problem-1
synthesis column. The direct resolvent calculation gives inverse-square
decay in the unit-height shell index.
-/
structure NativeProblemOneResolventData
    (count : ℕ → ℕ)
    (energySq : ZetaShellIndex count → ℝ)
    (A : ℝ) : Prop where
  A_nonneg : 0 ≤ A
  energy_nonneg :
    ∀ gamma, 0 ≤ energySq gamma
  energy_le_inverse_square :
    ∀ gamma,
      energySq gamma
        ≤ A * (((gamma.1 : ℝ) + 1) ^ (-2 : ℝ))

/--
Basis-square-summability formulation of the Hilbert-Schmidt criterion for an
l2-domain. Mathlib v4.34.0 has no dedicated Hilbert-Schmidt operator type, so
this is the project-level semantic interface used by WD-T28.
-/
def NativeHilbertSchmidtCriterion
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ) : Prop :=
  Summable energySq

/--
For a Hilbert-Schmidt synthesis S, the trace mass of SS* is the same basis
square sum. This criterion records the trace-class covariance conclusion at
the coefficient level in the pinned Mathlib environment.
-/
def NativeTraceClassCovarianceCriterion
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ) : Prop :=
  Summable energySq

/-- Sum of squared column norms in one unit-height shell. -/
noncomputable def nativeShellEnergy
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ)
    (n : ℕ) : ℝ :=
  ∑ i : Fin (count n), energySq ⟨n, i⟩

/-- The shifted p-series with exponent 3/2 is summable. -/
theorem summable_shifted_rpow_neg_three_halves :
    Summable
      (fun n : ℕ =>
        (((n : ℝ) + 1) ^ (-(3 / 2 : ℝ)))) := by
  have h0 :
      Summable
        (fun n : ℕ => (n : ℝ) ^ (-(3 / 2 : ℝ))) :=
    (Real.summable_nat_rpow).2 (by norm_num)
  have hshift :=
    (summable_nat_add_iff
      (f := fun n : ℕ => (n : ℝ) ^ (-(3 / 2 : ℝ))) 1).2 h0
  simpa [Nat.cast_add, Nat.cast_one] using hshift

/--
Shell energy is dominated by a summable 3/2-power series.
-/
theorem nativeShellEnergy_le_three_halves
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ)
    (A C : ℝ)
    (hCount : ZetaZeroShellCountData count C)
    (hResolvent : NativeProblemOneResolventData count energySq A)
    (n : ℕ) :
    nativeShellEnergy energySq n
      ≤
    (A * C) * (((n : ℝ) + 1) ^ (-(3 / 2 : ℝ))) := by
  let x : ℝ := (n : ℝ) + 1
  have hx : 0 < x := by
    dsimp [x]
    positivity
  calc
    nativeShellEnergy energySq n
        ≤ ∑ _i : Fin (count n), A * (x ^ (-2 : ℝ)) := by
          unfold nativeShellEnergy
          apply Finset.sum_le_sum
          intro i hi
          simpa [x] using
            hResolvent.energy_le_inverse_square ⟨n, i⟩
    _ = (count n : ℝ) * (A * (x ^ (-2 : ℝ))) := by
          simp
    _ ≤
      (C * (x ^ (1 / 2 : ℝ))) * (A * (x ^ (-2 : ℝ))) := by
        apply mul_le_mul_of_nonneg_right
        · simpa [x] using hCount.count_le_half_power n
        · exact mul_nonneg hResolvent.A_nonneg (Real.rpow_nonneg hx.le _)
    _ = (A * C) * (x ^ (-(3 / 2 : ℝ))) := by
      calc
        (C * (x ^ (1 / 2 : ℝ))) * (A * (x ^ (-2 : ℝ)))
            =
          (A * C) * ((x ^ (1 / 2 : ℝ)) * (x ^ (-2 : ℝ))) := by
            ring
        _ =
          (A * C) * (x ^ ((1 / 2 : ℝ) + (-2 : ℝ))) := by
            rw [Real.rpow_add hx]
        _ = (A * C) * (x ^ (-(3 / 2 : ℝ))) := by
            congr 2
            norm_num

/--
The unit-height shell sums are summable from the resolvent estimate and the
Titchmarsh shell-count premise.
-/
theorem nativeShellEnergy_summable
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ)
    (A C : ℝ)
    (hCount : ZetaZeroShellCountData count C)
    (hResolvent : NativeProblemOneResolventData count energySq A) :
    Summable (nativeShellEnergy energySq) := by
  have hbase := summable_shifted_rpow_neg_three_halves
  have hmajor :
      Summable
        (fun n : ℕ =>
          (A * C) * (((n : ℝ) + 1) ^ (-(3 / 2 : ℝ)))) :=
    hbase.mul_left (A * C)
  have hnonneg :
      ∀ n, 0 ≤ nativeShellEnergy energySq n := by
    intro n
    unfold nativeShellEnergy
    exact Finset.sum_nonneg fun i _ =>
      hResolvent.energy_nonneg ⟨n, i⟩
  exact Summable.of_nonneg_of_le
    hnonneg
    (nativeShellEnergy_le_three_halves
      energySq A C hCount hResolvent)
    hmajor

/--
WD-T28 basis-square criterion: all native Problem-1 column energies are
summable over the zero shells.
-/
theorem wd_t28_native_basis_square_summable
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ)
    (A C : ℝ)
    (hCount : ZetaZeroShellCountData count C)
    (hResolvent : NativeProblemOneResolventData count energySq A) :
    Summable energySq := by
  rw [summable_sigma_of_nonneg]
  constructor
  · intro n
    exact Summable.of_finite
  · have hfun :
        (fun n : ℕ => ∑' i : Fin (count n), energySq ⟨n, i⟩)
          =
        nativeShellEnergy energySq := by
      funext n
      simp [nativeShellEnergy]
    rw [hfun]
    exact nativeShellEnergy_summable energySq A C hCount hResolvent
  · intro gamma
    exact hResolvent.energy_nonneg gamma

/--
WD-T28 / ZW1-T9: in the pinned Mathlib environment, the native Problem-1
synthesis satisfies the Hilbert-Schmidt basis criterion, and its positive
covariance satisfies the corresponding trace-class trace-sum criterion.
-/
theorem wd_t28_native_problem_one_hilbert_schmidt
    {count : ℕ → ℕ}
    (energySq : ZetaShellIndex count → ℝ)
    (A C : ℝ)
    (hCount : ZetaZeroShellCountData count C)
    (hResolvent : NativeProblemOneResolventData count energySq A) :
    NativeHilbertSchmidtCriterion energySq
      ∧ NativeTraceClassCovarianceCriterion energySq := by
  have hs :=
    wd_t28_native_basis_square_summable
      energySq A C hCount hResolvent
  exact ⟨hs, hs⟩

end WeilDefect
