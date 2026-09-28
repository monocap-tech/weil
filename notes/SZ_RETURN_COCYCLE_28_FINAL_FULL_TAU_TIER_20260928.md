# SZ-RETURN-COCYCLE-28 — Final Full-Tau Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_28_final_full_tau_tier_verify.py

Repository-side geometry run:

GitHub Actions run 36461315873, job 109060278595, conclusion SUCCESS.

---

## 0. Result

The fourth and final full tau-width seam occurs at

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
3\tau.
~~~

At this seam, every surviving T1 / 48786 center from the third tau chamber has collapsed.

The generic seam atlas contains only

~~~math
\boxed{
1053\text{ copies of }T_2/67780
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
3\tau
+
\delta,
\qquad
0<\delta<\tau.
~~~

A new graph species appears.

Its full two-orientation size is

~~~math
\boxed{86774}.
~~~

The chamber contains

~~~math
\boxed{
1348\times86774
+
1053\times67780
+
295\times18984,
}
~~~

for exactly

~~~math
\boxed{2696}
~~~

generic open seed bands.

All 1348 new bands normalize to one source graph.

No invertibility claim for the new T3 / 86774 species is made in this pass.

---

## 1. Completion of the quotient-four tau run

The active Euclidean relation is

~~~math
\boxed{
\sigma
=
4\tau
+
\omega,
\qquad
0<\omega<\tau.
}
~~~

The preceding tau seams successively reduced the surviving S0 width from

~~~math
\sigma
~~~

to

~~~math
\sigma-\tau,
\quad
\sigma-2\tau,
\quad
\sigma-3\tau.
~~~

At the present seam,

~~~math
\sigma-3\tau
=
\tau+\omega.
~~~

Across one final full tau-width chamber, the remaining S0 center width becomes

~~~math
(\tau+\omega)-\tau
=
\boxed{\omega}.
~~~

Thus this pass completes the quotient-four tau traversal.

The next residual is no longer another full tau width.

It is exactly omega.

---

## 2. Seam typing

At

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+3\tau,
~~~

the generic open intervals are:

- T2 / 67780, count 1053;
- S0 / 18984, count 295.

The equality seeds are retained as seam points and are not absorbed into either open species.

The repository-side verifier reconstructs both seam species directly.

---

## 3. Final full-tau chamber atlas

Immediately above the seam, every generic seam interval acquires a new left-edge band of width delta.

The new-anchor set is

~~~math
\boxed{
\mathcal A_{T_3}
=
\mathcal A_{T_2}
\sqcup
(3\tau+\mathcal A_{S_0}).
}
~~~

The two families are disjoint.

Their cardinalities are

~~~math
1053
~~~

and

~~~math
295,
~~~

hence

~~~math
\boxed{
|\mathcal A_{T_3}|=1348.
}
~~~

The inherited centers remain

~~~math
1053\text{ T}_2
~~~

and

~~~math
295\text{ S}_0.
~~~

Therefore the complete generic chamber contains

~~~math
1348+1053+295
=
\boxed{2696}
~~~

open bands.

---

## 4. Stabilized 9497-site module repeats again

Recall the stabilized tau module

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
\boxed{
|\mathcal W|=9497.
}
~~~

The checked tau ladder is now

~~~math
\mathcal T_1
=
\mathcal T_0
\sqcup
(\tau+\mathcal W),
~~~

~~~math
\mathcal T_2
=
\mathcal T_1
\sqcup
(2\tau+\mathcal W),
~~~

and the present pass proves

~~~math
\boxed{
\mathcal T_3
=
\mathcal T_2
\sqcup
(3\tau+\mathcal W).
}
~~~

The new shifted copy is disjoint from T2.

Since

~~~math
|\mathcal T_2|=33890,
~~~

we obtain

~~~math
\begin{aligned}
|\mathcal T_3|
&=
33890+9497
\\
&=
\boxed{43387}
\end{aligned}
~~~

per orientation.

Hence the full matrix size is

~~~math
\boxed{
2\cdot43387
=
86774.
}
~~~

The fixed-module phase therefore survives through the final full tau tier.

---

## 5. Exact row census

For each orientation of T3, the source-row census is

~~~math
\boxed{
A:8406,
\qquad
B:8406,
\qquad
D:8407,
\qquad
T:18168.
}
~~~

These sum to

~~~math
8406+8406+8407+18168
=
43387.
~~~

T2 had census

~~~math
A:6566,
\quad
B:6566,
\quad
D:6567,
\quad
T:14191.
~~~

Therefore the new shifted W module again contributes

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

This is the second consecutive exact reuse of the stabilized module census after the T0 to T1 transition.

---

## 6. Orientation equality

The representative T3 source orbit satisfies

~~~math
\boxed{
\mathcal T_3^+
=
\mathcal T_3^-.
}
~~~

Each orientation has exactly

~~~math
43387
~~~

constant sites.

Therefore the full T3 system will again admit exact reflection-sector reduction:

~~~math
\boxed{
86774
\longrightarrow
43387+43387.
}
~~~

This pass does not yet perform that invertibility certificate.

---

## 7. Graph uniqueness

The 1348 new anchors consist of:

1. the 1053 T2 seam anchors;
2. the 295 S0 anchors shifted by 3 tau.

The two sets are disjoint.

For

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta,
~~~

every source argument reduces to

~~~math
C+\zeta
~~~

or

~~~math
C+\delta-\zeta.
~~~

The canonical T3 topology is certified uniformly on

~~~math
0\le\zeta\le\delta\le\tau
~~~

by exact affine-margin signs.

A representative from the second anchor family is checked against the canonical graph and agrees exactly.

The repository-side verifier therefore confirms one T3 graph species across the full new-band family.

---

## 8. Inherited T2 species

The surviving T2 / 67780 centers are exact relabelings of the T2 graph from the previous tau chamber.

The orientation relabeling is

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\tau.
~~~

Exact row-graph equality is checked by the verifier.

Thus every inherited T2 center remains certified invertible by SZ-RETURN-COCYCLE-27.

---

## 9. Inherited S0 species

The surviving S0 / 18984 centers are exact relabelings of the already-certified S0 graph.

Relative to the preceding tau chamber, the orientation shift is

~~~math
(+):C\mapsto C+\tau,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus every inherited S0 center remains certified.

---

## 10. Omega is exposed at the next seam

Inside the final full tau chamber, the T2 center width is

~~~math
\tau-\delta.
~~~

Hence the immediate next seam occurs at

~~~math
\boxed{
\delta=\tau.
}
~~~

At that seam all T2 centers collapse.

The surviving S0 width becomes

~~~math
\begin{aligned}
(\sigma-3\tau)-\tau
&=
\sigma-4\tau
\\
&=
\boxed{\omega}.
\end{aligned}
~~~

Therefore the next topology event is

~~~math
\boxed{
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
4\tau,
}
~~~

and omega is the active residual there.

This is the first point after entering the tau run where no further full tau-width insertion remains.

---

## 11. Standing

The current standing is:

### seam

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+3\tau
~~~

typed.

### final full tau chamber

~~~math
5\kappa+2\chi+\rho+\sigma+3\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau
~~~

classified into:

- T3 / 86774: new, invertibility open;
- T2 / 67780: certified;
- S0 / 18984: certified.

Therefore the chamber is not yet declared closed solely because T3 remains uncertified.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-28:
FINAL FULL-TAU TIER TYPED /
T3-86774 SPECIES EXTRACTED /
QUOTIENT-4 TAU RUN COMPLETED /
OMEGA EXPOSED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-29 /
T3 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize T3 into two 43387 reflection sectors;
2. use the chunked exact left-inverse compiler;
3. measure the actual witness envelope;
4. close the final full tau chamber if certified;
5. only then type the omega collision seam at
   ~~~math
   e
   =
   5\kappa+2\chi+\rho+\sigma+4\tau.
   ~~~

**Stop rule:** do not advance into omega geometry before T3 is certified.
