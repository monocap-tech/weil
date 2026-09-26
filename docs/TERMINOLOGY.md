# Terminology Registry

This registry defines project terms before or with their first load-bearing use. Historical wording remains historical; changes are additive rather than retroactive.

## Horizon

A **horizon** is a finite research package with an explicit acceptance condition and an explicit stop boundary.

A horizon may contain open mathematical interfaces. Completion means that the horizon's own deliverables are satisfied, not that every downstream problem is solved.

## Phase

A **phase** is an ordered unit inside a horizon.

A phase has:

- a mathematical purpose;
- an entry condition;
- a set of allowed tasks;
- an exit condition;
- a list of outputs.

Phases are not merely chronological labels.

## Standing

**Standing** records what epistemic status a claim has inside the repository.

Current public standing labels:

- **PROVED** — established within the stated framework and hypotheses.
- **CONDITIONAL** — proved assuming an explicitly named hypothesis or branch condition.
- **DERIVED** — exact reformulation or reduction from retained inputs.
- **IMPORTED** — taken from an external theorem or source and used with explicit scope.
- **COMPUTATIONAL** — numerically certified or experimentally supported over a stated finite domain.
- **OPEN** — required for later closure but not established.

Standing is typed, not scalar: an imported theorem, an internal derivation, and a computational certificate are not interchangeable.

## Interface

An **interface** is a theorem-shaped boundary between one completed research package and a downstream problem.

An open interface is not automatically an incomplete proof inside the current horizon.

For Horizon 1, the two primary RH-facing stop-line interfaces are `AZ-NEXTJET-LOC` and `AZ-FIN-WEIL-NULL-EXTENSION`. The registry also tracks the stronger special-packet refinement `C-ACTUAL-KPH-FLOOR`:

```math
\texttt{AZ-NEXTJET-LOC},
\qquad
\texttt{C-ACTUAL-KPH-FLOOR},
\qquad
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
```

## Re-entry

**Re-entry** is the explicit promotion of a result from one project layer or horizon into a stronger downstream theorem line.

Re-entry requires a scope audit. It is never inferred merely because the same notation or object appears in both layers.

## Custody

**Custody** means preserving the identity, hypotheses, and scope of the mathematical object being tracked through a reduction or transfer.

A valid reduction must not silently replace a selected packet, metric, support scale, or theorem hypothesis by a weaker aggregate object.

## Screening

**Spectral screening** is the finite-to-infinite phenomenon in which a negative eigenvalue present at every finite truncation may approach the zero boundary as the positive complement is restored:

```math
\lambda^-_{N,k}<0,
\qquad
\lambda^-_{N,k}\uparrow0.
```

It distinguishes finite negative index from infinite negative-mode survival.

## Defect

A **defect** is the residual obstruction left after the positive/background contribution has been separated from a selected negative or neutral channel.

In the rank-one formulation, a representative defect operator is

```math
\mathcal K_C(t)
=
\widetilde S_t\widetilde S_t^{*}
-
\widetilde g_C\otimes\widetilde g_C.
```

The term does not by itself assert negativity.

## Negative persistence

**Negative persistence** means that after the screening limit, a selected negative-signature direction survives projectively rather than collapsing entirely into the zero boundary.

## Neutral persistence

**Neutral persistence** means that the limiting obstruction survives at zero signature as a null mode rather than as a strictly negative direction.

In the current compact-window branch this is represented by

```math
W_ck=0.
```

## Morphology

A **defect morphology** is a theorem-level structural branch describing how a defect or critical sequence can persist, become neutral, or fail compactness after the completed reductions have been applied.

Horizon 1 packages three morphology classes:

1. fixed-packet negative persistence, ending at weighted next-jet localization;
2. fixed-packet attained-neutral persistence, ending at compact-window null-extension/support rigidity;
3. noncompact coefficient morphology, separating moving/infinite selected-sector escape from unselected-background escape and fixed full-divisor weak limits.


