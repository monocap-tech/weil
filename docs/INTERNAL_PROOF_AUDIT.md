# Internal Proof Audit
**H1-P4.2 — WD-T01 through WD-T36**

This document records the Horizon-1 internal proof audit.

It introduces no new theorem.

P4-AUDIT-PASSED means:

> the current repository proof/reduction was checked for its stated hypotheses, domains, finite/infinite transitions, topology changes, quantifiers, and dependency custody, with any audit-level corrections applied.

It does **not** mean independently certified, formally verified, or externally refereed.

---

## 1. Audit criteria

Each stable theorem was checked for:

1. operator domain/codomain consistency;
2. adjoint and closure assumptions;
3. range/closed-range assumptions;
4. finite- versus infinite-dimensional transitions;
5. weak/strong convergence transitions;
6. index/nullity quantifiers;
7. multiplicity conventions;
8. support/Fourier conventions;
9. uniformity versus fixed-object constants;
10. hidden use of downstream interfaces.

---

## 2. Abstract defect calculus

| ID | Audit result | Notes |
| --- | --- | --- |
| WD-T01 | PASS after proof expansion | Reverse index inequality now records the finite-dimensional uniform negative margin and dense-range perturbation explicitly. |
| WD-T02 | PASS | Douglas source is pinned; the unit-majorization application and reduced-range convention are consistent. |
| WD-T03 | PASS | Exact range inclusion gives a bounded reduced solution; kernel decomposition and graph orthogonal complement are correct. |
| WD-T04 | PASS after notation cleanup | Failed range inclusion now uses the correct $\lambda^2$ Douglas majorization form. Critical attained/non-attained split is exhaustive. |
| WD-T05 | PASS | Rank-one covariance and contraction equivalence are a direct WD-T02 specialization. |
| WD-T06 | PASS | Nested orthogonal projections give Loewner-monotone defects and strong convergence; negative index is monotone under Loewner increase. |

### WD-T01 topology check

No closed-range assumption is required.

The equality

```math
\mathcal A
=
\overline{\operatorname{Ran}E^*}
```

is enough: only finite-dimensional negative subspaces must be approximated, and their negativity has a uniform margin.

### WD-T04 norm-attainment check

If the reduced solution satisfies

```math
\|X\|>1,
```

then

```math
\|X^*\|>1.
```

Because $X^*$ annihilates $\ker S_+$, the norm can be tested on $(\ker S_+)^\perp$, which is exactly the graph parameter space.

---

## 3. Restricted-channel / finite-index transfer

| ID | Audit result | Notes |
| --- | --- | --- |
| WD-T07 | PASS | Quadratic identity and custody direction are exact. |
| WD-T08 | PASS after quantifier clarification | The second index estimate now explicitly works with finite-dimensional negative subspaces before taking the supremum. |
| WD-T09 | PASS | For the Douglas reduced full map, joint contractivity is equivalent to the shared covariance budget. |
| WD-T10 | PASS | Residual budget $R_B$ is positive and WD-T02 applies to the effective synthesis. |
| WD-T11 | PASS | Finite-dimensional domain makes $YY^*$ finite rank; negative/null dimensions are exactly singular values above/equal to one. |
| WD-T12 | PASS | Sequential elimination is algebraically exact under the stated residual-factorization hypothesis. |
| WD-T13 | PASS after hypothesis correction | “Strictly positive” was narrowed to **uniformly positive** $K\succeq mI$, which guarantees bounded invertibility of the complementary block. |
| WD-T14 | PASS | Sign projection inequality is exact; graph admissibility is correctly not preserved in general. |

### WD-T09 reduced-solution check

The factorization

```math
D_{\rm full}
=
S_+(I-XX^*)S_+^*
```

alone would not justify positivity of $I-XX^*$ without using the reduced solution.

The proof does use the Douglas reduced full solution. Since its range lies in $(\ker S_+)^\perp$, WD-T02 supplies the equivalence between full defect nonnegativity and reduced-map contractivity.

### WD-T13 correction

The original wording “strictly positive” was ambiguous in infinite dimension.

The theorem now assumes

```math
K\succeq mI
```

for some $m>0$, so

```math
C\succeq mI_{W^\perp}
```

and $C^{-1}$ is bounded.

No broader merely-injective positive-operator statement is claimed.

---

## 4. Support filtration / persistence

