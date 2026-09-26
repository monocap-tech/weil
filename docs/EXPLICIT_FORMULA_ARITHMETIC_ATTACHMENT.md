# Explicit-Formula Arithmetic Attachment
**H1-P2.2 — Scalar localization, completed $\Xi$ next jets, and compact-window arithmetic operators**

This pass normalizes the ZW-2 layer.

The objective is not to prove an RH-facing exclusion theorem. It is to determine exactly what the explicit formula contributes **before** the open interfaces begin.

The result splits into two branches:

```math
\boxed{
\text{negative persistent source}
\longrightarrow
\text{weighted near next-jet field},
}
```

and

```math
\boxed{
\text{neutral compact-window mode}
\longrightarrow
\text{logarithmic operator + finitely many prime shifts}.
}
```

---

## Part I — Negative branch

### 1. Selected contracted-residue functional

Let $v\ne0$ be a finite selected raw residue vector on a packet $F$, with

```math
\mathbf{1}^Tv=0.
```

Let

```math
R_v(z)=\sum_{\rho_j\in F}\frac{v_j}{z-\rho_j}.
```

For an admissible scalar multiplier $\psi$, write

```math
\mathcal C_v[\psi]
```

for the selected contracted-residue term in the scalar explicit formula.

For the bounded-depth exponential family with real parameter

```math
\psi_\tau(s)=e^{\tau(s-c)},
\qquad
\tau\in\mathbb R,
```

define

```math
C_v(\tau):=\mathcal C_v[\psi_\tau].
```

Because $F$ is finite, $C_v(\tau)$ is an exponential polynomial in $\tau$.

---

### ZW2-T1 — Two-mode selected-preserving multiplier

Choose $\tau_1,\tau_2$ such that

```math
(C_v(\tau_1),C_v(\tau_2))\ne(0,0).
```

Then there is a nonzero pair $(\beta_1,\beta_2)$ for which

```math
\psi
=
\beta_1\psi_{\tau_1}
+
\beta_2\psi_{\tau_2}
```

satisfies

```math
\boxed{
\mathcal C_v[\psi]=0.
}
```

An explicit choice is

```math
(\beta_1,\beta_2)
=
\bigl(C_v(\tau_2),-C_v(\tau_1)\bigr).
```

If $C_v\equiv0$, every member of the exponential family is already selected-preserving.

**Standing:** PROVED as finite-dimensional scalar algebra.

### Scope

The earlier SOURCE-3 work also produced choices retaining a nontrivial prime-sensitive row for the fixed nonzero source.

That stronger simultaneous nondegeneracy is retained as a source-specific input, but the theorem spine below requires only:

1. a fixed selected-preserving multiplier;
2. boundedness of that multiplier on the zero strip;
3. the zero-moment far decay from H1-P2.1.

---

## 2. Far-tail localization

Fix a height center $T_F$ for the selected packet.

Assume $\psi$ is bounded on the zero strip:

```math
|\psi(\mu)|\le M_\psi.
```

By ZW1-T8,

```math
R_v(\mu)
=
O_v(|\mu|^{-2})
```

away from the finite selected packet.

Use the standard unit-height zero count

```math
N(X+1)-N(X)=O(\log(2+X))
```

with multiplicity.

---

### ZW2-T2 — Quantitative far-tail theorem

Define the distant complementary response

```math
\mathcal F_{v,R}[\psi]
:=
\sum_{\substack{\mu\notin F\\
|\Im\mu-T_F|\ge R}}
m_\mu\psi(\mu)R_v(\mu).
```

Then for sufficiently large $R$,

```math
\boxed{
|\mathcal F_{v,R}[\psi]|
\ll_{v,\psi,F}
\frac{\log R}{R}.
}
```

In particular,

```math
\boxed{
\mathcal F_{v,R}[\psi]\to0
\qquad(R\to\infty).
}
```

### Proof

Partition the complementary zeros into unit-height shells.

On a shell at distance $n$ from the fixed packet,

```math
|R_v(\mu)|\ll_v n^{-2},
```