## Synthesis pair

A **synthesis pair** is a pair of bounded operators

```math
S_{+}:K_{+}\to\mathcal H,
\qquad
S_{-}:K_{-}\to\mathcal H
```

assembled into

```math
E(x,u)=S_{+}x+S_{-}u.
```

The $+$ and $-$ labels refer to the coefficient-space indefinite signature, not to positivity of the operators themselves.

## Analysis space

The **analysis space** associated with a synthesis pair is

```math
\mathcal A=(\ker E)^\perp
=
\overline{\operatorname{Ran}E^{*}}.
```

It is the coefficient space actually visible to physical synthesis.

## Physical defect operator

The **physical defect operator** is

```math
D
=
S_{+}S_{+}^{*}
-
S_{-}S_{-}^{*}
=
EJE^{*}.
```

Its quadratic form exactly represents the indefinite coefficient form on vectors of the form $E^{*}h$.

## Exact screening

**Exact screening** means

```math
\operatorname{Ran}S_{-}
\subseteq
\operatorname{Ran}S_{+}.
```

Equivalently, there exists a bounded $X$ such that

```math
S_{-}=-S_{+}X.
```

Exact screening does not imply that the screening coefficient norm fits inside the unit budget.

## Reduced screening solution

The **reduced screening solution** is the unique Douglas reduced solution $X$ of

```math
S_{+}X=-S_{-}
```

whose range lies in

```math
(\ker S_{+})^\perp.
```

It is the minimum-norm canonical screening operator.

## Over-budget defect

An **over-budget defect** occurs when exact screening holds but the reduced screening solution satisfies

```math
\|X\|>1.
```

The negative physical channel lies in the positive range, but reproducing it requires more than the unit indefinite-metric budget.

## Critical screening

**Critical screening** is the boundary case

```math
\|X\|=1.
```

Critical screening splits into attained and non-attained cases.

## Approximate-neutral boundary

The **approximate-neutral boundary** is critical screening with

```math
\|X\|=1
```

but no nonzero vector $a$ satisfying

```math
\|X^{*}a\|=\|a\|.
```

There is then no actual neutral vector, while normalized positive margins can still converge to zero along an approximate-neutral sequence.

This term is distinct from **neutral persistence**.


## Selected negative sector

A **selected negative sector** is a distinguished closed subspace

```math
M\subseteq K_{-}
```

whose defect ownership is tracked separately from the remaining negative channels.

When $M$ is finite dimensional, its dimension gives an upper bound on the negative index it can create by itself.

## Negative background

The **negative background** is the complementary negative channel space

```math
B=M^\perp\cap K_{-}.
```

Background contributions can make a selected negative witness more negative, but aggregate negativity need not belong to the selected sector.

## Residual screening budget

If a background channel is contractively screened by $X_B$, the **residual screening budget** is

```math
R_B=I-X_BX_B^{*}.
```

It records the positive coefficient-space capacity remaining for later selected channels.

## Effective positive synthesis

The **effective positive synthesis** after background elimination is

```math
S_{\rm eff}=S_{+}R_B^{1/2}.
```

It allows the selected problem to be re-entered into the same defect calculus after a legitimate background screening step.

## Shared screening budget

The **shared screening budget** principle is that negative channel blocks are jointly admissible only when their combined screening covariance fits inside the unit budget.

Separate contractivity of each block is not sufficient.

## Shorted covariance

For a positive covariance $K$ and a selected physical subspace $W$, the **shorted covariance** is the covariance remaining on $W$ after the complementary physical subspace has been optimized away.

In an invertible block decomposition

```math
K=
\begin{pmatrix}
A&B\\
B^{*}&C
\end{pmatrix},
```

it is

```math
H_W=A-BC^{-1}B^{*}.
```

Direct compression $A$ and shorted covariance $H_W$ have different inverse-control meanings.

## Signature shadow

