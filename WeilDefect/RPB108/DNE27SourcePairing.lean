import WeilDefect.RPB108.DNE27NativePairing
import WeilDefect.RPB108.SourcePairing
open scoped BigOperators
noncomputable section
namespace WeilDefect.RPB108

namespace DNE27Even

/-- The low source has scale exactly one in the preserved four-column frame. -/
theorem low_source_square_identity : sourceSquare 0 = rawSourceSquare 0 := by
  norm_num [sourceSquare, scales]

/-- Exact realized source norm on the existing scaled four-column frame. -/
theorem retained_source_norm_sq {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (source : Fin 4 → E) (G : Fin 3 → Fin 3 → ℝ)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ)) (z : Fin 4 → ℂ) :
    ‖∑ i : Fin 3, z i.succ • source i.succ‖^2 =
      complexGram G (fun i => (gramScales i : ℂ)*z i.succ) := by
  rw [source_gram_norm_sq (fun i => source i.succ)
    (fun i j => gramScales i*gramScales j*G i j) hGram]
  exact scaled_retained_gram G gramScales (fun i => z i.succ)

def inverseSourcePairing {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (source : Fin 4 → E)
    (z : Fin 4 → ℂ) : ℂ :=
  inner ℂ (source 0) (T (∑ i : Fin 3, z i.succ • source i.succ))

/-- The required source-pairing square follows from actual source vectors,
complete Gram realization and the restricted inverse bound. -/
theorem inverse_source_pairing_square_of_gram {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (source : Fin 4 → E) (G : Fin 3 → Fin 3 → ℝ)
    (hT : ‖T‖ ≤ 1/highFloor) (hsource0 : ‖source 0‖^2 ≤ sourceSquare 0)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ)) (z : Fin 4 → ℂ) :
    ‖inverseSourcePairing T source z‖^2 ≤ (rawSourceSquare 0/highFloor^2)*
      complexGram G (fun i => (gramScales i : ℂ)*z i.succ) := by
  rw [low_source_square_identity] at hsource0
  have hk : 0 < highFloor := by norm_num [highFloor]
  have h := inverse_source_pairing_square T (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (rawSourceSquare 0) highFloor hk hT hsource0
  rw [retained_source_norm_sq source G hGram z] at h
  exact h

/-- Physical gap with both mixed pairing-square estimates derived. The same
inverse T completes the columns and defines the actual inverse source pairing. -/
theorem physical_gap_of_realized_source_gram {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ))
    (a : Fin 3 → ℝ)
    (ha : ∀ i, nativePairingLower i ≤ a i ∧ a i ≤ nativePairingUpper i)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ)
    (hcompletion : nativeLow*‖z 0‖^2-
      2*‖z 0‖*‖nativePairing a z-inverseSourcePairing T source z‖+
      complexGram V (fun i => (gramScales i : ℂ)*z i.succ)+
      highFloor*‖h‖^2 ≤ energy) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤ energy := by
  exact physical_gap_of_native_row_enclosures T x source hT hx hsource V G hV hG a ha
    z h energy (inverseSourcePairing T source z)
    (inverse_source_pairing_square_of_gram T source G hT (hsource 0) hGram z) hcompletion

#print axioms low_source_square_identity
#print axioms retained_source_norm_sq
#print axioms inverse_source_pairing_square_of_gram
#print axioms physical_gap_of_realized_source_gram
end DNE27Even

namespace DNE27Odd

/-- The low source has scale exactly one in the preserved four-column frame. -/
theorem low_source_square_identity : sourceSquare 0 = rawSourceSquare 0 := by
  norm_num [sourceSquare, scales]

/-- Exact realized source norm on the existing scaled four-column frame. -/
theorem retained_source_norm_sq {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (source : Fin 4 → E) (G : Fin 3 → Fin 3 → ℝ)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ)) (z : Fin 4 → ℂ) :
    ‖∑ i : Fin 3, z i.succ • source i.succ‖^2 =
      complexGram G (fun i => (gramScales i : ℂ)*z i.succ) := by
  rw [source_gram_norm_sq (fun i => source i.succ)
    (fun i j => gramScales i*gramScales j*G i j) hGram]
  exact scaled_retained_gram G gramScales (fun i => z i.succ)

def inverseSourcePairing {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] (T : E →L[ℂ] E) (source : Fin 4 → E)
    (z : Fin 4 → ℂ) : ℂ :=
  inner ℂ (source 0) (T (∑ i : Fin 3, z i.succ • source i.succ))

/-- The required source-pairing square follows from actual source vectors,
complete Gram realization and the restricted inverse bound. -/
theorem inverse_source_pairing_square_of_gram {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (source : Fin 4 → E) (G : Fin 3 → Fin 3 → ℝ)
    (hT : ‖T‖ ≤ 1/highFloor) (hsource0 : ‖source 0‖^2 ≤ sourceSquare 0)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ)) (z : Fin 4 → ℂ) :
    ‖inverseSourcePairing T source z‖^2 ≤ (rawSourceSquare 0/highFloor^2)*
      complexGram G (fun i => (gramScales i : ℂ)*z i.succ) := by
  rw [low_source_square_identity] at hsource0
  have hk : 0 < highFloor := by norm_num [highFloor]
  have h := inverse_source_pairing_square T (source 0)
    (∑ i : Fin 3, z i.succ • source i.succ) (rawSourceSquare 0) highFloor hk hT hsource0
  rw [retained_source_norm_sq source G hGram z] at h
  exact h

/-- Physical gap with both mixed pairing-square estimates derived. The same
inverse T completes the columns and defines the actual inverse source pairing. -/
theorem physical_gap_of_realized_source_gram {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (T : E →L[ℂ] E) (x source : Fin 4 → E)
    (hT : ‖T‖ ≤ 1/highFloor)
    (hx : ∀ i, ‖x i‖ ≤ nativeMass i)
    (hsource : ∀ i, ‖source i‖^2 ≤ sourceSquare i)
    (V G : Fin 3 → Fin 3 → ℝ)
    (hV : ∀ i j, nativeLower i j ≤ V i j ∧ V i j ≤ nativeUpper i j)
    (hG : ∀ i j, gramLower i j ≤ G i j ∧ G i j ≤ gramUpper i j)
    (hGram : ∀ i j, inner ℂ (source i.succ) (source j.succ) =
      ((gramScales i*gramScales j*G i j : ℝ) : ℂ))
    (a : Fin 3 → ℝ)
    (ha : ∀ i, nativePairingLower i ≤ a i ∧ a i ≤ nativePairingUpper i)
    (z : Fin 4 → ℂ) (h : E) (energy : ℝ)
    (hcompletion : nativeLow*‖z 0‖^2-
      2*‖z 0‖*‖nativePairing a z-inverseSourcePairing T source z‖+
      complexGram V (fun i => (gramScales i : ℂ)*z i.succ)+
      highFloor*‖h‖^2 ≤ energy) :
    (4/(10^36) : ℝ)*‖(∑ i, z i • (x i-T (source i)))+h‖^2 ≤ energy := by
  exact physical_gap_of_native_row_enclosures T x source hT hx hsource V G hV hG a ha
    z h energy (inverseSourcePairing T source z)
    (inverse_source_pairing_square_of_gram T source G hT (hsource 0) hGram z) hcompletion

#print axioms low_source_square_identity
#print axioms retained_source_norm_sq
#print axioms inverse_source_pairing_square_of_gram
#print axioms physical_gap_of_realized_source_gram
end DNE27Odd
end WeilDefect.RPB108
