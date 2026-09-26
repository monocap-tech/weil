# Zeta-Weil Specialization Map
**H1-P2.0 — Mapping the Weil problem onto the abstract defect calculus**

This document performs the first operation of H1-P2:

```math
\boxed{
\text{map first, strengthen second}.
}
```

No new arithmetic theorem is claimed merely because an old zeta-Weil object has been renamed in the H1-P1 language.

The purpose is to identify exactly:

1. which parts of the Weil machinery are instances of the abstract defect calculus;
2. which parts are stronger because of conjugate-pair / zeta-divisor geometry;
3. which parts genuinely begin on the prime/pole/archimedean side.

---

## 1. Three specialization layers

The zeta-facing theory separates naturally into three layers.

### ZW-0 — Weil/Krein pair geometry

This layer uses:

- the zero-side Weil form;
- conjugate-pair diagonalization;
- positive and negative Krein channels;
- finite negative-index structure;
- compact-support/window synthesis.

It does **not** yet require the prime side of the explicit formula.

### ZW-1 — Zeta-divisor structure

This layer additionally uses:

- functional-equation/conjugation symmetry of the zeta divisor;
- selected finite packets;
- actual zero distribution/counting;
- the antisymmetric raw residue structure;
- compact/high-height decay of actual zero channels.

This is where the zero-moment law appears.

### ZW-2 — Explicit-formula arithmetic

This layer uses the alternate prime/pole/archimedean representation of the same Weil form:

- prime powers;
- pole terms;
- archimedean terms;
- completed $\Xi$ lifts;
- weighted complementary next jets;
- compact-window finite translation operators.

The distinction matters because

```math
\boxed{
\text{prime/pole/archimedean terms are not additional }K_{+}\text{ screening coordinates}.
}
```

They are an arithmetic representation of the same Weil quadratic form, not extra positive coefficient channels to be added to the zero-side budget.

---

## 2. Canonical pair coordinates

Let a nonreal ordinate pair in Bombieri's zero coordinate be

```math
\gamma_D=T_D+i\delta_D,
\qquad
\overline{\gamma_D}=T_D-i\delta_D.
```

In the raw coefficient basis let

```math
e_{\gamma_D},
\qquad
e_{\overline{\gamma_D}}.
```

Define

```math
\boxed{
p_D
=
\frac{e_{\gamma_D}+e_{\overline{\gamma_D}}}{\sqrt2},
\qquad
n_D
=
\frac{e_{\gamma_D}-e_{\overline{\gamma_D}}}{\sqrt2}.
}
```

Then the coefficient-space fundamental symmetry is diagonal:

```math
\boxed{
Jp_D=p_D,
\qquad
Jn_D=-n_D.
}
```

Critical-line ordinates contribute only positive zero-side coordinates.

Thus the full zero-side coefficient space has the canonical decomposition

```math
\boxed{
K_{+}
=
K_{\rm crit}
\oplus
K_{{\rm off},+},
\qquad
K_{-}
=
K_{{\rm off},-}.
}
```

This is the zeta-Weil realization of the H1-P1 coefficient decomposition

```math
K=K_{+}\oplus K_{-}.
```

### Physical meaning

Up to the common Bombieri/Green weighting, one conjugate pair synthesizes the two physical shapes

```math
g_D^+(u)
=
\sqrt2\,e^{-iT_Du}\cosh(\delta_Du),
```

and

```math
g_D^-(u)
=
\sqrt2\,e^{-iT_Du}\sinh(\delta_Du).
```

The $+$ channel is symmetric across the transverse pair; the $-$ channel is antisymmetric.

**Standing:** specialization map; pair formulas retained from the zero-side Weil decomposition.

---

## 3. Mapping table

