# Lean Formalization Track
## LEAN-H1 — Certification before H1-P5 — EXHAUSTED

This track preempted H1-P5 until its exhaustion condition was met.

LEAN-H1 is exhausted under the current Horizon-1 theorem inventory. The subsequent H1-P5 public-package phase is also complete; see [Public Package Audit](PUBLIC_PACKAGE_AUDIT.md).

This page is the **control surface** for the completed formalization track. Certificate evidence and historical run records belong in [Lean Status](LEAN_STATUS.md); this page records the phase structure, exhaustion rule, and current post-LEAN handoff.

## Toolchain

Pinned baseline:

```math
\boxed{
\text{Lean 4.34.0}
\qquad
\text{mathlib v4.34.0}.
}
```

The project uses:

- `lean-toolchain`;
- `lakefile.toml`;
- the `WeilDefect` Lean namespace;
- GitHub Actions build verification.

## Certification rule

A theorem is **LEAN-CERTIFIED** only if:

1. its Lean declaration exists in the repository;
2. the declaration contains no `sorry`, `admit`, or project `axiom`;
3. the pinned Lean/mathlib build succeeds in CI;
4. the theorem-ID-to-declaration map is recorded durably.

A proof downstream from an imported external theorem is not called a full Lean certification of that external theorem.

Instead the status is:

```math
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}.
}
```

The imported premise itself remains separately unformalized until its source theorem is reconstructed in Lean.

## Phases

### LEAN-H1-P0 — Infrastructure and vertical pilot — COMPLETE

- initialize Lake/mathlib project;
- pin toolchain;
- establish CI;
- prohibit `sorry`, `admit`, and project `axiom`;
- certify a small vertical slice of algebraic theorem/example statements.

### LEAN-H1-P1 — Algebraic and finite-dimensional core — COMPLETE

Primary targets:

- WD-T05;
- WD-T07;
- WD-T09;
- WD-T14;
- WD-T20;
- WD-T21;
- WD-T26;
- WD-T27;
- WD-X01 through WD-X07.

### LEAN-H1-P2 — Operator screening core

Targets:

- WD-T01 through WD-T13 excluding statements already discharged;
- Douglas-dependent theorems formalized downstream from an explicit imported-premise interface until Douglas itself is reconstructed or mapped to an existing mathlib theorem.

### LEAN-H1-P3 — Filtration and persistence core

Targets:

- WD-T15 through WD-T19;
- weak/strong convergence;
- endpoint intersection spaces;
- quotient/index arguments;
- boundary amplification.

### LEAN-H1-P4 — Zeta-Weil specialization

Targets:

- WD-T20 through WD-T36;
- imported analytic results represented as explicit premises where their source proofs have not yet been formalized;
- no hidden project axioms.

### LEAN-H1-P5 — Composite morphology

Targets:

- WD-T37 through WD-T39;
- certify the deductions from already certified internal theorems and explicit external premises;
- preserve every P4.3 branch/custody correction.

### LEAN-H1-P6 — Imported-source reconstruction frontier

Attempt direct Lean reconstruction of load-bearing external results where feasible:

- Douglas factorization if not already available in mathlib;
- Bombieri finite inertia/multiplicity;
- zeta zero counting;
- compact-window explicit formula;
- special-function asymptotics.

This phase may terminate with exact formalization blockers if reconstructing an external analytic theorem requires a corpus far larger than this project.

## Exhaustion condition

LEAN-H1 is exhausted only when every stable Horizon-1 theorem/example has one of the following durable states:

```math
\boxed{
\begin{array}{l}
\text{LEAN-CERTIFIED},\\
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE},\\
\text{LEAN-BLOCKED with an exact formal dependency/blocker},\\
\text{SCOPE-ONLY}.
\end{array}
}
```

A theorem may not remain merely “not attempted.”

Only after this exhaustion condition is met does the project resume:

```math
\boxed{
\texttt{H1-P5.0 / PUBLIC PACKAGE ARCHITECTURE}.
}
```

## Current control state

- **LEAN-H1:** EXHAUSTED.
- **H1-P5:** COMPLETE.
- **Active Lean phase:** none.
- **Active Lean cursor:** none.
- **Next project cursor:** none selected.

```math
\boxed{
\texttt{LEAN-H1 EXHAUSTED / H1-P5 COMPLETE / HORIZON 1 COMPLETE}
}
```

WD-X06 is `LEAN-CERTIFIED`, LEAN-H1 is exhausted, and H1-P5.0 through H1-P5.5 are complete. Horizon 1 is complete. No post-Horizon research cursor is selected. See [Lean Status](LEAN_STATUS.md) for the declaration map and certificate evidence and [Public Package Audit](PUBLIC_PACKAGE_AUDIT.md) for package closure.
