# RPB-4 — Polarized zero expansion and local-pole certificate

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / FORCING ESTIMATE STILL OPEN**  
**Dependencies:** RPB-0 through RPB-3.  
**Promotion status:** none.

## 0. Objective

RPB-3 proved that any finite selected raw source can be interpolated by a pair of compact physical probes at finitely many prescribed divisor points.

RPB-4 asks whether the corresponding **polarized translated Weil matrix coefficient** has the same exact zero-only expansion and local-pole mechanism as the diagonal frozen reflected packet.

The answer is yes.

The diagonal source proof does not fundamentally require (f=g), evenness, positivity, or an autocorrelation. Those assumptions are needed for the special scalar positivity/parity interpretation, but not for the zero-only cancellation itself.

---

## 1. Polarized probe setup

Fix

```math
f,g\in C_c^\infty(\mathbb R)
```

with

```math
\operatorname{supp}f,
\operatorname{supp}g
\subseteq[-a,a]
```

for some (a>0).

Define

```math
C_{f,g}(r)
=
\int_{\mathbb R}
\overline{f(x-r)}g(x)\,dx
```

and its bilateral Laplace transform

```math
M_{f,g}(w)
=
\int_{\mathbb R}
C_{f,g}(r)e^{wr}\,dr.
```

By RPB-3,

```math
\boxed{
M_{f,g}(w)
=
\overline{\widehat f(-i\overline w)}
\widehat g(iw).
}
```

Since (C_{f,g}\in C_c^\infty) and

```math
\operatorname{supp}C_{f,g}
\subseteq[-2a,2a],
```

(M_{f,g}) is entire and rapidly decaying on every bounded vertical strip.

For

```math
y>a,
```

define the polarized right/left matrix coefficient

```math
\boxed{
Q_{f,g}(y)
:=
\mathfrak q(T_yf,T_{-y}g).
}
```

The translated supports are disjoint.

---

## 2. Translation of the correlation

The cross correlation of the translated probes is

```math
\boxed{
C_{T_yf,T_{-y}g}(r)
=
C_{f,g}(r+2y).
}
```

Since (y>a), its support lies strictly in the negative (r)-axis.

Hence for (r\ge0),

```math
C_{T_yf,T_{-y}g}(r)=0,
```

while for (r>0),

```math
C_{T_yf,T_{-y}g}(-r)
=
C_{f,g}(2y-r).
```

This is the exact polarized analogue of the frozen reflected support geometry.

---

## 3. Prime and pole sectors

The two pole terms in the complete preform are

```math
e^y M_{f,g}(-1/2)
+
e^{-y}M_{f,g}(1/2).
```

Indeed,

```math
M_{f,g}(-1/2)
=
\overline{\widehat f(i/2)}
\widehat g(-i/2),
```

and

```math
M_{f,g}(1/2)
=
\overline{\widehat f(-i/2)}
\widehat g(i/2).
```

The positive-shift prime correlation vanishes by support separation, so the prime-power cross term is

```math
-\sum_{n\ge2}
\frac{\Lambda(n)}{\sqrt n}
C_{f,g}(2y-\log n).
```

Define the polarized centered arithmetic interaction

```math
\mathcal I_{f,g}(y)
:=
-\int_0^\infty
x^{-1/2}
C_{f,g}(2y-\log x)
\,dE(x).
```

Its continuous part is

```math
\begin{aligned}
\int_0^\infty
x^{-1/2}
C_{f,g}(2y-\log x)
\,dx
&=
e^y
\int_{\mathbb R}
C_{f,g}(u)e^{-u/2}\,du
\\
&=
e^yM_{f,g}(-1/2).
\end{aligned}
```

Therefore

```math
\boxed{
Q_{f,g}(y)
=
A_{f,g}^{\infty}(y)
+
e^{-y}M_{f,g}(1/2)
+
\mathcal I_{f,g}(y).
}
```

The exponentially growing pole main term has already cancelled against the continuous prime main term before any contour argument.

---

## 4. Canonical base-1 transform

Put

```math
J_{f,g}(t)
:=
-\int_{[1,\infty)}
x^{-1/2}
C_{f,g}(t-\log x)
\,dE(x).
```

Because

```math
\operatorname{supp}C_{f,g}
\subseteq[-2a,2a],
```

we have

```math
J_{f,g}(t)=0
\qquad
(t\le-2a),
```

and

```math
J_{f,g}(t)
=
\mathcal I_{f,g}(t/2)
\qquad
(t>2a).
```

For (Re s>1/2), Tonelli and the same endpoint-normalized Chebyshev primitive used in the frozen reflected source give

