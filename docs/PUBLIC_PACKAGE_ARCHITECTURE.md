# Public Package Architecture

## H1-P5.0 — Canonical publication surface

**Status:** COMPLETE.

This document fixes the public-package architecture for Horizon 1.  It does
not add a theorem, change a theorem standing, or import any RH-facing
interface into the independent Weil-defect theory.

The package has one governing separation:

```math
\boxed{
\text{independent Weil-defect theory}
\quad\Vert\quad
\text{additional actual-zeta interfaces required for an RH application}.
}
```

The left side is the mathematical package established within Horizon 1. The
right side records downstream actual-zeta obligations that remain open. No
open actual-zeta statement may be presented as a theorem of the Horizon-1
package.

---

## 1. Public deliverables

The canonical package consists of seven surfaces.

| Surface | Canonical file | Role |
| --- | --- | --- |
| Technical manuscript | [Weil-Defect Manuscript](WEIL_DEFECT_MANUSCRIPT.md) | Main mathematical narrative and theorem chain |
| Public theorem index | `PUBLIC_THEOREM_INDEX.md` | Stable-ID theorem lookup with statement role and standing |
| Verification matrix | `PUBLIC_VERIFICATION_MATRIX.md` | Mathematical standing versus Lean verification status |
| Dependency map | `PUBLIC_DEPENDENCY_MAP.md` | Theorem/import/interface dependency DAG |
| Examples and sharpness | `PUBLIC_EXAMPLES.md` | WD-X01 through WD-X07, attached to theorem boundaries |
| RH-interface appendix | `RH_INTERFACE_APPENDIX.md` | Open actual-zeta interfaces and exact upstream outputs |
| Repository entrypoint | [README](../README.md) | Compact orientation and links to the six specialist surfaces |

The existing audit/control documents remain authoritative provenance, not
duplicate public narratives.

---

## 2. Source-of-truth hierarchy

Public prose is downstream from the following canonical sources.

1. [Theorem Ledger](THEOREM_LEDGER.md) — stable IDs and mathematical roles.
2. [Proof Status](PROOF_STATUS.md) — mathematical standing and exact scope.
3. [Lean Status](LEAN_STATUS.md) — formal verification state and certificate evidence.
4. [Dependency Audit](DEPENDENCY_AUDIT.md) — dependency custody.
5. [Imported Source Pins](IMPORTED_SOURCE_PINS.md) — external load-bearing inputs.
6. [Internal Proof Audit](INTERNAL_PROOF_AUDIT.md) — WD-T01 through WD-T36 corrections.
7. [Composite Morphology Audit](COMPOSITE_MORPHOLOGY_AUDIT.md) — WD-T37 through WD-T39 corrections.
8. [Examples and Sharpness Audit](EXAMPLES_SHARPNESS_AUDIT.md) — WD-X01 through WD-X07.

If public prose conflicts with one of these surfaces, the audit/control
surface wins until the public package is repaired.

---

## 3. Manuscript architecture

The technical manuscript is organized into four mathematical parts, one verification-and-boundary part, and five public appendices.

### Part I — Abstract Weil-defect calculus

Primary theorem range:

```text
WD-T01 — WD-T19
```

Narrative order:

1. physical defect and coefficient-space signature;
2. Douglas screening and graph normal form;
3. selected/background channel transfer;
4. finite selected-sector inertia and shorted covariance;
5. support filtration, right limits, and endpoint jumps;
6. fixed-sector persistence and critical dichotomy;
7. boundary amplification.

The public endpoint of Part I is:

```math
\boxed{
\text{fixed finite selected sector}
+
\text{critical/negative right approach}
\Longrightarrow
\text{nonzero nonpositive right-limit ray}.
}
```

### Part II — Zeta-Weil specialization

Primary theorem range:

```text
WD-T20 — WD-T36
```

Narrative order:

1. quartet/pair diagonalization;
2. finite inertia and multiplicity;
3. zero-moment residue structure;
4. rational response and inverse-square far decay;
5. native compactness and finite-head approximation;
6. completed next-jet field;
7. finite prime-power translations;
8. logarithmic compact-window order;
9. no automatic positive-Sobolev bootstrap.

All imported analytic inputs remain explicitly typed and separately cited.

### Part III — Defect morphology

Primary theorem range:

```text
WD-T37 — WD-T39
```

The three morphology families remain separate:

- persistent selected negative defect;
- attained unit-gain neutral defect;
- noncompact/moving/background morphology.

No branch may silently consume an interface that is listed as open in the
RH appendix.

### Part IV — Sharpness and failure modes

Primary example range:

```text
WD-X01 — WD-X07
```

The manuscript cites sharpness witnesses where their theorem boundaries are
discussed and consolidates the full examples in Part IV. The separate public
examples document provides the canonical cross-reference table.

---

## 4. Standing vocabulary

The public package must keep two classifications distinct.

### Mathematical standing

Examples include:

- internal theorem;
- conditional theorem;
- imported theorem plus exact specialization;
- structural statement;
- scope rule;
- open interface.

### Formal verification standing

Allowed labels are exactly:

- `LEAN-CERTIFIED`;
- `LEAN-CERTIFIED-FROM-IMPORTED-PREMISE`;
- `LEAN-BLOCKED`;
- `SCOPE-ONLY`.

A theorem proved in Lean downstream from an imported analytic theorem is not
described as a full formalization of the imported theorem.

---

## 5. Citation and provenance policy

Public theorem statements use stable IDs such as `WD-T17`.

Historical labels may appear only as provenance annotations.  They do not
replace stable IDs.

External results are identified at the theorem or paragraph where they first
enter as load-bearing premises. Downstream prose must preserve that ancestry
rather than redescribing an imported premise as an internally established
analytic fact.

Lean certificate run IDs belong in the verification matrix or theorem index,
not in the main mathematical proof flow unless verification itself is being
discussed.

---

## 6. RH boundary architecture

The manuscript keeps the Horizon-1 deductions and the downstream actual-zeta
obligations visibly separate. The dedicated RH appendix records the latter in
one place rather than extending the theorem chain past its stop line.

The three tracked interfaces are:

```text
AZ-NEXTJET-LOC
C-ACTUAL-KPH-FLOOR
AZ-FIN-WEIL-NULL-EXTENSION
```

The appendix records for each interface:

1. exact input supplied by Horizon 1;
2. exact missing statement;
3. which morphology branch consumes it;
4. whether it is necessary or only a stronger sufficient refinement;
5. what would follow if the interface were discharged;
6. what does **not** follow without it.

The manuscript may say that the Horizon-1 deduction terminates at these
interfaces. It may not present an interface as discharged, or describe the
package as an RH proof.

---

## 7. Dependency-graph layers

The public dependency map uses five layers.

```text
Layer A  Abstract operator/signature calculus
Layer B  Finite-sector transfer and filtration
Layer C  Zeta-Weil specialization and arithmetic
Layer D  Morphology composites
Layer E  Open actual-zeta interfaces
```

Examples and scope rules attach laterally to the theorem boundary they
constrain; they are not proof-producing nodes. Direct imported-source entry
points are shown separately, while downstream theorems retain their transitive
source ancestry through the dependency graph.

---

## 8. Public theorem index schema

Each stable theorem entry will have exactly these fields:

| Field | Meaning |
| --- | --- |
| Stable ID | WD-Txx |
| Public name | Human-readable theorem name |
| Role | One-sentence mathematical function |
| Inputs | Load-bearing hypotheses only |
| Output | Public conclusion |
| Mathematical standing | Internal / conditional / imported-specialization / etc. |
| Lean status | Verification class |
| Dependencies | Stable IDs and imported premises |
| Sharpness | WD-Xxx if applicable |
| Source | Canonical detailed document |

This keeps theorem lookup separate from proof exposition.

---

## 9. Verification matrix schema

The verification matrix is intentionally orthogonal to mathematical standing.

Minimum columns:

```text
Stable ID
Mathematical standing
Lean status
Imported premise ancestry?
Certificate record?
RH-facing dependency?
```

The matrix must make it impossible to read
`LEAN-CERTIFIED-FROM-IMPORTED-PREMISE` as certification of the external
analytic input itself. A certificate record means that the row's formal status
is supported by the Lean-status evidence history; it does not imply that every
row was checked by a dedicated single-theorem CI run.

---

## 10. Package completion gate

H1-P5 is complete only when all seven public surfaces exist and satisfy a
final adversarial pass for:

- theorem-ID consistency;
- standing consistency;
- imported-premise custody;
- RH-boundary separation;
- notation consistency;
- cross-reference integrity;
- Markdown/math rendering;
- no stale cursor or phase language;
- no claim stronger than the canonical audit source.

The final Horizon-1 completion statement may then be:

```math
\boxed{
\text{Independent Weil-defect theory packaged and verified to its stated boundary.}
}
```

It must not be restated as an RH proof.

---

## 11. Package determination

Completed:

```text
H1-P5.0 / PUBLIC PACKAGE ARCHITECTURE
H1-P5.1 / TECHNICAL MANUSCRIPT ASSEMBLY
H1-P5.2 / PUBLIC THEOREM INDEX AND VERIFICATION MATRIX
H1-P5.3 / PUBLIC DEPENDENCY MAP AND EXAMPLES
H1-P5.4 / RH-INTERFACE APPENDIX AND ENTRYPOINT ALIGNMENT
H1-P5.5 / FINAL PACKAGE ADVERSARIAL PASS
```

The final pass is recorded in [Public Package Audit](PUBLIC_PACKAGE_AUDIT.md).

```math
\boxed{
\textbf{H1-P5 — PUBLIC MATHEMATICAL PACKAGE: COMPLETE.}
}
```

No post-Horizon research cursor is selected here.
