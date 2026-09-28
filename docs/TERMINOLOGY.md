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


## Physical probe

A **physical probe** is a compactly supported smooth test function

```math
f\in C_c^\infty(\mathbb R)
```

used as an input to the physical Weil preform.

In the reflected-packet bridge, a physical probe is distinct from a **selected packet** (Pi), which is a finite set of zero-side divisor channels.

## Weil translation system

The **Weil translation system** is the triple

```math
(\mathscr D,T,\mathfrak q),
\qquad
\mathscr D=C_c^\infty(\mathbb R),
```

where

```math
(T_tf)(x)=f(x-t)
```

is the real translation action and (mathfrak q) is the Hermitian Weil preform on the common compact-support core.

The system is translation-covariant in the sense

```math
\mathfrak q(T_af,T_ag)=\mathfrak q(f,g).
```

This term refers to the form together with its translation action, not to a single compact-window compression and not to a single scalar observable.

**Status:** branch-local RPB terminology; noncanonical outside the reflected-packet investigation.

## Polarized translated Weil kernel

Given the Weil translation system, the **polarized translated Weil kernel** is the matrix-coefficient family

```math
\mathcal K_{\mathfrak q}(f,g;t)
:=
\mathfrak q(T_tf,g).
```

Equivalently, by common-translation covariance,

```math
\mathcal K_{\mathfrak q}(f,g;t)
=
\mathfrak q(T_{t/2}f,T_{-t/2}g).
```

It satisfies the Hermitian symmetry

```math
\mathcal K_{\mathfrak q}(f,g;t)
=
\overline{
\mathcal K_{\mathfrak q}(g,f;-t)
}.
```

The frozen reflected scalar (Q_h(y)) is the diagonal centered slice

```math
Q_h(y)
=
\mathcal K_{\mathfrak q}(h,h;2y).
```

**Status:** branch-local RPB terminology; noncanonical outside the reflected-packet investigation.

## Mellin probe weight

For compact physical probes (f,g) with correlation

```math
C_{f,g}(r)
=
\int
\overline{f(x-r)}g(x)\,dx,
```

the associated **Mellin probe weight** is

```math
W_{f,g}(u)
=
u^{-1/2}C_{f,g}(-\log u),
\qquad
u>0.
```

Its Mellin transform satisfies

```math
\widetilde W_{f,g}(s)
=
M_{f,g}\!\left(\frac12-s\right),
```

where (M_{f,g}) is the bilateral Laplace transform of (C_{f,g}).

On a finite selected zero set, RPB source custody is expressed by

```math
m_\rho\widetilde W_{f,g}(\rho)=v_\rho.
```

**Status:** branch-local RPB terminology.

## RPB-POL-TAIL

`RPB-POL-TAIL` is the branch-local candidate interface asking for a subcritical large-separation growth estimate for a polarized translated Weil kernel whose selected Mellin residues encode a fixed WD-T37 source.

A source-specific sufficient form is

```math
\mathcal K_{\mathfrak q}(f_v,g_v;2y)
=
O(e^{\kappa_v y}),
\qquad
\kappa_v<2\delta_v,
```

where (delta_v) is the largest positive real displacement of an active selected zero carried by (v).

Equivalently, in multiplicative scale it is a source-adapted smoothed prime-number-theorem remainder bound.

`RPB-POL-TAIL` is not a public Horizon-1 interface and is not currently known to follow from `AZ-NEXTJET-LOC` or imply it.


## Weil screw potential

The **Weil screw potential** is the branch-local name for Suzuki's continuous real-even function (g_\zeta(t)) associated with the zeta Weil form.

Its load-bearing relation to the Weil translation system is distributional:

```math
k_\zeta
=
-g_\zeta'',
```

where (k_\zeta) is the translation-invariant distribution kernel representing the Weil preform.

The term **potential** emphasizes that (g_\zeta) is two distributional integrations smoother than the original Weil kernel. It does not assert that (g_\zeta) is positive definite unconditionally.

Suzuki's stronger Krein--Langer screw-kernel positivity condition is RH-equivalent.

