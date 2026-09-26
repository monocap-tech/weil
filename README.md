# Weil Defect

A public research repository for a defect-theoretic analysis of **Weil's quadratic
form**, its finite negative-index structure, spectral screening, persistent
negative directions, and compact-window neutral modes.

> **Status:** Horizon 1 complete; downstream actual-zeta interfaces remain open.
>
> **Scope:** This repository packages an independent Weil-defect theory to its
> stated stop boundary. It does not claim a proof of the Riemann Hypothesis.

## Scope and separation

The project separates two mathematical layers that must not be conflated:

- **Weil-defect theory:** finite negative index, screening, persistence,
  compact-window neutrality, and their operator-theoretic structure.
- **Actual-zeta exclusion:** the additional arithmetic input needed to rule out
  the remaining defect geometries for the actual zeta divisor.

The first layer can be developed and audited independently of the second. The
working architecture is

```math
\boxed{
\text{finite negative index}
\longrightarrow
\text{spectral screening / support filtration}
\longrightarrow
\begin{cases}
\text{fixed-packet negative persistence},\\
\text{fixed-packet attained-neutral persistence},\\
\text{moving/infinite-sector or background noncompactness}.
\end{cases}
}
```

Only after this defect geometry is isolated does the program ask whether the
**actual zeta divisor** can realize the remaining branches.

## Horizon 1

The repository is currently organized under
[Horizon 1 — Independent Weil-Defect Theory](docs/HORIZON_1.md). Its stop
boundary is deliberately before RH closure.

| Phase | Scope | Status |
| --- | --- | --- |
| H1-P0 | Consolidation and custody | Complete |
| H1-P1 | Abstract defect calculus | Complete |
| H1-P2 | Zeta-Weil specialization | Complete |
| H1-P3 | Defect morphology theorem | Complete |
| H1-P4 | Proof audit and theorem normalization | Complete |
| LEAN-H1 | Lean certification track | **Exhausted** |
| H1-P5 | Public mathematical package | **Complete** |
| Horizon 1 | Independent Weil-defect theory | **Complete** |

Source pinning, internal proof audit, composite morphology audit, examples
sharpness audit, Lean certification, and public packaging are complete for the
Horizon-1 inventory. No post-Horizon research cursor is currently selected.
Stable theorem IDs and the canonical audit surfaces are recorded in the
[Theorem Ledger](docs/THEOREM_LEDGER.md),
[Dependency Audit](docs/DEPENDENCY_AUDIT.md),
[Imported Source Pins](docs/IMPORTED_SOURCE_PINS.md),
[Internal Proof Audit](docs/INTERNAL_PROOF_AUDIT.md),
[Composite Morphology Audit](docs/COMPOSITE_MORPHOLOGY_AUDIT.md), and
[Examples and Sharpness Audit](docs/EXAMPLES_SHARPNESS_AUDIT.md).

Project terms such as **horizon**, **phase**, **standing**, **interface**,
**custody**, and **screening** are fixed in the
[Terminology Registry](docs/TERMINOLOGY.md).

Formal verification has reached its exhaustion condition. See the
[Lean Formalization Track](docs/LEAN_FORMALIZATION_TRACK.md) and
[Lean Status Ledger](docs/LEAN_STATUS.md). The public package has passed its final adversarial audit. See [Public Package Architecture](docs/PUBLIC_PACKAGE_ARCHITECTURE.md), the [Weil-Defect Manuscript](docs/WEIL_DEFECT_MANUSCRIPT.md), the [Public Theorem Index](docs/PUBLIC_THEOREM_INDEX.md), the [Public Verification Matrix](docs/PUBLIC_VERIFICATION_MATRIX.md), the [Public Dependency Map](docs/PUBLIC_DEPENDENCY_MAP.md), the [Public Examples and Sharpness](docs/PUBLIC_EXAMPLES.md), the [RH-Facing Interface Appendix](docs/RH_INTERFACE_APPENDIX.md), and the [Public Package Audit](docs/PUBLIC_PACKAGE_AUDIT.md).

## Core mathematical picture

The abstract defect calculus is organized around

```math
D=S_{+}S_{+}^{*}-S_{-}S_{-}^{*},
```

