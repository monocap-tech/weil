import Mathlib.Algebra.IsPrimePow
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Order.Filter.AtTopBot.Archimedean

namespace WeilDefect

open scoped BigOperators

/-- Prime powers active under the compact-window support inequality log n < 2c. -/
def activePrimePowers (c : ℝ) : Set ℕ :=
  {n | IsPrimePow n ∧ Real.log (n : ℝ) < 2 * c}

/--
WD-T34 arithmetic core: for every fixed real support radius, only finitely many
natural prime powers satisfy the strict compact-window inequality log n < 2c.
-/
theorem wd_t34_active_prime_powers_finite (c : ℝ) :
    (activePrimePowers c).Finite := by
  obtain ⟨N : ℕ, hN⟩ := exists_nat_gt (Real.exp (2 * c))
  refine (Set.finite_Iio N).subset ?_
  intro n hn
  rcases hn with ⟨hnpp, hnlog⟩
  have hnNat : 0 < n := lt_of_lt_of_le Nat.zero_lt_two hnpp.two_le
  have hnpos : 0 < (n : ℝ) := by exact_mod_cast hnNat
  have hnexp : (n : ℝ) < Real.exp (2 * c) :=
    (Real.log_lt_iff_lt_exp hnpos).mp hnlog
  have hnNreal : (n : ℝ) < (N : ℝ) := lt_trans hnexp hN
  exact_mod_cast hnNreal


/-- Finite set of active prime powers at support radius c. -/
noncomputable def activePrimePowerFinset (c : ℝ) : Finset ℕ :=
  (wd_t34_active_prime_powers_finite c).toFinset

@[simp]
theorem mem_activePrimePowerFinset
    (c : ℝ) (n : ℕ) :
    n ∈ activePrimePowerFinset c ↔
      IsPrimePow n ∧ Real.log (n : ℝ) < 2 * c := by
  simp [activePrimePowerFinset, activePrimePowers]

/-- Positive and negative logarithmic shifts contributed by active prime powers. -/
def activePrimeTranslationShifts (c : ℝ) : Set ℝ :=
  ((fun n : ℕ => Real.log (n : ℝ)) '' activePrimePowers c)
    ∪
  ((fun n : ℕ => -Real.log (n : ℝ)) '' activePrimePowers c)

/--
The physical-space arithmetic shift set attached to a fixed compact support
is finite.
-/
theorem wd_t34_active_prime_translation_shifts_finite
    (c : ℝ) :
    (activePrimeTranslationShifts c).Finite := by
  unfold activePrimeTranslationShifts
  exact
    ((wd_t34_active_prime_powers_finite c).image
      (fun n : ℕ => Real.log (n : ℝ))).union
    ((wd_t34_active_prime_powers_finite c).image
      (fun n : ℕ => -Real.log (n : ℝ)))

/-- Translation of a physical-space function by a real displacement. -/
def translateBy
    {E : Type*}
    (a : ℝ) (f : ℝ → E) (x : ℝ) : E :=
  f (x - a)

/-- Symmetric translation pair associated to one prime power. -/
noncomputable def symmetricPrimeTranslation
    {E : Type*} [Add E]
    (n : ℕ) (f : ℝ → E) (x : ℝ) : E :=
  translateBy (Real.log (n : ℝ)) f x
    + translateBy (-Real.log (n : ℝ)) f x

/--
The compact-window prime translation operator is literally a finite sum over
the active prime-power Finset.
-/
noncomputable def compactPrimeTranslationSum
    {E : Type*} [AddCommMonoid E] [Module ℝ E]
    (c : ℝ)
    (weight : ℕ → ℝ)
    (f : ℝ → E)
    (x : ℝ) : E :=
  Finset.sum (activePrimePowerFinset c)
    (fun n => weight n • symmetricPrimeTranslation n f x)

/--
WD-T34 / ZW2-T6: fixed compact support selects a finite index set of prime
powers, and hence only finitely many symmetric logarithmic translations.
-/
theorem wd_t34_finite_prime_power_translations
    (c : ℝ) :
    ∃ s : Finset ℕ,
      (∀ n : ℕ,
        n ∈ s ↔
          IsPrimePow n ∧ Real.log (n : ℝ) < 2 * c)
      ∧
      (activePrimeTranslationShifts c).Finite := by
  refine ⟨activePrimePowerFinset c, ?_, ?_⟩
  · intro n
    exact mem_activePrimePowerFinset c n
  · exact wd_t34_active_prime_translation_shifts_finite c

/-- Prime powers lying exactly on the support threshold log n = 2c. -/
def primePowerThreshold (c : ℝ) : Set ℕ :=
  {n | IsPrimePow n ∧ Real.log (n : ℝ) = 2 * c}

/--
An exact compact-support threshold contains at most one natural prime power.
This is the finite threshold-event part of ZW2-T6.
-/
theorem primePowerThreshold_subsingleton
    (c : ℝ) :
    (primePowerThreshold c).Subsingleton := by
  intro a ha b hb
  rcases ha with ⟨haPrime, haLog⟩
  rcases hb with ⟨hbPrime, hbLog⟩
  have haNat : 0 < a :=
    lt_of_lt_of_le Nat.zero_lt_two haPrime.two_le
  have hbNat : 0 < b :=
    lt_of_lt_of_le Nat.zero_lt_two hbPrime.two_le
  have haPos : 0 < (a : ℝ) := by exact_mod_cast haNat
  have hbPos : 0 < (b : ℝ) := by exact_mod_cast hbNat
  have hlog :
      Real.log (a : ℝ) = Real.log (b : ℝ) := by
    rw [haLog, hbLog]
  have habReal : (a : ℝ) = (b : ℝ) := by
    calc
      (a : ℝ) = Real.exp (Real.log (a : ℝ)) := by
        symm
        exact Real.exp_log haPos
      _ = Real.exp (Real.log (b : ℝ)) := by rw [hlog]
      _ = (b : ℝ) := Real.exp_log hbPos
  exact_mod_cast habReal

end WeilDefect
