import Mathlib

namespace WeilDefect

attribute [local instance 1100] NormedSpace.complexToReal

open Filter Set
open scoped Topology

/--
The real-line exponential mode with complex frequency freq.
This is exactly x ↦ exp(x freq).
-/
noncomputable def realExpMode (freq : ℂ) (x : ℝ) : ℂ :=
  Complex.exp (Complex.ofRealCLM x * freq)

/-- The complex exponential mode never vanishes. -/
theorem realExpMode_ne_zero (freq : ℂ) (x : ℝ) :
    realExpMode freq x ≠ 0 := by
  simp [realExpMode]

/--
One real derivative of a complex exponential mode multiplies it by its
complex frequency.
-/
theorem hasDerivAt_realExpMode (freq : ℂ) (x : ℝ) :
    HasDerivAt (realExpMode freq) (freq * realExpMode freq x) x := by
  have hcomplex :
      HasDerivAt
        (fun z : ℂ => Complex.exp (z * freq))
        (freq * Complex.exp ((x : ℂ) * freq))
        (x : ℂ) := by
    have h :=
      hasDerivAt_exp_smul_const' (𝕂 := ℂ) (𝔸 := ℂ) freq (x : ℂ)
    simpa [← Complex.exp_eq_exp_ℂ, smul_eq_mul] using h
  change HasDerivAt
    (fun y : ℝ => Complex.exp ((y : ℂ) * freq))
    (freq * Complex.exp ((x : ℂ) * freq))
    x
  exact hcomplex.comp_ofReal

/--
The k-th real derivative of x ↦ exp(x freq) is freq^k exp(x freq).
-/
theorem iteratedDeriv_realExpMode (k : ℕ) (freq : ℂ) :
    iteratedDeriv k (realExpMode freq) =
      fun x : ℝ => freq ^ k * realExpMode freq x := by
  induction k with
  | zero =>
      simp
  | succ k ih =>
      rw [iteratedDeriv_succ, ih]
      funext x
      have h :=
        (hasDerivAt_realExpMode freq x).const_mul (freq ^ k)
      simpa [pow_succ, mul_assoc, mul_left_comm, mul_comm] using h.deriv

/--
Each scalar multiple of a real exponential mode is smooth, hence has every
finite iterated derivative required by the Vandermonde argument.
-/
theorem contDiffAt_const_mul_realExpMode
    (k : ℕ) (c freq : ℂ) (x : ℝ) :
    ContDiffAt ℝ k (fun y : ℝ => c * realExpMode freq y) x := by
  unfold realExpMode
  fun_prop

/--
Derivative formula for a finite exponential sum.
-/
theorem iteratedDeriv_finite_exp_sum
    {n : ℕ} (k : ℕ) (c freq : Fin n → ℂ) (x : ℝ) :
    iteratedDeriv k
        (fun y : ℝ => ∑ i : Fin n, c i * realExpMode (freq i) y) x
      =
        ∑ i : Fin n, c i * (freq i) ^ k * realExpMode (freq i) x := by
  rw [iteratedDeriv_fun_sum]
  · apply Finset.sum_congr rfl
    intro i hi
    rw [iteratedDeriv_const_mul_field]
    rw [iteratedDeriv_realExpMode]
    ring
  · intro i hi
    exact contDiffAt_const_mul_realExpMode k (c i) (freq i) x

/--
WD-T24 / ZW1-T5: finite distinct-frequency exponential independence on a
nonempty real interval.

If freq₁,...,freqₙ are distinct complex frequencies and a finite exponential sum
vanishes throughout a nonempty real interval, then every coefficient is zero.
-/
theorem wd_t24_finite_distinct_frequency_exponential_independence
    {n : ℕ}
    (freq c : Fin n → ℂ)
    (hfreq : Function.Injective freq)
    (a b : ℝ)
    (hab : a < b)
    (hzero :
      Set.EqOn
        (fun x : ℝ => ∑ i : Fin n, c i * realExpMode (freq i) x)
        0
        (Set.Ioo a b)) :
    c = 0 := by
  let x0 : ℝ := (a + b) / 2
  have hx0 : x0 ∈ Set.Ioo a b := by
    dsimp [x0]
    constructor <;> linarith

  let F : ℝ → ℂ :=
    fun x => ∑ i : Fin n, c i * realExpMode (freq i) x

  have hFzero : F =ᶠ[𝓝 x0] (0 : ℝ → ℂ) := by
    filter_upwards [isOpen_Ioo.mem_nhds hx0] with x hx
    simpa [F] using hzero hx

  let v : Fin n → ℂ :=
    fun i => c i * realExpMode (freq i) x0

  have hmom :
      ∀ k : Fin n,
        (∑ i : Fin n, v i * (freq i) ^ (k : ℕ)) = 0 := by
    intro k
    have hderiv :
        iteratedDeriv (k : ℕ) F x0 = 0 := by
      have h :=
        Filter.EventuallyEq.iteratedDeriv_eq (k : ℕ) hFzero
      simpa using h
    have hformula :=
      iteratedDeriv_finite_exp_sum (n := n) (k : ℕ) c freq x0
    rw [show F =
        (fun x : ℝ => ∑ i : Fin n, c i * realExpMode (freq i) x) by rfl] at hderiv
    rw [hformula] at hderiv
    simpa [v, mul_assoc, mul_left_comm, mul_comm] using hderiv

  have hv : v = 0 :=
    Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero hfreq hmom

  funext i
  have hvi : v i = 0 := by
    simpa [hv]
  dsimp [v] at hvi
  exact (mul_eq_zero.mp hvi).resolve_right (realExpMode_ne_zero (freq i) x0)

end WeilDefect
