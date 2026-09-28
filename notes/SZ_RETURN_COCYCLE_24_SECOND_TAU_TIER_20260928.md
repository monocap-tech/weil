# SZ-RETURN-COCYCLE-24 — Second Tau Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_24_second_tau_tier_verify.py

---

## 0. Result

The second tau-tier seam occurs at

~~~math
e
=
5\kappa
+
2\chi
+
\rho
+
\sigma
+
\tau.
~~~

At this seam, the K2 / 10798 centers from the first tau chamber have collapsed.

The generic seam atlas contains only

~~~math
\boxed{
463\text{ copies of }T_0/29792
}
~~~

and

~~~math
\boxed{
295\text{ copies of }S_0/18984.
}
~~~

Immediately above the seam, write

~~~math
e
=
5\kappa
+
2\chi
+
\rho
+
\sigma
+
\tau
+
\delta,
\qquad
0<\delta<\tau.
~~~

A new graph species appears.

Its size is

~~~math
\boxed{48786}.
~~~

The chamber contains

~~~math
\boxed{
758\times48786
+
463\times29792
+
295\times18984,
}
~~~

for exactly

~~~math
\boxed{1516}
~~~

generic open seed bands.

All 758 new bands normalize to one source graph.

No invertibility claim for the new 48786 species is made in this pass.

---

## 1. Quotient-four arithmetic remains active

The Euclidean relation from the previous pass is

~~~math
\boxed{
\sigma
=
4\tau+\omega,
\qquad
0<\omega<\tau.
}
~~~

The second tau tier does not yet expose omega directly.

At the current seam, the surviving S0 center width is

~~~math
\sigma-\tau
=
3\tau+\omega.
~~~

After one further tau insertion, that width becomes

~~~math
\sigma-2\tau
=
\boxed{
2\tau+\omega.
}
~~~

Thus the geometry is still inside the quotient-four tau run.

The traversal must account for the remaining tau tiers before omega becomes the active residual.

---

## 2. Seam typing

At the end of the first tau chamber:

- each T0 band has width tau;
- each S0 center has width sigma minus tau;
- each K2 center has width tau minus delta.

Setting the first tau-chamber parameter to

~~~math
\delta=\tau
~~~

collapses every K2 center.

The generic seam therefore consists of:

~~~math
\boxed{
463\text{ T}_0\text{ bands}
}
~~~

and

~~~math
\boxed{
295\text{ S}_0\text{ bands}.
}
~~~

The equality seeds remain isolated seam points and are not absorbed into either open species.

---

## 3. Second tau chamber atlas

Immediately above the seam, every generic seam interval acquires a new left-edge band of width delta.

There are two disjoint new-anchor families:

1. the 463 old T0 left endpoints;
2. the 295 S0 left endpoints shifted by tau.

Hence the number of new bands is

~~~math
463+295
=
\boxed{758}.
~~~

The inherited centers remain:

~~~math
463\text{ T}_0,
~~~

and

~~~math
295\text{ S}_0.
~~~

Therefore the complete generic atlas has

~~~math
758+463+295
=
\boxed{1516}
~~~

open bands.

The new-band graph is the same on both anchor families after affine normalization.

---

## 4. Nested truncation, not a fixed tau module

The first tau collision produced

~~~math
\mathcal T_0
=
\mathcal S_0
\sqcup
(\sigma+\mathcal Z),
~~~

with

~~~math
|\mathcal S_0|=9492,
\qquad
|\mathcal Z|=5404.
~~~

At the second tau tier, the new body is larger.

Recall the five-site terminal rho-cap slice

~~~math
\mathcal T_\rho.
~~~

Define

~~~math
\boxed{
\mathcal W
=
\mathcal S_0
\sqcup
(\sigma+\mathcal T_\rho).
}
~~~

Since

~~~math
|\mathcal S_0|=9492,
\qquad
|\mathcal T_\rho|=5,
~~~

we have

~~~math
\boxed{
|\mathcal W|
=
9497.
}
~~~

The new second-tier species is

~~~math
\boxed{
\mathcal T_1
=
\mathcal T_0
\sqcup
(\tau+\mathcal W).
}
~~~

The two pieces are disjoint.

Thus

~~~math
\begin{aligned}
|\mathcal T_1|
&=
14896+9497
\\
&=
\boxed{24393}
\end{aligned}
~~~