| H1-P1 object | Zeta-Weil realization | Standing after mapping |
| --- | --- | --- |
| physical Hilbert carrier $\mathcal H$ | compact-window/Bombieri physical carrier at support $t$, embedded into a common larger carrier when limits are taken | specialization |
| $K_{+}$ | critical-line zero coordinates plus every positive off-axis pair direction $p_D$ | specialization |
| $K_{-}$ | negative off-axis pair directions $n_D$ | specialization |
| $S_{+}$ | synthesis of critical-line positives and all $p_D$ channels | specialization |
| $S_{-}$ | synthesis of all $n_D$ channels | specialization |
| $D=S_{+}S_{+}^{*}-S_{-}S_{-}^{*}$ | zero-side compact-window Weil defect/operator | specialization |
| $M\subset K_{-}$ | selected finite packet $\Pi$'s negative channels | specialization |
| $B=M^\perp\cap K_{-}$ | unselected off-axis negative divisor | specialization |
| $D_M$ | selected signed zero-side form $Q_{\Pi,t}$ in physical coordinates | specialization |
| full $D$ | full zero-side Weil form $Q_W$ | specialization |
| $\mathcal A_t=(\ker E_t)^\perp$ | selected/full Weil analysis space at support $t$ | specialization |
| $\mathcal A_{c+}$ | right-support persistent coefficient space | specialization |
| $\mathcal J_c$ | endpoint coefficient jump / persistent defect space | specialization |
| reduced screening map $X$ | minimum positive compensator for selected negative channels | specialization |
| shared unit budget | global Krein contraction budget across critical and positive off-axis helpers | specialization |
| residual budget $R_B$ | positive covariance remaining after legitimate background elimination | specialization |
| shorted covariance | endpoint Green/Picard covariance after the complementary physical field is optimized away | specialization |
| rank-one defect | one selected residual negative channel after all prior positive/background elimination | specialization |
| moving-sector escape | selected packet changes with height/index rather than remaining one fixed $\Pi$ | specialization |

---

## 4. The full positive channel is larger than the critical-line channel

A selected negative cell $C$ does not screen only against critical-line zeros.

In one parity/reality sector the positive coefficient space decomposes as

```math
\boxed{
K_{+}
=
K_{\rm crit}
\oplus
\mathbb Cp_C
\oplus
K_{{\rm off},+}^{\ne C}.
}
```

The exact selected-cell kernel equation has the form

```math
\boxed{
S_{\rm crit}x_{\rm crit}
+
a\,g_C^+
+
S_{{\rm off},+}x_{\rm off}
=
-g_C^-.
}
```

Therefore the abstract $S_{+}$ of H1-P1 must include:

1. the critical-line channel;
2. the selected cell's own positive partner;
3. positive directions from every other off-axis pair.

This is required by WD-B3: all positive helpers consume the **same** screening budget.

### Consequence

The statement

> “the selected negative cell is screened by the critical-line field”

is a further reduction, not the raw zero-side problem.

It becomes legitimate only after the remaining positive off-axis channels have been eliminated, bounded, or incorporated into an effective positive synthesis.

---

## 5. Selected packet and negative background

Fix a finite selected packet $\Pi$.

Let

```math
M_\Pi\subset K_{-}
```

be the span of its negative pair channels.

Then

```math
\boxed{
\dim M_\Pi<\infty.
}
```

The remaining negative channels form

```math
B_\Pi
=
M_\Pi^\perp\cap K_{-}.
```

For a physical test $h$,

```math
Q_{\Pi,t}(h)
=
\|S_{+,t}^{*}h\|^2
-
\|S_{M_\Pi,t}^{*}h\|^2,
```

while the full zero-side Weil form is

```math
\boxed{
Q_W(h)
=
Q_{\Pi,t}(h)
-
\|S_{B_\Pi,t}^{*}h\|^2.
}
```

This is exactly WD-B1.

Hence

```math
\boxed{
Q_{\Pi,t}(h)<0
\Longrightarrow
Q_W(h)<0.
}
```

But the converse need not preserve packet custody.

A negative full Weil value can be carried partly or entirely by unselected off-axis background.

**Standing:** direct specialization of WD-B1.

---

## 6. Bombieri's finite negative index is stronger than the abstract index cap

WD-B2 gives only

```math
\operatorname{ind}_{-}(D_{M_\Pi})
\le
\dim M_\Pi.
```

Bombieri's finite-set theorem supplies a stronger zero-side statement: for a finite symmetric zero set, the number of negative directions equals the number of nonreal conjugate pairs.

Thus the zeta-Weil finite matrix saturates the abstract finite-sector capacity in the canonical pair coordinates.

For the previously studied two-quartet configuration,

```math
\operatorname{ind}_{-}=4,
```

with the corresponding even/odd split.

This exact count is **not** a theorem of the abstract calculus.

It is an imported Weil-specific strengthening.

---

## 7. Spectral screening is WD-A6 in zeta coordinates

Let $P_N$ restore increasing collections of positive zero-side channels.

The finite defect operators have the form

```math
D_N
=
S_{+}P_NS_{+}^{*}
-
S_{-}S_{-}^{*}.
```