| ID | Audit result | Notes |
| --- | --- | --- |
| WD-T15 | PASS | Monotone projection convergence and gap duality are correct for the real-parameter nested filtration. |
| WD-T16 | PASS | Finite negative sector gives strong compactness of the negative coordinate and hence a nonzero nonpositive/negative right-limit ray. |
| WD-T17 | PASS | At critical signature, equality of the positive weak-limit norm gives strong convergence; any positive norm loss makes the limit strictly negative. |
| WD-T18 | PASS | A negative subspace meets a nonnegative endpoint space trivially, so it injects into the endpoint quotient. |
| WD-T19 | PASS | Blow-up uses one bounded physical map $T$, right-continuous nested closed physical spaces, and weak compactness. |

### WD-T15 net/sequential check

For every $x$, failure of strong convergence as $t\downarrow c$ would produce a sequence $t_n\downarrow c$ violating the sequential limit.

Thus the sequence proof suffices for the real one-parameter filtration.

### WD-T19 carrier check

The theorem requires a **common** bounded map

```math
T:\mathscr H\to K
```

with

```math
\mathcal A_t=\overline{T(\mathscr H_t)}.
```

No theorem here claims blow-up when the analysis map itself varies with $t$. Any such identification belongs to the later composite morphology audit.

---

## 5. Zeta-Weil pair / residue structure

| ID | Audit result | Notes |
| --- | --- | --- |
| WD-T20 | PASS | Pair diagonalization is direct finite-dimensional algebra after multiplicity quotienting. |
| WD-T21 | PASS | Functional-equation quartet produces two distinct conjugate pairs in Bombieri ordinate coordinates. |
| WD-T22 | PASS for specialization; source pinned | The two-quartet $4$-index specialization matches Bombieri Theorem 8 after distinct-pair counting. |
| WD-T23 | PASS for quotienting; source pinned | Multiplicity-null convention matches Bombieri Lemma 10 and direct same-frequency synthesis kernel. |
| WD-T24 | PASS | Entire finite exponential sum + Vandermonde gives exact independence. |
| WD-T25 | PASS | Finite Problem-1 relation is smooth/distributional; applying $L=-\partial_u^2+1/4$ kills the homogeneous boundary terms and reduces to WD-T24. |
| WD-T26 | PASS | Every negative pair coordinate has equal-and-opposite raw residues; finite sums preserve zero moment. |
| WD-T27 | PASS | Finite Laurent expansion at infinity gives inverse-square decay, with no hidden uniformity claim. |
| WD-T28 | PASS after proof replacement | Hilbert–Schmidt proof now uses the native Dirichlet-resolvent estimate plus pinned multiplicity-counting, not an ordinary-Gram interpretation of Bombieri’s complex-symmetric matrix. |
| WD-T29 | PASS | Unit-budget tail error is bounded by the tail operator norm from WD-T28. |

### WD-T25 finite relation check

The theorem is only about **finite** positive compensation.

For finite smooth exponential combinations, equality in the native distribution/Hilbert carrier implies equality as a distribution, so applying $L$ is legitimate.

No statement is made about applying $L$ termwise to an infinite relation.

### WD-T28 corrected proof

For one coordinate,

```math
f_\gamma(u)=e^{-i\gamma u},
\qquad
LF_\gamma=f_\gamma,
\qquad
F_\gamma(\pm t)=0.
```

The explicit resolvent solution yields

```math
\|F_\gamma\|_2
\ll_t
(1+|\gamma|^2)^{-1}
```

because the zeta ordinate stays in the fixed transverse strip.

Hence

```math
\|f_\gamma\|_{H^{-1}_L}^2
=
\langle f_\gamma,Gf_\gamma\rangle
\ll_t
(1+|\gamma|^2)^{-1}.
```

Pinned zero counting with multiplicity then gives

```math
\sum_\gamma
\|E_te_\gamma\|_{H^{-1}_L}^2
<\infty.
```

This proves the Hilbert–Schmidt statement without treating Bombieri's $H$-matrix as an ordinary Hermitian Gram matrix.

Bombieri equation (7.7) is therefore corroborating/contextual for WD-T28 rather than load-bearing.

---

## 6. Explicit-formula arithmetic attachment