**Status:** branch-local RPB terminology; source is Suzuki's screw-function formalism.

## Screw-kernel regularization

The **screw-kernel regularization** of the Weil form is the continuous Hermitian kernel

```math
\widetilde g_\zeta(x,y)
=
g_\zeta(x-y)
-
g_\zeta(x)
-
g_\zeta(-y)
+
g_\zeta(0).
```

On zero-mean functions, the subtraction terms vanish after integration, so the corresponding quadratic form agrees with convolution by (g_\zeta(x-y)).

This regularization is a continuous-kernel realization of the same Weil form after differentiation of test functions; it is not an independent arithmetic source.

**Status:** branch-local RPB terminology.

## Potentialization

**Potentialization** is the passage from the distribution kernel (k_\zeta) of the Weil preform to its normalized continuous second primitive (g_\zeta):

```math
k_\zeta=-g_\zeta''.
```

At the matrix-coefficient level, potentialization replaces a translated Weil coefficient by the second derivative of a smoother translated screw-potential coefficient.

This lowers distributional order but does not remove the underlying spectral data.

**Status:** branch-local RPB terminology.


## Neutral spectral plateau

Let (Q_W^a) be the localized Weil form on the support window ([-a,a]), with associated self-adjoint operator (A_a), and let

```math
\lambda_a
=
\inf_{0\ne f}
\frac{Q_W^a(f)}{\|f\|_2^2}
```

be its lowest spectral value.

Given an endpoint (c) with a nonzero neutral mode (k) satisfying (A_ck=0), a **neutral spectral plateau** is an interval of larger supports on which

```math
\lambda_a=0.
```

Because the zero extension of (k) has the same global Weil quadratic value on every larger support, every point of such a plateau carries the same fixed mode in the kernel of (A_a).

**Status:** branch-local RPB terminology.

## Neutral sign-persistence dichotomy

The **neutral sign-persistence dichotomy** is the following branch-local reduction.

For a zero-extended endpoint neutral mode (k) and any larger support (b>c),

```math
Q_W^b(k)=0.
```

Therefore exactly one of the following occurs:

```math
\lambda_b=0,
```

in which case the larger localized form is nonnegative and the same fixed (k) lies in (ker A_b); or

```math
\lambda_b<0,
```

in which case the enlarged compact-window Weil form has entered a negative spectral regime.

This dichotomy refines the branch-local interpretation of `AZ-FIN-WEIL-NULL-EXTENSION`. It does not by itself identify selected negative-sector custody after a negative fall-through.

**Status:** branch-local RPB terminology.


## Global Weil radical

A compactly supported physical vector (k) lies in the **global Weil radical** when

```math
\mathfrak q(k,h)=0
\qquad
\text{for every }h\in C_c^\infty(\mathbb R).
```

Equivalently, every translated matrix coefficient with (k) in one slot vanishes after using common-translation covariance.

In the RPB neutral-plateau analysis, persistence of the same compact mode in the kernel of every sufficiently large localized Weil operator forces membership in the global Weil radical.

**Status:** branch-local RPB terminology.

## Entire-density obstruction

The **entire-density obstruction** is the incompatibility between:

1. a nonzero compactly supported (L^2) function (k), whose Fourier transform is an entire function of finite exponential type and hence has only (O(R)) zeros in (|z|\le R); and
2. a requirement that (widehat k) vanish at a set of distinct real points with counting function (gg R\log R).

In RPB-11, Conrey's unconditional positive proportion of simple critical-line zeta zeros supplies such a set of real ordinates.

**Status:** branch-local RPB terminology.


## Finite-head sign capture

Let

```math
Q_W(h)
=
\|S_+^*h\|^2
-
\|S_-^*h\|^2
```

be the full zero-side Weil form, and let (P_G^-) be a finite-coordinate exhaustion of the negative coefficient sector.

A negative witness (h) has **finite-head sign capture at height (G)** when

```math
\|S_+^*h\|^2
-
\|P_G^-S_-^*h\|^2
<0.
```

Every strict full-form negative witness has finite-head sign capture for some finite (G), because the negative coefficient tail is square summable.