By WD-A6,

```math
D_N\uparrow D
```

in the Loewner/strong sense and

```math
\operatorname{ind}_{-}(D_N)
```

is nonincreasing.

Thus the Bombieri phenomenon

```math
\lambda^-_{N,k}<0
\quad\text{for all finite }N,
\qquad
\lambda^-_{N,k}\uparrow0
```

is an instance of generic positive-channel spectral screening.

### What is Weil-specific?

The abstract theorem permits this behavior.

The Weil problem supplies:

- the canonical zero channels;
- the finite negative-index count;
- the actual positive-channel ordering/truncation;
- the analytic question of whether screening reaches zero at a given support.

---

## 8. The rank-one cell defect is a composite specialization

The selected-cell rank-one operator

```math
\boxed{
\mathcal K_C(t)
=
\widetilde S_t\widetilde S_t^{*}
-
\widetilde g_C\otimes\widetilde g_C
}
```

should not be identified directly with the raw full Weil operator.

It appears **after** a sequence of eliminations:

1. choose a selected negative cell;
2. optimize/eliminate permitted positive partner/background channels;
3. short the complementary positive physical covariance when necessary;
4. retain the residual selected negative source.

Abstractly this composes:

```math
\boxed{
\text{WD-B4}
+
\text{WD-B7}
+
\text{WD-A5}.
}
```

Thus

```math
\widetilde S_t
```

is an **effective** positive synthesis and

```math
\widetilde g_C
```

is the residual one-dimensional negative source.

This explains why the rank-one defect was discovered only after substantial screening/Schur work: it is a terminal normal form, not the original zero-side decomposition.

---

## 9. Support filtration and persistent packet geometry

For a fixed finite packet $\Pi$, let

```math
\mathcal A_{\Pi,t}
```

be the corresponding selected analysis space at support $t$.

As the support window expands,

```math
s<t
\Longrightarrow
\mathcal A_{\Pi,s}
\subseteq
\mathcal A_{\Pi,t}.
```

Define

```math
\boxed{
\mathcal A_{\Pi,c+}
=
\bigcap_{t>c}
\mathcal A_{\Pi,t}.
}
```

A persistent coefficient ray is precisely a vector in this right-limit space.

If the endpoint space

```math
\mathcal A_{\Pi,c}
```

is $J$-nonnegative and a right-approaching sequence has a uniform negative margin, WD-C5 gives

```math
\boxed{
0\ne y\in
\mathcal A_{\Pi,c+}
\setminus
\mathcal A_{\Pi,c}
}
```

with the same or stronger negative margin.

This is the abstract carrier of the persistent-negative-ray branch.

---

## 10. Fixed-packet criticality has no third nonpersistent branch

This is the most useful immediate consequence of the H1-P1 mapping.

The selected packet $\Pi$ is finite, so

```math
\dim M_\Pi<\infty.
```

Therefore WD-C3 and WD-C4 apply.

Suppose

```math
t_n\downarrow c
```

and

```math
y_n\in\mathcal A_{\Pi,t_n},
\qquad
\|y_n\|=1,
\qquad
[y_n,y_n]_J\to0.
```

Then after passing to a subsequence there is

```math
0\ne y\in\mathcal A_{\Pi,c+}
```

with

```math
[y,y]_J\le0.
```

Hence exactly one of the following occurs:

1. $y$ is neutral;
2. $y$ is strictly negative because positive coefficient mass is lost.

Therefore

```math
\boxed{
\text{fixed finite packet}
\Longrightarrow
\text{critical right-approach produces an actual nonpositive persistent ray}.
}
```

The abstract non-attained approximate-neutral morphology cannot survive as a third fixed-packet branch.

### Where can it still occur?

Only through a noncompactness mechanism outside one fixed packet, such as:

- a selected packet moving with height/index;
- an infinite selected negative sector;
- negative-background mass escaping through infinitely many unselected channels.

This is a **derived specialization consequence** of H1-P1, not a new arithmetic theorem.

---

## 11. Representative blow-up is abstract, not arithmetic

Suppose a new persistent ray satisfies

```math
y\in
\mathcal A_{\Pi,c+}
\setminus
\mathcal A_{\Pi,c}.
```

When the support filtration is realized by nested physical test spaces and a common bounded analysis map, WD-C7 gives:

```math
\boxed{
\text{every physical representation of }y
\text{ approaching the endpoint has norm }\to\infty.
}
```

The familiar normalization

