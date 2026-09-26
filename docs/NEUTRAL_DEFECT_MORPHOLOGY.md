# Neutral Defect Morphology Theorem
**H1-P3.1 — Attained critical branch and compact-window null mode**

This document packages the neutral branch of the completed H1-P1/H1-P2 theory.

It does **not** prove that a nonzero neutral mode persists to a larger support.

The theorem stops at the Horizon-1 interface

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
}
```

---

## 1. Critical right-approach and branch selection

Fix a finite selected packet

```math
\Pi
```

with finite negative coefficient sector

```math
M_\Pi.
```

Let

```math
\mathcal A_{\Pi,t}
```

be the monotone selected analysis-space filtration and let

```math
t_n\downarrow c.
```

Suppose

```math
y_n=(a_n,u_n)\in\mathcal A_{\Pi,t_n},
\qquad
\|y_n\|=1,
```

with

```math
\boxed{
[y_n,y_n]_J\to0.
}
```

Because $M_\Pi$ is finite dimensional, WD-C4 gives a nonzero right-limit vector

```math
y=(a,u)\in\mathcal A_{\Pi,c+}
```

with

```math
[y,y]_J\le0.
```

There are exactly two fixed-packet possibilities.

### Negative fall-through

If positive coefficient norm is lost in the weak limit, then

```math
[y,y]_J<0.
```

That branch is already covered by H1-P3.0.

### Attained neutral branch

If

```math
\|a\|^2=\frac12,
```

then

```math
[y,y]_J=0,
```

and

```math
y_n\to y
```

strongly.

Only this second alternative enters H1-P3.1.

---

### P3-U1 — Fixed-packet critical dichotomy

For a fixed finite selected packet,

```math
\boxed{
\text{critical right-approach}
\Longrightarrow
\begin{cases}
\text{strict negative persistent ray},\\
\text{attained nonzero neutral right-limit ray}.
\end{cases}
}
```

There is no independent non-attained critical branch.

**Dependencies:** WD-C3, WD-C4.

**Standing:** PROVED.

---

## 2. Finite-exception unit-gain neutral realization

The remainder of P3.1 concerns the retained finite-exception neutral branch.

Assume the attained neutral coefficient vector is represented by a nonzero finite selected coordinate

```math
u
```

and an endpoint minimum-compensator map

```math
C_c
```

satisfying the unit-gain relation

```math
\boxed{
C_c^{*}C_cu=u.
}
```

Then

```math
\boxed{
\|C_cu\|=\|u\|.
}
```

Assume further that the neutral positive coordinate has a physical adjoint realization: there exists a physical vector $k\ne0$ such that

```math
\boxed{
C_cu=P_c^{*}k.
}
```

Define the negative physical synthesis by

```math
\boxed{
N_c=-P_cC_c.
}
```

These are finite-exception neutral hypotheses inherited from the endpoint reduction.

For the arithmetic/operator part of P3.1, assume in addition that this physical realization is identified with the compact-window Weil form used in H1-P2.2: $k$ belongs to its form domain and the algebraic null equation below is the endpoint realization of that same compact-window form.

This carrier-identification hypothesis is not a consequence of abstract criticality alone.

---

## 3. Exact null-mode identity

From

```math
C_cu=P_c^{*}k
```

and

```math
C_c^{*}C_cu=u,
```

we get

```math
N_c^{*}k
=
-C_c^{*}P_c^{*}k
=
-C_c^{*}C_cu
=
-u.
```

Hence the fixed coefficient relation is

```math
\boxed{
\Phi(u)
=
(P_c^{*}k,-N_c^{*}k)
=
(C_cu,u).
}
```

Define the finite-exception physical Weil defect operator

```math
\boxed{
W_c
=
P_cP_c^{*}
-
N_cN_c^{*}.
}
```

Then

```math
\begin{aligned}
W_ck
&=
P_cP_c^{*}k-N_cN_c^{*}k\\
&=
P_cC_cu-N_c(-u)\\
&=
P_cC_cu+N_cu\\
&=
0.
\end{aligned}
```

Thus

```math
\boxed{
W_ck=0.
}
```

---

### P3-U2 — Physical neutral null-mode theorem

Every finite-exception unit-gain neutral relation satisfying the physical adjoint realization above determines a nonzero physical null mode

```math
\boxed{
k\ne0,
\qquad
W_ck=0.
}
```

**Standing:** PROVED CONDITIONAL on the finite-exception unit-gain realization.

### Interpretation

The neutral obstruction is not merely a coefficient-space equality.

It is an actual compact-window Weil null mode.

---

## 4. Compact-window arithmetic representation

For a test function $f$ supported in

```math
[-c,c],
```

with Fourier transform

```math
F=\widehat f,
```

the compact-window Weil form has the geometric representation

```math
\boxed{
Q_c(f)
=
2|F(i/2)|^2
+
\frac1{2\pi}
\int_{\mathbb R}
|F(t)|^2
\Psi_c(t)\,dt,
}
```

where

```math
\boxed{
\Psi_c(t)
=
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
-\log\pi
-
\sum_{\log n<2c}
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n).
}
```

At fixed support, the prime-power sum is finite.

In physical coordinates, up to the fixed Fourier-normalization convention, the corresponding whole-line operator species is

```math
\boxed{
\mathcal W_c^{\rm ext}
=
\mathcal A_\infty
-
\sum_{\log n<2c}
\frac{\Lambda(n)}{\sqrt n}
\left(
\tau_{\log n}
+
\tau_{-\log n}
\right)
+
\mathcal R_{\rm pole}.
}
```

Here:

- $\mathcal A_\infty$ is the archimedean nonlocal Fourier multiplier;
- the prime part is a finite sum of symmetric translations;
- $\mathcal R_{\rm pole}$ is finite rank.

---

### P3-U3 — Finite arithmetic-shift theorem

At every fixed compact support $c$,

```math
\boxed{
\text{the arithmetic part contains only finitely many prime-power translations}.
}
```

The active prime set is locally constant under a sufficiently small right variation of $c$, except at a discrete prime-power threshold, where only a finite threshold event occurs.

**Dependencies:** ZW2-T6.

**Standing:** PROVED from the compact-window support truncation.

### Consequence

Neutral persistence is not driven by an infinite local cascade of newly activated primes.

The infinite-order part is archimedean.

---

## 5. Logarithmic principal order

The digamma asymptotic gives

```math
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
=
\log|t|
+
O(1).
```

Because the prime sum is finite and bounded in $t$,

```math
\boxed{
\Psi_c(t)
=
\log|t|
+
O_c(1).
}
```

Consequently, after adding a sufficiently large harmless $L^2$ shift,

```math
\boxed{
Q_c(f)+C_c^{(0)}\|f\|_2^2
\asymp_c
\int_{\mathbb R}
\log(e+|t|)
|F(t)|^2\,dt.
}
```

The superscript on $C_c^{(0)}$ distinguishes this scalar shift from the compensator map $C_c$.

---

### P3-U4 — Logarithmic-order neutral carrier theorem

The physical neutral mode belongs naturally to a logarithmic Fourier/form domain.

The explicit-formula operator has principal order

```math
\boxed{
\log|D|,
}
```

perturbed only by order-zero finite translations and a finite-rank term.

**Dependencies:** ZW2-T7.

**Standing:** DERIVED CONDITIONAL on the neutral-mode setup.

---

## 6. No automatic regularity bootstrap

Translations preserve ordinary Sobolev and logarithmic Fourier norms:

```math
\|\tau_af\|_{H^s}
=
\|f\|_{H^s}.
```

Thus the finite prime-delay operator does not increase differential order.

The compact-window logarithmic form estimate therefore supplies no **uniform coercive control** of a positive Sobolev norm

```math
\|k\|_{H^\varepsilon}
```

for any

```math
\varepsilon>0.
```

Repeated substitution only creates further translated copies at the same order.

This statement does not assert that a particular neutral mode can never possess additional $H^\varepsilon$ regularity from some separate theorem.

---

### P3-U5 — No free quasianalyticity theorem

The retained operator estimates supply logarithmic form control but no uniform positive-Sobolev coercive estimate:

```math
\boxed{
\text{finite prime translations}
+
\log|D|
\not\Rightarrow
\text{a uniform }H^\varepsilon\text{ bound}
}
```

for any $\varepsilon>0$ without an additional theorem.

**Dependencies:** ZW2-T8.

**Standing:** PROVED as the audited non-coercivity/order statement.

---

## 7. Neutrality is global

The null equality

```math
Q_c(k)=0
```

does not imply that the terms in the geometric explicit formula vanish separately.

In particular, it does not imply individually that

```math
F(i/2)=0
```

or that

```math
\Psi_c(t)|F(t)|^2=0
```

pointwise.

The prime trigonometric polynomial can make

```math
\Psi_c
```

sign-indefinite.

Thus the neutral mode is one global cancellation of the whole compact-window Weil form.

---

### P3-U6 — Global-cancellation scope theorem

Neutrality supplies

```math
\boxed{
W_ck=0,
}
```

but does not split into termwise prime, pole, and archimedean vanishing.

**Dependencies:** ZW2-T9.

**Standing:** SCOPE/LOGICAL CONSEQUENCE.

---

## 8. Fixed-vector persistence problem

Let

```math
\widetilde k
```

denote the zero extension of $k$ outside

```math
[-c,c].
```

The endpoint null-mode identity gives the interior endpoint equation

```math
\boxed{
P_{[-c,c]}
\mathcal W_c^{\rm ext}
\widetilde k
=
0
}
```

in the retained compact-window operator/form realization.

For a strict right enlargement, the active prime set is governed by

```math
\log n<2t.
```

Define the **right-limit arithmetic operator**

```math
\boxed{
\mathcal W_{c+}^{\rm ext}
:=
\mathcal A_\infty
-
\sum_{\log n\le 2c}
\frac{\Lambda(n)}{\sqrt n}
\left(
\tau_{\log n}
+
\tau_{-\log n}
\right)
+
\mathcal R_{\rm pole}.
}
```

If $c$ is not a prime-power threshold, then

```math
\mathcal W_{c+}^{\rm ext}
=
\mathcal W_c^{\rm ext}.
```

If $2c=\log n_0$ for one or more prime powers, the strict right enlargement activates exactly those finitely many equality-threshold translations, so

```math
\mathcal W_{c+}^{\rm ext}
\ne
\mathcal W_c^{\rm ext}
```

by that finite threshold correction.

The finite-exception persistence question is therefore not merely whether the endpoint output of $\mathcal W_c^{\rm ext}$ has a collar.

It is whether the **same fixed coefficient/physical relation** satisfies the correct right-limit compact-window equation after this finite threshold convention is applied.

Away from thresholds, this reduces to asking whether

```math
\mathcal W_c^{\rm ext}\widetilde k
```

vanishes on a nontrivial exterior collar.

At a threshold, the corresponding statement uses

```math
\mathcal W_{c+}^{\rm ext}\widetilde k
```

instead.

---

### P3-U7 — Neutral null-extension reduction

Every finite-exception unit-gain neutral branch reduces to a threshold-aware fixed-vector support problem.

At the endpoint,

```math
\boxed{
P_{[-c,c]}
\mathcal W_c^{\rm ext}\widetilde k=0,
\qquad
k\ne0.
}
```

For strict right persistence, the relevant local operator is

```math
\boxed{
\mathcal W_{c+}^{\rm ext}
=
\text{logarithmic-order archimedean operator}
+
\text{the finite right-limit prime translations}
+
\text{finite-rank pole term}.
}
```

If $c$ is not a threshold, $\mathcal W_{c+}^{\rm ext}=\mathcal W_c^{\rm ext}$.

If $c$ is a threshold, the right-limit operator contains the finitely many equality-threshold prime terms absent from the endpoint strict-$<$ sum.

Exact persistence to a larger support requires the same fixed relation to satisfy this right-limit equation on a nontrivial enlarged interval.

**Standing:** DERIVED CONDITIONAL on P3-U2 and on the compact-window carrier-identification hypothesis.

---

## 9. What P3-U7 does not say

P3-U7 is a reduction theorem.

It does **not** assert that a nonzero neutral mode has such an exterior collar.

It does **not** assert that immediate exterior activation is forced.

It does **not** import a generic logarithmic-Laplacian unique-continuation theorem for the full shifted operator.

It does **not** infer persistence from:

- logarithmic form regularity;
- finite prime shifts;
- finite-dimensionality of the neutral selected space;
- smoothness or flatness of an auxiliary representation;
- ordinary frame or Picard closure.

Those questions belong downstream.

---

## 10. Neutral Defect Morphology Theorem

Collecting P3-U1 through P3-U7:

### H1-P3.1 Neutral Defect Morphology Theorem

Assume:

1. $\Pi$ is a fixed finite selected packet;
2. $t_n\downarrow c$;
3. $y_n\in\mathcal A_{\Pi,t_n}$ are unit critical vectors with
   ```math
   [y_n,y_n]_J\to0;
   ```
4. the fixed-packet critical limit falls in the attained-neutral rather than positive-mass-loss alternative;
5. the resulting nonzero neutral selected coordinate $u$ has the finite-exception unit-gain realization
   ```math
   C_c^{*}C_cu=u;
   ```
6. there exists $k\ne0$ with
   ```math
   C_cu=P_c^{*}k;
   ```
7. $N_c=-P_cC_c$;
8. the physical realization above is the same compact-window Weil form/operator realization used in H1-P2.2, with $k$ in its form domain.

Then:

### Attained neutral geometry

The critical sequence converges strongly to a nonzero neutral right-limit vector.

### Physical null mode

```math
\boxed{
W_ck=0,
\qquad
W_c=P_cP_c^{*}-N_cN_c^{*}.
}
```

### Arithmetic operator species

The corresponding compact-window Weil operator is a logarithmic-order nonlocal archimedean operator plus finitely many prime-power translations and a finite-rank pole term.

### Form order

```math
\boxed{
\Psi_c(t)=\log|t|+O_c(1).
}
```

Its natural form domain is logarithmic rather than positive-Sobolev.

### Rigidity limit

Neither the null equality nor the finite translation structure supplies a uniform positive-Sobolev coercive estimate or, by itself, a quasianalytic continuation theorem.

### Persistence reduction

The remaining fixed-vector question is whether the zero-extended neutral mode satisfies the correct **right-limit** compact-window equation on a nontrivial enlarged interval; away from prime thresholds this is the same operator, while at a threshold a finite equality-threshold correction is required.

---

## 11. Exact stop line

The theorem package ends at

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
}
```