**Status:** branch-local RPB terminology.

## Sign-custody escape

A right-approaching sequence of strict full-form negative witnesses exhibits **sign-custody escape** when each witness has finite-head sign capture, but the least/canonical height needed to capture the strict sign tends to infinity.

Equivalently, for every fixed finite negative-coordinate block, the selected finite-head form is eventually nonnegative even though the full form remains strictly negative.

Sign-custody escape is weaker than full selected-sector escape: fixed low negative coordinates may remain strongly anchored, but an increasingly remote negative tail is required to tip the total signature below zero as the full negative margin tends to zero.

**Status:** branch-local RPB terminology.


## Sign-capture scale

For a strict full-form negative witness (h) at support (a), the **sign-capture scale** (G_{m cap}(a,h)) is the least cutoff in a fixed canonical finite negative-coordinate exhaustion for which the truncated selected form is already negative:

```math
Q_{G,a}(h)<0.
```

When a post-neutral branch (h_delta) approaches a plateau edge (c_*), the behavior of (G_{m cap}(c_*+delta,h_delta)) distinguishes bounded finite-head custody from sign-custody escape.

**Status:** branch-local RPB terminology.

## Relative negative-tail control

For a post-plateau negative branch with margin

```math
m(delta)
=
-Q_W^{c_*+delta}(h_delta)>0,
```

a fixed negative-coordinate cutoff (G) has **relative negative-tail control** when

```math
|(I-P_G^-)S_-^*h_delta|^2
=
o(m(delta))
qquad
(deltadownarrow0).
```

Relative negative-tail control, unlike an absolute uniform tail bound, is sufficient to preserve the strict negative sign in one fixed finite packet arbitrarily close to the plateau edge.

**Status:** branch-local RPB terminology.


## Selected crossing support

Fix a finite selected zero packet (Pi) carrying an endpoint neutral vector at support (c).

The **selected crossing support** is

```math
c_\Pi
=
\inf
\left\{
a\ge c:
\mathcal A_{\Pi,a}
\text{ contains a strictly }J\text{-negative vector}
\right\},
```

with (c_\Pi=+\infty) if no such support exists.

Because the endpoint neutral vector remains in every larger selected analysis space by support monotonicity, the fixed selected packet can only remain critical/nonnegative or cross into a negative regime; it cannot become strictly positive.

**Status:** branch-local RPB terminology.


## Background screenability boundary

Fix a decomposition of the negative zero-side coefficient sector

```math
K_-
=
M_\Pi\oplus B_\Pi
```

relative to a finite selected packet (Pi).

The **background screenability boundary** is the first support at which the background-only defect

```math
D_{B,a}
=
S_{+,a}S_{+,a}^{*}
-
S_{B_\Pi,a}S_{B_\Pi,a}^{*}
```

fails to be nonnegative.

Equivalently, before this boundary the background admits a contractive Douglas screening map and may be legitimately absorbed into the residual positive budget by WD-B4.

**Status:** branch-local RPB terminology.

## Residual selected custody

A fixed finite selected sector (M_\Pi) has **residual selected custody** at support (a) when the negative background (B_\Pi) is contractively screenable and has been eliminated by WD-B4, leaving

```math
D_{\rm full,a}
=
S_{{\rm eff},a}S_{{\rm eff},a}^{*}
-
S_{M_\Pi,a}S_{M_\Pi,a}^{*}.
```

In this representation, every negative direction of the full defect is owned by the same fixed selected sector (M_\Pi) relative to the residual positive budget.

Residual selected custody is not the same as negativity of the raw selected form obtained by simply deleting the background term.

**Status:** branch-local RPB terminology.


## Background right-edge stability

Relative to a fixed finite selected packet (Pi), the unselected negative background has **background right-edge stability** at support (c) when there exists (delta>0) such that the background-only defect remains nonnegative on every strict right enlargement:

```math
D_{B,a}\succeq0
\qquad
(c\le a<c+\delta).
```

Equivalently, the background remains contractively screenable throughout some right neighborhood of (c).

Endpoint screenability

