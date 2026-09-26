import Mathlib

namespace WeilDefect

/-- A raw conjugate-pair coefficient has two coordinates. -/
abbrev RawPair := Bool → ℂ

/-- Conjugation swaps the two raw coordinates. -/
def pairSwap (v : RawPair) : RawPair
  | false => v true
  | true => v false

/-- Unnormalized positive pair eigenchannel. -/
def pairPos : RawPair := fun _ => 1

/-- Unnormalized negative pair eigenchannel. -/
def pairNeg : RawPair
  | false => 1
  | true => -1

/-- WD-T20: the symmetric pair channel is fixed by conjugation. -/
theorem wd_t20_pair_pos_eigen : pairSwap pairPos = pairPos := by
  funext b
  cases b <;> simp [pairSwap, pairPos]

/-- WD-T20: the antisymmetric pair channel has conjugation eigenvalue -1. -/
theorem wd_t20_pair_neg_eigen : pairSwap pairNeg = -pairNeg := by
  funext b
  cases b <;> simp [pairSwap, pairNeg]


/--
WD-T20: the raw two-coordinate pair is linearly equivalent to its
positive/negative eigenchannel coordinates.
-/
noncomputable def pairEigenEquiv : (ℂ × ℂ) ≃ₗ[ℂ] RawPair where
  toFun p b := p.1 * pairPos b + p.2 * pairNeg b
  invFun v :=
    ((v false + v true) / 2, (v false - v true) / 2)
  left_inv p := by
    apply Prod.ext <;> simp [pairPos, pairNeg] <;> ring
  right_inv v := by
    funext b
    cases b <;> simp [pairPos, pairNeg] <;> ring
  map_add' x y := by
    funext b
    cases b <;> simp [pairPos, pairNeg] <;> ring
  map_smul' a x := by
    funext b
    cases b <;> simp [pairPos, pairNeg] <;> ring

/-- In eigenchannel coordinates, conjugation fixes the positive coordinate and negates the negative one. -/
theorem wd_t20_pair_diagonalization (a b : ℂ) :
    pairSwap (pairEigenEquiv (a, b)) = pairEigenEquiv (a, -b) := by
  funext q
  cases q <;> simp [pairSwap, pairEigenEquiv, pairPos, pairNeg] <;> ring

/-- The positive-T conjugate pair in Bombieri ordinate coordinates. -/
def quartetPairPos (T δ : ℝ) : ℂ × ℂ :=
  ((T : ℂ) + (δ : ℂ) * Complex.I,
   (T : ℂ) - (δ : ℂ) * Complex.I)

/-- The negative-T conjugate pair in Bombieri ordinate coordinates. -/
def quartetPairNeg (T δ : ℝ) : ℂ × ℂ :=
  ((-T : ℂ) + (δ : ℂ) * Complex.I,
   (-T : ℂ) - (δ : ℂ) * Complex.I)

/-- Each positive-T pair is a genuine complex-conjugate pair. -/
theorem wd_t21_quartet_pair_pos_conjugate (T δ : ℝ) :
    (quartetPairPos T δ).2 =
      star (quartetPairPos T δ).1 := by
  simp [quartetPairPos, sub_eq_add_neg]

/-- Each negative-T pair is a genuine complex-conjugate pair. -/
theorem wd_t21_quartet_pair_neg_conjugate (T δ : ℝ) :
    (quartetPairNeg T δ).2 =
      star (quartetPairNeg T δ).1 := by
  simp [quartetPairNeg, sub_eq_add_neg]

/-- Off-critical displacement makes both quartet pairs nonreal. -/
theorem wd_t21_quartet_pairs_nonreal
    (T δ : ℝ) (hδ : δ ≠ 0) :
    (quartetPairPos T δ).1.im ≠ 0
      ∧ (quartetPairNeg T δ).1.im ≠ 0 := by
  constructor <;> simpa [quartetPairPos, quartetPairNeg] using hδ

/-- Nonzero ordinate T separates the +T and -T conjugate pairs. -/
theorem wd_t21_quartet_pairs_distinct
    (T δ : ℝ) (hT : T ≠ 0) :
    quartetPairPos T δ ≠ quartetPairNeg T δ := by
  intro h
  have hfirst :
      (quartetPairPos T δ).1 = (quartetPairNeg T δ).1 :=
    congrArg Prod.fst h
  have hre :
      T = -T := by
    have := congrArg Complex.re hfirst
    simpa [quartetPairPos, quartetPairNeg] using this
  apply hT
  linarith

/-- The selected negative coordinate type for one simple functional-equation quartet. -/
abbrev SimpleQuartetNegative := Fin 2

/-- WD-T21: one simple quartet contains two negative conjugate-pair coordinates. -/
theorem wd_t21_simple_quartet_negative_count :
    Fintype.card SimpleQuartetNegative = 2 := by
  decide

