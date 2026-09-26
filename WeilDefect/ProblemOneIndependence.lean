import WeilDefect.FiniteExponentialIndependence

namespace WeilDefect

attribute [local instance 1100] NormedSpace.complexToReal

open Filter Set
open scoped Topology

/--
The scalar symbol of the Dirichlet Green operator
L = -d²/dx² + 1/4 on an exponential mode exp(freq x).
-/
noncomputable def problemOneDenominator (freq : ℂ) : ℂ :=
  (1 / 4 : ℂ) - freq ^ 2

/--
The differential operator L = -d²/dx² + 1/4, represented pointwise through
Lean's iterated derivative.
-/
noncomputable def problemOneL (f : ℝ → ℂ) (x : ℝ) : ℂ :=
  -(iteratedDeriv 2 f x) + (1 / 4 : ℂ) * f x

/-- L acts diagonally on one complex exponential mode. -/
theorem problemOneL_realExpMode (freq : ℂ) (x : ℝ) :
    problemOneL (realExpMode freq) x =
      problemOneDenominator freq * realExpMode freq x := by
  simp [problemOneL, problemOneDenominator, iteratedDeriv_realExpMode]
  ring

/-- L commutes with multiplication by a fixed complex scalar. -/
theorem problemOneL_const_mul
    (c : ℂ) (f : ℝ → ℂ) (x : ℝ) :
    problemOneL (fun y => c * f y) x =
      c * problemOneL f x := by
  simp [problemOneL, iteratedDeriv_const_mul_field]
  ring

/-- Scalar form of the diagonal action of L on an exponential mode. -/
theorem problemOneL_const_mul_realExpMode
    (c freq : ℂ) (x : ℝ) :
    problemOneL (fun y => c * realExpMode freq y) x =
      c * problemOneDenominator freq * realExpMode freq x := by
  rw [problemOneL_const_mul, problemOneL_realExpMode]
  ring

/-- L is additive at a point for twice continuously differentiable functions. -/
theorem problemOneL_add
    (f g : ℝ → ℂ) (x : ℝ)
    (hf : ContDiffAt ℝ 2 f x)
    (hg : ContDiffAt ℝ 2 g x) :
    problemOneL (f + g) x =
      problemOneL f x + problemOneL g x := by
  simp [problemOneL, iteratedDeriv_add hf hg]
  ring

/--
A Problem-1 Green-preconditioned mode: one particular exponential solution,
plus arbitrary homogeneous boundary terms exp(x/2) and exp(-x/2).
-/
noncomputable def problemOneMode
    (freq q A B : ℂ) (x : ℝ) : ℂ :=
  q * realExpMode freq x
    + A * realExpMode (1 / 2 : ℂ) x
    + B * realExpMode (-1 / 2 : ℂ) x

/-- Every Problem-1 mode is smooth to every finite order. -/
theorem contDiffAt_problemOneMode
    (k : ℕ) (freq q A B : ℂ) (x : ℝ) :
    ContDiffAt ℝ k (problemOneMode freq q A B) x := by
  have hmain :=
    contDiffAt_const_mul_realExpMode k q freq x
  have hplus :=
    contDiffAt_const_mul_realExpMode k A (1 / 2 : ℂ) x
  have hminus :=
    contDiffAt_const_mul_realExpMode k B (-1 / 2 : ℂ) x
  have hfun :
      problemOneMode freq q A B =
        (fun y : ℝ =>
          q * realExpMode freq y
            + A * realExpMode (1 / 2 : ℂ) y
            + B * realExpMode (-1 / 2 : ℂ) y) := by
    funext y
    rfl
  rw [hfun]
  exact (hmain.add hplus).add hminus

/--
The two boundary-homogeneous frequencies are exactly in the kernel of L.
-/
theorem problemOneDenominator_half :
    problemOneDenominator (1 / 2 : ℂ) = 0 := by
  norm_num [problemOneDenominator]

theorem problemOneDenominator_neg_half :
    problemOneDenominator (-1 / 2 : ℂ) = 0 := by
  norm_num [problemOneDenominator]

/--
If q is the Green reciprocal, L removes the preconditioning and kills both
boundary-homogeneous corrections.
-/
theorem problemOneL_problemOneMode
    (freq q A B : ℂ) (x : ℝ)
    (hq : q * problemOneDenominator freq = 1) :
    problemOneL (problemOneMode freq q A B) x =
      realExpMode freq x := by
  let fmain : ℝ → ℂ := fun y => q * realExpMode freq y
  let fplus : ℝ → ℂ := fun y => A * realExpMode (1 / 2 : ℂ) y
  let fminus : ℝ → ℂ := fun y => B * realExpMode (-1 / 2 : ℂ) y
  have hmain : ContDiffAt ℝ 2 fmain x := by
    simpa [fmain] using contDiffAt_const_mul_realExpMode 2 q freq x
  have hplus : ContDiffAt ℝ 2 fplus x := by
    simpa [fplus] using
      contDiffAt_const_mul_realExpMode 2 A (1 / 2 : ℂ) x
  have hminus : ContDiffAt ℝ 2 fminus x := by
    simpa [fminus] using
      contDiffAt_const_mul_realExpMode 2 B (-1 / 2 : ℂ) x
  have hmode :
      problemOneMode freq q A B = fmain + fplus + fminus := by
    funext y
    rfl
  rw [hmode]
  rw [problemOneL_add (fmain + fplus) fminus x (hmain.add hplus) hminus]
  rw [problemOneL_add fmain fplus x hmain hplus]
  simp only [fmain, fplus, fminus]
  rw [problemOneL_const_mul_realExpMode]
  rw [problemOneL_const_mul_realExpMode]
  rw [problemOneL_const_mul_realExpMode]
  rw [problemOneDenominator_half, problemOneDenominator_neg_half, hq]
  simp

