# RPB-6 — Large-separation prime-window dynamics

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / DILATION MODEL IDENTIFIED / NO FINITE THRESHOLD RECURRENCE**  
**Dependencies:** RPB-0 through RPB-5.  
**Promotion status:** none.

## 0. Objective

RPB-5 isolated the missing statement as a large-separation estimate for

```math
Q_{f,g}(y)
=
\mathfrak q(T_yf,T_{-y}g).
```

RPB-6 asks whether the moving prime-power window

```math
2y-2a<\log n<2y+2a
```

has an intrinsic finite recurrence or transfer law capable of producing that estimate.

The answer is:

1. the exact evolution is a **continuous dilation/translation convolution**;
2. prime-power threshold entries are (C^\infty)-silent for smooth compact probes;
3. there is no nontrivial kernel-level finite delay recurrence;
4. after (X=e^{2y}), the object is exactly a compact multiplicative smoothing of the Chebyshev error;
5. the selected residue data are exactly Mellin values of that smoothing kernel.

This identifies the large-separation object much more sharply.

---

## 1. Logarithmic convolution form

Let

```math
C(r)=C_{f,g}(r)
```

and define the logarithmic Chebyshev-error measure

```math
d\nu_E(r)
=
\sum_{n\ge2}
\frac{\Lambda(n)}{\sqrt n}
\delta_{\log n}(r)
-
e^{r/2}\,dr.
```

For sufficiently separated probes,

```math
\mathcal I_{f,g}(y)
=
-
\int
C(2y-r)
\,d\nu_E(r).
```

Thus, with (t=2y),

```math
\boxed{
\mathcal I_{f,g}(t/2)
=
-(C*d\nu_E)(t).
}
```

The large-separation parameter is therefore ordinary translation in logarithmic coordinates.

For every integer (k\ge0),

```math
\boxed{
\frac{d^k}{dy^k}
\mathcal I_{f,g}(y)
=
-2^k
\int
C^{(k)}(2y-r)
\,d\nu_E(r).
}
```

The dynamics remains in the same compact-kernel convolution class under differentiation.

---

## 2. Exact shift covariance

For any real (h),

```math
\mathcal I_C(y+h)
=
\mathcal I_{C_h}(y),
```

where

```math
C_h(u)
=
C(u+2h).
```

So changing physical separation translates the correlation kernel against one fixed arithmetic distribution.

This is an exact covariance law:

```math
\boxed{
y\text{-evolution}
=
\text{translation orbit of }C
\text{ against }d\nu_E.
}
```

It is not, by itself, a scalar recurrence for one fixed (C).

---

## 3. Prime-power thresholds are smooth, not jump data

Each individual prime-power contribution has the form

```math
-\frac{\Lambda(n)}{\sqrt n}
C(2y-\log n).
```

Since

```math
C\in C_c^\infty(\mathbb R),
```

it and all of its derivatives vanish to infinite order at the boundary of its support.

Therefore, when a prime power enters or exits the moving support window, its contribution turns on or off with all derivatives equal to zero at the threshold.

Hence

```math
\boxed{
\text{prime-power activation thresholds produce no jump, kink, or finite jet event in }Q_{f,g}.
}
```

This sharply distinguishes RPB large-separation dynamics from traversals whose state changes are carried by hard support-boundary relations.

Threshold bookkeeping identifies which terms are active, but the scalar observable is (C^\infty) across every activation threshold.

---

## 4. No nontrivial kernel-level finite delay recurrence

Suppose a nonzero compact smooth kernel (C) satisfied a constant-coefficient finite translation relation

```math
\sum_{j=1}^N
a_j C(t+h_j)
=
0
\qquad
\text{for every }t\in\mathbb R,
```

with distinct (h_j).

Taking Fourier transforms gives

```math
\widehat C(\xi)
\sum_{j=1}^N
a_j e^{i\xi h_j}
=
0
\qquad
(\xi\in\mathbb R).
```

Because (C\ne0), its entire Fourier transform is not identically zero and is nonzero on some real interval.

The finite exponential polynomial

```math
\sum_j a_j e^{i\xi h_j}
```

therefore vanishes on an interval, hence identically. Distinct-frequency independence forces

```math
a_1=\cdots=a_N=0.
```

Thus:

```math
\boxed{
\text{a nonzero }C_c^\infty\text{ correlation kernel has no nontrivial global finite constant-delay recurrence.}
}
```

Accordingly, no SZ-type finite scalar recurrence can be inherited merely from compact support plus moving prime thresholds.

Any recurrence would require additional arithmetic structure, a different state enlargement, or a nonconstant/adaptive transfer law.

---

## 5. Multiplicative scale variable

