# Theorem Ledger
**H1-P4.0 — Stable public labels and standing/verification split**

This ledger is the canonical public index for Horizon 1.

Historical theorem labels remain valid provenance aliases. They are not renamed. Stable public IDs are additive.

## Status model

The H1-P4 ledger separates **mathematical standing** from **audit/source verification status**. LEAN-H1 formal certification is a third independent axis tracked in [Lean Status](LEAN_STATUS.md); it is intentionally not folded into this table.

### Mathematical standing

- **INTERNAL-PROOF** — the repository contains a proof under stated hypotheses.
- **DERIVED** — exact reformulation/reduction from retained inputs.
- **IMPORTED** — consumed from an external source.
- **CONDITIONAL** — theorem proved only under explicitly named branch hypotheses.
- **EXAMPLE** — explicit construction establishing possibility/sharpness.
- **SCOPE** — jurisdiction/interpretive statement, not an independent theorem.
- **OPEN** — downstream obligation not established.

### H1-P4 audit/source verification status

- **P4-AUDIT-PENDING** — proof text exists but has not yet completed Horizon-1 internal line-by-line audit.
- **P4-AUDIT-PASSED** — the Horizon-1 internal proof audit passed after any recorded corrections; this is not independent certification.
- **SOURCE-PIN-PENDING** — external source is identified, but exact theorem/equation pinning remains to be normalized.
- **SOURCE-PINNED** — the exact external theorem/equation location and convention have been fixed; internal use may still await proof audit.
- **COMPOSITE-AUDIT-PENDING** — a packaged morphology theorem whose dependency/hypothesis assembly still requires final audit.
- **COMPOSITE-AUDIT-PASSED** — the packaged morphology has passed the Horizon-1 dependency/hypothesis composition audit after any recorded narrowing corrections.
- **SCOPE-ONLY** — no proof certification is claimed because the item is a scope rule rather than a theorem.
- **EXAMPLE-AUDIT-PASSED** — explicit construction and its sharpness role passed the Horizon-1 internal examples audit.

The legacy word **PROVED** in earlier files means “internal proof standing.” It does not mean independently certified proof.

---

## A. Abstract defect calculus

| Stable ID | Historical alias | Statement | Standing | Verification | Canonical source |
| --- | --- | --- | --- | --- | --- |
| WD-T01 | WD-A1 | Defect identity and equality of coefficient/physical negative index | INTERNAL-PROOF | P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T02 | WD-A2 | Nonnegative defect iff contractive Douglas screening exists | INTERNAL-PROOF + IMPORTED Douglas | SOURCE-PINNED; P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T03 | WD-A3 | Reduced-screening graph normal form under exact range inclusion | INTERNAL-PROOF | P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T04 | WD-A4 | Abstract screening taxonomy including attained/non-attained criticality | INTERNAL-PROOF | P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T05 | WD-A5 | Rank-one defect specialization | INTERNAL-PROOF | P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T06 | WD-A6 | Monotone positive-channel restoration and nonincreasing negative index | INTERNAL-PROOF | P4-AUDIT-PASSED | [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md) |
| WD-T07 | WD-B1 | Selected negativity survives negative-background aggregation; converse custody fails | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T08 | WD-B2 | Finite selected-sector negative-index cap | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T09 | WD-B3 | Selected and background channels share one screening budget | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T10 | WD-B4 | Contractively screened background reduces to residual positive synthesis | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T11 | WD-B5 | Finite-sector inertia/nullity counted by singular values of residual screening map | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T12 | WD-B6 | Sequential background consumption is closed under the defect calculus | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T13 | WD-B7 | Complement elimination replaces direct compression by Schur/shorted covariance in the uniformly positive setting | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T14 | WD-B8 | Finite positive shadows preserve sign but not analysis-space admissibility | INTERNAL-PROOF | P4-AUDIT-PASSED | [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md) |
| WD-T15 | WD-C1 + WD-C2 | Right-limit projection convergence and gap-space duality | INTERNAL-PROOF | P4-AUDIT-PASSED | [Support Filtration](SUPPORT_FILTRATION_PERSISTENCE.md) |
| WD-T16 | WD-C3 + WD-C5 | Fixed finite negative sector forces a nonzero persistent nonpositive/negative right-limit ray | INTERNAL-PROOF | P4-AUDIT-PASSED | [Support Filtration](SUPPORT_FILTRATION_PERSISTENCE.md) |
| WD-T17 | WD-C4 | Fixed-sector critical dichotomy: attained neutral limit or negative fall-through | INTERNAL-PROOF | P4-AUDIT-PASSED | [Support Filtration](SUPPORT_FILTRATION_PERSISTENCE.md) |
| WD-T18 | WD-C6 | Endpoint-jump quotient bounds new right-limit negative index | INTERNAL-PROOF | P4-AUDIT-PASSED | [Support Filtration](SUPPORT_FILTRATION_PERSISTENCE.md) |
| WD-T19 | WD-C7 + WD-C8 + WD-C9 | New endpoint vectors force boundary amplification / representative blow-up | INTERNAL-PROOF | P4-AUDIT-PASSED | [Support Filtration](SUPPORT_FILTRATION_PERSISTENCE.md) |