per orientation.

Hence the full two-orientation matrix has

~~~math
\boxed{
2\cdot24393
=
48786
}
~~~

variables.

This is the decisive structural fact of the pass:

~~~math
\boxed{
\text{the tau ladder is a nested-truncation ladder, not a fixed-module ladder.}
}
~~~

---

## 5. Exact row census

For each orientation of T1, the source-row census is

~~~math
\boxed{
A:4726,
\qquad
B:4726,
\qquad
D:4727,
\qquad
T:10214.
}
~~~

These sum to

~~~math
4726+4726+4727+10214
=
24393.
~~~

T0 had census

~~~math
A:2886,
\quad
B:2886,
\quad
D:2887,
\quad
T:6237.
~~~

Therefore the tau-shifted body W contributes

~~~math
\boxed{
A:1840,
\quad
B:1840,
\quad
D:1840,
\quad
T:3977.
}
~~~

These sum to

~~~math
9497,
~~~

exactly the size of W.

---

## 6. Orientation equality

A representative T1 source orbit gives identical constant sets on the two seed orientations:

~~~math
\boxed{
\mathcal T_1^+
=
\mathcal T_1^-.
}
~~~

Each orientation contains

~~~math
24393
~~~

constants.

Thus the reflection-sector diagonalization used for T0 remains structurally available for the next invertibility pass.

This pass does not yet perform that large-sector certificate.

---

## 7. New-band graph uniqueness

The 758 new anchors are

~~~math
\boxed{
\mathcal A_{T_1}
=
\mathcal A_{T_0}
\sqcup
(\tau+\mathcal A_{S_0}).
}
~~~

The two sets are disjoint.

For a normalized seed

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta,
~~~

all source arguments reduce to

~~~math
C+\zeta
~~~

or

~~~math
C+\delta-\zeta.
~~~

The companion verifier checks the canonical T1 topology uniformly on

~~~math
0\le\zeta\le\delta\le\tau
~~~

by exact affine-margin signs at the parameter-triangle vertices.

It also checks a representative from the second anchor family against the canonical graph.

The remaining anchors differ only by the established affine anchor translations.

Thus the 758 new bands constitute one source-level graph species.

---

## 8. Inherited T0 species

The surviving T0 / 29792 graph is an exact relabeling of the already-certified T0 species.

Relative to the previous representation,

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\tau.
~~~

The companion verifier checks row-graph equality under this relabeling.

Therefore every T0 center in the second tau chamber remains certified.

---

## 9. Inherited S0 species

The surviving S0 / 18984 graph is likewise an exact relabeling of the certified S0 species.

Here the complementary orientation shift occurs:

~~~math
(+):C\mapsto C+\tau,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus every surviving S0 center remains certified.

---

## 10. Next topology event

In the second tau chamber, the surviving T0 center width is

~~~math
\tau-\delta.
~~~

Hence the next immediate topology event is again

~~~math
\boxed{
\delta=\tau.
}
~~~

At that seam all T0 centers collapse.

The surviving S0 center width becomes

~~~math
\begin{aligned}
(\sigma-\tau)-\tau
&=
\sigma-2\tau
\\
&=
\boxed{
2\tau+\omega.
}
\end{aligned}
~~~

Thus there are still further tau-width insertions before omega becomes active.

---

## 11. Standing

The current exact standing is:

### seam

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+\tau
~~~

typed.

### second tau chamber

~~~math
5\kappa+2\chi+\rho+\sigma+\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+2\tau
~~~

classified into:

- T1 / 48786: new, invertibility open;
- T0 / 29792: certified;
- S0 / 18984: certified.

Therefore the chamber is not yet declared closed solely because T1 remains uncertified.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-24:
SECOND TAU TIER TYPED /
T1-48786 SPECIES EXTRACTED /
NESTED-TRUNCATION LADDER HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-25 /
T1 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize T1 into two 24393 reflection sectors;
2. use the chunked exact left-inverse compiler;
3. measure the actual witness envelope rather than assuming exact reuse;
4. close the second tau chamber if certified;
5. then type the next tau-tier seam at
   ~~~math
   e
   =
   5\kappa+2\chi+\rho+\sigma+2\tau.
   ~~~

**Stop rule:** do not jump to omega until the quotient-four tau run has been traversed tier by tier.