Set

```math
X=e^{2y}.
```

Define the compactly supported multiplicative weight

```math
\boxed{
W(u)
=
u^{-1/2}
C(-\log u),
\qquad
u>0.
}
```

If

```math
\operatorname{supp}C\subseteq[-2a,2a],
```

then

```math
\operatorname{supp}W
\subseteq
[e^{-2a},e^{2a}].
```

The prime sum becomes

```math
\boxed{
\sum_{n\ge2}
\frac{\Lambda(n)}{\sqrt n}
C(2y-\log n)
=
X^{-1/2}
\sum_{n\ge2}
\Lambda(n)
W(n/X).
}
```

Moreover,

```math
\boxed{
M_{f,g}(-1/2)
=
\int_0^\infty
W(u)\,du.
}
```

Therefore the centered arithmetic interaction is

```math
\boxed{
\mathcal I_{f,g}(y)
=
-
X^{-1/2}
\left[
\sum_{n\ge2}
\Lambda(n)W(n/X)
-
X\int_0^\infty W(u)\,du
\right].
}
```

Define the smoothed Chebyshev discrepancy

```math
\boxed{
D_W(X)
:=
\sum_{n\ge2}
\Lambda(n)W(n/X)
-
X\int_0^\infty W(u)\,du.
}
```

Then

```math
\boxed{
\mathcal I_{f,g}(y)
=
-X^{-1/2}D_W(X).
}
```

This is the exact arithmetic meaning of the moving prime window.

---

## 6. Full polarized coefficient in the scale variable

RPB-4 gives

```math
Q_{f,g}(y)
=
A_{f,g}^{\infty}(y)
+
e^{-y}M_{f,g}(1/2)
+
\mathcal I_{f,g}(y).
```

Hence

```math
\boxed{
Q_{f,g}\!\left(\frac12\log X\right)
=
-
X^{-1/2}D_W(X)
+
A_{f,g}^{\infty}\!\left(\frac12\log X\right)
+
X^{-1/2}M_{f,g}(1/2).
}
```

For fixed smooth compact probes, the archimedean cross term is rapidly decreasing in (y), hence faster than every negative power of (log X).

The last pole term is (O(X^{-1/2})).

Thus the large-scale growth problem is carried by the smoothed Chebyshev discrepancy (D_W(X)).

---

## 7. Mellin transform identity

Let

```math
\widetilde W(s)
=
\int_0^\infty
W(u)u^{s-1}\,du.
```

Substituting (u=e^{-r}) gives

```math
\boxed{
\widetilde W(s)
=
M_{f,g}\!\left(\frac12-s\right).
}
```

At a nontrivial zero (ho),

```math
\boxed{
\widetilde W(\rho)
=
M_{f,g}\!\left(
-\left(\rho-\frac12\right)
\right).
}
```

Therefore the polarized zero expansion becomes

```math
\boxed{
Q_{f,g}\!\left(\frac12\log X\right)
=
\sum_\rho^{\rm dist}
m_\rho
\widetilde W(\rho)
X^{\rho-1/2}.
}
```

This is precisely the Mellin/explicit-formula form expected for a compact multiplicative smoothing kernel.

The selected-source interpolation of RPB-3/4 can now be written simply as

```math
\boxed{
m_{\rho_j}\widetilde W(\rho_j)
=
v_j
\qquad
(\rho_j\in\Pi).
}
```

So selected-source custody is Mellin interpolation.

---

## 8. RPB-POL-TAIL is a smoothed prime-number remainder bound

For (kappa\ge0),

```math
Q_{f,g}(y)
=
O(e^{\kappa y})
```

is

```math
Q_{f,g}\!\left(\frac12\log X\right)
=
O(X^{\kappa/2}).
```

Using the exact discrepancy relation above, this is equivalent at the exponential-power level to

```math
\boxed{
D_W(X)
=
O\!\left(
X^{(1+\kappa)/2}
\right).
}
```

The archimedean and (X^{-1/2}) pole corrections lie below this power scale.

Thus the source-specific branch-killing condition from RPB-5,

```math
\kappa<2\delta_v,
```

becomes

```math
\boxed{
D_W(X)
=
O(X^\theta)
\quad
\text{for some }
\theta
<
\frac12+\delta_v.
}
```

But

```math
\frac12+\delta_v
```

is exactly the real part of the active rightmost selected zero carried by (v).

So the RPB interface is now identified as a **source-adapted smoothed prime-number-theorem remainder exponent**.

---

## 9. Pole-null / zero-mean gauge

The finite interpolation lemma from RPB-3 has room for additional finitely many evaluation constraints.

Therefore, while preserving

