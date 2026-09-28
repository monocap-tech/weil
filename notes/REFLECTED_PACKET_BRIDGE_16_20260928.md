# RPB-16 — Right-continuity of background screenability

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO-GO IN GENERAL / RIGHT-EDGE STABILITY REQUIRES EXTRA GAP+CONTINUITY INPUT**  
**Dependencies:** RPB-15; WD-C1–C9; WD-T39; ZW1-T9.  
**Promotion status:** none.

## 0. Objective

RPB-15 reduced the post-neutral ownership problem to the background-only defect

```math
D_{B,a}
=
S_{+,a}S_{+,a}^{*}
-
S_{B,a}S_{B,a}^{*}.
```

At the full neutral edge (c_*),

```math
D_{B,c_*}\succeq0
```

is automatic.

RPB-16 asks whether the compact/Hilbert–Schmidt structure of the native zero synthesis forces

```math
D_{B,a}\succeq0
```

for every (a) in some strict right neighborhood of (c_*).

It does not.

Endpoint screenability is not an open condition at a critical boundary, and compactness of the background synthesis controls coefficient tails rather than the support-parameter sign gap.

---

## 1. Analysis-space formulation

Let

```math
\mathcal A_{B,a}
```

be the analysis space for the positive channel together with the unselected negative background.

Then

```math
D_{B,a}\succeq0
```

is equivalent to

```math
\boxed{
\mathcal A_{B,a}
\text{ is }J\text{-nonnegative}.
}
```

As the physical support increases,

```math
\mathcal A_{B,s}
\subseteq
\mathcal A_{B,t}
\qquad
(s<t).
```

Thus background screenability can only be lost, not recovered, under support enlargement.

Define

```math
\mathcal A_{B,c+}
=
\bigcap_{a>c}
\mathcal A_{B,a}.
```

The abstract support-filtration theorem gives strong convergence of the corresponding orthogonal projections to the projection onto (mathcal A_{B,c+}).

But it does **not** identify

```math
\mathcal A_{B,c+}
=
\mathcal A_{B,c},
```

nor does such equality by itself imply a positive sign gap.

---

## 2. Endpoint nonnegativity is a closed, not open, condition

The positive cone of bounded self-adjoint operators is norm-closed.

But at a boundary point with lowest spectral value zero, arbitrarily small perturbations can create negative spectrum.

The scalar family

```math
D(a)
=
-(a-c)I
```

already has

```math
D(c)=0,
```

while

```math
D(a)<0
qquad
(a>c).
```

So even operator-norm continuity of a defect family does not preserve nonnegativity through a critical zero edge.

A strict positive margin is required.

---

## 3. Finite-rank compact sharpness model

The preceding observation can be realized directly in screening form.

Take

```math
\mathcal H
=
K_+
=
B
=
\mathbb C,
```

and define

```math
S_+=1,
```

```math
S_{B,a}
=
\sqrt{1+(a-c)}.
```

Then every synthesis operator is rank one, hence compact and Hilbert–Schmidt.

The background defect is

```math
\boxed{
D_{B,a}
=
1-
\left(1+(a-c)\right)
=
-(a-c).
}
```

Therefore

```math
D_{B,c}=0
```

is screenable at the endpoint, but

```math
\boxed{
D_{B,a}<0
\qquad
\forall a>c.
}
```

The family is even norm-continuous in (a).

Thus:

```math
\boxed{
\text{compact/Hilbert--Schmidt synthesis}
+
\text{norm continuity}
+
\text{endpoint criticality}
\not\Rightarrow
\text{right-edge screenability}.
}
```

---

## 4. Right-continuous analysis spaces still do not suffice

One might hope that the failure above comes only from a discontinuous analysis-space jump.

That is also false.

Use the WD-E5 moving-sector geometry.

Let

```math
K_+
=
B
=
\ell^2(\mathbb N)
```

with standard basis (e_n), and choose

```math
r_n>1,
\qquad
r_n\downarrow1.
```

Define

```math
y_n
=
\frac{
(e_n,r_ne_n)
}{
\sqrt{1+r_n^2}
}.
```

Then

```math
[y_n,y_n]_J
=
\frac{1-r_n^2}{1+r_n^2}
<0
```

and

```math
[y_n,y_n]_J\to0.
```

Choose support parameters

```math
a_n
=
c+\frac1n
```

and define

```math
\mathcal A_{B,a_n}
=
\overline{
\operatorname{span}
\{y_k:k\ge n\}
}.
```

Then

```math
\mathcal A_{B,a_{n+1}}
\subseteq
\mathcal A_{B,a_n},
```

each strict right stage contains negative vectors, but

```math
\boxed{
\bigcap_n
\mathcal A_{B,a_n}
=
\{0\}.
}
```

Take the endpoint space

```math
\mathcal A_{B,c}
=
\{0\}.
```

Then

```math
\boxed{
\mathcal A_{B,c+}
=
\mathcal A_{B,c},
}
```

so the analysis filtration is right-continuous at the endpoint.

Nevertheless every strict right stage is negative.

Thus:

```math
\boxed{
\text{analysis-space right continuity}
\not\Rightarrow
\text{background right-edge screenability}
}
```

for an infinite negative background.

The negative directions can move to infinity while their margins collapse to zero.

---

## 5. The moving-background example admits a compact common realization

The previous example is compatible with the compact-realization philosophy.

Let the physical carrier be

```math
\mathscr H
=
\ell^2(\mathbb N)
```

with basis (f_n), and choose

```math
\alpha_n>0,
\qquad
\alpha_n\to0.
```

Define a common bounded operator

