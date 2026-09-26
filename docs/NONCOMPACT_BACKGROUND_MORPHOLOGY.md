# Noncompact Background Morphology Theorem
**H1-P3.2 — Moving selected custody, unselected-background escape, and full-divisor limits**

This document packages the noncompact mechanisms left outside the fixed-packet negative and neutral morphology theorems.

There are two distinct kinds of noncompactness:

```math
\boxed{
\text{selected-sector noncompactness}
}
```

and

```math
\boxed{
\text{background-sector noncompactness}.
}
```

They have different consequences.

A moving selected sector can erase every nonzero selected weak limit.

An escaping unselected background cannot erase a negative ray already anchored in one fixed finite selected packet. Bounded tail escape can still admit a fixed full-divisor negative weak limit, but it prevents strong background compactness; norm escape may prevent even a bounded full-coefficient weak limit.

---

## 1. Coordinate framework

Let the full coefficient space be

```math
K
=
K_{+}
\oplus
K_{-}.
```

For a fixed finite selected packet $\Pi$, split

```math
K_{-}
=
M_\Pi
\oplus
B_\Pi,
```

where

- $M_\Pi$ is the finite selected negative sector;
- $B_\Pi$ is the unselected negative background.

Let

```math
Q_R^-
```

be an increasing family of finite-rank coordinate projections on $K_{-}$ satisfying

```math
Q_R^-\to I
```

strongly.

Likewise let

```math
Q_R^B
```

be the corresponding exhaustion on $B_\Pi$.

---

## 2. Selected-sector custody versus escape

Consider normalized coefficient vectors

```math
w_n\in K,
\qquad
\|w_n\|=1,
```

carrying negative or near-critical signature, and suppose their physical synthesis tends to zero:

```math
\|Sw_n\|\to0.
```

This is the abstract zero-edge situation.

Because the unit ball is weakly compact, after a subsequence

```math
w_n\rightharpoonup w.
```

If $S$ is compact, then

```math
Sw_n\to Sw
```

strongly, hence

```math
Sw=0.
```

The decisive question is whether

```math
w\ne0.
```

---

### P3-B1 — Anchored coefficient mass produces an exact relation

Assume there is a fixed finite-rank coordinate projection $Q_R$ such that

```math
\boxed{
\limsup_{n\to\infty}
\|Q_Rw_n\|
>0.
}
```

Then every weakly convergent subsequence with this lower bound has

```math
\boxed{
w\ne0.
}
```

If additionally

```math
Sw_n\to0,
```

then

```math
\boxed{
Sw=0,
\qquad
w\ne0.
}
```

### Proof

Finite dimensionality gives

```math
Q_Rw_n\to Q_Rw
```

strongly along the weakly convergent subsequence.

The positive lower bound implies

```math
Q_Rw\ne0.
```

Hence $w\ne0$.

Boundedness of $S$ gives weak convergence

```math
Sw_n\rightharpoonup Sw,
```

while strong convergence to zero forces $Sw=0$.

**Standing:** PROVED.

### Interpretation

A fixed finite coordinate anchor converts zero-edge approximation into an exact nonzero coefficient relation.

This is the coefficient-custody mechanism behind finite-exception compactness.

---

### P3-B2 — Moving-sector escape

Suppose instead that for the full coefficient exhaustion, every fixed finite coordinate block vanishes:

```math
\boxed{
Q_Rw_n\to0
\qquad
\text{for every fixed }R.
}
```

Then

```math
\boxed{
w_n\rightharpoonup0.
}
```

Thus it is possible to have

```math
\|w_n\|=1,
\qquad
\|Sw_n\|\to0,
```

while

```math
\boxed{
\ker S=\{0\}
}
```

and no nonzero limiting coefficient relation survives.

This is the **full coefficient moving-sector escape** morphology. Escape of the selected negative coordinates alone is not enough to conclude $w_n\rightharpoonup0$ if some positive coefficient block remains anchored.

**Standing:** PROVED as a Hilbert-space compactness classification; realized explicitly by WD-E5 and the toy compact diagonal model.

### Canonical toy model

For

```math
Ae_n=\frac1n e_n,
```

we have

```math
\|Ae_n\|\to0,
\qquad
e_n\rightharpoonup0,
```

but

```math
\ker A=\{0\}.
```