A **signature shadow** is a coordinate projection of an indefinite coefficient vector that preserves its algebraic sign margin but need not remain in the relevant analysis space.

A signature shadow is not automatically an admissible persistent vector.


## Right-limit analysis space

For a monotone analysis-space filtration

```math
\mathcal A_s\subseteq\mathcal A_t
\qquad(s<t),
```

the **right-limit analysis space** at $c$ is

```math
\mathcal A_{c+}
=
\bigcap_{t>c}\mathcal A_t.
```

It contains coefficient vectors that persist at every support/observation scale immediately to the right of the endpoint.

## Endpoint jump

The **endpoint jump** is the Hilbert-space difference

```math
\mathcal J_c
=
\mathcal A_{c+}\ominus\mathcal A_c.
```

A nonzero endpoint jump records failure of right continuity of the analysis-space filtration.

When $\mathcal A_c$ is $J$-nonnegative, any new right-limit negative index must inject into the quotient

```math
\mathcal A_{c+}/\mathcal A_c.
```

## Right-persistent vector

A **right-persistent vector** is a vector

```math
y\in\mathcal A_{c+}.
```

It is **new at the endpoint** when

```math
y\notin\mathcal A_c.
```

Negative and neutral persistence are sign-refined forms of this notion.

## Boundary amplification

Given a bounded physical realization

```math
\mathcal A_t
=
\overline{T(\mathscr H_t)},
```

the **boundary amplification cost** of $y$ is

```math
\mathfrak B_y(t,\varepsilon)
=
\inf
\left\{
\|h\|:
h\in\mathscr H_t,\
\|Th-y\|\le\varepsilon
\right\}.
```

For a genuinely new endpoint vector, this cost diverges as

```math
(t,\varepsilon)\to(c+,0).
```

## Moving-sector escape

A **moving-sector escape** occurs when the selected negative direction itself moves through an infinite coefficient space as the filtration approaches the endpoint.

This can destroy every nonzero right-limit ray even when every stage contains a finite-dimensional negative direction.

It is distinct from positive-coordinate mass loss with a fixed finite negative sector.


## Zero-side Weil representation

The **zero-side Weil representation** is the coefficient/synthesis realization of the Weil quadratic form in terms of zero channels.

Its positive coefficient sector contains critical-line coordinates and positive off-axis pair directions; its negative sector contains antisymmetric off-axis pair directions.

## Weil pair channels

For a nonreal ordinate pair

```math
\gamma=T+i\delta,
\qquad
\bar\gamma=T-i\delta,
```

the canonical **Weil pair channels** are

```math
p
=
\frac{e_\gamma+e_{\bar\gamma}}{\sqrt2},
\qquad
n
=
\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2}.
```

They satisfy

```math
Jp=p,
\qquad
Jn=-n.
```

The $p$-channel is the positive/symmetric pair direction; the $n$-channel is the negative/antisymmetric pair direction.

## Selected packet

A **selected packet** $\Pi$ is a fixed finite set of off-axis zero channels whose negative sector is tracked with custody through the defect calculus.

Its selected negative coefficient space is denoted

```math
M_\Pi\subseteq K_{-}.
```

## Unselected negative divisor

The **unselected negative divisor** relative to $\Pi$ is the complementary negative coefficient sector

```math
B_\Pi=M_\Pi^\perp\cap K_{-}.
```

It is the zeta-Weil realization of the abstract negative background.

## ZW-0 / ZW-1 / ZW-2

Horizon 1 uses three zeta-specialization layers:

- **ZW-0 — Weil/Krein pair geometry:** zero-side pair diagonalization, sign channels, finite index, and compact-window synthesis.
- **ZW-1 — zeta-divisor structure:** functional-equation/conjugation structure, selected packets, zero-moment residues, actual zero-count/compactness inputs.
- **ZW-2 — explicit-formula arithmetic:** prime, pole, archimedean, completed $\Xi$, next-jet, and finite translation structure.