```math
T f_n
=
\alpha_n y_n.
```

Then (T) is compact.

Let

```math
\mathscr H_{a_n}
=
\overline{
\operatorname{span}
\{f_k:k\ge n\}
}.
```

Because each (alpha_k\ne0),

```math
\overline{
T(\mathscr H_{a_n})
}
=
\mathcal A_{B,a_n}.
```

Also

```math
\bigcap_n
\mathscr H_{a_n}
=
\{0\}.
```

Hence the support filtration is realized by one common **compact** physical map and is right-continuous at the physical level, yet screenability fails at every strict right stage.

Therefore compactness of the native zero synthesis is not the missing theorem.

---

## 6. Two distinct immediate-failure mechanisms

Immediate failure

```math
c_B=c_*
```

can therefore arise in two conceptually different ways.

### B-Crit — fixed background critical crossing

A fixed finite/background direction is already critical at the endpoint and becomes over-budget immediately afterward.

This can occur even in finite dimension and under norm continuity.

### B-Esc — moving background escape

No one negative background direction persists.

Instead, negative directions move to successively higher coordinates with margins tending to zero.

The endpoint/right-limit analysis space may remain nonnegative or even trivial.

This is the background analogue of the moving-sector morphology already isolated in WD-T39.

Both mechanisms are compatible with endpoint screenability.

---

## 7. What would be sufficient for right-edge stability

A genuine right-neighborhood theorem requires more than

```math
D_{B,c}\succeq0.
```

One sufficient package is:

1. a **strict background screening margin**
   ```math
   D_{B,c}
   \succeq
   \eta I
   ```
   on the relevant physical carrier for some (eta>0); and
2. operator-norm continuity
   ```math
   \|D_{B,a}-D_{B,c}\|
   \to0
   qquad
   (a\downarrow c).
   ```

Then for sufficiently small (a-c),

```math
D_{B,a}
\succeq
\frac\eta2 I.
```

Equivalently, in screening coordinates, it is enough to have

```math
\|X_{B,c}\|
\le
1-\varepsilon
```

and norm-continuity of the reduced background screening family.

Horizon 1 currently proves neither such strict endpoint margin nor this support-parameter norm continuity for the actual zeta background.

---

## 8. Compactness cannot manufacture the missing margin

ZW1-T9 gives, at every fixed support, a Hilbert–Schmidt synthesis and high-zero tail control.

This supplies:

- compactness;
- finite-head approximation;
- small high-height covariance tails.

It does **not** supply a lower bound of the form

```math
D_{B,c}
\succeq
\eta I.
```

Nor does compactness exclude a sequence of background negative directions whose negative margins tend to zero while their coordinate support escapes.

Thus:

```math
\boxed{
\text{tail compactness}
\neq
\text{screening-gap stability}.
}
```

This is the exact reason RPB-15 cannot be completed using ZW1-T9 alone.

---

## 9. Consequence for the neutral-to-negative bridge

RPB-15 remains exact:

```math
\text{post-plateau full negativity}
\Longrightarrow
\begin{cases}
\text{fixed residual selected custody},
&
D_B\succeq0,
\\
\text{background defect},
&
D_B\not\succeq0.
\end{cases}
```

RPB-16 now shows that the second case cannot be excluded abstractly, even arbitrarily close to the endpoint.

Therefore no theorem chain presently gives

```math
D_{B,c_*}\succeq0
\Longrightarrow
D_{B,a}\succeq0
\text{ on a right neighborhood}.
```

The background-screenability boundary may satisfy

```math
\boxed{
c_B=c_*.
}
```

---

## 10. Relation to the earlier fixed-packet/moving-tail questions

If background screenability fails immediately, RPB-12 still says every strict negative witness at a fixed support is finitely capturable.

But RPB-16 shows why the capturing packet may fail to stabilize:

- in B-Crit, one fixed background packet may become critical and then negative;
- in B-Esc, the sign may migrate through successively higher negative channels with no fixed finite owner.

Thus the unresolved background branch naturally re-enters the existing noncompact morphology classification.

What is new is its location: it can arise specifically as the first obstruction after an attained neutral plateau.

---

## 11. Exact remaining question

There is no longer a generic functional-analytic route to prove background right-edge stability.

Any improvement must use actual zeta structure.

The next natural test is:

> Does the actual zeta background at a finite-exception neutral edge possess a **strict residual screening gap** after the endpoint selected neutral channel is removed?

Equivalently, can one show that the background reduced screening norm satisfies

```math
\boxed{
\|X_{B,c_*}\|<1
}
```

with a quantitative margin?

If yes, one must then establish enough support-parameter continuity to propagate that margin.

If the norm is already (1), immediate background failure is structurally possible.

This is a new, precisely typed finite-edge question.

---

## 12. RPB-16 determination

```math
\boxed{
\textbf{RPB-16 — BACKGROUND SCREENABILITY IS NOT AUTOMATICALLY RIGHT-STABLE.}
}
```

Specifically:

```math
\boxed{
D_{B,c_*}\succeq0
+
\text{compact/Hilbert--Schmidt synthesis}
\not\Rightarrow
\exists\delta>0:
D_{B,a}\succeq0
\ \forall a\in[c_*,c_*+\delta).
}
```

Even:

```math
\boxed{
\text{right-continuous analysis spaces}
+
\text{common compact realization}
}
```

do not suffice in an infinite background sector.

A strict screening margin plus strong enough norm-continuity would suffice, but those are new inputs.

Next cursor:

```text
RPB-17 / ACTUAL-ZETA BACKGROUND SCREENING GAP AT THE NEUTRAL EDGE
```
