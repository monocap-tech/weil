# Composite Morphology Audit
**H1-P4.3 — WD-T37 through WD-T39**

This document audits the three Horizon-1 composite morphology theorems against the internally audited theorem spine WD-T01 through WD-T36.

No new mathematical theorem is introduced.

COMPOSITE-AUDIT-PASSED means:

> every dependency used by the morphology package was expanded, its branch hypotheses were checked for preservation, and any overstatement discovered during composition was narrowed in the canonical morphology document.

It does not mean independent certification or external refereeing.

---

## 1. Audit criteria

Each morphology package was checked for:

1. exact branch hypotheses at entry;
2. preservation of fixed-packet versus moving-packet scope;
3. weak versus strong convergence;
4. fixed-object versus uniform-family estimates;
5. carrier/metric identification;
6. threshold/support conventions;
7. whether a downstream interface was imported upstream;
8. whether a stronger special-packet theorem was silently substituted for a generic branch result.

---

## 2. WD-T37 — Negative defect morphology

Canonical source:

[Negative Defect Morphology](NEGATIVE_DEFECT_MORPHOLOGY.md)

### Entry hypotheses

WD-T37 assumes:

- one fixed finite selected packet $\Pi$;
- one common selected coefficient carrier in which
  ```math
  \mathcal A_{\Pi,t}
  ```
  forms the monotone filtration;
- endpoint nonnegativity of
  ```math
  \mathcal A_{\Pi,c};
  ```
- right supports
  ```math
  t_n\downarrow c;
  ```
- unit physical witnesses $g_n$;
- selected amplitude
  ```math
  \varepsilon_n
  =
  \|\mathcal E_{\Pi,t_n}^*g_n\|
  \to0;
  ```
- normalized selected vectors
  ```math
  z_n
  =
  \mathcal E_{\Pi,t_n}^*g_n/\varepsilon_n
  ```
  with
  ```math
  [z_n,z_n]_J\to-\kappa,
  \qquad
  \kappa>0.
  ```

No actual-zeta existence theorem for such a branch is claimed.

### Dependency expansion

The branch uses:

```math
\text{WD-T16}
```

for the persistent negative endpoint ray,

```math
\text{WD-T07}
```

for selected/full negativity,

```math
\text{WD-T26}\to\text{WD-T27}
```

for zero moment and inverse-square far decay,

```math
\text{WD-T30}+\text{WD-T31}
```

for selected scalarization and fixed-source far-tail localization,

```math
\text{WD-T32}
```

for the completed-$\Xi$ next-jet representation,

and

```math
\text{WD-T33}
```

for cutoffwise explicit-formula co-adaptation.

### Composite correction N-1 — blow-up carrier

The original package cited WD-T19 as though the varying maps

```math
\mathcal E_{\Pi,t}^*
```

automatically formed the single common bounded realization map required by WD-T19.

That transfer was not justified by the P3.0 entry hypotheses.

The canonical theorem now separates:

### Direct normalized blow-up

```math
h_n
=
\varepsilon_n^{-1}g_n
```

satisfies

```math
\|h_n\|
=
\varepsilon_n^{-1}
\to\infty
```

directly.

### Universal representation-cost blow-up

The stronger statement that every increasingly accurate representation of the endpoint ray blows up is asserted only if the additional common-carrier hypotheses of WD-T19 are supplied.

Thus WD-T19 is no longer an unconditional dependency of WD-T37.

### Composite correction N-2 — adaptive multiplier quantifier

WD-T33 is cutoffwise.

At fixed $R$,

```math
\mathcal N_{v,R}[\psi]
=
\mathcal A_v[\psi]
```

implies

```math
\mathcal P_v[\psi]
=
\mathcal F_{v,R}[\psi].
```

The morphology now sends $R\to\infty$ only for:

- one fixed multiplier $\psi$; or
- a multiplier family satisfying the uniform boundedness required by WD-T31.

No asymptotic claim remains for an arbitrary unbounded adaptive family.

### Near-field custody

WD-T37 continues to assert only:

```math
\boxed{
\text{far tail vanishes}
\quad\Longrightarrow\quad
\text{remaining complementary dependence is the weighted near next-jet field}.
}
```

It does not assert a generic lower bound on that field.

No KPH null equation, reciprocal-Cauchy packet structure, CF-A17 compactness, or packet-uniform source margin is imported.

### Stop line

