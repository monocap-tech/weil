# RPB108 — Formalization and promotion protocol

**Objective:** close the gap between published RPB108 source/interval certificates and the completed Horizon-1 Lean project while preserving the original carrier and all transitive dependencies.

## Existing trusted baseline

The Horizon-1 WeilDefect Lean project is pinned at Lean 4.34.0 / mathlib v4.34.0 in [its formalization track](../../LEAN_FORMALIZATION_TRACK.md). Its certificate rule requires compilation in pinned CI, no project sorry/admit/axiom, durable theorem-to-declaration mapping, and explicit separate classification for imports. The external Prove2Me/Formalpedia constructions use a different recorded toolchain (Lean 4.33.1 / Mathlib 0df444a). **No automatic cross-version or cross-definition equivalence is established.**

The proposed package is **documentation/provenance only**. It contains no Lean proof, no cached compiled proof artifact, no promoted H1 theorem status, and no claim that the source validators have been rerun here.

## Staged port plan

| Gate | Deliverable | Proof/verification obligation |
| --- | --- | --- |
| F0: source identities | Exact original Q_a and its supported polynomial domain, parity involution, normalized Legendre carrier, source L_Q | Definitions match the original arithmetic and form; no unwarranted boundedness of full log operator |
| F1: analytic estimates | Complete F112 closed high form, coercivity with lower 11/25, polynomial source representation and Schur inverse | Domain/closed-form proof; signed arch/prime/pole, support cutoff and normalization |
| F2: arithmetic checker | Import exact rational trial vectors, original source and native Gram enclosures, analytic truncation/endpoint/remainder bounds | Trusted Lean verification of rational order, intervals, 116-dimensional positive pivots, physical mass and strict inequalities |
| F3: first vertical theorem | DNE27's Q(h)>=4e-36 ||h||² on Z8+F112 | Whole infinite-high completion and positive collective mixed source matrix, with all F112, not merely truncation |
| F4: null reduction | DNE24's explicit W104 and bounded finite response, exact null iff eigenvalue 1 | True form-Riesz inverse and operator-domain equivalence; no invented entries of K |
| F5: external adapter | Compare current Q_a/test domain to canonical Prove2Me Weil form/Green carriers, import equivalent statements if proved | No use of theorem-name coincidence as a definition bridge |
| F6: open frontier | Prove 104-dimensional response sign and a global all-aperture theorem | New mathematics necessary; not a mechanical translation gate |

## Promotion policy

A mathematical report enters the curated register as an **UPSTREAM-CERTIFIED computational statement** only with complete data custody, proof scope and independent script replay. Its formal status remains **NOT PORTED** until an axiom-audited Lean build proves the exact claim. A theorem relying on a missing external analytic proof must list its imported premise, and should not be described as a complete standalone kernel proof.

A conditional sufficient estimate may be a theorem of mathematics but cannot turn the antecedent into a proved fact by naming a certificate. Partial-data countermodels must identify the exact information packet they preserve and may not be cited as counterexamples to the complete original Weil identities.

## Build/CI staging

Do **not** alter or reset Horizon-1 certified source or existing public theorem IDs. Start a distinct Lean namespace/module family (proposed: WeilDefect.RPB108) only when the port begins. Reuse existing mathematical abstractions where type-preserving; avoid copying the huge experimental script directory. A future Lean PR should pin mathlib and any formally imported accepted Prove2Me proof bodies, run Lake CI and #print axioms / admission audits, and link each new declaration to a source manifest row.

If formal arithmetic verification is infeasible for a source certificate, mark it **INTERNAL COMPUTATIONAL EVIDENCE** and preserve the analytic dependency instead of decorating the result with a misleading Lean status.

## Publication disposition

This proposed transfer is not a completed Horizon-2 theorem package. Review the four surfaces, verify upstream bytes and accepted wording, then separately decide which statements warrant stable IDs and a manuscript-level theorem. Keep experimental work in weil-lab and attach only the reusable proofs and checked dependency closure to weil.
