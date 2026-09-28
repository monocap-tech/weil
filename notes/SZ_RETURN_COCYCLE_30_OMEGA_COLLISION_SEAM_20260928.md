# SZ-RETURN-COCYCLE-30 — Omega Collision Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_30_omega_collision_seam_discover.py

---

## 0. Result

The omega collision occurs at

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
4\tau.
~~~

At this seam, every surviving T2 / 67780 center from the final full-tau chamber has collapsed.

The generic seam atlas contains only

~~~math
\boxed{
1348\text{ copies of }T_3/86774
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
4\tau
+
\delta,
\qquad
0<\delta<\omega.
~~~

A new graph species appears.

Its full two-orientation size is

~~~math
\boxed{105768}.
~~~

The exact generic atlas is

~~~math
\boxed{
1643\times105768
+
1348\times86774
+
295\times18984,
}
~~~

for exactly

~~~math
\boxed{3286}
~~~

generic open seed bands.

No invertibility claim for the new O0 / 105768 species is made in this seam pass.

---

## 1. Omega and the next residual

Recall

~~~math
\boxed{
\omega
=
\sigma-4\tau,
}
~~~

with

~~~math
0<\omega<\tau.
~~~

Define

~~~math
\boxed{
\nu
:=
\tau-\omega.
}
~~~

In the q,j,k basis,

~~~math
\tau=(-1543,3086,1246),
~~~

~~~math
\omega=(7050,-14100,-5693),
~~~

hence

~~~math
\boxed{
\nu=(-8593,17186,6939).
}
~~~

In prime logarithms,

~~~math
\boxed{
\nu
=
\log
\frac{3^{36026}}
{2^{40988}5^{6939}}.
}
~~~

Exact integer comparison gives

~~~math
3^{36026}
>
2^{40988}5^{6939},
~~~

so

~~~math
\nu>0.
~~~

Moreover

~~~math
\omega-\nu
=
(15643,-31286,-12632),
~~~

and

~~~math
\boxed{
\omega-\nu
=
\log
\frac{2^{74616}5^{12632}}
{3^{65583}}.
}
~~~

Exact integer comparison gives

~~~math
2^{74616}5^{12632}
>
3^{65583},
~~~

hence

~~~math
\boxed{
0<\nu<\omega.
}
~~~

Thus the next Euclidean relation is

~~~math
\boxed{
\tau
=
\omega+\nu.
}
~~~

---

## 2. Omega seam typing

At

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+4\tau,
~~~

the final full-tau chamber has reached its far boundary.

The T2 centers have collapsed.

The two surviving generic species are:

- T3 / 86774, count 1348;
- S0 / 18984, count 295.

Therefore the seam contains

~~~math
\boxed{
1348+295
=
1643
}
~~~

generic open intervals, with equality seeds retained separately.

---

## 3. First omega chamber atlas

For

~~~math
0<\delta<\omega,
~~~

every generic seam interval acquires a new left-edge band of width delta.

The new-anchor set is

~~~math
\boxed{
\mathcal A_{O_0}
=
\mathcal A_{T_3}
\sqcup
(4\tau+\mathcal A_{S_0}).
}
~~~

The two anchor families are disjoint.

Their cardinalities are

~~~math
1348
~~~

and

~~~math
295,
~~~

giving

~~~math
\boxed{
1643
}
~~~

new bands.

The inherited centers remain

~~~math
1348\text{ T}_3
~~~

and

~~~math
295\text{ S}_0.
~~~

Hence the chamber contains

~~~math
1643+1348+295
=
\boxed{3286}
~~~

generic open bands.

---

## 4. O0 source architecture

The important source-level fact is that the first omega chamber does not introduce a new body size.

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
|\mathcal W|=9497.
~~~

The checked tau sequence was

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

~~~math
\mathcal T_3
=
\mathcal T_2
\sqcup
(3\tau+\mathcal W).
~~~

The omega-chamber orbit gives

~~~math
\boxed{
\mathcal O_0
=
\mathcal T_3
\sqcup
(4\tau+\mathcal W).
}
~~~

The new shifted copy is disjoint from T3.

This was checked directly: subtracting 4 tau from the 9497 new constant sites gives W exactly.

Subtracting omega instead does not identify any old body.

Therefore the load-bearing source architecture is a fourth stabilized W module at shift 4 tau, even though the active chamber width has changed from tau to omega.

Since

~~~math
|\mathcal T_3|=43387,
~~~

we get

~~~math
\begin{aligned}
|\mathcal O_0|
&=
43387+9497
\\
&=
\boxed{52884}
\end{aligned}
~~~

per orientation.

Hence the full matrix size is

~~~math
\boxed{
2\cdot52884
=
105768.
}
~~~

---

## 5. Exact row census

For each orientation of O0, the source-row census is

~~~math
\boxed{
A:10246,
\qquad
B:10246,
\qquad
D:10247,
\qquad
T:22145.
}
~~~

These sum to

~~~math
10246+10246+10247+22145
=
52884.
~~~

T3 had census

~~~math
A:8406,
\quad
B:8406,
\quad
D:8407,
\quad
T:18168.
~~~

Therefore the fourth shifted W module contributes

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

exactly the same increment as the preceding stabilized tau tiers.

---

## 6. Orientation equality

The representative O0 orbit satisfies

~~~math
\boxed{
\mathcal O_0^+
=
\mathcal O_0^-.
}
~~~

Each orientation contains

~~~math
52884
~~~

constant sites.

Therefore the full O0 system admits the same reflection-sector reduction:

~~~math
\boxed{
105768
\longrightarrow
52884+52884.
}
~~~

This pass intentionally stops before that invertibility certificate.

---

## 7. New-band graph uniqueness

The canonical new band is certified over

~~~math
0\le\zeta\le\delta\le\omega.
~~~

Every affine region margin has the required exact sign at the three parameter-triangle vertices.

A representative from the second anchor family

~~~math
4\tau+\mathcal A_{S_0}
~~~

has exactly the same normalized row graph as the canonical new band.

Together with the established affine anchor translations inside the T3 family, this identifies one O0 source graph across all 1643 new bands.

---

## 8. Inherited T3 species

The surviving T3 / 86774 centers are exact relabelings of the certified T3 graph.

The base changes by one full tau step between COCYCLE-28 and this seam.

Accordingly the exact orientation relabeling is

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\tau.
~~~

The verifier checks row-graph equality.

Thus every inherited T3 center remains certified by SZ-RETURN-COCYCLE-29.

---

## 9. Inherited S0 species

The surviving S0 / 18984 centers are exact relabelings of the certified S0 graph.

The complementary shift is

~~~math
(+):C\mapsto C+\tau,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus all inherited S0 centers remain certified.

---

## 10. Next topology event

Inside the first omega chamber:

- the S0 center width is
  ~~~math
  \omega-\delta;
  ~~~
- the T3 center width is
  ~~~math
  \tau-\delta.
  ~~~

Since

~~~math
0<\omega<\tau,
~~~

the next event occurs at

~~~math
\boxed{
\delta=\omega.
}
~~~

At that seam all S0 centers collapse.

The surviving T3 center width becomes

~~~math
\tau-\omega
=
\boxed{\nu}.
~~~

Thus nu is the next active residual.

---

## 11. Standing

The exact standing is:

### omega seam

~~~math
e
=
5\kappa+2\chi+\rho+\sigma+4\tau
~~~

typed.

### first omega chamber

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
~~~

classified into:

- O0 / 105768: new, invertibility open;
- T3 / 86774: certified;
- S0 / 18984: certified.

The chamber is not yet declared closed solely because O0 remains uncertified.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-30:
OMEGA SEAM TYPED /
O0-105768 SPECIES EXTRACTED /
FOURTH STABILIZED W MODULE HIT /
NU RESIDUAL IDENTIFIED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-31 /
O0 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize O0 into two 52884 reflection sectors;
2. use the chunked exact left-inverse compiler;
3. measure the actual sparsity and inverse envelope;
4. close the first omega chamber if certified;
5. only then type the nu seam at
   ~~~math
   e
   =
   5\kappa+2\chi+\rho+\sigma+4\tau+\omega.
   ~~~

**Stop rule:** do not infer a nu architecture before O0 is certified.