while the shell contains

```math
O(\log(2+n+|T_F|))
```

zeros counted with multiplicity.

Thus

```math
|\mathcal F_{v,R}[\psi]|
\ll
M_\psi
\sum_{n\ge R}
\frac{\log(2+n+|T_F|)}{n^2}
\ll
\frac{\log R}{R}.
```

**Standing:** PROVED from ZW1-T8 + zero counting.

### Consequence

For a fixed selected source and bounded multiplier, the distant complementary contribution tends to zero. Equivalently, for every $\varepsilon>0$ there is a finite cutoff $R$ such that the complementary contribution from zeros beyond distance $R$ has magnitude below $\varepsilon$. Thus the complementary response is localized, up to an arbitrarily small far-tail error, to the finite/intermediate region inside that cutoff.

---

## 3. Near complementary field

Define the near response

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\substack{\mu\notin F\\
|\Im\mu-T_F|<R}}
m_\mu\psi(\mu)R_v(\mu).
}
```

For fixed $R$, this is a finite sum.

Since

```math
R_v(\mu)
=
\sum_{\rho_j\in F}
\frac{v_j}{\mu-\rho_j},
```

we may interchange the two finite sums:

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\rho_j\in F}
v_j
\sum_{\substack{\mu\notin F\\
|\Im\mu-T_F|<R}}
\frac{m_\mu\psi(\mu)}
{\mu-\rho_j}.
}
```

Thus the remaining divisor burden is a finite weighted complementary logarithmic-derivative field evaluated against $v$.

**Standing:** PROVED.

---

## 4. Completed $\Xi$ lift

Define

```math
\boxed{
H_v(z):=\Xi(z)R_v(z).
}
```

Let $\mu\notin F$ be a zero of $\Xi$ of multiplicity $m_\mu$.

Because $\mu$ is not selected, $R_v$ is analytic at $\mu$.

Write locally

```math
\Xi(z)
=
(z-\mu)^{m_\mu}g_\mu(z),
\qquad
g_\mu(\mu)\ne0.
```

Then

```math
H_v(z)
=
(z-\mu)^{m_\mu}g_\mu(z)R_v(z).
```

---

### ZW2-T3 — Complementary next-jet identity

At every complementary zero $\mu\notin F$,

```math
\boxed{
R_v(\mu)
=
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
}
```

### Proof

Differentiating exactly $m_\mu$ times at $z=\mu$ gives

```math
H_v^{(m_\mu)}(\mu)
=
m_\mu!\,g_\mu(\mu)R_v(\mu),
```

while

```math
\Xi^{(m_\mu)}(\mu)
=
m_\mu!\,g_\mu(\mu).
```

Divide.

**Standing:** PROVED.

---

### ZW2-T4 — Weighted near next-jet representation