| ID | Audit result | Notes |
| --- | --- | --- |
| WD-T30 | PASS | Two-mode cancellation is finite-dimensional linear algebra; real $\tau$ is now explicit so each fixed multiplier is bounded on the zero strip. |
| WD-T31 | PASS | Far estimate is fixed-source/fixed-bounded-multiplier; constants may depend on the selected packet and multiplier. |
| WD-T32 | PASS | Local factorization of $\Xi$ at a complementary zero gives the exact multiplicity-$m_\mu$ derivative ratio. |
| WD-T33 | PASS after quantifier correction | Prime=far identity is cutoffwise. Tail decay requires a fixed multiplier or a uniformly bounded multiplier family; no claim remains for arbitrary adaptive unbounded families. |
| WD-T34 | PASS | Strict support convention $\log n<2c$ is source-pinned; threshold behavior is locally finite. |
| WD-T35 | PASS after domain/proof expansion | The theorem is restricted to the same compact-window admissible class as the pinned formula; pole evaluation is explicitly bounded by fixed-support $L^2$. |
| WD-T36 | PASS after statement sharpening | Recast as **no positive-Sobolev coercive estimate** from the logarithmic form norm; modulation gives an explicit sharpness sequence. |

### WD-T31 quantifier check

The estimate

```math
\mathcal F_{v,R}[\psi]
=
O_{v,\psi,F}\!\left(\frac{\log R}{R}\right)
```

is **not uniform over moving selected packets or unrestricted multiplier families**.

That is intentional and matches the fixed-source morphology theorem.

### WD-T33 correction

At each fixed cutoff $R$,

```math
\mathcal N_{v,R}[\psi]=\mathcal A_v[\psi]
```

implies

```math
\mathcal P_v[\psi]=\mathcal F_{v,R}[\psi].
```

Sending $R\to\infty$ uses WD-T31 only if $\psi$ is fixed, or if the multiplier family has the uniform bound required by the tail proof.

### WD-T35 form-domain check

The high-frequency estimate

```math
\Psi_c(t)=\log|t|+O_c(1)
```

gives global comparability after an $L^2$ shift because $\Psi_c$ is continuous on bounded frequency intervals.

The pole evaluation satisfies

```math
|F(i/2)|
\le
C_c\|f\|_2
```

for fixed support, so it is absorbed by the same scalar shift.

### WD-T36 sharpness check

For real-even $\phi\in C_c^\infty(-c,c)$,

```math
f_N(x)=\phi(x)\cos(Nx)
```

has logarithmic form size $\asymp\log N$ but

```math
\|f_N\|_{H^\varepsilon}^2
\asymp
N^{2\varepsilon}.
```

Thus no positive-Sobolev coercive estimate follows from WD-T35.

The theorem does not claim that every individual logarithmic-form vector lies outside every $H^\varepsilon$; it claims the absence of a uniform bootstrap/coercive bound.

---

## 7. Audit corrections applied

The audit required five substantive narrowing/clarification patches:

1. **WD-T13:** replace ambiguous “strictly positive” by $K\succeq mI$.
2. **WD-T28:** replace the Hilbert-Gram interpretation by a direct native Dirichlet-resolvent proof.
3. **WD-T33:** distinguish cutoffwise algebra from uniform $R\to\infty$ control for adaptive multiplier families.
4. **WD-T35:** state the source test class explicitly and bound the pole/evaluation term.
5. **WD-T36:** state the rigorous conclusion as failure of positive-Sobolev coercive bootstrap and supply a modulation sharpness sequence.

Two additional proof expositions were strengthened without changing hypotheses:

- WD-T01 finite-dimensional reverse-index approximation;
- WD-T08 finite-dimensional index-supremum quantifier.

---

## 8. Audit result

After the corrections above:

```math
\boxed{
\text{WD-T01 through WD-T36: P4-AUDIT-PASSED}
}
```

at the **internal Horizon-1 audit level**.

This does not certify the composite morphology theorems WD-T37–WD-T39; those are the subject of H1-P4.3.

It also does not change the OPEN status of any RH-facing interface.

---

## 9. Source-custody adjustment

WD-T28 no longer consumes Bombieri equation (7.7) as a load-bearing Hilbert-Gram input.

Its load-bearing external input is now only the pinned zeta zero count; the resolvent estimate is internal.

Bombieri (7.7) remains useful corroborating context for the same decay scale.

---

## H1-P4.2 determination

The internal proof audit is complete through WD-T36.

### Historical handoff from H1-P4.2

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P4.3 / COMPOSITE MORPHOLOGY AUDIT}
```