/--
WD-T21 / ZW1-T2: a simple off-critical functional-equation quartet yields
exactly two distinct nonreal conjugate pairs in Bombieri ordinate coordinates,
hence two canonical negative pair coordinates after WD-T20 diagonalization.
-/
theorem wd_t21_simple_quartet_pair_geometry
    (T δ : ℝ) (hT : T ≠ 0) (hδ : δ ≠ 0) :
    (quartetPairPos T δ).2 =
        star (quartetPairPos T δ).1
    ∧ (quartetPairNeg T δ).2 =
        star (quartetPairNeg T δ).1
    ∧ (quartetPairPos T δ).1.im ≠ 0
    ∧ (quartetPairNeg T δ).1.im ≠ 0
    ∧ quartetPairPos T δ ≠ quartetPairNeg T δ
    ∧ Fintype.card SimpleQuartetNegative = 2 := by
  refine ⟨
    wd_t21_quartet_pair_pos_conjugate T δ,
    wd_t21_quartet_pair_neg_conjugate T δ,
    (wd_t21_quartet_pairs_nonreal T δ hδ).1,
    (wd_t21_quartet_pairs_nonreal T δ hδ).2,
    wd_t21_quartet_pairs_distinct T δ hT,
    wd_t21_simple_quartet_negative_count
  ⟩

/--
Explicit imported interface for Bombieri's finite Weil inertia theorem
(Theorem 8, p. 213 in the pinned source).

For a finite type indexing the distinct nonreal conjugate pairs of the
multiplicity-reduced finite zero packet, the theorem premise identifies the
finite Weil matrix negative spectral index with the cardinality of that pair
type.

The external theorem is a premise here; it is not introduced as a project axiom.
-/
structure BombieriFiniteInertiaData
    (negativeIndex : ℕ)
    (Pair : Type*) [Fintype Pair] : Prop where
  index_eq_pairCount :
    negativeIndex = Fintype.card Pair

/--
WD-T22: Bombieri's imported finite-inertia theorem saturates the abstract
finite-sector negative-index cap: the negative spectral index is exactly the
number of distinct nonreal conjugate pairs.
-/
theorem wd_t22_finite_weil_inertia_saturation
    {Pair : Type*} [Fintype Pair]
    (negativeIndex : ℕ)
    (hBombieri : BombieriFiniteInertiaData negativeIndex Pair) :
    negativeIndex = Fintype.card Pair :=
  hBombieri.index_eq_pairCount

/-- Negative pair-coordinate type for a packet of q simple disjoint quartets. -/
abbrev SimpleQuartetPacketNegative (q : ℕ) :=
  Fin q × SimpleQuartetNegative

/--
A packet of q simple quartets contains 2q distinct negative pair coordinates,
using WD-T21's two-coordinate count for each quartet.
-/
theorem wd_t22_simple_quartet_packet_pair_count (q : ℕ) :
    Fintype.card (SimpleQuartetPacketNegative q) = 2 * q := by
  simp [SimpleQuartetPacketNegative, SimpleQuartetNegative, Nat.mul_comm]

/--
WD-T22 specialization: once Bombieri's finite-inertia theorem is supplied,
a packet of q simple disjoint quartets has negative spectral index 2q.
-/
theorem wd_t22_simple_quartet_packet_inertia
    (q negativeIndex : ℕ)
    (hBombieri :
      BombieriFiniteInertiaData
        negativeIndex
        (SimpleQuartetPacketNegative q)) :
    negativeIndex = 2 * q := by
  calc
    negativeIndex =
        Fintype.card (SimpleQuartetPacketNegative q) :=
      wd_t22_finite_weil_inertia_saturation negativeIndex hBombieri
    _ = 2 * q := wd_t22_simple_quartet_packet_pair_count q

/--
The audited two-simple-quartet specialization has finite Weil negative index 4.
-/
theorem wd_t22_two_simple_quartet_negative_index
    (negativeIndex : ℕ)
    (hBombieri :
      BombieriFiniteInertiaData
        negativeIndex
        (SimpleQuartetPacketNegative 2)) :
    negativeIndex = 4 := by
  simpa using
    wd_t22_simple_quartet_packet_inertia 2 negativeIndex hBombieri


/--
Explicit imported interface for Bombieri's multiplicity-null theorem
(Lemma 10, p. 210 with the proof continuation on p. 213).

The list records the positive raw multiplicities of the distinct ordinates in a
finite packet.  The imported premise states that the zero-eigenspace
multiplicity is the sum of the duplicate contributions m - 1.
-/
structure BombieriMultiplicityNullData
    (multiplicities : List ℕ)
    (nullity : ℕ) : Prop where
  multiplicities_pos :
    ∀ m ∈ multiplicities, 0 < m
  nullity_eq_sum :
    nullity =
      (multiplicities.map (fun m => m - 1)).sum

/--
Same-frequency synthesis factors through the sum of the raw coefficients.
Thus only the total coefficient survives before the multiplicity quotient.
-/
theorem wd_t23_same_frequency_synthesis_factor
    {H : Type*} [AddCommMonoid H] [Module ℂ H]
    {ι : Type*} [Fintype ι]
    (x : ι → ℂ) (g : H) :
    (∑ i, x i • g) = (∑ i, x i) • g := by
  simp [Finset.sum_smul]