```math
D_{B,c}\succeq0
```

does not by itself imply background right-edge stability.

**Status:** branch-local RPB terminology.

## Strict background screening margin

The background has a **strict background screening margin** at support (c) when its background-only analysis space is uniformly (J)-positive, equivalently when the reduced background screening solution satisfies

```math
\|X_{B,c}\|<1.
```

A strict margin can be propagated to a right neighborhood only with an additional continuity theorem strong enough to control the background defect/reduced screening map in operator norm. Horizon 1 does not currently supply that support-parameter continuity statement.

**Status:** branch-local RPB terminology.


## Full-nullspace coverage

At a nonnegative compact-window support (c), let (A_c) be the canonical self-adjoint Weil operator and let (M_Pi) be a fixed finite selected negative sector with selected physical covariance

```math
K_M
=
S_M S_M^{*}.
```

The selected sector has **full-nullspace coverage** when

```math
ker A_c
cap
ker S_M^{*}
=
{0}.
```

Equivalently, the selected analysis map is injective on the finite-dimensional full nullspace.

For the background-only operator

```math
A_{B,c}
=
A_c+K_M,
```

full-nullspace coverage is exactly the condition that (A_{B,c}) have trivial kernel.

**Status:** branch-local RPB terminology.

## Background physical spectral gap

The background-only compact-window operator has a **background physical spectral gap** at support (c) when

```math
A_{B,c}
\succeq
\eta I
```

on (L^2(-c,c)) for some (eta>0).

Because the canonical compact-window Weil operator has discrete lower-bounded spectrum, adding a bounded finite-rank selected covariance preserves compact resolvent/discrete spectrum. At a nonnegative endpoint, full-nullspace coverage is therefore equivalent to a positive background physical spectral gap.

This is an (L^2)-spectral statement. It must not be identified with a coefficient-space contraction gap (|X_B|<1) without an explicit metric/comparison theorem.

**Status:** branch-local RPB terminology.


## Nullspace-covering selected packet

At a nonnegative compact-window support (c), let

```math
N_c=\ker A_c
```

be the finite-dimensional full Weil nullspace.