The same geometry can occur when negative standing migrates through successively new off-axis coordinates.

---

## 3. Why finite selected packets eliminate moving selected escape

Now return to one fixed finite selected packet $\Pi$.

Let

```math
z_n=(a_n,u_n)
```

be normalized selected coefficient vectors with

```math
u_n\in M_\Pi.
```

Because

```math
\dim M_\Pi<\infty,
```

any sequence with nontrivial selected negative norm has, after passage to a subsequence,

```math
u_n\to u
```

strongly with

```math
u\ne0.
```

Therefore the fixed selected packet supplies an automatic finite coordinate anchor.

---

### P3-B3 — Fixed-packet custody theorem

For a fixed finite selected packet, any sequence satisfying

```math
\limsup_{n\to\infty}\|u_n\|>0
```

has a subsequence on which the selected negative coordinate converges strongly to a nonzero

```math
u\in M_\Pi.
```

Consequently, **full coefficient** moving-sector escape P3-B2 is impossible on any fixed-packet branch whose selected negative norm stays bounded away from zero.

Any loss of selected custody of that type must instead come from changing the selected packet, replacing it by an infinite selected sector, or allowing the selected negative norm itself to vanish.

**Dependencies:** WD-C3, WD-C4, P3-B1.

**Standing:** PROVED.

### Consequence

The phrase

```math
\text{“approximate-neutral branch with no persistent ray”}
```

is globally meaningful only for a moving/infinite selected sector.

It is not a third fixed-packet morphology.

---

## 4. Full-divisor background after a fixed selected negative ray

Assume now the P3.0 fixed-packet negative setup.

Thus

```math
z_n=(a_n,u_n)\to y=(a,u)
```

in the selected right-limit sense, with

```math
[y,y]_J\le-\kappa
```

for some

```math
\kappa>0.
```

Let

```math
\varepsilon_n
```

be the selected amplitude normalization and define the normalized unselected negative response

```math
\boxed{
b_n
=
\frac{
S_{B_\Pi,t_n}^{*}g_n
}{
\varepsilon_n
}
\in B_\Pi.
}
```

The normalized full Weil identity is

```math
\boxed{
\frac{Q_W(g_n)}{\varepsilon_n^2}
=
[z_n,z_n]_J
-
\|b_n\|^2.
}
```

The selected ray is already anchored.

The only question is now the compactness of the background sequence $b_n$.

---

## 5. Background compactness taxonomy

Every sequence $b_n\in B_\Pi$ admits, after passage to a subsequence, one of the following regimes.

### B∞ — norm escape

```math
\boxed{
\|b_n\|\to\infty.
}
```

Then

```math
\frac{Q_W(g_n)}{\varepsilon_n^2}
\to-\infty
```

along that subsequence whenever

```math
[z_n,z_n]_J
```

remains bounded.

The normalized full negativity is increasingly carried by the unselected negative background.

---

### BT — bounded but non-precompact background

Assume

```math
\sup_n\|b_n\|<\infty
```

but the sequence is not precompact.

After a subsequence,

```math
b_n\rightharpoonup b
```

weakly.

Define the escaped background mass

```math
\boxed{
d_B
:=
\lim_{n\to\infty}\|b_n\|^2-\|b\|^2
\ge0
}
```

after selecting a further subsequence on which the norms converge.

Then

```math
d_B>0
```

is the weak norm loss carried by the unselected background.

Equivalently, with respect to a canonical finite-coordinate exhaustion, uniform tail tightness fails.

---

### BF — strong background compactness

If $b_n$ is bounded and uniformly coordinate-tail tight, then it is precompact in the $\ell^2$-type background coefficient space.

Hence after a subsequence

```math
\boxed{
b_n\to b
}
```

strongly.

This is the background-compact regime; combined with the already anchored selected ray it yields a fixed full-divisor negative weak limit. Full strong coefficient convergence still requires positive-coordinate compactness.

---

### P3-B4 — Background compactness trichotomy

For the normalized unselected background, after passage to a subsequence:

```math
\boxed{
\begin{array}{ll}
\textbf{B∞}:&
\|b_n\|\to\infty,\\[1mm]
\textbf{BT}:&
b_n\text{ bounded but with positive tail/weak norm loss},\\[1mm]
\textbf{BF}:&
b_n\to b\text{ strongly}.
\end{array}
}
```