The interface asks:

> For an actual nonzero finite-exception unit-gain neutral mode $k$ satisfying the endpoint equation $P_{[-c,c]}\mathcal W_c^{\rm ext}\widetilde k=0$, does the same fixed relation satisfy the correct right-limit equation for some strict enlargement?
>
> Away from a prime threshold, this asks whether $\mathcal W_c^{\rm ext}\widetilde k$ vanishes on a nontrivial exterior collar. At a threshold, the same question uses the finitely corrected right-limit operator $\mathcal W_{c+}^{\rm ext}$.

The answer is not assumed in H1-P3.1.

---

## 12. Dependency chain

The neutral morphology theorem consumes

```math
\boxed{
\begin{array}{c}
\text{WD-C4 / attained critical branch}\\
\downarrow\\
\text{finite-exception unit-gain realization}\\
\downarrow\\
W_ck=0\\
\downarrow\\
\text{ZW2-T6 / finite prime shifts}\\
\downarrow\\
\text{ZW2-T7 / logarithmic form order}\\
\downarrow\\
\text{ZW2-T8,T9 / no free bootstrap and global cancellation}\\
\downarrow\\
\text{null-extension support interface}.
\end{array}
}
```

No downstream support-rigidity theorem is consumed above the stop line.

---

## H1-P3.1 determination

The neutral branch is now packaged as a single auditable morphology theorem.

Its output, after the finite-exception unit-gain relation is identified with the compact-window Weil carrier specified in the theorem hypotheses, is:

```math
\boxed{
\text{attained fixed-packet criticality + carrier identification}
\Longrightarrow
\text{physical compact-window null mode}
}
```

whose operator is

```math
\boxed{
\text{logarithmic order}
+
\text{finite arithmetic translations}
+
\text{finite-rank pole term},
}
```

with no uniform positive-Sobolev coercive gain supplied by the retained form estimate.

Within this carrier-identified neutral branch, the remaining H1-P3.1 interface is a fixed-vector exterior support/right-limit null-extension problem.

---

## Historical handoff from H1-P3.1

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P3.2 / NONCOMPACT BACKGROUND MORPHOLOGY THEOREM}
}
```