These labels distinguish where arithmetic genuinely enters.

## Explicit-formula side

The **explicit-formula side** is the prime/pole/archimedean representation of the same Weil quadratic form.

It is not an additional positive screening sector and must not be added to $K_{+}$ as though it supplied independent coefficient budget.


## Raw residue vector

Given a selected negative pair-coordinate vector $u$, the **raw residue vector** $v$ is obtained by undoing the canonical pair diagonalization back to the selected zero coordinates.

For each negative pair channel, the two raw coefficients are equal and opposite.

## Zero-moment law

The **zero-moment law** is

```math
\mathbf{1}^Tv=0.
```

It is a ZW-1 structural identity coming from antisymmetry of the negative pair channels.

It is not a generic H1-P1 screening theorem and does not use the prime side of the explicit formula.

## Rational response

The **rational response** of a finite raw residue vector is

```math
R_v(z)
=
\sum_j\frac{v_j}{z-\rho_j}.
```

Under the zero-moment law,

```math
R_v(z)=O(|z|^{-2}).
```

The inverse-square order is the universal pair-geometric order unless additional moment cancellation is proved.

## Native Problem-1 synthesis

The **native Problem-1 synthesis** is Bombieri's Green-preconditioned zero synthesis into the Dirichlet $H^{-1}$-type physical carrier.

For fixed support it is Hilbert-Schmidt, hence compact.

This term distinguishes the actual Weil/Bombieri operator metric from unweighted exponential $L^2$ models.

## Unweighted mirror model

An **unweighted mirror model** is an $L^2/PW_t$ exponential or cosh/sinh sampling model in which the Green weights of native Problem 1 have been removed.

Frame or sampling lower bounds in this model are auxiliary harmonic-analytic statements and are not automatically native Problem-1 coercivity estimates.

## Metric separation

**Metric separation** is the rule that a theorem proved in an unweighted exponential/sampling norm may not be transferred to the native Problem-1 $H^{-1}$ operator without an explicit bounded comparison theorem.

In particular, a stable unweighted frame does not contradict compactness of native Problem-1 synthesis.


## Selected-preserving multiplier

A **selected-preserving multiplier** for a raw residue source $v$ is an admissible scalar multiplier $\psi$ satisfying

```math
\mathcal C_v[\psi]=0,
```

so the selected contracted-residue contribution is removed without discarding the complementary divisor, prime, and archimedean terms.

## Far complementary field

The **far complementary field** is the contribution of unselected zeros outside a fixed neighborhood of the selected packet:

```math
\mathcal F_{v,R}[\psi]
=
\sum_{\substack{\mu\notin F\\|\Im\mu-T_F|\ge R}}
m_\mu\psi(\mu)R_v(\mu).
```

For a fixed bounded multiplier and a zero-moment selected source,

```math
\mathcal F_{v,R}[\psi]
=
O((\log R)/R).
```

## Weighted next-jet field

The **weighted next-jet field** is

```math
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)},
\qquad
H_v=\Xi R_v.
```

It is the finite/intermediate complementary divisor object left after zero-moment far-tail localization.

## Explicit-formula co-adaptation

**Explicit-formula co-adaptation** is the phenomenon that adapting $\psi$ to cancel one side of the scalar explicit formula changes the remaining prime/archimedean balance simultaneously.

In particular, under selected preservation, if

```math
\mathcal N_v[\psi]=\mathcal A_v[\psi],
```

then

```math
\mathcal P_v[\psi]=\mathcal F_v[\psi].
```

Thus adaptive near cancellation does not leave an independent prime lower bound.

## Compact-window arithmetic operator

The **compact-window arithmetic operator** at support $c$ is the physical operator representing the geometric Weil form:

```math
\mathcal W_c
=
\mathcal A_\infty
-
\sum_{\log n<2c}
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n})
+
\mathcal R_{\rm pole},
```

up to the fixed Fourier-normalization convention.

