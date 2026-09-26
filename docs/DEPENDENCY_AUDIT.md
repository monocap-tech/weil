# Dependency Audit
**H1-P4.0 — Theorem DAG, source boundaries, and audit closure**

This document audits the architecture of the Horizon-1 theorem inventory without introducing new mathematical claims.

The canonical stable IDs are defined in [Theorem Ledger](THEOREM_LEDGER.md).

---

## 1. Normalized dependency DAG

### Abstract screening spine

```math
\boxed{
\text{WD-T01}
\longrightarrow
\text{WD-T02}
\longrightarrow
\begin{cases}
\text{WD-T03},\\
\text{WD-T04},\\
\text{WD-T05}.
\end{cases}
}
```

Positive restoration is separately encoded by

```math
\boxed{
\text{WD-T06}.
}
```

### Selected/background spine

```math
\boxed{
\text{WD-T07}
\longrightarrow
\begin{cases}
\text{WD-T08},\\
\text{WD-T09}
\end{cases}
}
```

and

```math
\boxed{
\text{WD-T02}
+
\text{WD-T09}
\longrightarrow
\text{WD-T10}
\longrightarrow
\text{WD-T12}.
}
```

The finite-sector spectral statement is

```math
\boxed{
\text{WD-T03}
\longrightarrow
\text{WD-T11}.
}
```

Complement elimination and finite shadows are

```math
\boxed{
\text{WD-T13},
\qquad
\text{WD-T14}.
}
```

### Support-filtration spine

```math
\boxed{
\text{WD-T15}
\longrightarrow
\begin{cases}
\text{WD-T16},\\
\text{WD-T17},\\
\text{WD-T18}.
\end{cases}
}
```

The representative-blow-up theorem is independent of WD-T16 once its own physical-realization hypotheses and a new endpoint vector are supplied:

```math
\boxed{
\text{new endpoint vector}
+
\text{common bounded physical realization/right continuity}
\longrightarrow
\text{WD-T19 conclusion}.
}
```

WD-T16 is one way a later morphology application can produce the required persistent endpoint vector; it is not a theorem-level premise of WD-T19.

### Zeta-Weil pair spine

```math
\boxed{
\text{WD-T20}
\longrightarrow
\text{WD-T21}.
}
```

Bombieri's imported finite inertia theorem supplies

```math
\boxed{
\text{WD-T22}.
}
```

Multiplicity reduction is

```math
\boxed{
\text{WD-T23}.
}
```

Finite exponential independence gives

```math
\boxed{
\text{WD-T24}
\longrightarrow
\text{WD-T25}.
}
```

The selected residue chain is

```math
\boxed{
\text{WD-T20}
\longrightarrow
\text{WD-T26}
\longrightarrow
\text{WD-T27}.
}
```

Native compact synthesis gives

```math
\boxed{
\text{WD-T28}
\longrightarrow
\text{WD-T29}.
}
```

### Explicit-formula spine

Scalarization and far localization are separate steps. WD-T30 supplies a selected-preserving multiplier construction when its two-mode hypothesis is used. The far-tail theorem itself uses the zero-moment decay from WD-T27, zero counting, and boundedness of the chosen multiplier:

```math
\boxed{
\text{WD-T27}
+
\text{EXT-3 zero counting}
+
\text{bounded multiplier}
\longrightarrow
\text{WD-T31}.
}
```

The completed $\Xi$ representation is

```math
\boxed{
\text{WD-T32}.
}
```

Explicit-formula co-adaptation is

```math
\boxed{
\text{WD-T33}.
}
```

The compact-window neutral arithmetic chain is

```math
\boxed{
\text{WD-T34}
\longrightarrow
\text{WD-T35}
\longrightarrow
\text{WD-T36}.
}
```

---

## 2. Morphology dependencies

### Negative morphology

The load-bearing fixed-packet chain is:

```math
\boxed{
\begin{array}{c}
\text{WD-T16 / fixed selected negative persistence}\\
\downarrow\\
\text{WD-T07 / selected-to-full sign transfer}\\
\downarrow\\
\text{WD-T26}\to\text{WD-T27}\\
\downarrow\\
\text{WD-T31 / far-tail control}\\
\downarrow\\
\text{WD-T32 / near completed-}\Xi\text{ representation}\\
\downarrow\\
\text{WD-T33 / co-adaptation guard}\\
\downarrow\\
\boxed{\text{WD-T37}}
\end{array}
}
```

WD-T30 can supply a selected-preserving multiplier for the scalarization step but is not a premise of the far-tail estimate itself. WD-T19 supplies the stronger universal representation-cost conclusion only when the common-carrier hypotheses required by that theorem are additionally available; WD-T37 otherwise uses the direct selected-amplitude normalization recorded in its canonical source.

The downstream interface is

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}.
}
```

C-ACTUAL-KPH-FLOOR is a stronger special-packet interface and is not used to prove WD-T37.

### Neutral morphology

```math
\boxed{
\text{WD-T17}
+
\text{finite-exception unit-gain/physical-realization hypotheses}
\longrightarrow
\text{physical null mode}
}
```

followed by

```math
\boxed{
\text{WD-T34}
\to
\text{WD-T35}
\to
\text{WD-T36}
\to
\boxed{\text{WD-T38}}.
}
```

The downstream interface is

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
}
```

