# Research Map

## Current horizon

The canonical phase plan is [Horizon 1 — Independent Weil-Defect Theory](HORIZON_1.md).

```math
\boxed{
\begin{array}{ll}
\textbf{H1-P0} & \text{Consolidation and custody}\\
\textbf{H1-P1} & \text{Abstract defect calculus}\\
\textbf{H1-P2} & \text{Zeta-Weil specialization}\\
\textbf{H1-P3} & \text{Defect morphology theorem}\\
\textbf{H1-P4} & \text{Proof audit and theorem normalization}\\
\textbf{H1-P5} & \text{Public mathematical package}
\end{array}
}
```

Current position:

```math
\boxed{
\text{H1-P0 COMPLETE}
\qquad
\text{H1-P1 COMPLETE}
\qquad
\text{H1-P2 COMPLETE}
\qquad
\text{H1-P3 COMPLETE}
\qquad
\text{H1-P4 COMPLETE}
\qquad
\text{LEAN-H1 EXHAUSTED}
\qquad
\text{H1-P5 COMPLETE}\\
\qquad
\text{HORIZON 1 COMPLETE}.
}
```

The RH-facing statements at the bottom of this map are **interfaces out of Horizon 1**, not Horizon-1 completion requirements.

---

## H1-P1 abstract core

### 1. Defect operator and screening

For

```math
E(x,u)=S_{+}x+S_{-}u
```

and

```math
\mathcal A=(\ker E)^\perp,
```

define

```math
\boxed{
D=S_{+}S_{+}^{*}-S_{-}S_{-}^{*}.
}
```

Then

```math
\boxed{
\mathcal A\text{ is }J\text{-nonnegative}
\iff
D\succeq0
\iff
S_{-}=-S_{+}X
\text{ for a contraction }X.
}
```

When exact range inclusion holds, the Douglas reduced solution gives

```math
\boxed{
\mathcal A=\operatorname{graph}(-X^{*}).
}
```

See [Abstract Defect Calculus](ABSTRACT_DEFECT_CALCULUS.md).

### 2. Selected/background transfer

For a selected finite negative sector $M$ and negative background $B$,

```math
D_{\rm full}
=
D_M-S_BS_B^{*}.
```

Selected negativity survives aggregation, but aggregate negativity does not preserve selected-sector custody.

If the background is contractively screened with reduced map $X_B$, define

```math
R_B=I-X_BX_B^{*}
```

and

```math
S_{\rm eff}=S_{+}R_B^{1/2}.
```

Then the selected problem re-enters the same calculus:

```math
\boxed{
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^{*}
-
S_MS_M^{*}.
}
```

For fixed finite $M$, the reduced residual screening map $Y$ satisfies

```math
\boxed{
\operatorname{ind}_{-}
=
\#\{j:\sigma_j(Y)>1\},
}
```

and

```math
\boxed{
\operatorname{nul}_J
=
\#\{j:\sigma_j(Y)=1\}.
}
```

See [Restricted-Channel Transfer](RESTRICTED_CHANNEL_TRANSFER.md).

### 3. Support filtration and persistence

For a monotone family

```math
\mathcal A_s\subseteq\mathcal A_t
\qquad(s<t),
```

the right-limit space is

```math
\boxed{
\mathcal A_{c+}
=
\bigcap_{t>c}\mathcal A_t.
}
```

Its endpoint jump is

```math
\boxed{
\mathcal J_c
=
\mathcal A_{c+}\ominus\mathcal A_c.
}
```

With a fixed finite negative sector, any normalized right-approaching sequence with

```math
[y_n,y_n]_J\to q_*\le0
```

has a nonzero right-limit vector

```math
y\in\mathcal A_{c+}
```

satisfying

```math
[y,y]_J\le q_*.
```

At criticality, either:

- the positive coordinates converge strongly and $y$ is neutral; or
- positive coefficient mass is lost and $y$ becomes strictly negative.

Thus non-attained approximate neutrality without persistence requires an infinite or moving negative-sector mechanism.

Under a bounded physical realization, every genuinely new endpoint vector has diverging representation cost.

See [Support Filtration and Persistence Limits](SUPPORT_FILTRATION_PERSISTENCE.md).

---

## Abstract screening taxonomy

```math
\boxed{
\begin{array}{ccl}
\operatorname{Ran}S_{-}\not\subseteq\operatorname{Ran}S_{+}
&\Rightarrow&
\text{range-defect negativity},\\
\operatorname{Ran}S_{-}\subseteq\operatorname{Ran}S_{+},\ \|X\|>1
&\Rightarrow&
\text{over-budget negativity},\\
\|X\|<1
&\Rightarrow&
\text{uniform positive screening},\\
\|X\|=1\text{ attained}
&\Rightarrow&
\text{neutral mode},\\
\|X\|=1\text{ not attained}
&\Rightarrow&
\text{approximate-neutral boundary}.
\end{array}
}
```