At fixed $c$, the prime-translation sum is finite.

## Logarithmic form order

The **logarithmic form order** is the high-frequency asymptotic

```math
\Psi_c(t)
=
\log|t|+O_c(1).
```

It implies that the natural form norm is equivalent, after an $L^2$ shift, to a logarithmic Fourier/Sobolev norm rather than to a positive-order Sobolev norm.


## Unit-gain neutral relation

A **unit-gain neutral relation** is a finite-exception selected direction $u\neq0$ satisfying

```math
C_c^{*}C_cu=u.
```

Equivalently,

```math
\|C_cu\|=\|u\|.
```

This is the attained-neutral boundary condition in the selected compensator metric.

## Physical neutral mode

A **physical neutral mode** is a nonzero physical vector $k$ realizing a unit-gain neutral relation through

```math
C_cu=P_c^{*}k.
```

With

```math
N_c=-P_cC_c,
```

it satisfies

```math
N_c^{*}k=-u
```

and therefore

```math
W_ck=0,
\qquad
W_c=P_cP_c^{*}-N_cN_c^{*}.
```

## Null-extension problem

The **null-extension problem** asks whether the zero extension $\widetilde k$ of a compact-window physical neutral mode has Weil output

```math
\mathcal W_c^{\rm ext}\widetilde k
```

vanishing on a nontrivial exterior collar adjacent to the original support.

It is a fixed-vector support question, not merely a regularity or approximate-closure question.

## Negative fall-through

**Negative fall-through** is the fixed-packet critical alternative in which positive coefficient mass is lost in the right-limit process, converting an approximately neutral sequence into a strictly negative persistent ray.

Negative fall-through is assigned to the negative morphology theorem rather than to the neutral branch.


## Background escape

**Background escape** is failure of strong compactness in the normalized unselected negative background after a fixed selected packet has already been anchored.

It includes:

- background norm escape;
- bounded coefficient-tail escape.

Background escape does not erase the fixed selected negative ray.

## Coefficient-tail tightness

A bounded sequence $b_n$ in an $\ell^2$-type coefficient space is **coefficient-tail tight** when, for a canonical increasing finite-coordinate exhaustion $Q_R$,

```math
\lim_{R\to\infty}
\sup_n
\|(I-Q_R)b_n\|
=
0.
```

Bounded coefficient-tail tightness implies precompactness.

## Fixed full-divisor ray

A **fixed full-divisor ray** is historical shorthand reserved for the stronger case of a full strong coefficient limit

```math
Y_{\rm full}=(a,u,b)
```

containing the positive coordinate, fixed selected negative coordinate, and a strongly convergent unselected negative background.

On the negative morphology branch its full signature remains strictly negative. The audited WD-T39 theorem generally guarantees only a **fixed full-divisor negative weak limit**; use “fixed full-divisor ray” only when positive-coordinate strong convergence is additionally available.

## Selected-sector escape

**Selected-sector escape** is the noncompact morphology in which the selected negative direction or mass moves through successively new coordinates so that every fixed finite coordinate projection tends to zero.

Selected-sector escape may produce normalized approximate zero-edge relations with weak coefficient limit zero.

It is distinct from background escape.


## Stable theorem ID

A **stable theorem ID** is the additive public identifier assigned during H1-P4.

Stable theorem IDs use the form

```math
\texttt{WD-T01},\texttt{ WD-T02},\ldots
```

and do not replace historical labels. Historical labels remain immutable provenance aliases.

A stable theorem ID is a name, not a certification mark.

## Verification status

**Verification status** records how far a theorem has progressed through proof/source audit independently of its mathematical standing.

The completed H1-P4 verification labels used on the stable inventory are:

- **P4-AUDIT-PASSED**;
- **SOURCE-PINNED**;
- **COMPOSITE-AUDIT-PASSED**;
- **EXAMPLE-AUDIT-PASSED**;
- **SCOPE-ONLY**.

