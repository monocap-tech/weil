# RPB108 — Proposed theorem and verification inventory

**Date:** 2026-10-09. These RPB-P identifiers are **provisional package identifiers**, not promoted WD-T IDs. All source validations mentioned below were conducted upstream; no new Lean or producer replay is claimed by this transfer.

| Provisional ID | Result and scope | Mathematical status | Formal status | Primary evidence |
| --- | --- | --- | --- | --- |
| RPB-P01 | Q_a positive on all 116 Legendre modes of the original a=53/50 finite restriction | UPSTREAM-CERTIFIED | NOT PORTED | CC71 |
| RPB-P02 | Full original high complement F112 coercive with C >= 11/25·I | UPSTREAM-CERTIFIED, inherited from DNE17 | NOT PORTED | DNE17 through DNE23/DNE27 |
| RPB-P03 | Q(h) >= 4·10^-36 ||h||² on Z8+F112, with dim Z8=8 | UPSTREAM-CERTIFIED | NOT PORTED | DNE23, sharpened DNE27 |
| RPB-P04 | After eliminating Z8+F112, actual null iff the remaining 104-dimensional response K has eigenvalue 1; negative index and nullity <=104 | Conditional on established form/source attachment; analytic reduction upstream | NOT PORTED | DNE24 |
| RPB-P05 | An explicit positive contracted four-column tested packet admits remainder source credits c_even=0.00316, c_odd=0.00962 | UPSTREAM-CERTIFIED for the named frame | NOT PORTED | DNE25, sharpened DNE27 |
| RPB-L01 | Named rank-two and aggregate source packets do not determine full true inverse response; signed boundary/source data reduce but do not end the ambiguity | PARTIAL-DATA LIMIT | NOT PORTED | NF39–NF41 |
| RPB-O01 | Strict positivity of Q on the **entire** canonical form domain at 1.06 | OPEN | NOT AVAILABLE | No completed certificate |
| RPB-O02 | Old-gap-independent cap-uniform continuation / all-window first-contact exclusion | OPEN; global RH-strength requirement | NOT AVAILABLE | CC26/CC29 conditional reductions |
| RPB-O03 | Reconcile canonical original Q/domain/carrier with Prove2Me's established formal representations and import a local quantitative certificate | OPEN INTEGRATION | NOT AVAILABLE | See FORMALIZATION_PLAN |

## Exact statement boundaries

### RPB-P01 — Finite native restriction

Let V116=span(e0,...,e115). The upstream CC71 outward matrix certificate asserts positivity of Q_a on every v in V116 and a physical lower bound >9·10^-35 ||v||². This is **not** positivity on V116 + V116^\perp, whose mixed response must be paid.

### RPB-P02 — Full infinite high coercivity

Let F112 be the original physical complement of E112, equipped with its canonical high **form domain**. The DNE17 estimate C >= 11/25 I is an infinite-dimensional form inequality, not a statement that the full original logarithmic Weil action is a bounded operator on all physical L². An eventual Lean port must establish domain preservation and the same signed normalization.

### RPB-P03 — Joint selected original restriction

Let Z8=span(e0,e1,x_even,w_even,u_even,x_odd,w_odd,u_odd), as defined by the upstream authenticated rational vectors. DNE23 certifies the eight-direction joint source matrix and all remaining F112; DNE27 strengthens the common physical gap to

    Q_a(h,h) >= 4 * 10^(-36) * ||h||²   for h in Z8+F112.

A null with retained projection in Z8 is excluded. Arbitrary retained components outside Z8 remain unconstrained by this theorem.

### RPB-P04 — Null-response reduction

Let W104 be the physical retained orthogonal complement of Z8 inside E112, with 52 dimensions in each parity. Complete the positive Z8+F112 block H. The upstream reduction defines its native B>0 and mixed source J, and

    K = B^(-1/2) J* H^(-1) J B^(-1/2).

It proves: actual weak/operator null iff 1 is an eigenvalue of K. Full strict sign requires K<I; merely excluding eigenvalue 1 does not exclude negative directions. **No entries or spectrum of K have been evaluated to completion.** Nullity and negative index are bounded by 104 rather than shown zero.

### RPB-P05 — Sufficient remaining-source test

After original native-energy orthogonalization of W104 against the tested positive frame, denote the remaining native block B_Y and complete signed projected physical source Gram Gamma_Y. DNE27 pays source-contraction credits

    c_even = 0.00316,    c_odd = 0.00962.

The inequalities c_parity * B_Y - Gamma_Y > 0 **in both parities** suffice for full positivity at 1.06. They have **not** been established. This sufficient test may fail even if actual original Q is positive, because the scalar-floor source estimator can be conservative.

## What must not be inferred

- Positive diagonal witnesses do not establish a collective positive matrix.
- An indefinite scalar-floor estimator is not a negative Weil vector.
- A finite116 positive form and an F112 positive form do not imply their union is positive without mixed coupling.
- Eight of 112 retained dimensions is a dimension count, **not** 7.14% of the RH proof.
- The formal RH-equivalent quartet/finite-selected-certificate results are separate, accepted interfaces. No direct identity with the RPB108 fixed-aperture certificate is yet formalized.

See [SOURCE_MANIFEST](SOURCE_MANIFEST.md) for pinned upstream links and [OPEN_FRONTIER](OPEN_FRONTIER.md) for the next mathematical target.

## Generic supporting Lean component

The [physical-gap component ledger](PHYSICAL_GAP_PORT.md) maps ten new declarations to exact generic inequalities. Status: first six declarations passed remote CI; four source-norm certificate declarations are locally type-checked and axiom-audited, with remote CI pending. These supporting lemmas are separate from provisional RPB-P01–RPB-P05. None of those original arithmetic/form results changes formal status.