H1-P1.2 refines the last line:

```math
\boxed{
\text{fixed finite selected sector}
+
\text{right-approach}
\Longrightarrow
\text{actual nonpositive right-limit ray}.
}
```

Hence the genuinely nonpersistent approximate-neutral case belongs to moving/infinite-sector noncompactness.

---

## Zeta-Weil branches already identified

The prior zeta traversal produced two arithmetic-facing branches that H1-P2 subsequently attached to the abstract carriers.

### Negative-persistence branch

```math
\boxed{
\text{persistent negative ray}
\Longrightarrow
\mathbf{1}^Tv=0
\Longrightarrow
R_v(z)=O(|z|^{-2})
\Longrightarrow
\text{weighted near next-jet field}.
}
```

The surviving arithmetic object is

```math
\mathcal N_v[\psi]
=
\sum_{\mu\notin F}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
```

### Neutral branch

```math
\boxed{
\text{neutral persistence}
\Longrightarrow
W_ck=0.
}
```

At fixed support,

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

with principal symbol

```math
\Psi_c(t)=\log|t|+O_c(1).
```

### Approximate-neutral classification

The completed H1-P2/H1-P3 audit separates failure of attained neutrality into two different outcomes:

- **fixed-packet negative fall-through:** positive-coordinate mass loss produces a strictly negative persistent right-limit ray;
- **genuine noncompact escape:** selected-sector nonpersistence requires a moving/infinite selected sector, while an infinite unselected background can separately fail strong compactness after a selected ray has already been anchored.

These mechanisms are not interchangeable: background escape does not erase fixed selected custody, and positive-coordinate mass loss is a persistence mechanism rather than an escape mechanism.

---

## Three layers

### A. General defect structure — COMPLETE

- defect operator and negative-index transfer;
- Douglas screening;
- rank-one specialization;
- shared screening budgets;
- background elimination;
- finite-sector singular-value inertia;
- shorted covariance;
- support filtration;
- endpoint jumps;
- persistent-ray compactness;
- representative blow-up;
- moving-sector escape.

### B. Zeta-Weil attachment — COMPLETE

- quartet channel decomposition;
- selected/unselected divisor decomposition;
- zero-moment conservation;
- $O(z^{-2})$ rational far field;
- completed $\Xi$ weighted next jets;
- compact-window prime shifts;
- logarithmic archimedean order.

### C. RH-facing exclusion — OUTSIDE HORIZON 1

- worst-packet next-jet control;
- actual KPH floor or another sufficient transversality theorem;
- neutral null-extension/support rigidity.

---

## H1-P2 specialization layers

The canonical mapping is now recorded in [Zeta-Weil Specialization Map](ZETA_WEIL_SPECIALIZATION_MAP.md).

```math
\boxed{
\text{ZW-0: Weil/Krein pair geometry}
\longrightarrow
\text{ZW-1: zeta-divisor structure}
\longrightarrow
\text{ZW-2: explicit-formula arithmetic}.
}
```

The first genuinely non-abstract structural identity is the pair-antisymmetry law

```math
\mathbf{1}^Tv=0,
```

which yields

```math
R_v(z)=O(|z|^{-2}).
```

Prime/pole/archimedean terms begin only at ZW-2; they are not extra positive screening coordinates.

## H1-P2.1 disposition

The canonical ZW-1 theorem package is [Quartet Channel and Residue Structure](QUARTET_CHANNEL_RESIDUE_STRUCTURE.md).

```math
\boxed{
\text{pair antisymmetry}
\Longrightarrow
\mathbf{1}^Tv=0
\Longrightarrow
R_v(z)=O(|z|^{-2}),
}
```

with inverse-square order sharp.

Native Problem-1 synthesis is Hilbert-Schmidt/compact, so unweighted sampling/frame inputs remain metric-separated from native coercivity.

## H1-P2.2 disposition

The canonical ZW-2 theorem package is [Explicit-Formula Arithmetic Attachment](EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md).

Negative branch:

```math
\boxed{
\mathbf{1}^Tv=0
\Longrightarrow
R_v(z)=O(z^{-2})
\Longrightarrow
\mathcal F_{v,R}
=
O((\log R)/R)
\Longrightarrow
\text{weighted near next-jet field}.
}
```

Neutral branch:

```math
\boxed{
\text{fixed support}
\Longrightarrow
\text{finitely many prime translations}
\quad\text{and}\quad
\Psi_c(t)=\log|t|+O_c(1).
}
```

The explicit formula supplies no automatic positive-Sobolev or quasianalytic gain.