The corresponding pending labels are queue/history states, not current terminal H1-P4 standings.

Verification status is distinct from whether the repository contains an internal proof.

## Internal proof standing

**INTERNAL-PROOF** means that proof text is present in the repository under the stated hypotheses.

It does not mean that the proof has been independently certified, formally verified, or externally refereed.


## Source-pinned

**SOURCE-PINNED** means that a load-bearing external input has been tied to an exact theorem, lemma, equation, or page location and that the convention imported from that source has been recorded.

Source-pinned does not mean the repository's downstream use of the source has completed internal proof audit.

## Source pin

A **source pin** is the durable record connecting one external input to:

1. its bibliographic source;
2. its exact theorem/equation location;
3. the notation or convention imported into this project;
4. the stable theorem IDs that consume it.


## P4-audit-passed

**P4-AUDIT-PASSED** means that the theorem's current repository proof/reduction has passed the Horizon-1 internal audit for stated hypotheses, domains, topology transitions, quantifiers, and dependency custody, after any recorded corrections.

It does not mean independent certification, formal verification, or external refereeing.


## Composite-audit-passed

**COMPOSITE-AUDIT-PASSED** means that a packaged morphology theorem has passed the Horizon-1 end-to-end dependency/hypothesis audit after any recorded narrowing corrections.

It does not mean independent certification or external refereeing.

## Right-limit compact-window operator

Under the strict endpoint convention

```math
\log n<2c,
```

the **right-limit compact-window operator** is the operator seen under arbitrarily small strict right enlargement:

```math
\mathcal W_{c+}^{\rm ext}
=
\mathcal A_\infty
-
\sum_{\log n\le2c}
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n})
+
\mathcal R_{\rm pole}.
```

Away from a prime-power threshold it equals $\mathcal W_c^{\rm ext}$. At a threshold it differs by the finite equality-threshold translation terms.

## P4 audit clarification — fixed full-divisor limit

In the audited stable theorem WD-T39, a **fixed full-divisor negative weak limit** is

```math
Y_{\rm full}=(a,u,b)
```

with

```math
a_n\rightharpoonup a,
\qquad
u_n\to u,
\qquad
b_n\to b.
```

Thus the whole negative sector converges strongly while the positive coordinate may converge only weakly.

The earlier stronger phrase **fixed full-divisor ray** applies as a full strong limit only when the additional positive-coordinate compactness condition

```math
a_n\to a
```

is also available.


## Example-audit-passed

**EXAMPLE-AUDIT-PASSED** means that an explicit example/sharpness construction has been checked algebraically and that the theorem boundary it is claimed to sharpen has been verified.

It does not mean independent certification or external refereeing.


## Lean certification

**LEAN-CERTIFIED** means that a mapped Lean declaration has passed the pinned Lean/mathlib build with no project-level unfinished proof placeholders or project axioms.

Lean certification is separate from P4 internal audit status.

## Lean-certified from imported premise

**LEAN-CERTIFIED-FROM-IMPORTED-PREMISE** means Lean kernel-checks the project's downstream deduction from an explicitly represented external theorem premise, while the external theorem itself has not yet been reconstructed in Lean.

This status must never be presented as formal verification of the imported source theorem.

## Lean-blocked

**LEAN-BLOCKED** means a formalization pass has been exhausted and a precise missing formal dependency, library theorem, or source reconstruction obligation has been recorded.

It is a terminal status for the current LEAN-H1 exhaustion test, but not a claim that the theorem is impossible to formalize.

## Lean formalization exhaustion

**Lean formalization exhaustion** is reached when every stable Horizon-1 theorem/example is assigned one of:

- LEAN-CERTIFIED;
- LEAN-CERTIFIED-FROM-IMPORTED-PREMISE;
- LEAN-BLOCKED with an exact blocker;
- SCOPE-ONLY.

No stable theorem/example may remain merely unattempted when LEAN-H1 closes.