with the sign problem reduced to contractive Douglas screening. In the
monotone support-filtration setting of WD-T16/WD-T17, a normalized critical or
negative right-approaching sequence whose negative coordinate remains in one
fixed finite selected sector has a nonzero nonpositive right-limit subsequence.
Accordingly, loss of a persistent selected ray while selected negative mass
remains anchored requires leaving the fixed finite-sector regime. Unselected-
background noncompactness is a separate mechanism: after a selected ray is
anchored it may obstruct strong full-coefficient compactness, but it does not
erase that selected ray.

Under the zeta-Weil specialization, the selected raw residue vector satisfies

```math
\mathbf{1}^{T}v=0.
```

For the associated rational response, that zero-moment identity removes the
first Laurent term and yields

```math
R_{v}(z)=O(|z|^{-2}).
```

The explicit-formula attachment sharpens the far-field contribution to

```math
\mathcal{F}_{v,R}
=
O\!\left(\frac{\log R}{R}\right),
```

leaving a weighted completed $\Xi$ next-jet field as the negative-branch
arithmetic obstruction.

On the neutral branch, fixed compact support produces only finitely many
prime-power translations, with principal order

```math
\Psi_{c}(t)=\log|t|+O_{c}(1).
```

These statements are packaged in the negative, neutral, and noncompact
morphology documents linked below.

## Current theorem picture

| Component | Current standing |
| --- | --- |
| Finite Weil negative index | Imported theorem + exact specialization |
| Rank-one defect specialization | Internal proof; one-channel specialization of the abstract calculus |
| Support-filtration right-limit geometry | Internal proof with stated inputs |
| Screening taxonomy and custody distinctions | Internal/structural package |
| Persistent normalized Weil negativity | Conditional theorem |
| Quartet zero-moment law | Internal proof in the selected quartet model |
| $O(\lvert z\rvert^{-2})$ far-field decay | Internal proof |
| Reduction to weighted near next-jet representation | Internal deduction under stated source/multiplier hypotheses |
| Compact-window neutral equation $W_{c}k=0$ | Conditional theorem |
| Fixed-window log-order operator + finite prime shifts | Derived |
| Actual-zeta next-jet exclusion | Open |
| Neutral null-extension rigidity | Open |
| RH | Open |

See [Proof Status](docs/PROOF_STATUS.md) for precise hypotheses, mathematical
standing, and verification state.

## RH-facing interfaces

Horizon 1 deliberately stops before two primary actual-zeta interfaces, with one stronger special-packet refinement on the negative side:

- `AZ-NEXTJET-LOC` — control or exclusion of the weighted near next-jet field.
- `C-ACTUAL-KPH-FLOOR` — stronger special-packet KPH/transversality floor that can serve as a sufficient refinement of `AZ-NEXTJET-LOC` where its packet hypotheses apply.
- `AZ-FIN-WEIL-NULL-EXTENSION` — exterior support/null-extension rigidity for
  an actual compact-window neutral mode.

The negative morphology leaves `AZ-NEXTJET-LOC` as the next unresolved
actual-zeta obligation after

```math
\mathbf{1}^{T}v=0
\quad\Longrightarrow\quad
R_{v}(z)=O(|z|^{-2})
\quad\Longrightarrow\quad
\mathcal{F}_{v,R}=O\!\left(\frac{\log R}{R}\right).
```

The neutral morphology leaves `AZ-FIN-WEIL-NULL-EXTENSION` as its unresolved
support/right-limit obligation after deriving the compact-window equation

```math
W_{c}k=0.
```

These interfaces are downstream obligations; none is a premise of the
Horizon-1 morphology theorem from which it emerges.

## Repository map


### Public Horizon-1 package

- [Public Package Architecture](docs/PUBLIC_PACKAGE_ARCHITECTURE.md) — reader-facing package structure and custody rules.
- [Weil-Defect Manuscript](docs/WEIL_DEFECT_MANUSCRIPT.md) — assembled mathematical narrative.
- [Public Theorem Index](docs/PUBLIC_THEOREM_INDEX.md) — stable-ID lookup with hypotheses, outputs, dependencies, standing, and Lean status.
- [Public Verification Matrix](docs/PUBLIC_VERIFICATION_MATRIX.md) — mathematical standing, source ancestry, formal status, and certificate evidence.
- [Public Dependency Map](docs/PUBLIC_DEPENDENCY_MAP.md) — compressed theorem/import/interface DAG.
- [Public Examples and Sharpness](docs/PUBLIC_EXAMPLES.md) — canonical failure modes attached to theorem boundaries.
- [RH-Facing Interface Appendix](docs/RH_INTERFACE_APPENDIX.md) — exact downstream obligations left open by Horizon 1.
- [Public Package Audit](docs/PUBLIC_PACKAGE_AUDIT.md) — final package and reader-surface consistency checks.

