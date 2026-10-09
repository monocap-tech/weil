# RPB108: fixed-aperture Weil positivity — post-Horizon-1 transfer dossier

**Status:** DRAFT RESEARCH PROMOTION PACKAGE, 2026-10-09. **Not** a new completed Horizon, Lean certificate, or proof of RH.

**Upstream:** experimental research in [monocap-tech/weil-lab](https://github.com/monocap-tech/weil-lab). **Destination:** the curated [monocap-tech/weil](https://github.com/monocap-tech/weil) publication and formalization surface.

## Purpose and publication boundary

Horizon 1 is a closed, audited package of independent Weil-defect theory. This directory proposes a distinct *post-H1* interface for selected actual-Weil, fixed-aperture results. It does not mutate WD-T01–WD-T39, WD-X01–WD-X07, their historical premises, or their Lean statuses. Nothing here authorizes treating computational interval certificates as kernel-checked Lean proofs.

The research archive is intentionally broader than the publication package: CC/NF/DNE iterations, failed source estimators, unselected numerical trials, and alternative branches remain in weil-lab. This dossier promotes **only statements with a precise mathematical role and traceable evidence**.

The current mathematical subject is the original supported Weil quadratic form Q at radius a = 53/50 (1.06), on physical L²([-a,a]) with the canonical form domain and normalized Legendre basis. Let E112 contain the first 112 modes (56 per reflection parity), and F112 be its full physical orthogonal high complement with the original closed high form.

## Reader pathway

1. [Theorem/status inventory](THEOREM_INVENTORY.md) — what is established, conditional, or open; proposed durable IDs.
2. [Dependency and evidence manifest](SOURCE_MANIFEST.md) — immutable source commits and claims, with a replay-vs-import distinction.
3. [Mathematical obstruction and next acceptance gate](OPEN_FRONTIER.md) — the exact remaining 104-dimensional response and adequate sufficient source test.
4. [Formalization and promotion protocol](FORMALIZATION_PLAN.md) — which proofs to port first; how numerical certificates may be promoted without overstating evidence.

## First Lean component

The companion port adds [the universal physical-gap bound](PHYSICAL_GAP_PORT.md) in the separate `WeilDefect.RPB108` namespace. The ten supporting lemmas passed pinned remote CI. The [DNE27 numerical slice](DNE27_NUMERIC_PORT.md) now proves eight closed scalar lemmas and two conditional physical-gap theorems; these passed the local pinned build and axiom audit, with remote CI pending. This numerical slice certifies selected arithmetic inequalities; the original source/form-domain attachment and carrier adapter remain open.

## Main bounded conclusions and nonconclusions

- The **finite first-116-mode original form** at 1.06 is certified positive *in the upstream arithmetic/interval workflow*. The unmeasured infinite high complement prevents inferring whole-domain positivity from this alone.
- The original complete high form on F112 has an upstream certified lower floor 11/25.
- An explicit eight-dimensional retained space Z8 satisfies **Q(h) ≥ 4·10^-36 ||h||² for all h in Z8 + F112** (DNE27, inheriting DNE23). Every infinite high correction is included.
- The full original-null equation is reduced, using this positive block, to eigenvalue 1 of an **uncomputed 104-dimensional** finite response K (DNE24). Nullity and negative index are at most 104, not zero.
- The remainder response, whole original positivity at 1.06, all-aperture nonstalling continuation, actual global first-contact exclusion, F4, and RH remain **open**.
- The strongest whole-aperture positivity anchor *reported by upstream RPB108* remains a=21/20 (1.05). This dossier does not independently replay or promote its original CC18 certificate.

## Terminology and verification

A result marked **UPSTREAM-CERTIFIED** has a published, outward computational arithmetic or analytic certificate and recorded producer/validator evidence in weil-lab. It is not thereby **LEAN-CERTIFIED**. A result marked **CONDITIONAL** proves a consequence after an unverified arithmetic inequality is assumed. **OPEN** means the load-bearing inequality or theorem is absent. A **PARTIAL-DATA LIMIT** excludes one named estimator class, never the full original Weil identities or the RH conjecture.

Original theorem statements should be promoted into the stable public theorem registry only after the input bytes, exact normalizations, source ancestry, statement scope, and replay evidence have passed review. Proposed RPB labels are **not** existing stable Horizon-1 theorem IDs.

This directory is a review candidate, not an instruction to begin a new official Horizon or silently attach the current P2M equivalence to a different carrier.