A finite selected negative packet (M_{\Pi'}\subset K_-) is a **nullspace-covering selected packet** when

```math
N_c\cap\ker S_{M_{\Pi'}}^*
=
\{0\}.
```

Equivalently, its selected negative analysis map is injective on the entire full nullspace.

A nullspace-covering packet need not coincide with the originally chosen finite-exception packet; it may be a finite enlargement.

**Status:** branch-local RPB terminology.

## Finite nullspace capture

**Finite nullspace capture** is the principle that, if the full negative analysis map

```math
S_-^*|_{N_c}:N_c\to K_-
```

is injective and (N_c) is finite dimensional, then some finite negative-coordinate projection (P_G^-) remains injective on (N_c):

```math
P_G^-S_-^*|_{N_c}
\text{ is injective}.
```

After completing the retained coordinates to the project’s symmetric zero-packet convention, they form a nullspace-covering selected packet.

**Status:** branch-local RPB terminology.


## Finite-enlarged background ground level

For a finite symmetric selected packet \(\Pi'\), define the complementary-background quadratic form at support \(a\) by

```math
Q_{B',a}(h)
=
Q_W^a(h)
+
\|S_{M_{\Pi'},a}^{*}h\|^2.
```

Its **finite-enlarged background ground level** is

```math
\lambda_{B',a}
=
\inf_{0\ne h}
\frac{Q_{B',a}(h)}{\|h\|_2^2}.
```

Equivalently, \(\lambda_{B',a}\) is the lowest spectral value of the background-only operator obtained by removing the finitely selected negative channels \(M_{\Pi'}\) from the full negative divisor.

Under the fixed-interval scaling used by Suzuki, the added selected covariance is a finite-rank bounded quadratic perturbation depending continuously on the support parameter.

**Status:** branch-local RPB terminology.


## Critical source custody

A fixed finite selected sector has **critical source custody** along a right-approaching negative branch when normalized selected analysis vectors

```math
z_n=(a_n,u_n),
\qquad
\|z_n\|=1,
\qquad
[z_n,z_n]_J<0,
```

admit, after passage to a subsequence, a limit selected coordinate

```math
u_n\to u_*\ne0
```

even though the limiting (J)-signature may be neutral:

```math
[z_n,z_n]_J\to0.
```

The nonzero (u_*) determines a fixed finite raw zero source (v_*
e0) with the canonical zero-moment law

```math
\mathbf 1^Tv_*=0.
```

Critical source custody is weaker than persistent strict-negative-ray custody: it preserves the selected arithmetic source even when the normalized negative margin collapses.

**Status:** branch-local RPB terminology.


## Source-level next-jet object

For a fixed finite nonzero selected raw source (v) with

```math
\mathbf 1^Tv=0,
```

the **source-level next-jet object** is the arithmetic package

```math
R_v(z)
=
\sum_{\rho_j\in\Pi}
\frac{v_j}{z-\rho_j},
```

```math
\mathcal F_{v,R}[\psi]
=
O\!\left(\frac{\log R}{R}\right),
```

and

```math
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
```

This object depends on the fixed source and multiplier/cutoff regime, not on how the source was produced.

It must be distinguished from the canonical branch-level interface `AZ-NEXTJET-LOC`, whose closure semantics are currently attached to WD-T37.

**Status:** branch-local RPB terminology.

## Branch contradiction datum

A **branch contradiction datum** is additional information, beyond existence of a fixed nonzero zero-moment source and its source-level next-jet representation, that makes a proposed actual-zeta next-jet estimate incompatible with the morphology branch that produced the source.

Examples include a fixed normalized negative margin, a nonzero forcing functional, a transversality lower bound, or another quantified relation whose failure excludes the branch.

The source-level next-jet object by itself is an identity/localization package and is not a contradiction datum.

**Status:** branch-local RPB terminology.


## Background Birman--Schwinger matrix

Fix a finite selected negative sector (M) and a strictly positive complementary-background operator

```math
A_{B,a}\succ0.
```

Let (S_{M,a}:M\to\mathcal H_a) be the selected physical synthesis.

The **background Birman--Schwinger matrix** is the finite-dimensional positive operator

```math
\mathsf K_a
:=
S_{M,a}^{*}
A_{B,a}^{-1}
S_{M,a}
\quad\text{on }M.
```

When the background has been eliminated by WD-B4, (mathsf K_a) equals (C_a^{*}C_a) for the Douglas reduced residual screening map (C_a).

Thus

```math
D_{\rm full,a}\succeq0
\iff
\mathsf K_a\preceq I,
```

while strict selected over-budget negativity is equivalent to

```math
\lambda_{\max}(\mathsf K_a)>1.
```

**Status:** branch-local RPB terminology.

## Inverse-background source energy

For a selected coefficient (u\in M), its **inverse-background source energy** at support (a) is

```math
\mathfrak E_a(u)
=
\langle
\mathsf K_a u,u
\rangle
-
\|u\|^2.
```

Equivalently,

```math
\mathfrak E_a(u)
=
\langle
A_{B,a}^{-1}S_{M,a}u,
S_{M,a}u
\rangle
-
\|u\|^2.
```

At a unit-gain neutral crossing this energy is zero on an endpoint singular direction; post-edge over-budget crossing means it is positive for some selected direction.

After pair-to-raw conversion, the same quadratic form may be regarded as a finite-dimensional metric on zero-moment selected raw sources.

**Status:** branch-local RPB terminology.


## Birman--Schwinger carrier caution

The branch-local background Birman--Schwinger matrix

```math
\mathsf K_a
=
\Phi_a
A_{B,a}^{-1}
\Phi_a^{*}
```

is a **canonical-physical/form-carrier** object, where (A_{B,a}) is the strictly positive compact-window background operator on the (L^2)/form realization and

```math
\Phi_a:L^2(-a,a)\to M
```

is the finite selected analysis map.

It must not be identified without an explicit intertwining theorem with a coefficient-space Douglas Gram (C_a^{*}C_a) formed in the Green-preconditioned native Problem-1 carrier.

The native zero synthesis is Hilbert--Schmidt in the (H^{-1}_L) metric, while the canonical compact-window operator is an unbounded compact-resolvent operator on (L^2). These are equivalent representations of the quadratic-form problem only after the relevant Green/metric transport is explicitly supplied.

**Status:** branch-local RPB custody rule.


## Green-congruence transport

Fix a compact support interval and the positive Dirichlet operator

```math
L=-\partial_u^2+\frac14,
\qquad
G=L^{-1}.
```

Let (H^{-1}_L) be the completion of (L^2) for

```math
\langle f,g\rangle_{-1,L}
=
\langle f,Gg\rangle_{L^2}.
```

The map

```math
U=G^{1/2}
```

extends to a unitary

```math
U:H^{-1}_L\to L^2.
```

For a canonical compact-window closed form (q_A) with operator (A), its Green-preconditioned/native realization is the form

```math
q_{\rm nat}[h]
=
q_A[Gh].
```

After transport by (U),

```math
\widetilde q_{\rm nat}[k]
=
q_A[G^{1/2}k],
```

so the transported bounded/preconditioned operator is the form congruence

```math
\widetilde D
=
G^{1/2}AG^{1/2}.
```

This is a form/metric intertwiner. It does not assert ordinary bounded similarity between (A) and (widetilde D).

**Status:** branch-local RPB terminology.

## Native inverse-form Gram

Let a strictly positive canonical background operator (A_B) have Green-preconditioned transport

```math
\widetilde D_B
=
G^{1/2}A_BG^{1/2},
```

and let (Phi:L^2\to M) be a finite selected analysis map. Put

```math
\widetilde S_M
=
G^{1/2}\Phi^{*}.
```

The **native inverse-form Gram** is the finite matrix defined by

```math
\langle \mathsf K_{\rm nat}u,u\rangle
=
\|\widetilde D_B^{-1/2}\widetilde S_Mu\|^2,
```

where the inverse is understood on its natural quadratic-form domain.

Under Green-congruence transport,

```math
\mathsf K_{\rm nat}
=
\Phi A_B^{-1}\Phi^{*}.
```

Although (widetilde D_B) is compact and not boundedly invertible on an infinite-dimensional carrier, this finite sandwich is bounded whenever (A_B\succ0).

**Status:** branch-local RPB terminology.


## Resolvent extremizer

For a strictly positive complementary-background operator (A_{B,a}), finite selected analysis map (Phi_a), and selected coefficient (u), the **resolvent extremizer** is

```math
h_{a,u}
=
A_{B,a}^{-1}Phi_a^{*}u.
```

It is the unique physical vector representing the Riesz extremizer for the inverse-background source energy:

```math
\langle
\Phi_aA_{B,a}^{-1}\Phi_a^{*}u,u
\rangle
=
\langle
\Phi_a^{*}u,h_{a,u}
\rangle
=
Q_{B,a}[h_{a,u}].
```

If (u) is an eigenvector of the Birman--Schwinger matrix with eigenvalue (kappa), then

```math
\Phi_a h_{a,u}
=
\kappa u.
```

**Status:** branch-local RPB terminology.

## Support-decoupling obstruction

The **support-decoupling obstruction** is the mismatch that a fixed raw selected source (v) determines the meromorphic reciprocal-Cauchy response

```math
R_v(\mu)
=
\sum_j
\frac{v_j}{\mu-\rho_j},
```

independently of the compact-window support parameter (a), while the inverse-background Gram

```math
\mathsf K_a
=
\Phi_aA_{B,a}^{-1}\Phi_a^{*}
```

is intrinsically support-dependent and may cross the unit threshold as (a) varies.

Therefore the bare source-level Cauchy response cannot by itself encode the support crossing. Any bridge must introduce additional support-dependent data, such as a resolvent extremizer, dual multiplier, or reproducing kernel.

**Status:** branch-local RPB terminology.


## Resolvent multiplier candidate

For a compact-window resolvent extremizer

```math
h_{a,u}
=
A_{B,a}^{-1}\Phi_a^{*}u,
```

the **resolvent multiplier candidate** is its centered bilateral Laplace transform

```math
\psi_{a,u}^{\rm res}(s)
=
\int_{-a}^{a}
h_{a,u}(x)
e^{x(s-1/2)}
\,dx.
```

On any bounded support neighborhood and the closed critical strip

```math
0\le\Re s\le1,
```

a uniform (L^2) bound on (h_{a,u}) gives a uniform strip bound on
(psi_{a,u}^{\rm res}).

The selected zero evaluations of this transform recover the selected analysis
coordinates of (h_{a,u}), up to the fixed raw/pair normalization convention.

**Status:** branch-local RPB terminology.

## Selected-preserving projection of a multiplier family

Let (\mathcal C_v) be the selected contracted-residue functional for a fixed
source (v), and let (\chi) be a fixed admissible multiplier with

```math
\mathcal C_v[\chi]\ne0.
```

For any multiplier family (\phi_a), its **selected-preserving projection
relative to (\chi)** is

```math
\Pi_v^{\chi}\phi_a
=
\phi_a
-
\frac{\mathcal C_v[\phi_a]}
{\mathcal C_v[\chi]}
\chi.
```

Then

```math
\mathcal C_v[
\Pi_v^{\chi}\phi_a
]
=
0.
```

Uniform boundedness of the projected family requires uniform boundedness of
both (\phi_a) and the scalar ratios
(\mathcal C_v[\phi_a]/\mathcal C_v[\chi]).

**Status:** branch-local RPB terminology.

## Scalar crossing-custody gap

The **scalar crossing-custody gap** is the unresolved step of proving that a
support-dependent multiplier derived from the resolvent extremizer carries the
Birman--Schwinger over-budget datum

```math
\kappa_a-1
```

through the scalar selected-contraction / explicit-formula normalization.

Horizon 1 treats (\mathcal C_v) abstractly and does not identify it with the
Hermitian selected-coordinate pairing. Therefore the vector identity

```math
\Phi_a h_{a,u_a}
=
\kappa_a u_a
```

does not, by itself, give a certified scalar identity involving
(\mathcal C_v[\psi_{a,u_a}^{\rm res}]).

**Status:** branch-local RPB terminology.


## Logarithmic support modulus

After scaling compact-window support to a fixed interval, a prime translation
with delay \(\ell=\log n\) contributes a Fourier multiplier of the form

```math
m_{\ell,a}(\xi)
=
\cos\!\left(
\frac{\ell\xi}{a}
\right).
```

For nearby supports \(a,b\) in a compact positive interval,

```math
|m_{\ell,a}(\xi)-m_{\ell,b}(\xi)|
\lesssim
\min\!\left(
1,
|a-b|\,|\xi|
\right).
```

Relative to the logarithmic form weight
\(\log(e+|\xi|)\), the resulting operator/form modulus is of order

```math
\omega_{\log}(r)
=
\frac{1}{
\log(e+r^{-1})
}.
```

This is the **logarithmic support modulus**. It tends to zero but is weaker
than every positive power \(r^\alpha\).

**Status:** branch-local RPB terminology.

## Crossing-normalized first-variation gap

Let \(\kappa_a>1\) denote the post-edge Birman--Schwinger top eigenvalue
with \(\kappa_a\to1\) as \(a\downarrow c_*\), and let
\(\psi_a^{\rm sp}\) be a selected-preserving support-dependent multiplier.

The **crossing-normalized first-variation gap** is the missing control needed
to make sense of, or extract a nonzero limit from,

```math
\frac{
\psi_a^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}{
\kappa_a-1
}.
```

Continuity of numerator and denominator separately is insufficient. A closure
requires a quantitative comparison of their vanishing orders, supplied for
example by differentiability plus a nonzero transversality derivative, or by
another two-sided modulus theorem.

**Status:** branch-local RPB terminology.


## Half-Sobolev boundary obstruction

For a compactly supported function (h) on an interval, the **half-Sobolev
boundary obstruction** is the failure of its zero extension to belong to
(H^{1/2}(\mathbb R)).

A sufficient diagnostic near a boundary point is

```math
\int_0^\varepsilon
\frac{|h(c-r)|^2}{r}\,dr
=
\infty.
```

Indeed this integral is contained, up to constants, in the cross-boundary part
of the (H^{1/2}) Gagliardo seminorm of the zero extension.

For logarithmic Dirichlet problems, the optimal model boundary scale

```math
|h(c-r)|
\asymp
\frac1{\sqrt{\log(1/r)}}
```

produces precisely such divergence.

**Status:** branch-local RPB terminology.

## Selected boundary-cancellation obligation

The **selected boundary-cancellation obligation** is the additional statement
needed to show that the special resolvent extremizers

```math
h_{a,u}
=
A_{B,a}^{-1}\Phi_a^*u
```

avoid the generic logarithmic Dirichlet boundary layer strongly enough to lie
uniformly in (H^{1/2}), or in another regularity class sufficient for support
differentiation.

Smoothness of the finite selected forcing (\Phi_a^*u) alone does not satisfy
this obligation.

**Status:** branch-local RPB terminology.


## Selected half-Sobolev regularity kernel

For a fixed support (a) with strictly positive complementary-background
operator (A_{B,a}), let

```math
h_{a,u}
=
A_{B,a}^{-1}\Phi_a^{*}u,
\qquad
u\in M.
```

The **selected half-Sobolev regularity kernel** is

```math
\mathcal R_{1/2}(a)
:=
\left\{
u\in M:
\widetilde h_{a,u}
\in
H^{1/2}(\mathbb R)
\right\},
```

where (\widetilde h_{a,u}) is the zero extension outside the support
interval.

Because (u\mapsto h_{a,u}) is linear and (H^{1/2}) is a vector space,
(\mathcal R_{1/2}(a)) is a linear subspace of the finite selected sector.

This definition avoids assuming that a pointwise logarithmic boundary
coefficient exists.

**Status:** branch-local RPB terminology.

## Boundary-coefficient existence gap

The **boundary-coefficient existence gap** is the missing theorem required to
replace sharp logarithmic boundary bounds

```math
|h(x)|
\lesssim
\ell^{1/2}(\operatorname{dist}(x,\partial I))
```

and Hopf-type positive lower bounds by a genuine signed/complex asymptotic

```math
h(a-r)
=
\mathfrak b^{+}(h)\,
\ell^{1/2}(r)
+
o(\ell^{1/2}(r)),
```

and similarly at the left endpoint.

Existing logarithmic-Laplacian boundary regularity does not by itself provide
such a linear coefficient map for arbitrary signed/complex solutions, and no
such theorem is presently established for the finite-enlarged Weil background
operator.

**Status:** branch-local RPB terminology.


## Neutral-resolvent isomorphism

At a support where the complementary-background operator (A_B) is strictly
positive, let

```math
\mathsf K
=
\Phi A_B^{-1}\Phi^*
```

on the finite selected sector (M), and let

```math
A_{\rm full}
=
A_B-\Phi^*\Phi.
```

The **neutral-resolvent isomorphism** is the bijection

```math
J:
\ker(\mathsf K-I)
\longrightarrow
\ker A_{\rm full},
\qquad
J(u)=A_B^{-1}\Phi^*u,
```

with inverse

```math
J^{-1}(h)=\Phi h.
```

Thus selected unit-gain multiplicity equals full physical nullity whenever the
background is strictly positive.

**Status:** branch-local RPB terminology.

## Half-Sobolev neutral nullspace

For a compact-window full operator (A_{\rm full}), define the
**half-Sobolev neutral nullspace**

```math
N^{1/2}
=
\left\{
h\in\ker A_{\rm full}:
\widetilde h\in H^{1/2}(\mathbb R)
\right\}.
```

Under the neutral-resolvent isomorphism,

```math
J\left(
\ker(\mathsf K-I)
\cap
\mathcal R_{1/2}
\right)
=
N^{1/2}.
```

Hence the selected regularity-intersection problem is exactly the physical
regularity problem for neutral null modes.

**Status:** branch-local RPB terminology.