---

## B. Zeta-Weil zero-side specialization

| Stable ID | Historical alias | Statement | Standing | Verification | Canonical source |
| --- | --- | --- | --- | --- | --- |
| WD-T20 | ZW1-T1 | Canonical conjugate-pair diagonalization into positive/negative Weil channels | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T21 | ZW1-T2 | One simple zeta quartet contributes two negative pair coordinates | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T22 | ZW1-T3 | Finite Weil negative index equals number of distinct nonreal conjugate pairs | IMPORTED + SPECIALIZED | SOURCE-PINNED; P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T23 | ZW1-T4 | Multiplicity-null directions must be quotiented before independent index counting | IMPORTED/DERIVED | SOURCE-PINNED; P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T24 | ZW1-T5 | Finite distinct-frequency exponential independence on a nonempty interval | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T25 | ZW1-T6 | No exact finite positive compensation for an anchored selected negative cell | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T26 | ZW1-T7 | Selected negative raw residues satisfy the zero-moment law $\mathbf{1}^Tv=0$ | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T27 | ZW1-T8 | Zero moment gives universal $R_v(z)=O(\lvert z\rvert^{-2})$ far decay | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T28 | ZW1-T9 | Native Problem-1 zero synthesis is Hilbert-Schmidt; off-axis helper covariance is trace class | INTERNAL-PROOF + imported zero count | SOURCE-PINNED; P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |
| WD-T29 | ZW1-T10 | Exact bounded-budget infinite-helper target requires quantitative finite-head approximation | INTERNAL-PROOF | P4-AUDIT-PASSED | [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md) |

---

## C. Explicit-formula arithmetic attachment

| Stable ID | Historical alias | Statement | Standing | Verification | Canonical source |
| --- | --- | --- | --- | --- | --- |
| WD-T30 | ZW2-T1 | Two-mode selected-preserving scalar multiplier exists | INTERNAL-PROOF | P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T31 | ZW2-T2 | Zero moment + zero counting gives $O((\log R)/R)$ far complementary tail | INTERNAL-PROOF + imported zero count | SOURCE-PINNED; P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T32 | ZW2-T3 + ZW2-T4 | Near complementary response is represented by the weighted completed $\Xi$ next-jet field | INTERNAL-PROOF | P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T33 | ZW2-T5 | At a fixed cutoff, adaptive near-minus-archimedean cancellation collapses the corresponding prime term onto the far term | INTERNAL-PROOF | P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T34 | ZW2-T6 | Fixed compact support activates only finitely many prime-power translations | DERIVED from IMPORTED compact-window formula | SOURCE-PINNED; P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T35 | ZW2-T7 | Compact-window Weil form has logarithmic Fourier/form order | DERIVED | SOURCE-PINNED; P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |
| WD-T36 | ZW2-T8 | Logarithmic form control yields no uniform positive-Sobolev coercive estimate; finite translations add no smoothing | INTERNAL-PROOF/SHARPNESS | P4-AUDIT-PASSED | [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md) |

---

## D. Morphology theorems