/-- Multiplying a Green-preconditioned mode by a fixed coefficient commutes with L. -/
theorem problemOneL_const_mul_problemOneMode
    (c freq q A B : ℂ) (x : ℝ)
    (hq : q * problemOneDenominator freq = 1) :
    problemOneL (fun y => c * problemOneMode freq q A B y) x =
      c * realExpMode freq x := by
  rw [problemOneL_const_mul]
  rw [problemOneL_problemOneMode freq q A B x hq]

/--
A scalar multiple of a Problem-1 mode is smooth to every finite order.
-/
theorem contDiffAt_const_mul_problemOneMode
    (k : ℕ) (c freq q A B : ℂ) (x : ℝ) :
    ContDiffAt ℝ k
      (fun y => c * problemOneMode freq q A B y) x := by
  have hmain :=
    contDiffAt_const_mul_realExpMode k (c * q) freq x
  have hplus :=
    contDiffAt_const_mul_realExpMode k (c * A) (1 / 2 : ℂ) x
  have hminus :=
    contDiffAt_const_mul_realExpMode k (c * B) (-1 / 2 : ℂ) x
  have hfun :
      (fun y => c * problemOneMode freq q A B y)
        =
      (fun y =>
        (c * q) * realExpMode freq y
          + (c * A) * realExpMode (1 / 2 : ℂ) y
          + (c * B) * realExpMode (-1 / 2 : ℂ) y) := by
    funext y
    simp [problemOneMode]
    ring
  rw [hfun]
  exact (hmain.add hplus).add hminus

/-- L commutes with a finite sum of twice-smooth functions. -/
theorem problemOneL_fin_sum
    {n : ℕ} (f : Fin n → ℝ → ℂ) (x : ℝ)
    (hf : ∀ i, ContDiffAt ℝ 2 (f i) x) :
    problemOneL (fun y => ∑ i : Fin n, f i y) x =
      ∑ i : Fin n, problemOneL (f i) x := by
  simp only [problemOneL]
  rw [iteratedDeriv_fun_sum]
  · rw [← Finset.sum_neg_distrib, Finset.mul_sum, ← Finset.sum_add_distrib]
  · intro i hi
    exact hf i

/--
WD-T25 core: every finite exact Problem-1 relation over distinct frequencies
is trivial once each Green coefficient satisfies the reciprocal identity.
-/
theorem wd_t25_finite_problem_one_relation_trivial
    {n : ℕ}
    (freq c q A B : Fin n → ℂ)
    (hfreq : Function.Injective freq)
    (hq : ∀ i, q i * problemOneDenominator (freq i) = 1)
    (a b : ℝ)
    (hab : a < b)
    (hzero :
      Set.EqOn
        (fun x : ℝ =>
          ∑ i : Fin n,
            c i * problemOneMode (freq i) (q i) (A i) (B i) x)
        0
        (Set.Ioo a b)) :
    c = 0 := by
  have hraw :
      Set.EqOn
        (fun x : ℝ => ∑ i : Fin n, c i * realExpMode (freq i) x)
        0
        (Set.Ioo a b) := by
    intro x hx
    let F : ℝ → ℂ :=
      fun y =>
        ∑ i : Fin n,
          c i * problemOneMode (freq i) (q i) (A i) (B i) y
    have hFx : F x = 0 := by
      simpa [F] using hzero hx
    have hD2 : iteratedDeriv 2 F x = 0 := by
      have h :=
        hzero.iteratedDeriv_of_isOpen isOpen_Ioo 2 hx
      simpa [F] using h
    have hLF : problemOneL F x = 0 := by
      simp [problemOneL, hFx, hD2]
    have hsum :
        problemOneL F x =
          ∑ i : Fin n, c i * realExpMode (freq i) x := by
      calc
        problemOneL F x =
            ∑ i : Fin n,
              problemOneL
                (fun y =>
                  c i * problemOneMode (freq i) (q i) (A i) (B i) y)
                x := by
          apply problemOneL_fin_sum
          intro i
          exact
            contDiffAt_const_mul_problemOneMode
              2 (c i) (freq i) (q i) (A i) (B i) x
        _ = ∑ i : Fin n, c i * realExpMode (freq i) x := by
          apply Finset.sum_congr rfl
          intro i hi
          exact
            problemOneL_const_mul_problemOneMode
              (c i) (freq i) (q i) (A i) (B i) x (hq i)
    rw [hsum] at hLF
    exact hLF
  exact
    wd_t24_finite_distinct_frequency_exponential_independence
      freq c hfreq a b hab hraw

/--
WD-T25 / ZW1-T6: an anchored nonzero Problem-1 channel cannot be cancelled
exactly on a nontrivial interval by any finite family of distinct-frequency
channels.

The other channels are unrestricted here; the theorem is therefore stronger
than the positive-helper specialization used in the zeta-Weil application.
-/
theorem wd_t25_no_exact_finite_positive_compensation
    {n : ℕ}
    (anchor : Fin n)
    (freq c q A B : Fin n → ℂ)
    (hfreq : Function.Injective freq)
    (hq : ∀ i, q i * problemOneDenominator (freq i) = 1)
    (hanchor : c anchor ≠ 0)
    (a b : ℝ)
    (hab : a < b) :
    ¬ Set.EqOn
        (fun x : ℝ =>
          ∑ i : Fin n,
            c i * problemOneMode (freq i) (q i) (A i) (B i) x)
        0
        (Set.Ioo a b) := by
  intro hzero
  have hc :
      c = 0 :=
    wd_t25_finite_problem_one_relation_trivial
      freq c q A B hfreq hq a b hab hzero
  apply hanchor
  simpa [hc]

end WeilDefect