Therefore

```math
\boxed{
\textbf{H1-P2 — ZETA-WEIL SPECIALIZATION: COMPLETE.}
```

## H1-P3.0 disposition

The fixed-packet negative branch is packaged in [Negative Defect Morphology Theorem](NEGATIVE_DEFECT_MORPHOLOGY.md).

```math
\boxed{
\begin{aligned}
\text{persistent selected negativity}
&\Longrightarrow
\text{negative endpoint jump}\\
&\Longrightarrow
\text{normalized full-Weil negativity}\\
&\Longrightarrow
\mathbf{1}^Tv=0\\
&\Longrightarrow
R_v(z)=O(z^{-2})\\
&\Longrightarrow
\mathcal F_{v,R}=O((\log R)/R)\\
&\Longrightarrow
\text{weighted finite/intermediate next-jet field}.
\end{aligned}
}
```

The theorem does not assert a generic lower bound for the near field. Its stop line is $\texttt{AZ-NEXTJET-LOC}$.

## H1-P3.1 disposition

The attained-neutral branch is packaged in [Neutral Defect Morphology Theorem](NEUTRAL_DEFECT_MORPHOLOGY.md).

```math
\boxed{
\text{fixed-packet criticality}
\Longrightarrow
\begin{cases}
\text{negative fall-through to P3.0},\\
\text{attained neutral mode}.
\end{cases}
}
```

On the neutral branch,

```math
\boxed{
W_ck=0,
}
```

and the corresponding compact-window operator has logarithmic principal order with finitely many prime translations.

The unresolved fixed-vector support question is exactly $\texttt{AZ-FIN-WEIL-NULL-EXTENSION}$.

## H1-P3.2 disposition

The remaining noncompact species are packaged in [Noncompact Background Morphology Theorem](NONCOMPACT_BACKGROUND_MORPHOLOGY.md).

```math
\boxed{
\text{moving selected escape}
\ne
\text{unselected-background escape}.
}
```

The former can erase every selected weak limit. The latter cannot erase an already anchored fixed selected negative ray. Bounded tail escape prevents strong background/full-coefficient compactness while still allowing a negative full weak limit; norm escape may prevent even a bounded full-coefficient weak limit.

Thus

```math
\boxed{
\textbf{H1-P3 — DEFECT MORPHOLOGY THEOREM: COMPLETE.}
```

## H1-P4.0 disposition

Stable theorem labels and the normalized dependency graph are now canonical:

- [Theorem Ledger](THEOREM_LEDGER.md);
- [Dependency Audit](DEPENDENCY_AUDIT.md).

The dependency graph is acyclic at the Horizon-1 level, and the RH-facing interfaces occur only downstream of the morphology theorems.

## H1-P4.1 disposition

Exact external pins are recorded in [Imported Source Pins](IMPORTED_SOURCE_PINS.md).

The source boundary is now fixed for Douglas, Bombieri, standard zero counting, the compact-window formula, and the digamma asymptotic.

## H1-P4.2 disposition

WD-T01 through WD-T36 are P4-AUDIT-PASSED at the internal Horizon-1 level.

The theorem-by-theorem audit and applied corrections are recorded in [Internal Proof Audit](INTERNAL_PROOF_AUDIT.md).

## H1-P4.3 disposition

WD-T37 through WD-T39 are COMPOSITE-AUDIT-PASSED. The expanded audit and corrections are recorded in [Composite Morphology Audit](COMPOSITE_MORPHOLOGY_AUDIT.md).

## H1-P4.4 disposition

All seven stable examples/sharpness witnesses are EXAMPLE-AUDIT-PASSED. See [Examples and Sharpness Audit](EXAMPLES_SHARPNESS_AUDIT.md).

Thus

```math
\boxed{
\textbf{H1-P4 — PROOF AUDIT AND THEOREM NORMALIZATION: COMPLETE.}
}
```

## Current cursor

Horizon 1 is complete.

```math
\boxed{
\texttt{HORIZON 1 COMPLETE / POST-H1 CURSOR NOT SELECTED}
}
```

LEAN-H1 is exhausted and H1-P5.0 through H1-P5.5 are complete. The final package certificate is [Public Package Audit](PUBLIC_PACKAGE_AUDIT.md). No post-Horizon research program has been started.

---

## RH-facing interfaces

### Negative branch

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}
}
```

or an equivalent actual-zeta theorem controlling the required weighted near-field compensation.

### Selected screening floor

```math
\boxed{
\texttt{C-ACTUAL-KPH-FLOOR}
}
```

or an equivalent packetwise transversality theorem.

### Neutral branch

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}
}
```

or an equivalent support theorem for the logarithmic-order compact-window operator.
