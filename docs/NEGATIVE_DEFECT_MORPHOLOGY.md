# Negative Defect Morphology Theorem
**H1-P3.0 — Fixed-packet persistent negative branch**

This document packages the completed H1-P1 and H1-P2 ingredients into one theorem-shaped morphology.

It does **not** prove that the actual zeta divisor excludes the morphology.

The theorem stops at the explicit Horizon-1 interface

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}
}
```

or an equivalent packetwise transversality/KPH floor.

---

## 1. Fixed-packet setup

Fix a finite selected off-axis packet

```math
\Pi
```

with finite selected negative coefficient space

```math
M_\Pi\subset K_{-}.
```

Let

```math
\mathcal A_{\Pi,t}
```

be the corresponding selected analysis spaces for support parameter $t$, with

```math
s<t
\Longrightarrow
\mathcal A_{\Pi,s}\subseteq\mathcal A_{\Pi,t}.
```

Fix an endpoint $c>0$ and assume

```math
\boxed{
\mathcal A_{\Pi,c}
\text{ is }J\text{-nonnegative}.
}
```

Let

```math
t_n\downarrow c.
```

Suppose there are unit physical vectors

```math
g_n
```

and selected analysis amplitudes

```math
\varepsilon_n
:=
\|\mathcal E_{\Pi,t_n}^{*}g_n\|
>0
```

such that

```math
\boxed{
\varepsilon_n\to0.
}
```

Normalize the selected coefficient vectors by

```math
\boxed{
z_n
:=
\frac{\mathcal E_{\Pi,t_n}^{*}g_n}{\varepsilon_n},
\qquad
\|z_n\|=1.
}
```

Assume their selected indefinite signature has a fixed negative limit:

```math
\boxed{
[z_n,z_n]_J\to-\kappa
}
```

for some

```math
\kappa>0.
```

This is the abstract fixed-packet negative-collapse hypothesis.

---

## 2. Persistent endpoint ray

Because $M_\Pi$ is finite dimensional, WD-C5 applies.

After passage to a subsequence there is

```math
y=(a,u)\in\mathcal A_{\Pi,c+}
```

such that

```math
\boxed{
y\ne0,
\qquad
[y,y]_J\le-\kappa.
}
```

Since the endpoint space is nonnegative,

```math
\boxed{
y\in
\mathcal A_{\Pi,c+}
\setminus
\mathcal A_{\Pi,c}.
}
```

In particular,

```math
u\ne0.
```

Thus the branch carries a genuine negative endpoint jump, not merely a sequence of finite negative witnesses.

---

### P3-N1 — Fixed-packet persistent-negative theorem

Under the setup above,

```math
\boxed{
\text{uniform normalized selected negativity}
\Longrightarrow
\text{nonzero persistent negative endpoint ray}.
}
```

**Dependencies:** WD-C3, WD-C5.

**Standing:** PROVED CONDITIONAL on the stated branch hypotheses.

---

## 3. Representative blow-up

Define the rescaled physical representatives

```math
h_n
:=
\varepsilon_n^{-1}g_n.
```

Then

```math
\mathcal E_{\Pi,t_n}^{*}h_n
=
z_n,
```

while

```math
\boxed{
\|h_n\|
=
\varepsilon_n^{-1}
\to\infty.
}
```

This is the normalized endpoint-amplification morphology.

The divergence above is direct from the selected-amplitude normalization and does not require identifying the varying maps $\mathcal E_{\Pi,t}^*$ with the single common realization map used in WD-C7.

A stronger statement—every increasingly accurate physical representation of the endpoint ray must blow up—follows from WD-C7 only if the selected support filtration is additionally realized by one common bounded map

```math
T:\mathscr H\to K,
\qquad
\mathcal A_{\Pi,t}=\overline{T(\mathscr H_t)},
```

with the right-continuous nested physical spaces required there.

---

### P3-N2 — Boundary-amplification conclusion

For the normalized witnesses in the P3-N1 setup,

```math
h_n=\varepsilon_n^{-1}g_n
```

satisfies

```math
\|h_n\|\to\infty.
```

If the additional common-carrier hypotheses of WD-C7 hold, then every increasingly accurate right-endpoint representation of the new endpoint vector is likewise unbounded.

**Dependencies:** direct normalization; WD-C7 only for the stronger common-carrier statement.

**Standing:** PROVED CONDITIONAL on P3-N1 setup, with the universal-representation version conditional on the WD-C7 realization hypotheses.

---

## 4. Selected and full Weil negativity

For the selected signed form,

```math
Q_{\Pi,t_n}(g_n)
=
\varepsilon_n^2
[z_n,z_n]_J.
```

Therefore

```math
\boxed{
\frac{
Q_{\Pi,t_n}(g_n)
}{
\varepsilon_n^2
}
\to
-\kappa.
}
```

Let

```math
B_\Pi
```

be the unselected negative divisor and define the normalized background response

```math
\boxed{
b_n
:=
\frac{
S_{B_\Pi,t_n}^{*}g_n
}{
\varepsilon_n
}.
}
```

The selected/full sign identity gives exactly

```math
\boxed{
\frac{
Q_W(g_n)
}{
\varepsilon_n^2
}
=
[z_n,z_n]_J
-
\|b_n\|^2.
}
```

Hence

```math
\boxed{
\limsup_{n\to\infty}
\frac{
Q_W(g_n)
}{
\varepsilon_n^2
}
\le
-\kappa.
}
```

Thus the branch does not consist of arbitrarily weak negativity after normalization by its selected coefficient amplitude.

The unselected negative background can only make the normalized full Weil form more negative.

---

### P3-N3 — Normalized full-Weil negativity

Every fixed-packet persistent negative branch carries full Weil witnesses whose normalized negativity is bounded away from zero:

```math
\boxed{
\limsup
Q_W(g_n)/\varepsilon_n^2
\le-\kappa.
}
```

**Dependencies:** WD-B1 + selected normalization.

**Standing:** PROVED CONDITIONAL on P3-N1 setup.

---

## 5. Background submorphology

The sequence

```math
b_n\in B_\Pi
```

creates a secondary compactness split.

### B1 — background escape

If either

```math
\|b_n\|\to\infty
```

or $b_n$ is bounded but its coefficient mass is not tail-tight, the branch carries infinite-background noncompactness.

### B2 — fixed full-divisor ray

If $b_n$ is bounded and coefficient-tail tight, then after a subsequence

```math
b_n\to b
```

strongly.

The limiting full coefficient vector is

```math
(a,u,b),
```

with signature

```math
\boxed{
\|a\|^2-\|u\|^2-\|b\|^2
\le
-\kappa-\|b\|^2
<0.
}
```

Thus the background alternative is:

```math
\boxed{
\text{background escape}
\quad\text{or}\quad
\text{fixed full-divisor negative ray}.
}
```

This submorphology will be normalized separately in H1-P3.2.

---

## 6. Selected raw source

Take the nonzero selected negative coordinate

```math
u\in M_\Pi.
```

Undo the canonical Weil pair diagonalization and let

```math
v=(v_j)_{\rho_j\in\Pi}
```

be the corresponding raw selected residue vector.

By ZW1-T7,

```math
\boxed{
v\ne0,
\qquad
\mathbf{1}^Tv=0.
}
```

Define

```math
R_v(z)
=
\sum_{\rho_j\in\Pi}
\frac{v_j}{z-\rho_j}.
```

Then ZW1-T8 gives

```math
\boxed{
R_v(z)
=
O(|z|^{-2}).
}
```

The inverse-square order is the universal pair-geometric order; no source-free $O(z^{-3})$ upgrade is available.

---

### P3-N4 — Zero-moment source theorem

Every fixed-packet persistent negative endpoint ray determines a nonzero finite selected source satisfying

```math
\boxed{
\mathbf{1}^Tv=0
}
```

and hence

```math
\boxed{
R_v(z)=O(|z|^{-2}).
}
```

**Dependencies:** ZW1-T7, ZW1-T8.

**Standing:** PROVED CONDITIONAL on P3-N1 setup.

---

## 7. Selected-preserving scalarization

For the fixed nonzero source $v$, choose a bounded selected-preserving multiplier $\psi$ as in ZW2-T1:

```math
\boxed{
\mathcal C_v[\psi]=0.
}
```

The scalar explicit formula then reads

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

No KPH null equation is assumed here.

No reciprocal-Cauchy packet structure is assumed.

No uniform projective source margin over a moving packet family is imported.

---

## 8. Distant complement disappears

For a radius $R$, define

```math
\mathcal F_{v,R}[\psi]
=
\sum_{\substack{\mu\notin\Pi\\
|\Im\mu-T_\Pi|\ge R}}
m_\mu\psi(\mu)R_v(\mu).
```

ZW2-T2 gives

```math
\boxed{
\mathcal F_{v,R}[\psi]
=
O_{v,\psi,\Pi}
\left(
\frac{\log R}{R}
\right).
}
```

Therefore

```math
\boxed{
\mathcal F_{v,R}[\psi]\to0.
}
```

For every $\eta>0$, one can choose a finite $R$ such that

```math
|\mathcal F_{v,R}[\psi]|<\eta.
```

Thus any complementary-divisor dependence that remains after selected scalarization can be localized, up to arbitrarily small error, to a finite/intermediate neighborhood of the selected packet.

---

### P3-N5 — Finite-neighborhood localization theorem

For every fixed persistent negative source and fixed bounded selected-preserving multiplier,

```math
\boxed{
\text{complementary divisor response}
=
\text{finite/intermediate response}
+
o_{R\to\infty}(1).
}
```

Quantitatively,

```math
\boxed{
\text{far error}
=
O((\log R)/R).
}
```

**Dependencies:** ZW2-T1, ZW2-T2.

**Standing:** PROVED CONDITIONAL on P3-N4 source.

---

## 9. Completed $\Xi$ next-jet morphology

Define

```math
H_v(z)
=
\Xi(z)R_v(z).
```

If $\mu\notin\Pi$ is a complementary zero of multiplicity $m_\mu$, ZW2-T3 gives

```math
R_v(\mu)
=
\frac{
H_v^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
```

Hence the localized complementary field is

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\substack{\mu\notin\Pi\\
|\Im\mu-T_\Pi|<R}}
m_\mu\psi(\mu)
\frac{
H_v^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

This is the exact arithmetic morphology of the complementary divisor seen by the selected source.

---

### P3-N6 — Weighted next-jet morphology theorem

Every fixed-packet persistent negative endpoint defect admits a nonzero finite zero-moment selected source $v$ such that, for each fixed bounded selected-preserving multiplier $\psi$, the complementary-divisor response decomposes into the weighted finite/intermediate next-jet field

```math
\boxed{
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{
H_v^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

plus the far remainder $\mathcal F_{v,R}[\psi]$, which tends to zero at the rate supplied by P3-N5 as $R\to\infty$.

**Dependencies:** P3-N4, P3-N5, ZW2-T3, ZW2-T4.

**Standing:** PROVED CONDITIONAL on P3-N1 setup.

---

## 10. What P3-N6 does not say

P3-N6 is a localization and representation theorem.

It does **not** assert, without an additional source-margin hypothesis, that

```math
|\mathcal N_{v,R}[\psi]|
```

is uniformly bounded below.

It does **not** import:

- KPH nullity;
- CF-A17 shape compactness;
- reciprocal-Cauchy eigenvector structure;
- a packet-uniform prime-band margin;
- a microscopic moat separating selected and complementary zeros.

Those belong to stronger special packet classes or to downstream actual-zeta questions.

What P3-N6 does say is exact:

> for a fixed selected source and fixed bounded selected-preserving multiplier, the complementary-divisor contribution is the near weighted next-jet field plus a far remainder that vanishes as the cutoff tends to infinity.

---

## 11. Adaptive cancellation is not an escape

Fix a cutoff $R$. Suppose the selected-preserving multiplier is additionally chosen so that

```math
\mathcal N_{v,R}[\psi]
=
\mathcal A_v[\psi].
```

ZW2-T5 forces, at that same cutoff,

```math
\boxed{
\mathcal P_v[\psi]
=
\mathcal F_{v,R}[\psi].
}
```

Thus cutoffwise adaptive annihilation of the near-minus-archimedean field does not leave an independent prime term.

If the same fixed multiplier satisfies the cancellation along cutoffs tending to infinity, then

```math
\mathcal F_{v,R}[\psi]\to0.
```

The same tail conclusion holds for a varying multiplier family only under the uniform boundedness required by WD-T31/WD-T33.

No statement is made for an arbitrarily varying unbounded adaptive family.

---

### P3-N7 — No adaptive scalar bypass

Within the selected-preserving scalar explicit formula,

```math
\boxed{
\text{cutoffwise adaptive near cancellation}
\Longrightarrow
\text{prime term equals the corresponding far tail}.
}
```

**Dependencies:** ZW2-T5.

**Standing:** PROVED.

---

## 12. Negative morphology theorem

Collecting P3-N1 through P3-N7:

### H1-P3.0 Negative Defect Morphology Theorem

Assume:

1. $\Pi$ is a fixed finite selected off-axis packet;
2. $\mathcal A_{\Pi,c}$ is $J$-nonnegative;
3. $t_n\downarrow c$;
4. $g_n$ are unit physical vectors;
5. $\varepsilon_n=\|\mathcal E_{\Pi,t_n}^{*}g_n\|\to0$;
6. the normalized selected vectors
   ```math
   z_n
   =
   \mathcal E_{\Pi,t_n}^{*}g_n/\varepsilon_n
   ```
   satisfy
   ```math
   [z_n,z_n]_J\to-\kappa
   ```
   for some $\kappa>0$.

Then, after passage to a subsequence:

### Endpoint geometry

There exists a nonzero persistent negative endpoint ray

```math
\boxed{
y=(a,u)
\in
\mathcal A_{\Pi,c+}
\setminus
\mathcal A_{\Pi,c},
\qquad
[y,y]_J\le-\kappa.
}
```

The explicitly normalized representatives $h_n=\varepsilon_n^{-1}g_n$ have diverging norm. A universal representation-cost statement additionally requires the common-carrier hypotheses of WD-C7.

### Full Weil signature

The full Weil witnesses satisfy

```math
\boxed{
\limsup
\frac{
Q_W(g_n)
}{
\varepsilon_n^2
}
\le
-\kappa.
}
```

### Selected source

The negative coordinate $u$ determines a nonzero finite raw source $v$ with

```math
\boxed{
\mathbf{1}^Tv=0,
\qquad
R_v(z)=O(|z|^{-2}).
}
```

### Arithmetic localization

For any fixed bounded selected-preserving multiplier $\psi$,

```math
\boxed{
\mathcal F_{v,R}[\psi]
=
O((\log R)/R).
}
```

Therefore, up to an arbitrarily small far-tail error, the complementary divisor is seen only through

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{
H_v^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

Cutoffwise adaptive cancellation of this field collapses the prime term onto the corresponding far tail; an asymptotic tail conclusion requires a fixed or uniformly bounded multiplier family.

---

## 13. Exact stop line

The morphology theorem is complete at the point where the finite/intermediate field has been isolated.

The theorem does **not** prove that actual zeta forbids

```math
\mathcal N_{v,R}[\psi].
```

The downstream question is:

> Can the actual complementary zeta divisor realize the weighted reciprocal $\Xi^{(m)}$ next-jet geometry required by the selected source, with the quantifiers demanded by the application?

That is

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}.
}
```

For the special KPH/reciprocal-Cauchy packet class, a stronger sufficient interface for closing the same packetwise branch is

```math
\boxed{
\texttt{C-ACTUAL-KPH-FLOOR}.
}
```

Both are outside the H1-P3.0 theorem.

---

## 14. Dependency chain

The negative morphology theorem consumes:

```math
\boxed{
\begin{array}{c}
\text{WD-C5 / fixed-sector persistence}\\
\downarrow\\
\text{direct selected-amplitude blow-up}\\
\downarrow\\
\text{WD-C7 only under common-carrier realization}\\
\downarrow\\
\text{WD-B1 / selected-full negativity}\\
\downarrow\\
\text{ZW1-T7,T8 / zero moment and far order}\\
\downarrow\\
\text{ZW2-T1,T2 / scalarization and far-tail localization}\\
\downarrow\\
\text{ZW2-T3,T4 / completed-}\Xi\text{ next jet}\\
\downarrow\\
\text{ZW2-T5 / no adaptive bypass}.
\end{array}
}
```

No RH-facing exclusion theorem appears above the stop line.

---

## H1-P3.0 determination

The negative branch is now packaged as a single auditable morphology theorem.

Its output is not “RH is false” or “RH is true.”

Its output is:

```math
\boxed{
\text{if a fixed selected negative defect persists at the endpoint,}
}
```

then the theorem yields, under its stated hypotheses:

1. a negative endpoint jump;
2. explicit selected-amplitude-normalized representatives whose norms diverge;
3. normalized full-Weil negativity bounded away from zero;
4. a nonzero finite zero-moment selected source;
5. inverse-square far decay;
6. quantitative elimination of the distant divisor;
7. a weighted finite/intermediate completed $\Xi$ next-jet field.

If the support filtration is additionally realized through the common bounded carrier required by WD-C7/WD-T19, the stronger universal representation-cost blow-up statement also follows. Separately, WD-T33 shows that the scalar explicit-formula balance supplies no independent adaptive prime bypass under the fixed/uniformly bounded multiplier hypotheses.

That is the complete Horizon-1 negative defect morphology at its stated stop line.

---

## Historical handoff from H1-P3.0

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P3.1 / NEUTRAL DEFECT MORPHOLOGY THEOREM}
}
```