The first two cases are collectively the **background-escape morphology**.

**Standing:** PROVED as Hilbert-space compactness classification.

---

## 6. Background escape cannot erase fixed selected negativity

Even in the bounded noncompact regime,

```math
b_n\rightharpoonup b,
```

the selected coordinates have already converged to

```math
y=(a,u)\ne0.
```

Hence the full weak coefficient limit is

```math
\boxed{
(a,u,b),
}
```

which remains nonzero because $u\ne0$.

Its full signature satisfies

```math
\begin{aligned}
[(a,u,b),(a,u,b)]_{\rm full}
&=
\|a\|^2-\|u\|^2-\|b\|^2\\
&\le
-\kappa-\|b\|^2\\
&<0.
\end{aligned}
```

Thus unselected-background weak escape does not destroy the fixed selected negative ray.

It only prevents strong convergence of the complete background coefficient vector.

---

### P3-B5 — Fixed-selected-ray stability under background escape

If a fixed selected negative ray survives with margin $\kappa>0$, then every bounded weak background limit produces a nonzero full weak coefficient ray with

```math
\boxed{
\text{full signature}
\le
-\kappa-\|b\|^2.
}
```

Therefore:

```math
\boxed{
\text{background noncompactness}
\not\Rightarrow
\text{loss of selected-ray custody}.
}
```

**Standing:** PROVED CONDITIONAL on the P3.0 fixed selected ray.

---

## 7. Strong full-divisor ray

In the BF regime,

```math
b_n\to b
```

strongly.

Then the selected negative coordinate and the unselected negative background converge strongly,

```math
u_n\to u,
\qquad
b_n\to b,
```

while the positive coordinate generally converges only weakly,

```math
a_n\rightharpoonup a.
```

Thus the normalized full coefficient vectors have the fixed weak limit

```math
\boxed{
Y_{\rm full}
=
(a,u,b).
}
```

with strong convergence on the entire negative sector.

Its signature is

```math
\boxed{
[Y_{\rm full},Y_{\rm full}]_{\rm full}
\le
-\kappa-\|b\|^2
<0.
}
```

Thus a fixed full-divisor negative **weak limit** survives. Strong convergence of the entire coefficient vector requires the additional hypothesis $a_n\to a$ strongly.

---

### P3-B6 — Fixed full-divisor negative-limit theorem

If the normalized unselected background is bounded and coefficient-tail tight, then after passage to a subsequence

```math
b_n\to b
```

strongly.

From the fixed selected-ray branch,

```math
u_n\to u
```

strongly while, in general,

```math
a_n\rightharpoonup a
```

only weakly.

Therefore the full coefficient vectors have the fixed weak limit

```math
\boxed{
Y_{\rm full}=(a,u,b),
}
```

and the entire negative sector converges strongly.

Its full signature satisfies

```math
\boxed{
[Y_{\rm full},Y_{\rm full}]_{\rm full}
\le
-\kappa-\|b\|^2
<0.
}
```

If one additionally knows

```math
a_n\to a
```

strongly, then the whole full-divisor coefficient vector converges strongly.

**Standing:** PROVED CONDITIONAL on the P3.0 fixed selected ray + background tail tightness; full strong convergence requires the additional positive-coordinate compactness hypothesis.

---


## 8. Finite positive shadows do not cure background noncompactness

Let

```math
P_F
```

be any finite-rank projection on the positive coefficient space.

For the fixed selected negative ray

```math
y=(a,u),
\qquad
\|u\|^2-\|a\|^2\ge\kappa,
```

we have

```math
\boxed{
\|u\|^2-\|P_Fa\|^2
\ge
\kappa.
}
```

Thus the negative signature is already visible on finitely many positive coordinates together with the selected packet.

But, as WD-B8 showed,

```math
(P_Fa,u)
```

need not remain in the relevant analysis space.

And finite positive projection gives no compactness control over

```math
b_n\in B_\Pi.
```

Therefore the genuinely infinite issue in the background morphology is **background custody**, not visibility of the selected negative margin.

---

### P3-B7 — Finite-shadow separation principle

Finite positive-coordinate shadows can certify the algebraic selected negative margin, but they neither preserve the full persistence relation nor make the unselected negative background compact.

**Dependencies:** WD-B8.

**Standing:** PROVED.

---