Substituting ZW2-T3 into the near field gives

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\substack{\mu\notin F\\
|\Im\mu-T_F|<R}}
m_\mu\psi(\mu)
\frac{
H_v^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

Thus the **near complementary response** is exactly a weighted completed-$\Xi$ next-jet field. The full complementary response differs from it by the far term controlled in ZW2-T2.

**Standing:** PROVED.

### Near-collision warning

If a simple complementary zero approaches a selected point,

```math
\mu=\rho_j+\delta,
```

then

```math
R_v(\mu)
=
\frac{v_j}{\delta}
+
O(1).
```

The entire lift $H_v$ remains regular; the large response is encoded by the reciprocal local metric

```math
\frac1{\Xi'(\mu)}
```

or its multiplicity $m$ analogue.

Nothing in the abstract persistence calculus excludes this geometry.

---

## 5. Explicit-formula decomposition

For the fixed selected source and admissible multiplier, write the scalar explicit formula schematically as

```math
\boxed{
\mathcal C_v[\psi]
+
\mathcal N_v[\psi]
+
\mathcal F_v[\psi]
=
\mathcal P_v[\psi]
+
\mathcal A_v[\psi].
}
```

Here:

- $\mathcal C_v$ is the selected contracted-residue term;
- $\mathcal N_v$ is the finite/intermediate complementary divisor term;
- $\mathcal F_v$ is the distant complementary divisor term;
- $\mathcal P_v$ is the prime-power term;
- $\mathcal A_v$ is the archimedean/pole term.

For a selected-preserving multiplier,

```math
\mathcal C_v[\psi]=0,
```

so

```math
\boxed{
\mathcal N_v[\psi]
+
\mathcal F_v[\psi]
=
\mathcal P_v[\psi]
+
\mathcal A_v[\psi].
}
```

**Standing:** retained exact explicit-formula decomposition.

---

### ZW2-T5 — Adaptive co-cancellation identity

Fix a cutoff $R$ and a selected-preserving multiplier $\psi$. Suppose it is additionally chosen so that

```math
\mathcal N_{v,R}[\psi]
=
\mathcal A_v[\psi].
```

Then the split explicit formula forces

```math
\boxed{
\mathcal P_v[\psi]
=
\mathcal F_{v,R}[\psi].
}
```

Thus, at that same cutoff, adaptive cancellation of the near-minus-archimedean response does not leave an independent prime term: the prime functional is exactly the far functional.

If one then sends $R\to\infty$ while keeping $\psi$ fixed, ZW2-T2 gives

```math
\mathcal F_{v,R}[\psi]\to0.
```

The same conclusion holds for a family $\psi_R$ only when the multiplier bounds entering ZW2-T2 are uniform in $R$. No uniform tail conclusion is claimed for an arbitrarily varying unbounded adaptive family.

**Standing:** PROVED algebraically from the cutoff-split explicit-formula identity.

### Interpretation

```math
\boxed{
\text{adaptive near cancellation}
\ne
\text{independent prime detection}.
}
```

The theorem rules out treating a multiplier chosen specifically to cancel the near-minus-archimedean field as producing an independent prime signal. Any argument for separate prime information therefore needs an additional non-coadaptation condition—for example, a multiplier fixed independently of the unknown near field.

---

## 6. Negative-branch theorem boundary

For a fixed bounded selected-preserving multiplier $\psi$ (or a multiplier family satisfying the uniform bounds required by ZW2-T2), H1-P1, H1-P2.1, and ZW2-T1–T5 yield the lawful chain

```math
\boxed{
\begin{aligned}
\text{persistent selected negative ray}
&\Longrightarrow
v\ne0,\ \mathbf{1}^Tv=0\\
&\Longrightarrow
R_v(z)=O(|z|^{-2})\\
&\Longrightarrow
\mathcal F_{v,R}[\psi]\to0\\
&\Longrightarrow
\text{finite/intermediate complementary field}\\
&\Longrightarrow
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
\end{aligned}
}
```

This chain is a theorem/reduction package.

The next statement is **not** in the package:

> the actual zeta divisor cannot realize such a weighted near field.

That is exactly the downstream interface

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}
}
```

or, for the special packet class where it applies, a stronger sufficient actual-zeta KPH/transversality floor.

---

## Part II — Neutral branch

### 7. Compact-window geometric explicit formula

Let $f$ be supported in

```math
[-c,c],
```

and let

```math
F=\widehat f.
```

The compact-window Weil form has the geometric representation

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

with

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

At fixed $c$, only finitely many prime powers satisfy

```math
\log n<2c.
```

**Standing:** IMPORTED compact-window explicit-formula identity / specialization. The current compact-window literature explicitly works with this finite-support arithmetic truncation.

---

### ZW2-T6 — Finite prime-support theorem

For every fixed support $c<\infty$,

```math
\boxed{
\#\{n=p^m:\log n<2c\}<\infty.
}
```

Hence the prime contribution to the compact-window Weil operator is a finite trigonometric polynomial in Fourier space and a finite sum of translations in physical space.

Moreover, because the threshold set

```math
\left\{
\frac12\log n:
n=p^m
\right\}
```

is discrete, there exists a right neighborhood of $c$ on which the active prime-power set is unchanged, except when $c$ itself is a threshold, in which case one finite threshold event occurs before the set again stabilizes.

**Standing:** PROVED from support truncation + discreteness of prime powers.

---

## 8. Physical operator form

Multiplication by

```math
\cos(t\log n)
```

in Fourier space corresponds, under the project Fourier convention, to the symmetric translation

```math
\frac12
\left(
\tau_{\log n}
+
\tau_{-\log n}
\right)
```

in physical space.

Define the archimedean multiplier

```math
\widehat{\mathcal A_\infty f}(t)
=
\left[
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
-\log\pi
\right]
\widehat f(t).
```

Let $\mathcal R_{\rm pole}$ denote the finite-rank pole/evaluation contribution.

Then, up to the fixed Fourier-normalization convention already encoded in $Q_c$,

```math
\boxed{
\mathcal W_c
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

**Standing:** DERIVED from the compact-window geometric formula.

---

## 9. Logarithmic principal order

The digamma asymptotic gives

```math
\Re\psi\!\left(
\frac14+\frac{it}{2}
\right)
=
\log|t|
+
O(1)
\qquad(|t|\to\infty).
```

The prime trigonometric polynomial is bounded because it contains finitely many terms.

Therefore

```math
\boxed{
\Psi_c(t)
=
\log|t|
+
O_c(1).
}
```

---

### ZW2-T7 — Logarithmic form-domain theorem

Work in the same compact-window admissible test class as the pinned geometric formula, with

```math
\operatorname{supp}f\subseteq[-c,c],
\qquad
F=\widehat f.
```

There exist constants

```math
A_c,B_c>0
```

and a real scalar shift $C_c^{(0)}$ such that

```math
\boxed{
A_c
\int_{\mathbb R}
\log(e+|t|)
|F(t)|^2\,dt
\le
Q_c(f)+C_c^{(0)}\|f\|_2^2
}
```

and

```math
\boxed{
Q_c(f)+C_c^{(0)}\|f\|_2^2
\le
B_c
\int_{\mathbb R}
\log(e+|t|)
|F(t)|^2\,dt.
}
```

### Proof

By EXT-5 and the finite prime support of ZW2-T6,

```math
\Psi_c(t)=\log|t|+O_c(1).
```

Hence there are positive constants $a_c,b_c$ and a scalar $C$ such that

```math
a_c\log(e+|t|)
\le
\Psi_c(t)+C
\le
b_c\log(e+|t|)
```

for all real $t$.

The pole/evaluation term is bounded by the fixed-support $L^2$ norm: by Cauchy–Schwarz,

```math
|F(i/2)|
=
\left|
\int_{-c}^{c}
f(x)e^{x/2}\,dx
\right|
\le
\left(
\int_{-c}^{c}e^x\,dx
\right)^{1/2}
\|f\|_2.
```

Absorbing this bounded finite-rank contribution into the scalar $L^2$ shift gives the two-sided estimate above.

Thus the natural compact-window form domain is a logarithmic Fourier/Sobolev space.

**Standing:** DERIVED from ZW2-T6 + the pinned digamma asymptotic + the fixed-support bound on the pole/evaluation functional.

### Consequence

The finite arithmetic translations do not increase the principal regularity order. They are order-zero on ordinary Sobolev and logarithmic Fourier scales.

---

### ZW2-T8 — No positive-Sobolev coercive bootstrap

For every $\varepsilon>0$, the logarithmic form norm of ZW2-T7 does not control the $H^\varepsilon$ norm uniformly on the fixed support class.

Indeed, choose a nonzero real-even

```math
\phi\in C_c^\infty(-c,c)
```

and set

```math
f_N(x)=\phi(x)\cos(Nx).
```

Then the Fourier mass of $f_N$ is concentrated near $\pm N$, so

```math
\int
\log(e+|t|)
|\widehat f_N(t)|^2\,dt
\asymp
\log N,
```

whereas

```math
\|f_N\|_{H^\varepsilon}^2
\asymp
N^{2\varepsilon}.
```

After normalizing by $(\log N)^{1/2}$, the logarithmic form norm stays bounded while the $H^\varepsilon$ norm diverges.

Therefore no estimate of the form

```math
\|f\|_{H^\varepsilon}
\le
C
\left(
Q_c(f)+C_c^{(0)}\|f\|_2^2
\right)^{1/2}
```

can follow from the compact-window form equivalence alone.

Finite translations do not change this conclusion: they are order-zero operators and repeated substitution creates translated copies but no positive-order smoothing.

**Standing:** PROVED as a sharp non-coercivity consequence of ZW2-T7.

---

## 10. Neutral null modes

Suppose the compact-window defect operator is nonnegative:

```math
W_c\succeq0.
```

If a physical vector $k$ satisfies

```math
Q_c(k)=0,
```

then positivity gives

```math
\boxed{
W_ck=0
}
```

in the corresponding operator/form sense.

This null-mode step is abstract positive-operator geometry.

What ZW-2 adds is the concrete operator species:

```math
\boxed{
\text{archimedean log multiplier}
+
\text{finite prime translations}
+
\text{finite-rank pole term}.
}
```

---

### ZW2-T9 — Neutrality is global, not termwise

The equality

```math
Q_c(k)=0
```

does **not** imply separately that

```math
F(i/2)=0
```

or that each pointwise integrand contribution vanishes.

The symbol

```math
\Psi_c(t)
```

need not be pointwise nonnegative because the finite prime trigonometric polynomial can change its sign contribution.

Thus neutral equality is one global quadratic cancellation.

**Standing:** SCOPE/LOGICAL CONSEQUENCE of the geometric formula.

---

## 11. Neutral-branch theorem boundary

Let $\widetilde k$ be the zero extension of a compact-window neutral mode.

The explicit operator is

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

The arithmetic theorem package determines its order and finite translation structure.

What it does **not** determine is whether

```math
\mathcal W_c^{\rm ext}\widetilde k
```

must vanish on a nontrivial exterior collar, or whether the finite arithmetic shifts can cancel the exterior archimedean tail.

That is exactly the downstream interface

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
}
```

---

## 12. H1-P2.2 determination

The explicit-formula attachment is now normalized.

### Negative branch

Established:

```math
\boxed{
\begin{aligned}
\mathbf{1}^Tv=0
&\Longrightarrow
R_v(z)=O(z^{-2})\\
&\Longrightarrow
\mathcal F_{v,R}=O((\log R)/R)\\
&\Longrightarrow
\text{near-field localization}\\
&\Longrightarrow
\text{weighted completed-}\Xi\text{ next jet}.
\end{aligned}
}
```

Adaptive cancellation cannot produce an independent prime signal because the exact explicit formula co-adapts.

The first unproved statement is actual-zeta control/exclusion of that near next-jet field.

### Neutral branch

Established:

```math
\boxed{
\text{fixed support}
\Longrightarrow
\text{finitely many prime translations},
}
```

and

```math
\boxed{
\Psi_c(t)=\log|t|+O_c(1).
}
```

Hence the operator is logarithmic order with only bounded/order-zero arithmetic translations.

There is no free quasianalytic bootstrap.

The first unproved statement is the null-extension/support-rigidity interface.

---

## H1-P2 completion status

H1-P2 now has:

1. H1-P2.0 — specialization map;
2. H1-P2.1 — quartet channel and residue structure;
3. H1-P2.2 — explicit-formula arithmetic attachment.

The remaining question is whether another internal zeta-Weil normalization pass is needed before morphology packaging.

The theorem inventory indicates that the required specialization outputs have now all been normalized.

Therefore:

```math
\boxed{
\textbf{H1-P2 — ZETA-WEIL SPECIALIZATION: COMPLETE.}
}
```

---

## Historical handoff from H1-P2.2

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P3.0 / NEGATIVE DEFECT MORPHOLOGY THEOREM}
}
```

H1-P3 should no longer discover ingredients.

It should package the already established chains into exact morphology theorems, starting with the negative branch and terminating explicitly at

```math
\texttt{AZ-NEXTJET-LOC}
```

without attempting to solve that interface.