/--
Every zero-sum coefficient combination of duplicate same-frequency coordinates
is an exact synthesis-null direction.
-/
theorem wd_t23_same_frequency_zero_sum_null
    {H : Type*} [AddCommMonoid H] [Module ℂ H]
    {ι : Type*} [Fintype ι]
    (x : ι → ℂ) (g : H)
    (hzero : (∑ i, x i) = 0) :
    (∑ i, x i • g) = 0 := by
  rw [wd_t23_same_frequency_synthesis_factor x g, hzero, zero_smul]

/--
WD-T23: the imported Bombieri multiplicity theorem gives the total exact
multiplicity-null dimension before distinct-frequency quotienting.
-/
theorem wd_t23_total_multiplicity_nullity
    (multiplicities : List ℕ)
    (nullity : ℕ)
    (hBombieri : BombieriMultiplicityNullData multiplicities nullity) :
    nullity =
      (multiplicities.map (fun m => m - 1)).sum :=
  hBombieri.nullity_eq_sum

/--
For one ordinate of raw multiplicity m, exactly m - 1 coefficient directions
are multiplicity-null.
-/
theorem wd_t23_single_ordinate_nullity
    (m nullity : ℕ)
    (hBombieri : BombieriMultiplicityNullData [m] nullity) :
    nullity = m - 1 := by
  simpa using hBombieri.nullity_eq_sum

/--
For one genuine ordinate, a nontrivial multiplicity-null sector is present
exactly when its raw multiplicity exceeds one.
-/
theorem wd_t23_single_ordinate_has_null_iff_repeated
    (m nullity : ℕ)
    (hBombieri : BombieriMultiplicityNullData [m] nullity) :
    0 < nullity ↔ 1 < m := by
  have hm : 0 < m := by
    simpa using hBombieri.multiplicities_pos m (by simp)
  rw [wd_t23_single_ordinate_nullity m nullity hBombieri]
  omega

/--
WD-T23 / ZW1-T4: multiplicity-null directions are quotient directions, while
the active same-frequency coordinate is the single coefficient sum.
-/
theorem wd_t23_distinct_frequency_reduction
    (m nullity : ℕ)
    (hBombieri : BombieriMultiplicityNullData [m] nullity) :
    nullity = m - 1
      ∧ (0 < nullity ↔ 1 < m) := by
  exact ⟨
    wd_t23_single_ordinate_nullity m nullity hBombieri,
    wd_t23_single_ordinate_has_null_iff_repeated m nullity hBombieri
  ⟩


/-- Raw residues contributed by finitely many negative pair coefficients. -/
def rawResiduesOfNegativePairs (xs : List ℂ) : List ℂ :=
  xs.flatMap fun α => [α, -α]

/-- WD-T26: every finite collection of negative pair channels has zero raw residue moment. -/
theorem wd_t26_zero_moment (xs : List ℂ) :
    (rawResiduesOfNegativePairs xs).sum = 0 := by
  induction xs with
  | nil =>
      simp [rawResiduesOfNegativePairs]
  | cons α xs ih =>
      change ([α, -α] ++ rawResiduesOfNegativePairs xs).sum = 0
      simp [ih]

/--
Every selected negative-pair coefficient occurs verbatim among its raw
residues.  This is the custody bridge needed for the nondegeneracy half of
WD-T26.
-/
theorem wd_t26_coefficient_mem_rawResidues
    {xs : List ℂ} {α : ℂ}
    (hα : α ∈ xs) :
    α ∈ rawResiduesOfNegativePairs xs := by
  simp only [rawResiduesOfNegativePairs, List.mem_flatMap]
  exact ⟨α, hα, by simp⟩

/--
A genuinely nonzero selected negative coefficient produces a genuinely
nonzero raw residue coordinate.
-/
theorem wd_t26_nonzero_raw_residue_of_nonzero_coefficient
    (xs : List ℂ)
    (hxs : ∃ α ∈ xs, α ≠ 0) :
    ∃ r ∈ rawResiduesOfNegativePairs xs, r ≠ 0 := by
  rcases hxs with ⟨α, hα, hα0⟩
  exact ⟨α, wd_t26_coefficient_mem_rawResidues hα, hα0⟩

/--
WD-T26 / ZW1-T7: selected negative pair coordinates have zero total raw
residue, and a nonzero selected coefficient vector cannot collapse to the zero
raw-residue vector.
-/
theorem wd_t26_selected_zero_moment_residue
    (xs : List ℂ) :
    (rawResiduesOfNegativePairs xs).sum = 0
      ∧ ((∃ α ∈ xs, α ≠ 0) →
          ∃ r ∈ rawResiduesOfNegativePairs xs, r ≠ 0) := by
  exact ⟨
    wd_t26_zero_moment xs,
    wd_t26_nonzero_raw_residue_of_nonzero_coefficient xs
  ⟩

end WeilDefect
