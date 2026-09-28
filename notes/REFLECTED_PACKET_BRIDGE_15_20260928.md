# RPB-15 — Background-driven negativity at the neutral edge

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / BACKGROUND-SCREENABILITY DICHOTOMY / RPB-14 NARROWED**  
**Dependencies:** RPB-10 through RPB-14; WD-B1, WD-B4, WD-B5, WD-T39.  
**Promotion status:** none.

## 0. Objective

RPB-14 asked whether the original endpoint selected packet must itself become negative when the full compact-window Weil form crosses below zero.

A custody audit shows that this question must be posed in the **background-reduced representation**, not by directly comparing the raw selected form with the full form.

The finite-exception neutral operator used in the neutral branch is already a residual/effective defect after the allowed background reductions.

Therefore the correct question is:

> Does the unselected negative background remain contractively screenable immediately to the right of the neutral edge?

If yes, WD-B4 absorbs it into the residual positive budget and the same fixed finite selected sector owns the full negative sign.

If no, the background itself becomes the negative obstruction.

This produces an exact two-branch classification.

---

## 1. Additive custody correction to RPB-14

RPB-14 introduced a raw selected/background decomposition

```math
D_{\rm full}
=
D_M
-
S_BS_B^*
```

and then discussed the endpoint selected neutral packet as though the finite-exception unit-gain relation were automatically a neutral vector of that **raw selected** problem.

That identification is too strong without an additional hypothesis.

The Horizon-1 finite-exception neutral chain uses a reduced/effective problem of the type supplied by WD-B4:

```math
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^{*}
-
S_MS_M^{*},
```

after a contractively screenable background has consumed part of the positive budget.

Thus the endpoint unit-gain relation

```math
C_c^*C_cu=u
```

belongs to the **residual selected problem**.

It need not be a neutral vector for the raw selected form

```math
S_+S_+^*
-
S_MS_M^*.
```

Accordingly, the RPB-14 raw selected crossing support (c_\Pi) is retained only as a conditional/raw-coordinate construction.

It is not the load-bearing neutral-to-negative object unless the neutral relation is separately proved to live before background elimination.

Historical RPB-14 text is left unchanged; this pass is the additive correction.

---

## 2. Endpoint full nonnegativity forces background screenability

At the plateau endpoint (c_*), the full compact-window Weil form is nonnegative:

```math
\boxed{
D_{\rm full,c_*}\succeq0.
}
```

Split the negative coefficient space relative to the finite endpoint selected packet:

```math
K_-
=
M_\Pi
\oplus
B_\Pi.
```

Write the full negative synthesis as

```math
S_-
=
[S_M\;S_B].
```

Since the full defect is nonnegative, WD-A2 supplies a contractive full screening map

```math
X:
M_\Pi\oplus B_\Pi
\to
K_+.
```

Restricting (X) to the background sector gives a contraction

```math
X_B:
B_\Pi
\to
K_+
```

with

```math
S_B=-S_+X_B.
```

Hence:

```math
\boxed{
D_{B,c_*}
=
S_+S_+^*
-
S_BS_B^*
\succeq0.
}
```

So the background is contractively screenable at the neutral edge.

This is automatic from full endpoint nonnegativity.

---

## 3. Right of the edge: exact background-screenability split

Fix

```math
a>c_*,
```

so the full form is negative:

```math
D_{\rm full,a}
\not\succeq0.
```

There are exactly two cases.

### Case A — background remains contractively screenable

Assume

```math
D_{B,a}
=
S_{+,a}S_{+,a}^{*}
-
S_{B,a}S_{B,a}^{*}
\succeq0.
```

Then WD-B4 applies.

Let (X_{B,a}) be the reduced background screening solution and define

```math
R_{B,a}
=
I-X_{B,a}X_{B,a}^{*},
```

```math
S_{{\rm eff},a}
=
S_{+,a}R_{B,a}^{1/2}.
```

Then exactly

```math
\boxed{
D_{\rm full,a}
=
S_{{\rm eff},a}S_{{\rm eff},a}^{*}
-
S_{M,a}S_{M,a}^{*}.
}
```

Since the left side is negative somewhere, the reduced selected defect on the right is negative.

Therefore:

```math
\boxed{
\text{background screenable}
+
\text{full negativity}
\Longrightarrow
\text{fixed finite residual selected negativity}.
}
```

The same finite selected sector (M_\Pi) owns the sign after legitimate background elimination.

There is no separate "background-only" sign once the background has been paid for.

---

## 4. Finite selected sector classification after elimination

Because

```math
\dim M_\Pi<\infty,
```

the reduced selected defect is governed by WD-B5.

If the selected negative synthesis is exactly screenable through (S_{{\rm eff},a}), let

```math
Y_a:
M_\Pi
\to
(\ker S_{{\rm eff},a})^\perp
```

be the reduced residual screening map.

Then

```math
\operatorname{ind}_-
=
\#\{j:\sigma_j(Y_a)>1\}.
```

Since the full defect is negative,

```math
\boxed{
\|Y_a\|>1
}
```

for at least one residual singular direction.

If exact range inclusion fails instead, the fixed selected sector has a residual range defect.

Thus Case A produces genuine fixed finite selected custody in either form:

```math
\boxed{
\text{over-budget residual screening}
\quad\text{or}\quad
\text{residual selected range defect}.
}
```

This is the correct selected object, not the raw form obtained by deleting the background term.

---

## 5. Case B — background itself loses screenability

Assume instead

```math
D_{B,a}
\not\succeq0.
```

Then, by WD-A1/WD-A2, the background-only analysis problem already has a negative defect:

```math
\boxed{
\text{the unselected negative background itself is unscreened or over-budget}.
}
```

In this case WD-B4 cannot be used to absorb the whole background into a residual positive budget.

The owner of the first negative sign may therefore lie in the infinite background sector before the finite endpoint selected packet can be isolated.

This is the genuine background-driven branch.

---

## 6. Pointwise finite capture inside an unscreenable background

Even in Case B, strict background negativity at one fixed support is not literally irreducibly infinite-coordinate.

Let (h) satisfy

```math
\langle D_{B,a}h,h\rangle<0.
```

Then

```math
\|S_{B,a}^{*}h\|^2
>
\|S_{+,a}^{*}h\|^2.
```

Since

```math
S_{B,a}^{*}h
\in
B_\Pi\cong\ell^2,
```

a sufficiently large finite background head (P_G^B) satisfies

```math
\boxed{
\|P_G^BS_{B,a}^{*}h\|^2
>
\|S_{+,a}^{*}h\|^2.
}
```

Thus each fixed unscreenable-background witness is captured by a finite enlarged negative packet.

As in RPB-12, the capture height can nevertheless drift to infinity as

```math
a\downarrow c_*.
```

So the true escape mechanism is moving custody, not literal pointwise infinite support.

---

## 7. Background screenability boundary

Define

```math
\boxed{
c_B
=
\inf
\left\{
a\ge c_*:
D_{B,a}
\not\succeq0
\right\},
}
```

with

```math
c_B=+\infty
```

if the background remains screenable forever.

Endpoint nonnegativity gives

```math
D_{B,c_*}\succeq0.
```

Therefore

```math
\boxed{
c_B\ge c_*.
}
```

The post-plateau branch is then typed as follows.

### If (c_B>c_*)

For every

```math
c_*<a<c_B,
```

the background is screenable while the full form is negative.

Hence the original finite selected sector has residual selected custody throughout this interval.

### If (c_B=c_*)

Background screenability can fail arbitrarily close to the full crossing.

Then the first strict negative sign need not admit one fixed residual selected reduction.

This is the only genuine immediate background-driven escape.

### If (c_B=\infty)

Every post-plateau full negative form is representable as a fixed finite selected residual defect after background elimination.

---

## 8. Shared-budget interpretation

This classification is exactly the shared-budget geometry of WD-B3/WD-B4.

If both selected and background channels individually factor through (S_+),

```math
S_M=-S_+X_M,
\qquad
S_B=-S_+X_B,
```

then

```math
D_{\rm full}
=
S_+
\left(
I
-
X_MX_M^*
-
X_BX_B^*
\right)
S_+^*.
```

The full crossing can occur even while the raw selected channel remains individually contractive.

But after the background is consumed, the remaining selected channel is tested against

```math
R_B
=
I-X_BX_B^*,
```