The theorem terminates at

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}.
}
```

The stronger special-packet interface

```math
\texttt{C-ACTUAL-KPH-FLOOR}
```

is not consumed by WD-T37.

### WD-T37 audit result

```math
\boxed{
\text{COMPOSITE-AUDIT-PASSED}
}
```

after corrections N-1 and N-2.

---

## 3. WD-T38 — Neutral defect morphology

Canonical source:

[Neutral Defect Morphology](NEUTRAL_DEFECT_MORPHOLOGY.md)

### Entry hypotheses

The audited theorem assumes:

1. one fixed finite selected packet;
2. a critical right-approaching sequence;
3. the attained-neutral rather than negative-fall-through alternative of WD-T17;
4. a nonzero selected coordinate $u$ satisfying
   ```math
   C_c^*C_cu=u;
   ```
5. a physical realization
   ```math
   C_cu=P_c^*k,
   \qquad
   k\ne0;
   ```
6. the relation
   ```math
   N_c=-P_cC_c;
   ```
7. an explicit carrier identification saying that this physical realization is the same compact-window Weil form/operator realization used by H1-P2.2, with $k$ in that form domain.

Items 4–7 are finite-exception neutral hypotheses. They are not consequences of abstract criticality alone.

### Dependency expansion

WD-T17 supplies the fixed-packet critical bifurcation.

The unit-gain/adjoint hypotheses give algebraically

```math
N_c^*k=-u
```

and

```math
W_ck=0.
```

The arithmetic/operator part then uses:

```math
\text{WD-T34}
```

for finite prime support,

```math
\text{WD-T35}
```

for logarithmic form order,

and

```math
\text{WD-T36}
```

for the absence of a uniform positive-Sobolev coercive estimate.

The global-cancellation jurisdiction remains WD-S03.

### Composite correction U-1 — carrier identification

The algebraic null equation

```math
W_ck=0
```

does not, by itself, identify the algebraic synthesis operator with the compact-window explicit-formula form domain.

That identification is now an explicit theorem hypothesis.

Accordingly, the logarithmic-form and arithmetic-translation conclusions are conditional on this common-carrier identification.

### Composite correction U-2 — regularity statement

The package previously used language that could be read as

```math
k\notin H^\varepsilon
```

for every neutral mode.

That is stronger than WD-T36.

The audited statement is now

```math
\boxed{
\text{the retained logarithmic form estimate supplies no uniform }H^\varepsilon\text{ coercive bound}.
}
```

A particular neutral mode may possess additional regularity if another theorem supplies it.

### Composite correction U-3 — strict support threshold

The source-pinned compact-window convention is

```math
\log n<2c.
```

Therefore the endpoint operator and the strict-right-limit operator can differ when

```math
2c=\log n_0
```

for a prime power $n_0$.

Define

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

Away from a threshold,

```math
\mathcal W_{c+}^{\rm ext}
=
\mathcal W_c^{\rm ext}.
```

At a threshold, the right-limit operator contains the finite equality-threshold correction.

The null-extension interface is therefore threshold-aware.

### Stop line

The theorem terminates at

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
}
```

The interface asks whether the same fixed neutral relation satisfies the correct right-limit compact-window equation on a strict enlargement.

No boundary-trace, Stieltjes, or UCP theorem is imported upstream.

### WD-T38 audit result

```math
\boxed{
\text{COMPOSITE-AUDIT-PASSED}
}
```

after corrections U-1 through U-3.

---

## 4. WD-T39 — Noncompact background morphology

Canonical source:

[Noncompact Background Morphology](NONCOMPACT_BACKGROUND_MORPHOLOGY.md)

WD-T39 contains two distinct compactness problems:

1. selected/full coefficient escape before a fixed selected branch is anchored;
2. unselected-background escape after a fixed selected negative ray is anchored.

These must remain separate.

---

### Selected/full coefficient escape

Fix a finite-rank coordinate exhaustion

```math
Q_R\to I_K
```

strongly on the full coefficient carrier.

If

```math
Q_Rw_n\to0
```

for every fixed $R$, then

```math
w_n\rightharpoonup0.
```

This conclusion requires the full carrier exhaustion.

Escape of selected negative coordinates alone is insufficient if a positive coefficient block remains anchored.

### Composite correction B-1 — full versus selected coordinate escape

The canonical theorem now calls P3-B2 full coefficient moving-sector escape.