### Horizon and audit control

- [Horizon 1](docs/HORIZON_1.md) — phase gates and the Horizon-1 stop boundary.
- [Theorem Ledger](docs/THEOREM_LEDGER.md) — stable theorem IDs, mathematical
  standing, H1-P4 audit/source status, and historical aliases.
- [Dependency Audit](docs/DEPENDENCY_AUDIT.md) — normalized theorem DAG,
  imported-source boundaries, scope guards, and audit queue.
- [Imported Source Pins](docs/IMPORTED_SOURCE_PINS.md) — exact load-bearing
  external statements, equation locations, and convention map.
- [Proof Status](docs/PROOF_STATUS.md) — compact theorem and phase status.
- [Terminology Registry](docs/TERMINOLOGY.md) — canonical project vocabulary.
- [Research Map](docs/RESEARCH_MAP.md) — dependency graph and current frontier.
- [References](docs/REFERENCES.md) — background literature used by the program.

### H1-P1 — Abstract defect calculus

- [Abstract Defect Calculus](docs/ABSTRACT_DEFECT_CALCULUS.md) — zeta-independent
  operator theory.
- [Restricted-Channel Transfer](docs/RESTRICTED_CHANNEL_TRANSFER.md) — selected
  finite sectors, background budget, and shorting.
- [Support Filtration and Persistence](docs/SUPPORT_FILTRATION_PERSISTENCE.md) —
  right limits, endpoint jumps, representative blow-up, and moving-sector
  escape.

### H1-P2 — Zeta-Weil specialization

- [Zeta-Weil Specialization Map](docs/ZETA_WEIL_SPECIALIZATION_MAP.md) — mapping
  from abstract carriers to Weil/divisor/arithmetic structure.
- [Quartet Channel and Residue Structure](docs/QUARTET_CHANNEL_RESIDUE_STRUCTURE.md)
  — pair geometry, finite inertia, zero moments, and compact synthesis.
- [Explicit-Formula Arithmetic Attachment](docs/EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md)
  — far-tail localization, completed $\Xi$ next jets, finite prime shifts, and
  logarithmic form order.

### H1-P3 — Defect morphology

- [Negative Defect Morphology Theorem](docs/NEGATIVE_DEFECT_MORPHOLOGY.md) —
  fixed-packet negative endpoint morphology and stop line.
- [Neutral Defect Morphology Theorem](docs/NEUTRAL_DEFECT_MORPHOLOGY.md) —
  attained-neutral null mode, logarithmic operator, and null-extension stop
  line.
- [Noncompact Background Morphology Theorem](docs/NONCOMPACT_BACKGROUND_MORPHOLOGY.md)
  — moving selected escape, background escape, and fixed full-divisor negative weak
  limits.

### Consolidation record

- [Initial Consolidation](notes/WEIL_DEFECT_CONSOLIDATION_0_20260923.md) — first
  full public consolidation checkpoint.

## Background

The project sits in the lineage of work on Weil's criterion, finite truncations
of the Weil quadratic form, compact-window positivity, and operator
realizations of the explicit formula.

Particularly relevant references include:

- Enrico Bombieri, *Remarks on Weil's quadratic functional in the theory of
  prime numbers, I*.
- Masatoshi Suzuki, *Weil's quadratic form via the screw function*.
- Recent work on certified compact-window Weil positivity and
  Landau–Widom-type spectral behavior.

See [References](docs/REFERENCES.md) for the repository's source list.

## Verification convention

The project separates **mathematical standing** from **verification status**.
An internal proof under stated hypotheses is not, by that fact alone,
independently certified or formally verified.

A stable theorem ID is a name, not a certification mark. Verification claims
are promoted only by an explicit later audit or certificate artifact.