not against the original unit budget.

So a change that appears "background-driven" in raw coordinates becomes

```math
\boxed{
\text{selected over-budget relative to the residual budget}
}
```

whenever (B) remains contractively screenable.

This is not relabeling; it is the exact WD-B4 factorization.

---

## 9. Sharp scalar model

Take

```math
S_+=1,
```

and scalar selected/background screening coefficients

```math
X_M=r,
\qquad
X_B=s(a),
```

with

```math
0<r<1.
```

The full defect is

```math
D_{\rm full}(a)
=
1-r^2-s(a)^2.
```

Choose the endpoint so that

```math
r^2+s(c_*)^2=1.
```

The selected raw channel alone remains strictly screenable:

```math
r<1.
```

Now increase (s(a)) slightly while keeping

```math
s(a)<1.
```

Then the background remains individually screenable, but

```math
D_{\rm full}(a)<0.
```

After background elimination,

```math
R_B(a)
=
1-s(a)^2,
```

and the residual selected screening coefficient is

```math
Y(a)
=
\frac{r}{\sqrt{1-s(a)^2}}.
```

At the endpoint,

```math
Y(c_*)=1,
```

while immediately afterward,

```math
\boxed{
Y(a)>1.
}
```

Thus raw-coordinate background depletion and residual selected over-budget crossing are the same event under WD-B4.

---

## 10. Consequence for RPB-14

RPB-14 correctly emphasized that raw selected negativity is not forced by full negativity.

The narrower load-bearing statement is now:

```math
\boxed{
\text{raw selected negativity need not occur},
}
```

but

```math
\boxed{
\text{residual selected negativity does occur whenever the background remains screenable}.
}
```

Accordingly, the useful crossing object is not the raw selected support (c_\Pi) by itself.

It is the pair

```math
\boxed{
(c_*,c_B)
}
```

together with the residual selected screening family on the region where

```math
a<c_B.
```

---

## 11. Relation to WD-T37

Case A gives one fixed finite selected sector carrying every post-plateau full negative sign after background elimination.

However this alone does not yet supply all WD-T37 hypotheses at the edge.

As

```math
a\downarrow c_*,
```

the residual selected negative margin may tend to zero:

```math
\|Y_a\|\downarrow1.
```

So the branch can be a critical over-budget approach rather than a uniformly negative-margin approach.

The fixed finite dimension does guarantee compact selected custody.

What remains is to classify the limiting residual singular direction and determine whether it yields:

1. a strict negative right-limit ray;
2. a neutral limit with a higher-order crossing;
3. another reduction already covered by the endpoint critical theory.

That is now a finite-dimensional problem, provided background screenability persists.

---

## 12. Exact status of the background-driven branch

The question

> can the unselected negative background alone create the first negative sign?

has the exact answer:

```math
\boxed{
\textbf{YES only in the sense that background screenability itself may fail.}
}
```

If the background remains contractively screenable, then it cannot remain an independent negative owner after reduction.

Its effect is already encoded in the residual positive budget, and the fixed finite selected sector owns the resulting negative defect.

Thus the true unresolved edge question is:

```math
\boxed{
\text{does background contractive screenability persist on some strict right neighborhood of }c_*?
}
```

---

## 13. RPB-15 determination

```math
\boxed{
\textbf{RPB-15 — BACKGROUND-DRIVEN NEGATIVITY IS EXACTLY A BACKGROUND-SCREENABILITY FAILURE BRANCH.}
}
```

More precisely:

```math
\boxed{
\text{post-plateau full negativity}
\Longrightarrow
\begin{cases}
\text{fixed finite residual selected negativity},
&
D_B\succeq0,
\\
\text{background defect / moving background custody},
&
D_B\not\succeq0.
\end{cases}
}
```

RPB-14 is narrowed accordingly: raw selected crossing is not the canonical ownership test after background elimination.

Next cursor:

```text
RPB-16 / RIGHT-CONTINUITY OF BACKGROUND SCREENABILITY
```

The next pass should test whether (D_{B,c_*}\succeq0) plus the native compact/Hilbert–Schmidt background synthesis implies (D_{B,a}\succeq0) for some (a>c_*), or whether background screenability can fail immediately at the neutral edge.
