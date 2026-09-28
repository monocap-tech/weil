# SZ-RETURN-COCYCLE-26 — Third Tau Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_26_third_tau_tier_verify.py

---

## 0. Result

The third tau-tier seam occurs at

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
2\tau.
~~~

At this seam, the surviving T0 / 29792 centers from the second tau chamber have collapsed.

The generic seam atlas contains only

~~~math
\boxed{
758\text{ copies of }T_1/48786
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
2\tau
+
\delta,
\qquad
0<\delta<\tau.
~~~

A new graph species appears.

Its size is

~~~math
\boxed{67780}.
~~~

The chamber contains

~~~math
\boxed{
1053\times67780
+
758\times48786
+
295\times18984,
}
~~~

for exactly

~~~math
\boxed{2106}
~~~

generic open seed bands.

All new anchors normalize to one source graph.

No invertibility claim for the new 67780 species is made in this pass.

---

## 1. Quotient-four arithmetic

The active Euclidean relation remains

~~~math
\boxed{
\sigma
=
4\tau+\omega,
\qquad
0<\omega<\tau.
}
~~~

At the present seam the surviving S0 width is

~~~math
\sigma-2\tau
=
2\tau+\omega.
~~~

After one further tau insertion this becomes

~~~math
\sigma-3\tau
=
\boxed{
\tau+\omega.
}
~~~

Thus one more full tau-width stage remains after the present chamber before the omega remainder can become the active residual.

---

## 2. Seam typing

At the end of the second tau chamber:

- each T1 band has grown to width tau;
- each T0 center has width tau minus delta;
- each S0 center has width sigma minus 2 tau minus delta.

Setting the chamber parameter to

~~~math
\delta=\tau
~~~

collapses all T0 centers.

Keeping equality seeds separate, the generic seam consists of

~~~math
\boxed{
758\text{ T}_1\text{ bands}
}
~~~

and

~~~math
\boxed{
295\text{ S}_0\text{ bands}.
}
~~~

---

## 3. Third tau chamber atlas

Immediately above this seam, every seam interval acquires a new left-edge band of width delta.

The new-anchor set is

~~~math
\boxed{
\mathcal A_{T_2}
=
\mathcal A_{T_1}
\sqcup
(2\tau+\mathcal A_{S_0}).
}
~~~

The two families are disjoint.

Their sizes are

~~~math
758
~~~

and

~~~math
295,
~~~

so the new species occurs on

~~~math
\boxed{
1053
}
~~~

bands.

The surviving centers contribute

~~~math
758\text{ T}_1
~~~

and

~~~math
295\text{ S}_0.
~~~

Therefore the chamber has

~~~math
1053+758+295
=
\boxed{2106}
~~~

generic open bands.

---

## 4. Stabilization of the tau module

SZ-RETURN-COCYCLE-24 found the first nested tau body

~~~math
\boxed{
\mathcal W
=
\mathcal S_0
\sqcup
(\sigma+\mathcal T_\rho),
}
~~~

with

~~~math
|\mathcal W|
=
\boxed{9497}.
~~~

It produced

~~~math
\boxed{
\mathcal T_1
=
\mathcal T_0
\sqcup
(\tau+\mathcal W).
}
~~~

The present pass shows that the next tier uses **the same body again**:

~~~math
\boxed{
\mathcal T_2
=
\mathcal T_1
\sqcup
(2\tau+\mathcal W).
}
~~~

The new shifted copy is disjoint from T1.

Hence

~~~math
\begin{aligned}
|\mathcal T_2|
&=
24393+9497
\\
&=
\boxed{33890}
\end{aligned}
~~~

per orientation.

Therefore the full two-orientation matrix has

~~~math
\boxed{
2\cdot33890
=
67780
}
~~~

variables.

This refines the previous structural diagnosis.

The transition from T0 to T1 genuinely introduced a larger nested-truncation body rather than reusing the original 5404-site body.

But once that 9497-site body W is formed, the next tier repeats it exactly.

Thus the current structure is:

~~~math
\boxed{
\text{nested-truncation transition followed by fixed-module stabilization.}
}
~~~

No historical statement is changed; this is an additive refinement supplied by the next tier.

---

## 5. Exact row census

For each orientation of T2, the source-row census is

~~~math
\boxed{
A:6566,
\qquad
B:6566,
\qquad
D:6567,
\qquad
T:14191.
}
~~~

These sum to

~~~math
6566+6566+6567+14191
=
33890.
~~~

T1 had census

~~~math
A:4726,
\quad
B:4726,
\quad
D:4727,
\quad
T:10214.
~~~

Therefore the new shifted W module contributes

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

This is the same census increment observed in the T0 to T1 step.

---

## 6. Orientation equality

A representative T2 source orbit gives

~~~math
\boxed{
\mathcal T_2^+
=
\mathcal T_2^-.
}
~~~

Each orientation contains exactly

~~~math
33890
~~~

constants.

Thus reflection-sector diagonalization remains structurally available:

~~~math
\boxed{
67780
\longrightarrow
33890+33890.
}
~~~

The present pass does not perform that invertibility certificate.

---

## 7. Graph uniqueness

The new anchor families are:

1. the 758 T1 seam anchors;
2. the 295 S0 anchors shifted by 2 tau.

The exact verifier shows the families are disjoint.

For a normalized new seed

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

The canonical topology is certified uniformly on

~~~math
0\le\zeta\le\delta\le\tau
~~~

by exact affine-margin signs at the parameter-triangle vertices.

A representative from the second anchor family is checked against the canonical graph and agrees exactly.

Together with the already-established affine translation structure inside the inherited T1 anchor family, this identifies one T2 source species on all 1053 new bands.

---

## 8. Inherited T1 species

The surviving T1 / 48786 centers are exact relabelings of the T1 graph from the previous tau chamber.

The relabeling is

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\tau.
~~~

The verifier checks exact row-graph equality.

Thus every surviving T1 center remains certified invertible by SZ-RETURN-COCYCLE-25.

---

## 9. Inherited S0 species

The surviving S0 / 18984 centers are exact relabelings of the previously certified S0 graph.

Relative to the prior tau chamber, the relabeling is

~~~math
(+):C\mapsto C+\tau,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus every surviving S0 center remains certified.

---

## 10. Next topology event

In the third tau chamber, the T1 center width is

~~~math
\tau-\delta.
~~~

Therefore the next immediate seam is again

~~~math
\boxed{
\delta=\tau.
}
~~~

At that seam all T1 centers collapse.

The surviving S0 width becomes

~~~math
\begin{aligned}
(\sigma-2\tau)-\tau
&=
\sigma-3\tau
\\
&=
\boxed{
\tau+\omega.
}
\end{aligned}
~~~

Since

~~~math
0<\omega<\tau,
~~~

one final tau-width chamber remains before the omega residual itself is exposed.

---

## 11. Standing

The current exact standing is:

### seam

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+2\tau
~~~

typed.

### third tau chamber

~~~math
5\kappa+2\chi+\rho+\sigma+2\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+3\tau
~~~

classified into:

- T2 / 67780: new, invertibility open;
- T1 / 48786: certified;
- S0 / 18984: certified.

Therefore the chamber is not yet declared closed solely because T2 remains uncertified.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-26:
THIRD TAU TIER TYPED /
T2-67780 SPECIES EXTRACTED /
FIXED-9497 MODULE STABILIZATION HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-27 /
T2 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize T2 into two 33890 reflection sectors;
2. use the chunked exact left-inverse compiler;
3. measure the actual witness envelope;
4. close the third tau chamber if certified;
5. then type the final tau-tier chamber before omega.

**Stop rule:** do not promote the observed fixed-module stabilization beyond the checked tau tiers until the final quotient-four tier is typed.