```math
m_{\rho_j}\widetilde W(\rho_j)
=
v_j
```

on the selected zeros, one may additionally impose

```math
\boxed{
\widetilde W(1)=0
}
```

and, if desired,

```math
\boxed{
\widetilde W(0)=0.
}
```

By the Mellin identity these are

```math
M_{f,g}(-1/2)=0,
\qquad
M_{f,g}(1/2)=0.
```

The first gives

```math
\int W(u)\,du=0,
```

so the continuous prime main term vanishes.

The second removes the remaining decaying pole cross term.

In this gauge,

```math
\boxed{
Q_{f,g}\!\left(\frac12\log X\right)
=
-
X^{-1/2}
\sum_{n\ge2}
\Lambda(n)W(n/X)
+
A_{f,g}^{\infty}\!\left(\frac12\log X\right).
}
```

Thus the source can be encoded by a compact multiplicative **zero-mean wavelet-type weight** whose moving prime-power coefficient carries the same selected pole residues.

This removes the elementary main term from the large-scale forcing problem without removing the selected zeta signal.

---

## 10. Dilation generator

The scale dynamics is continuous.

Let

```math
\mathcal D
=
X\frac{d}{dX}.
```

For one summand,

```math
\mathcal D
\left[
W(n/X)
\right]
=
-
uW'(u)
\big|_{u=n/X}.
```

Hence repeated scale derivatives replace (W) by iterates of the Euler operator

```math
\boxed{
\mathscr E W(u)
=
-uW'(u).
}
```

In logarithmic coordinates this is exactly ordinary translation differentiation.

Therefore the natural evolution algebra is

```math
\boxed{
\text{dilation semigroup / Mellin generator},
}
```

not a finite arithmetic-delay recurrence.

This aligns with the Mellin-pole representation: powers (X^{\rho-1/2}) are eigenmodes of the dilation generator.

---

## 11. Interpretation relative to the object question

The bridge object can now be written in three equivalent representations:

### Physical

```math
(f,g,y)
\longmapsto
\mathfrak q(T_yf,T_{-y}g).
```

### Logarithmic arithmetic

```math
C_{f,g}
*d\nu_E.
```

### Multiplicative arithmetic

```math
W
\longmapsto
D_W(X)
=
\sum_n\Lambda(n)W(n/X)
-
X\int W.
```

The Mellin transform of (W) records the zero-side source coefficients.

Thus:

```math
\boxed{
\text{physical translation}
\leftrightarrow
\text{multiplicative dilation}
\leftrightarrow
\text{Mellin spectral evolution}.
}
```

This is more informative than treating (Q_h) as an isolated scalar criterion.

---

## 12. What RPB-6 does not solve

The reformulation does not itself improve the prime discrepancy exponent.

Indeed, a bound

```math
D_W(X)
=
O(X^\theta)
```

below an active selected zero real part would already contradict the local pole certificate.

So the deep forcing problem remains deep.

What RPB-6 does accomplish is to identify exactly where it lives:

```math
\boxed{
\text{not threshold recurrence}
\quad\text{but}\quad
\text{source-adapted Mellin/dilation cancellation of a smoothed Chebyshev error}.
}
```

---

## 13. Next comparison target

The next pass should ask whether the **zero-moment law**

```math
\mathbf1^Tv=0
```

and the freedom in choosing an interpolating zero-mean weight (W) impose any additional Mellin moment, annihilation, or orthogonality condition on the prime-side smoothing beyond ordinary source interpolation.

Specifically:

1. characterize the affine space of compact (W) satisfying
   ```math
   m_{\rho_j}\widetilde W(\rho_j)=v_j;
   ```
2. impose (widetilde W(1)=\widetilde W(0)=0);
3. determine whether (mathbf1^Tv=0) yields a canonical extra vanishing condition in Mellin/scale variables;
4. test whether such conditions produce cancellation stronger than generic smoothed PNT error.

If not, record a no-go and stop this route before manufacturing an artificial recurrence.

---

## 14. RPB-6 determination

```math
\boxed{
\textbf{RPB-6 — LARGE-SEPARATION DYNAMICS = MELLIN/DILATION DYNAMICS.}
}
```

More explicitly:

```math
\boxed{
\begin{aligned}
&\text{threshold recurrence: no generic finite law},\\
&\text{prime-window object: smoothed Chebyshev discrepancy }D_W(X),\\
&\text{selected source: Mellin interpolation }m_\rho\widetilde W(\rho)=v_\rho,\\
&\text{tail interface: source-adapted smoothed-PNT exponent}.
\end{aligned}
}
```

Next cursor:

```text
RPB-7 / ZERO-MOMENT → MELLIN-CANCELLATION TEST
```