No later boundary-trace, Stieltjes, or UCP diagnostic is consumed by WD-T38.

### Noncompact morphology

Moving selected-sector escape uses the compactness distinction encoded by

```math
\boxed{
\text{WD-T15},
\text{ WD-T16},
\text{ WD-T17}
}
```

plus explicit examples such as WD-X05.

Unselected-background classification uses

```math
\boxed{
\text{WD-T07}
+
\text{WD-T14}
}
```

and fixed selected-ray hypotheses inherited from WD-T37.

This packages as

```math
\boxed{
\text{WD-T39}.
}
```

---

## 3. Imported-source boundary

Only a small subset of the theorem spine consumes external theorems as load-bearing inputs.

### EXT-1 — Douglas factorization theorem

Consumed by

```math
\boxed{
\text{WD-T02}.
}
```

Downstream theorems WD-T03, WD-T10, and WD-T11 use the reduced screening solution produced in that framework.

**Source status:** PINNED. Douglas (1966), Theorem 1, pp. 413–415 supplies the range-inclusion/majorization/factorization equivalence together with the reduced-solution normalization used by WD-T02; see [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

### EXT-2 — Bombieri finite Weil theory

Consumed directly by

```math
\boxed{
\text{WD-T22},
\qquad
\text{WD-T23}.
}
```

Bombieri's kernel/column estimate is retained as corroborating context, but after P4.2 it is **not load-bearing** for WD-T28.

WD-T28 now uses an internal Dirichlet-resolvent estimate plus EXT-3 zero counting.

Exact source pins for the Bombieri finite-index and multiplicity statements are recorded in [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

### EXT-3 — Standard zeta zero counting

Consumed in

```math
\boxed{
\text{WD-T28},
\qquad
\text{WD-T31}.
}
```

**Source status:** PINNED. The canonical unit-height zero-count input and its multiplicity convention are fixed in [Imported Source Pins](IMPORTED_SOURCE_PINS.md) via Titchmarsh, Theorem 9.2, equation (9.2.1).

### EXT-4 — Compact-window geometric explicit formula

Consumed in

```math
\boxed{
\text{WD-T34},
\qquad
\text{WD-T35}.
}
```

**Source status:** PINNED. The strict support convention

```math
\log n<2c
```

the equality-threshold treatment, and the Fourier-normalization convention used by the operator form are recorded in [Imported Source Pins](IMPORTED_SOURCE_PINS.md) from Zhu's equations (2)–(3).

### EXT-5 — Digamma/Stirling asymptotic

Consumed in

```math
\boxed{
\text{WD-T35}.
}
```

**Source status:** PINNED. The asymptotic input

```math
\Re\psi\!\left(\frac14+\frac{it}{2}\right)
=
\log|t|+O(1)
```

is pinned to DLMF §5.11(i), equation 5.11.2; see [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

### EXT-6 — Anderson–Trapp shorting

Not required for the strictly positive Schur-complement proof of WD-T13.

It is background support for extending shorting beyond the invertible-block setting.

Therefore it is non-load-bearing for the current WD-T13 statement.

### EXT-7 — Suzuki operator framework

Contextual/background for the nonlocal operator species.

It is not load-bearing for WD-T34–WD-T38 as currently stated.

---

## 4. Internal proof bodies versus transitive source dependence

A repository-contained proof body is **not** the same thing as a source-free theorem in the transitive dependency DAG.

For example:

- WD-T03–WD-T05 inherit the Douglas interface through WD-T02;
- WD-T10 and its downstream residual-screening consequences inherit WD-T02;
- WD-T29 inherits the zero-count input used by WD-T28;
- WD-T36 inherits the compact-window/digamma source boundary carried by WD-T34–WD-T35.

Conversely, many theorem bodies are entirely internal once their explicitly typed premises are fixed. That fact describes **where the deduction is proved**, not **whether every premise in its ancestry was proved inside this repository**.

Accordingly, source provenance is determined by the normalized DAG plus the EXT-1–EXT-5 pins above, while mathematical standing and H1-P4 audit status are recorded separately in [Theorem Ledger](THEOREM_LEDGER.md). Lean's distinction between `LEAN-CERTIFIED` and `LEAN-CERTIFIED-FROM-IMPORTED-PREMISE` is recorded separately in [Lean Status](LEAN_STATUS.md).

This prevents the phrase “internal proof” from silently erasing an imported ancestor.
---

## 5. Conditional boundary

The morphology statements are conditional because they begin from explicit branch hypotheses.

### WD-T37

Consumes:
- fixed finite selected packet;
- nonnegative endpoint selected space;
- normalized selected amplitude tending to zero;
- strictly negative normalized selected signature limit.

The theorem does not assert that such a branch exists for actual zeta.

### WD-T38

Consumes:
- fixed finite selected packet;
- attained rather than negative-fall-through critical alternative;
- finite-exception unit-gain relation;
- physical adjoint realization.

The theorem does not assert that every critical branch has these properties.

### WD-T39

Its background-stability/full-divisor statements are conditional on an already anchored fixed selected ray where stated.

The moving-sector compactness classification itself is unconditional Hilbert-space structure.

---

## 6. Scope-guard audit

The following forbidden transfers are now explicit.

### SG-1 — Metric transfer

Unweighted $L^2/PW_t$ frame statements may not be promoted to native Problem-1 coercivity without an explicit comparison theorem.

### SG-2 — Double-counting arithmetic

Prime/pole/archimedean explicit-formula terms are not additional $K_{+}$ coefficient channels.

### SG-3 — Near-field lower bound

Weighted next-jet localization does not imply a uniform source-free lower bound for the near field.

### SG-4 — Neutral termwise vanishing

$Q_c(k)=0$ does not imply separate vanishing of pole, prime, and archimedean terms.

### SG-5 — Background custody

Unselected-background escape does not erase a fixed selected negative ray.

### SG-6 — Fixed-packet approximate neutrality

A non-attained critical morphology with no right-limit ray cannot occur inside one fixed finite selected sector.

---

## 7. Cycle audit

The normalized Horizon-1 theorem graph is acyclic.

The two open interfaces occur strictly downstream of the theorem packages:

```math
\text{WD-T37}
\longrightarrow
\texttt{AZ-NEXTJET-LOC},
```

and

```math
\text{WD-T38}
\longrightarrow
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
```

Neither interface is used upstream to prove the morphology theorem that reaches it.

The special-packet interface C-ACTUAL-KPH-FLOOR is likewise not imported into the generic WD-T37 chain.

This closes the principal circularity audit at the dependency-graph level.

---

## 8. P4 audit queue

The next audit passes should proceed in this order.

### P4.1 — Imported source pinning — COMPLETE

Exact pins are recorded in [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

### P4.2 — Internal proof audit — COMPLETE

WD-T01 through WD-T36 are P4-AUDIT-PASSED at the internal Horizon-1 level.

Corrections and theorem-by-theorem findings are recorded in [Internal Proof Audit](INTERNAL_PROOF_AUDIT.md).

### P4.3 — Composite morphology audit — COMPLETE

WD-T37 through WD-T39 are COMPOSITE-AUDIT-PASSED after the scope corrections recorded in [Composite Morphology Audit](COMPOSITE_MORPHOLOGY_AUDIT.md).

### P4.4 — Examples and sharpness audit — COMPLETE

WD-X01 through WD-X07 are EXAMPLE-AUDIT-PASSED. See [Examples and Sharpness Audit](EXAMPLES_SHARPNESS_AUDIT.md).

---

## 9. H1-P4.0 determination

The theorem inventory now has:

- stable additive public IDs;
- immutable historical aliases;
- a normalized DAG;
- explicit imported-source boundaries;
- explicit conditional branch boundaries;
- explicit scope guards;
- no dependency-cycle use of the RH-facing interfaces.

No mathematical theorem has been added in this pass.

### Historical handoff from H1-P4.0

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P4.3 / COMPOSITE MORPHOLOGY AUDIT}
}
```


---

## 10. P4.1 source-pin disposition

The following external inputs are now SOURCE-PINNED:

- Douglas (1966), Theorem 1;
- Bombieri (2000), Theorem 8;
- Bombieri (2000), Lemma 10;
- Bombieri (2000), equation (7.7) in the proof of Theorem 6;
- Titchmarsh (1986), Theorem 9.2 / equation (9.2.1);
- Zhu (2026), equations (2)–(3);
- DLMF 5.11.2.

Exact conventions are recorded in [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

Source pinning does not complete the internal proof audit.


---

## 11. P4.2 internal-audit disposition

WD-T01 through WD-T36 are now P4-AUDIT-PASSED.

Five audit-level corrections were applied:

- WD-T13 uniformly positive Schur hypothesis;
- WD-T28 direct resolvent Hilbert–Schmidt proof;
- WD-T33 adaptive-multiplier quantifier restriction;
- WD-T35 compact-window domain and pole bound;
- WD-T36 no-positive-Sobolev-coercivity formulation.

See [Internal Proof Audit](INTERNAL_PROOF_AUDIT.md).

This status is internal audit only, not independent certification.


---

## 12. P4.3 composite-audit disposition

WD-T37 through WD-T39 are now COMPOSITE-AUDIT-PASSED.

The composite audit applied seven scope corrections across carrier identification, multiplier uniformity, prime-threshold conventions, full-coordinate escape, and weak/strong convergence.

See [Composite Morphology Audit](COMPOSITE_MORPHOLOGY_AUDIT.md).

No RH-facing interface was imported upstream.


---

## 13. P4.4 examples/sharpness disposition

WD-X01 through WD-X07 are EXAMPLE-AUDIT-PASSED.

All H1-P4 audit classes are now complete.

```math
\boxed{
\textbf{H1-P4 — COMPLETE.}
}
```