For a fixed finite selected packet, if

```math
\limsup_n\|u_n\|>0,
```

then a subsequence has

```math
u_n\to u\ne0
```

strongly.

Thus full coefficient weak escape to zero is impossible on such a fixed-packet branch.

This is the precise fixed-packet custody statement.

---

### Unselected-background escape

After a fixed selected negative ray is anchored, normalize the unselected background as $b_n$.

After passage to a subsequence, exactly one of the following can be arranged:

### B∞ — norm escape

```math
\|b_n\|\to\infty.
```

### BT — bounded weak/tail escape

```math
b_n\rightharpoonup b
```

but not strongly; after taking a norm-convergent subsequence,

```math
d_B
=
\lim\|b_n\|^2-\|b\|^2
>0.
```

### BF — background strong compactness

```math
b_n\to b
```

strongly.

For a bounded sequence in an $\ell^2$-type coefficient carrier, uniform coordinate-tail tightness is the relative-compactness criterion used to reach BF.

---

### Composite correction B-2 — positive-coordinate convergence

Background tail tightness controls $b_n$, not the positive coordinate $a_n$.

From the fixed selected-ray compactness theorem one generally has only

```math
a_n\rightharpoonup a,
\qquad
u_n\to u.
```

Therefore BF gives

```math
b_n\to b
```

strongly and the fixed full weak limit

```math
Y_{\rm full}=(a,u,b),
```

with strong convergence on the entire negative sector.

Its signature remains

```math
[Y_{\rm full},Y_{\rm full}]_{\rm full}
\le
-\kappa-\|b\|^2
<0.
```

Full strong coefficient convergence requires the extra hypothesis

```math
a_n\to a.
```

The stable theorem therefore speaks of a fixed full-divisor negative weak limit, not unconditional full strong convergence.

---

### Background custody

Even under bounded weak background escape,

```math
(a,u,b)
```

is nonzero because $u\ne0$, and remains strictly negative.

Hence

```math
\boxed{
\text{background escape}
\not\Rightarrow
\text{loss of selected-ray custody}.
}
```

This remains a valid scope guard.

### WD-T39 audit result

```math
\boxed{
\text{COMPOSITE-AUDIT-PASSED}
}
```

after corrections B-1 and B-2.

---

## 5. Composite cycle audit

After the corrections above:

```math
\text{WD-T37}
\longrightarrow
\texttt{AZ-NEXTJET-LOC}
```

and

```math
\text{WD-T38}
\longrightarrow
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}
```

remain strictly downstream.

No open interface is used to prove the composite theorem that reaches it.

WD-T39 introduces no new RH-facing interface.

The generic negative morphology still does not import

```math
\texttt{C-ACTUAL-KPH-FLOOR}.
```

Thus the composite-level dependency graph remains acyclic.

---

## 6. Composite audit corrections

The audit required seven compositional corrections:

### Negative branch

- N-1: direct normalized blow-up separated from the stronger WD-T19 common-carrier blow-up theorem;
- N-2: adaptive scalar cancellation made cutoffwise, with explicit uniformity requirements for any far-cutoff limit.

### Neutral branch

- U-1: compact-window form/operator carrier identification made explicit;
- U-2: “no bootstrap” narrowed to no uniform positive-Sobolev coercive estimate;
- U-3: null-extension reduction made threshold-aware under the strict $\log n<2c$ source convention.

### Noncompact branch

- B-1: weak-zero moving escape requires a full coefficient exhaustion, not negative-coordinate escape alone;
- B-2: background strong convergence no longer implies positive-coordinate strong convergence; stable output is a fixed full-divisor negative weak limit.

---

## 7. Audit result

After those corrections:

```math
\boxed{
\text{WD-T37, WD-T38, WD-T39: COMPOSITE-AUDIT-PASSED}.
}
```

This status remains internal to Horizon 1.

At the close of P4.3, the examples/sharpness witnesses WD-X01 through WD-X07 were the remaining P4 audit class. That subsequent P4.4 audit is now complete; see [Examples and Sharpness Audit](EXAMPLES_SHARPNESS_AUDIT.md).

---

## H1-P4.3 determination

The morphology packages preserve their audited dependencies and branch hypotheses after the corrections above.

### Historical handoff from H1-P4.3

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P4.4 / EXAMPLES AND SHARPNESS AUDIT}
}
```