| Stable ID | Historical aliases | Statement | Standing | Verification | Canonical source |
| --- | --- | --- | --- | --- | --- |
| WD-T37 | P3-N1…P3-N7 | Fixed-packet persistent negative defect localizes to zero-moment source + weighted near next-jet morphology, stopping at AZ-NEXTJET-LOC | CONDITIONAL COMPOSITE | COMPOSITE-AUDIT-PASSED | [Negative Defect Morphology](NEGATIVE_DEFECT_MORPHOLOGY.md) |
| WD-T38 | P3-U1…P3-U7 | Attained unit-gain neutral branch gives a carrier-identified compact-window null mode with logarithmic order + threshold-aware finite shifts, stopping at AZ-FIN-WEIL-NULL-EXTENSION | CONDITIONAL COMPOSITE | COMPOSITE-AUDIT-PASSED | [Neutral Defect Morphology](NEUTRAL_DEFECT_MORPHOLOGY.md) |
| WD-T39 | P3-B1…P3-B7 | Full-coefficient moving escape, unselected-background escape, and fixed full-divisor negative weak limits are distinct compactness morphologies | INTERNAL/CONDITIONAL COMPOSITE | COMPOSITE-AUDIT-PASSED | [Noncompact Background Morphology](NONCOMPACT_BACKGROUND_MORPHOLOGY.md) |

---

## E. Examples and sharpness witnesses

Examples are not assigned theorem IDs.

| Stable example ID | Historical alias | Purpose |
| --- | --- | --- |
| WD-X01 | WD-E1 | Strict finite negativity can screen completely to zero |
| WD-X02 | WD-E2 | Critical screening need not attain a neutral vector in infinite dimension |
| WD-X03 | WD-E3 | Individually screenable negative channels need not be jointly screenable |
| WD-X04 | WD-E4 | Direct compression can remain strong while shorted covariance collapses |
| WD-X05 | WD-E5 | Moving finite sectors can lose every persistent ray |
| WD-X06 | WD-E6 | Positive-coordinate mass loss can strengthen neutrality into negative persistence |
| WD-X07 | ZW1-E1 | The inverse-square far order is sharp under the zero-moment hypothesis alone |

All examples have verification status **EXAMPLE-AUDIT-PASSED**. See [Examples and Sharpness Audit](EXAMPLES_SHARPNESS_AUDIT.md).

---

## F. Scope rules

These are load-bearing jurisdiction rules, not theorems.

| Stable scope ID | Historical alias | Rule |
| --- | --- | --- |
| WD-S01 | ZW1-S1 | Unweighted sampling/frame statements do not transfer to native Problem-1 coercivity without an explicit metric comparison |
| WD-S02 | H1-P2.0 scope classification | Prime/pole/archimedean explicit-formula terms are an alternate representation of the Weil form, not additional $K_{+}$ screening coordinates |
| WD-S03 | ZW2-T9 / P3-U6 | Neutrality is a global quadratic cancellation, not termwise vanishing |
| WD-S04 | P3-N6 scope guard | Weighted near next-jet localization does not imply a source-free uniform lower bound |
| WD-S05 | P3-B5 custody guard | Unselected-background escape does not erase an already anchored fixed selected ray |

Verification status: **SCOPE-ONLY**.

---

## G. Open interfaces

These are deliberately not theorem IDs.

| Interface | Role | Reached from |
| --- | --- | --- |
| AZ-NEXTJET-LOC | Actual-zeta control/exclusion of the weighted near next-jet field | WD-T37 |
| C-ACTUAL-KPH-FLOOR | Stronger special-packet KPH/transversality floor | special refinement of WD-T37 |
| AZ-FIN-WEIL-NULL-EXTENSION | Exterior support/null-extension theorem for actual unit-gain neutral modes | WD-T38 |

PAP/MTP closure and RH remain outside Horizon 1. These interfaces are downstream stop lines; WD-T37 and WD-T38 do not consume them as premises.

---

## H. Publication rule

A stable theorem ID is a name, not a certification mark.

`P4-AUDIT-PASSED` and related H1-P4 labels are internal audit statuses, not formal certification. Lean certification is tracked separately in [Lean Status](LEAN_STATUS.md); an entry should be described as `LEAN-CERTIFIED` only when that ledger records the successful certificate.

Historical labels remain immutable provenance aliases.