## 9. Global morphology classification

The completed H1-P3 theory now distinguishes three fundamentally different failure species.

### M1 — fixed-packet negative morphology

A fixed selected packet retains a negative endpoint ray.

This is P3.0 and terminates at the weighted next-jet interface.

### M2 — fixed-packet attained-neutral morphology

A fixed selected packet reaches an attained neutral mode with finite-exception unit gain.

This is P3.1 and terminates at the null-extension interface.

### M3 — noncompact coefficient morphology

Noncompactness occurs before a fixed-packet morphology can be fully anchored, or in the unselected background after anchoring.

It splits further into:

### M3a — moving selected-sector escape

```math
\boxed{
w_n\rightharpoonup0
}
```

with coefficient mass moving through new selected/off-axis coordinates.

No nonzero selected limiting relation survives.

### M3b — unselected-background escape

A fixed selected ray survives, but

```math
b_n
```

is norm-unbounded or bounded/non-tail-tight.

The selected morphology remains valid, while the full-divisor coefficient vector fails strong compactness.

### M3c — fixed full-divisor negative weak limit

The background is bounded and tail-tight, so

```math
b_n\to b
```

strongly and a fixed full negative weak limit survives. Full strong coefficient convergence requires positive-coordinate compactness as an additional hypothesis.

---

## 10. Noncompact Background Morphology Theorem

### H1-P3.2 Noncompact Background Morphology Theorem

### Selected-sector statement

For normalized zero-edge coefficient vectors in the stated finite-coordinate exhaustion:

- finite coordinate anchoring forces a nonzero exact limiting coefficient relation;
- escape from every fixed finite coordinate block permits weak convergence to zero and no exact anchored relation.

For one fixed finite selected packet **whose selected negative norm stays bounded away from zero**, the second alternative is impossible because the finite selected coordinate supplies an anchor.

Thus nonpersistence of an already anchored selected ray requires a moving/infinite selected sector. If the selected negative norm itself vanishes, the sequence has left the anchored fixed-packet regime rather than furnishing a counterexample to it.

### Background statement

Once a fixed selected negative ray has been anchored, the normalized unselected negative background has exactly three subsequential compactness regimes:

```math
\boxed{
\text{norm escape},
\quad
\text{bounded tail escape},
\quad
\text{fixed full-divisor negative weak limit}.
}
```

The first two are background-escape morphologies.

The third produces a fixed full-divisor negative weak limit with strong convergence on the negative sector; full strong convergence requires an additional positive-coordinate compactness hypothesis.

Background escape cannot erase the already anchored selected negative ray.

---

## 11. Relation to the Horizon-1 interfaces

P3.2 introduces **no new RH-facing theorem interface**.

It types where compactness can fail.

If a fixed selected negative ray is already present, the arithmetic stop remains

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}
}
```

from P3.0.

If a fixed selected neutral mode is present, the support stop remains

```math
\boxed{
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}
}
```

from P3.1.

If selected mass itself moves through infinitely many sectors and no fixed selected ray survives, then the system has not entered either fixed-packet morphology. That is a coefficient-custody/noncompactness species rather than an additional fixed-packet RH interface.

---

## 12. H1-P3 completion

H1-P3 now contains:

1. [Negative Defect Morphology Theorem](NEGATIVE_DEFECT_MORPHOLOGY.md);
2. [Neutral Defect Morphology Theorem](NEUTRAL_DEFECT_MORPHOLOGY.md);
3. [Noncompact Background Morphology Theorem](NONCOMPACT_BACKGROUND_MORPHOLOGY.md).

Together they classify:

```math
\boxed{
\begin{array}{c}
\text{fixed negative persistence}\\
\text{fixed attained-neutral persistence}\\
\text{moving selected-sector escape}\\
\text{unselected-background escape}\\
\text{fixed full-divisor negative weak limit}.
\end{array}
}
```

Therefore

```math
\boxed{
\textbf{H1-P3 — DEFECT MORPHOLOGY THEOREM: COMPLETE.}
}
```

---

## Historical handoff from H1-P3.2

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P4.0 / THEOREM LEDGER AND DEPENDENCY AUDIT}
}
```

H1-P4 should not add new mathematical claims.

It should normalize the theorem inventory into stable public labels, exact dependency edges, imported-source boundaries, and proof-audit status.