```math
\boxed{
\mathcal B_{f,g}(s)
:=
\int_{\mathbb R}
J_{f,g}(t)e^{-st}\,dt
=
M_{f,g}(-s)
\left[
\frac{\zeta'}{\zeta}
\left(s+\frac12\right)
+
\frac1{s-1/2}
\right].
}
```

### Orientation note

The coefficient is (M_{f,g}(-s)), not (M_{f,g}(s)).

The diagonal frozen source hid this distinction because its (L_h) is even.

This is the orientation correction anticipated after RPB-3.

---

## 5. Contour displacement

The contour proof in the reflected source uses only:

1. compact support and smoothness of the kernel;
2. rapid vertical decay of its bilateral Laplace transform;
3. the zero-avoiding-height estimate for (zeta'/zeta);
4. exponential type controlled by the support radius.

All four remain valid for (C_{f,g}).

Moving the inverse-Laplace contour left therefore gives, for (t>2a),

```math
\boxed{
J_{f,g}(t)
=
\sum_\rho^{\rm dist}
m_\rho
M_{f,g}\!\left(
-\rho+\frac12
\right)
e^{(\rho-1/2)t}
+
\sum_{n\ge1}
M_{f,g}\!\left(
2n+\frac12
\right)
e^{-(2n+1/2)t}.
}
```

Equivalently, with

```math
w_\rho
=
\rho-\frac12,
```

```math
\boxed{
\mathcal I_{f,g}(y)
=
\sum_\rho^{\rm dist}
m_\rho M_{f,g}(-w_\rho)e^{2w_\rho y}
+
\sum_{n\ge1}
M_{f,g}\!\left(2n+\frac12\right)
e^{-(4n+1)y}.
}
```

The zero sum and every fixed real (y)-derivative converge absolutely and locally uniformly.

---

## 6. Archimedean cancellation without evenness

For the separated translated pair,

```math
C(0)=0,
\qquad
C(r)=0
\quad(r\ge0),
```

and

```math
C(-r)
=
C_{f,g}(2y-r).
```

The real-place formula therefore gives

```math
A_{f,g}^{\infty}(y)
=
-
\int_0^\infty
\frac{e^{r/2}}{e^r-e^{-r}}
C_{f,g}(2y-r)
\,dr.
```

Using

```math
\frac{e^{r/2}}{e^r-e^{-r}}
=
\sum_{n=0}^{\infty}
e^{-(2n+1/2)r}
```

and compact support of (C_{f,g}),

```math
\boxed{
A_{f,g}^{\infty}(y)
=
-
\sum_{n=0}^{\infty}
M_{f,g}\!\left(2n+\frac12\right)
e^{-(4n+1)y}.
}
```

The (n=0) term cancels

```math
e^{-y}M_{f,g}(1/2),
```

and every (n\ge1) term cancels the complete trivial-zero series from the arithmetic contour expansion.

No symmetry

```math
M_{f,g}(-w)=M_{f,g}(w)
```

has been used.

---

## 7. Polarized zero-only theorem

Combining the previous sections gives:

```math
\boxed{
Q_{f,g}(y)
=
\sum_\rho^{\rm dist}
m_\rho
M_{f,g}(-w_\rho)
e^{2w_\rho y},
\qquad
y>a.
}
```

This is the exact polarized extension of the frozen reflected zero-only formula.

The diagonal reflected source is recovered by taking

```math
f=g=h,
```

for which

```math
M_{h,h}=L_h
```

is even.

---

## 8. Tail transform and local poles

Set

```math
c_\rho^{f,g}
=
m_\rho M_{f,g}(-w_\rho).
```

Rapid vertical decay plus zero counting gives

```math
\sum_\rho
|c_\rho^{f,g}|
<\infty.
```

For (Y>a), define

```math
F_{f,g;Y}(s)
=
\int_Y^\infty
Q_{f,g}(y)e^{-2sy}\,dy.
```

Initially for (Re s>1/2),

```math
\boxed{
F_{f,g;Y}(s)
=
\frac12
\sum_\rho^{\rm dist}
\frac{
c_\rho^{f,g}
e^{-2(s-w_\rho)Y}
}{
s-w_\rho
}.
}
```

The right side is normally meromorphic on (mathbb C).

At every zero with

```math
c_{\rho_0}^{f,g}\ne0,
```

```math
\boxed{
\operatorname*{Res}_{s=w_{\rho_0}}
F_{f,g;Y}^{\rm mer}(s)
=
\frac12
c_{\rho_0}^{f,g}.
}
```

Distinct zeros give distinct pole locations, so complementary divisor terms cannot cancel this local principal part.

---

## 9. Selected-source local-pole certificate

Let

```math
\Pi
=
\{\rho_1,\ldots,\rho_N\}
```

be a finite selected zero set, and let

```math
v=(v_1,\ldots,v_N)
```

be any desired raw selected source.

RPB-3 proved finite interpolation for arbitrary prescribed transform values.

Apply that theorem at the **reflected transform points**

```math
-w_j
=
-\left(\rho_j-\frac12\right).
```

Choose compact probes (f,g) such that

```math
\boxed{
m_{\rho_j}
M_{f,g}(-w_j)
=
v_j
\qquad
(j=1,\ldots,N).
}
```

Then the polarized tail transform has

```math
\boxed{
\operatorname*{Res}_{s=w_j}
F_{f,g;Y}^{\rm mer}(s)
=
\frac12v_j.
}
```

Therefore every nonzero selected source coordinate acquires an individual nonremovable local pole at its own zeta location.

In particular, the WD-T37 source

```math
v\ne0,
\qquad
\mathbf1^Tv=0,
```

can be represented by compact physical probes whose polarized translated Weil coefficient carries precisely that source as its selected pole-residue data.

---

## 10. Complementary residues do not destroy selected custody

The interpolation imposes no condition on

```math
M_{f,g}(-w_\mu)
```

for unselected zeros (mu\notin\Pi).

Thus the same polarized observable generally has additional complementary poles.

However, at a selected point (s=w_j), every term associated with a distinct zero is holomorphic in a neighborhood of (w_j).

Hence:

```math
\boxed{
\text{complementary poles elsewhere}
\text{ cannot cancel the selected local residue }v_j/2.
}
```

Selected-source **isolation** is unnecessary for local pole custody.

This is stronger than the conclusion available at the end of RPB-3.

---

## 11. What the certificate does not yet prove

A local pole becomes contradictory only when the genuine tail integral is known to be holomorphic across that pole.

For example, a bound

```math
Q_{f,g}(y)
=
O(e^{\kappa y})
```

makes the genuine tail transform holomorphic in

```math
\Re s>\frac\kappa2.
```

If a selected pole (w_j) lies there, its nonzero residue is impossible.

But Horizon 1 does not currently provide such a growth estimate for the interpolated polarized matrix coefficient.

Therefore RPB-4 establishes

```math
\boxed{
\text{selected defect source}
\longrightarrow
\text{physical matrix coefficient}
\longrightarrow
\text{local pole certificate},
}
```

but not yet

```math
\boxed{
\text{local pole certificate}
\longrightarrow
\text{contradiction}.
}
```

The missing input is a forcing estimate / holomorphy domain.

---

## 12. Relation to AZ-NEXTJET-LOC

This pass materially changes the comparison with the Horizon-1 stop line.

Horizon 1 sends

```math
v
\longrightarrow
R_v
\longrightarrow
\text{weighted near completed-}\Xi\text{ next-jet field}.
```

RPB now sends the **same finite source**

```math
v
```

to a different exact representation:

```math
\boxed{
v
\longrightarrow
(f,g)
\longrightarrow
Q_{f,g}
\longrightarrow
\left\{
\operatorname*{Res}_{s=w_j}
F_{f,g;Y}
=
v_j/2
\right\}_{\rho_j\in\Pi}.
}
```

So the two routes have genuinely diverged after the common selected source.

It is not yet known whether the new missing growth/holomorphy statement is:

1. weaker than `AZ-NEXTJET-LOC`;
2. equivalent to it after explicit-formula unwinding; or
3. independently inaccessible from Horizon-1 data.

That is now the exact comparison problem.

---

## 13. Candidate new interface

For reconnaissance only, define the candidate interface label

```text
RPB-POL-TAIL
```

to mean:

> obtain a tail growth or holomorphy statement for a polarized translated Weil coefficient (Q_{f,g}) whose selected pole residues encode a given persistent WD-T37 source (v).

This label is **noncanonical** and is not added to the public RH-interface appendix.

The next pass must determine whether `RPB-POL-TAIL` is already implied, contradicted, or left untouched by the existing Horizon-1 estimates.

---

## 14. RPB-4 determination

```math
\boxed{
\textbf{RPB-4 — POLARIZED ZERO EXPANSION / LOCAL-POLE CERTIFICATE: PASS.}
}
```

The source-custody chain is now exact:

```math
\boxed{
v
\longrightarrow
(f,g)
\longrightarrow
Q_{f,g}(y)
\longrightarrow
\text{selected poles with residues }v_j/2.
}
```

No RH assumption and no next-jet exclusion theorem is used.

Next cursor:

```text
RPB-5 / DOES HORIZON-1 FORCE RPB-POL-TAIL?
```