```math
\mathcal E_{\Pi,t_n}^{*}g_n
=
\varepsilon_n z_n,
\qquad
\varepsilon_n\to0,
\qquad
z_n\to y
```

therefore produces

```math
h_n
=
\varepsilon_n^{-1}g_n,
```

with

```math
\|h_n\|
=
\varepsilon_n^{-1}
\to\infty.
```

Nothing in this blow-up mechanism is specifically arithmetic.

The arithmetic problem begins when one asks what additional identities the zeta-selected coordinate $u$ must satisfy.

---

## 12. Full-divisor background is WD-B1 plus an infinite-sector compactness problem

For a persistent selected ray, normalize the unselected negative response as

```math
b_n
=
\frac{S_{B_\Pi,t_n}^{*}g_n}{\varepsilon_n}.
```

Then

```math
\boxed{
\frac{Q_W(g_n)}{\varepsilon_n^2}
=
[z_n,z_n]_J
-
\|b_n\|^2.
}
```

This is the normalized form of WD-B1.

The subsequent alternatives are not new sign algebra:

- $\|b_n\|\to\infty$;
- bounded $b_n$ with coefficient mass escaping to infinity;
- coefficient-tail-tight $b_n\to b$.

They are compactness alternatives in the infinite negative background $B_\Pi$.

Thus the “background escape” branch is the zeta realization of the **infinite-background noncompactness** side of the abstract H1-P1 classification. It is distinct from moving selected-sector escape.

---

## 13. The zero-moment law is genuinely new specialization structure

Let

```math
u\in M_\Pi
```

be a selected negative coefficient vector.

Convert $u$ back to raw zero residues $v$ through the canonical pair unitary.

Because every negative pair channel is antisymmetric,

```math
\boxed{
\mathbf{1}^Tv=0.
}
```

For

```math
R_v(s)
=
\sum_{\rho_j\in\Pi}
\frac{v_j}{s-\rho_j},
```

the leading $s^{-1}$ term cancels, so

```math
\boxed{
R_v(s)=O(|s|^{-2}).
}
```

This statement has **no H1-P1 analogue**.

It uses the canonical conjugate-pair realization of the selected negative sector.

It is therefore the first clean new structural theorem belonging to ZW-1 rather than generic defect calculus.

### Scope

Persistence does not force

```math
\sum_j\rho_jv_j=0.
```

So the generic zeta-Weil gain stops at inverse-square decay unless additional arithmetic information is supplied.

---

## 14. Other zeta-specific strengthening already present in the corpus

The prior traversal contains additional structure that is not generic H1-P1 theory.

### Off-axis positive helper compactness

Bombieri's weighted synthesis estimates plus zero counting give high-height decay of the off-axis positive helper columns.

In the retained formulation,

```math
S_{{\rm off},+}
```

is Hilbert-Schmidt on the relevant window, with high-height tails tending to zero in operator norm.

This is a ZW-1 compactness input.

### Auxiliary critical-line sampling/completeness information

The project retains sampling/completeness information for suitable **unweighted** critical-line/mirror exponential families. This information is metric-typed: it is not a native Problem-1 lower-frame or coercivity statement, and it does not transfer to the native synthesis without an explicit comparison theorem.

It is therefore auxiliary ZW-1 structure rather than an additional native screening budget.

### Finite exponential independence

The selected pair's positive direction cannot by itself reproduce its negative direction, and no finite set of distinct positive-frequency exponentials gives an exact interval cancellation of the normalized selected negative source.

This is a Weil/exponential-geometry input, not generic defect theory.

These statements should be normalized in H1-P2.1.

---

## 15. Explicit-formula arithmetic begins only after the zero-side mapping

The prime/pole/archimedean side evaluates the same full Weil form.

For a selected zero-moment source $v$, the scalar explicit formula can be arranged in the schematic form

```math
\mathcal C_v[\psi]
+
\mathcal N_v[\psi]
+
\mathcal F_v[\psi]
=
\mathcal P_v[\psi]
+
\mathcal A_v[\psi].
```

After a selected-preserving choice with

```math
\mathcal C_v[\psi]=0,
```

the surviving finite/intermediate complementary divisor field is

```math
\mathcal N_v[\psi].
```

With the completed lift

```math
H_v=\Xi R_v,
```

it becomes

```math
\boxed{
\mathcal N_v[\psi]
=
\sum_{\mu\notin\Pi}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
}
```

This is the **weighted next-jet field**.

Nothing in H1-P1 produces this formula.

It belongs to ZW-2.

---

## 16. Neutral compact-window branch: abstract carrier versus arithmetic content

Let

```math
W_c
=
P_cP_c^{*}
-
N_cN_c^{*}
```

be the compact-window physical defect operator.

Suppose the endpoint problem is nonnegative:

```math
W_c\succeq0.
```

If an attained critical analysis vector is represented by $k$, then

```math
\langle W_ck,k\rangle=0.
```

Positivity implies

```math
\boxed{
W_ck=0.
}
```

Thus the passage

```math
\text{attained neutral coefficient vector}
\Longrightarrow
\text{physical null mode}
```

is abstract positive-operator geometry.

What is genuinely ZW-2 is the explicit operator representation

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

and the symbol asymptotic

```math
\Psi_c(t)=\log|t|+O_c(1).
```

The finite prime translations and logarithmic archimedean order are arithmetic/explicit-formula data, not consequences of neutral persistence alone.

---

## 17. Specialization matrix: abstract versus new structure

| Result | Abstract H1-P1 carrier | Genuinely new zeta/Weil content? |
| --- | --- | --- |
| finite-to-infinite spectral screening | WD-A6, WD-C1 | channel realization and exact finite index |
| selected/full negativity relation | WD-B1 | identity of selected packet and actual divisor background |
| shared helper budget | WD-B3 | actual critical/off-axis channel geometry |
| background elimination | WD-B4 | actual zeta background may or may not satisfy hypotheses |
| rank-one terminal defect | WD-B4 + WD-B7 + WD-A5 | identification of the residual cell source |
| persistent negative ray | WD-C5 | selected packet identity |
| representative blow-up | WD-C7/C9 | no |
| approximate-neutral fixed-packet closure | WD-C3/C4 | no; derived specialization |
| background escape | infinite-background noncompactness after selected anchoring | actual unselected divisor |
| zero-moment law | none | **YES** |
| $O(z^{-2})$ selected response | none beyond algebraic consequence of zero moment | **YES** |
| off-axis helper Hilbert-Schmidt decay | none | **YES** |
| auxiliary unweighted critical-line sampling/completeness | none | **YES, metric-typed; not native coercivity** |
| weighted completed $\Xi$ next jet | none | **YES — ZW-2** |
| compact-window finite prime shifts | none | **YES — ZW-2** |
| logarithmic principal symbol | none | **YES — ZW-2** |

---

## 18. H1-P2.0 determination

The specialization map is complete enough to freeze the boundary between generic defect theory and zeta-Weil structure.

The main conclusions are:

### 1. Most screening machinery is not arithmetic

The following are now recognized as H1-P1 instances:

- negative-index transfer;
- Douglas screening;
- shared unit budget;
- background elimination;
- rank-one residual defect;
- shorted covariance;
- support filtration;
- right-limit persistence;
- representative blow-up.

### 2. The fixed-packet morphology simplifies

For one fixed finite selected packet,

```math
\boxed{
\text{critical/negative right-approach}
\Longrightarrow
\text{actual nonpositive persistent ray}.
}
```

So P3 does not need a third nonpersistent approximate-neutral morphology **inside a fixed packet**.

Any such global behavior must be typed as moving/infinite selected-sector noncompactness or as infinite-background noncompactness.

### 3. The first genuinely new zeta-Weil identity is the zero moment

```math
\boxed{
\mathbf{1}^Tv=0
}
```

and therefore

```math
\boxed{
R_v(z)=O(|z|^{-2}).
}
```

This comes from conjugate-pair antisymmetry.

### 4. Prime arithmetic begins later

The weighted next jet, finite prime translations, and logarithmic archimedean operator are ZW-2 structures obtained only after invoking the explicit formula.

---

## Historical handoff from H1-P2.0

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P2.1 / QUARTET CHANNEL AND RESIDUE STRUCTURE}
}
```

At the close of H1-P2.0, the next pass was assigned to normalize and prove the ZW-0/ZW-1 statements genuinely stronger than H1-P1:

1. canonical pair diagonalization and quartet multiplicities;
2. exact finite negative-index specialization;
3. finite exponential independence of selected positive/negative channels;
4. zero-moment residue theorem and optimal far-decay order;
5. off-axis positive helper compactness;
6. critical-line positive-channel completeness inputs.

Only after that should H1-P2.2 normalize the prime/pole/archimedean explicit-formula layer.
