# SZ-RETURN-COCYCLE-12 — Eta-Wing Architecture Theorem

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL ARCHITECTURE THEOREM  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_12_eta_wing_architecture_verify.py

---

## 0. Result

The mixed-wing ladder is finite and admits one exact architecture throughout its entire pre-collision range.

Let

~~~math
\eta_*:=h-5\kappa
=
\lambda_{\rm ret}-4\kappa.
~~~

For level

~~~math
r\ge0,
~~~

write

~~~math
e
=
\lambda_{\rm ret}
+
r\eta_*
+
\delta.
~~~

For every full level

~~~math
r=0,1,\ldots,6,
~~~

take

~~~math
0<\delta<\eta_*.
~~~

There is one additional truncated level

~~~math
r=7
~~~

with

~~~math
0<\delta<\chi,
\qquad
\chi:=\kappa-8\eta_*.
~~~

The exact arithmetic ceiling is

~~~math
\boxed{
8\eta_*<\kappa<9\eta_*.
}
~~~

Therefore

~~~math
\boxed{
0<\chi<\eta_*.
}
~~~

At the upper endpoint of the truncated level,

~~~math
\boxed{
\lambda_{\rm ret}
+
7\eta_*
+
\chi
=
5\kappa.
}
~~~

Thus the eta-wing architecture covers the full mixed interval

~~~math
\boxed{
\lambda_{\rm ret}<e<5\kappa.
}
~~~

The next topology change is exactly the kappa collision at

~~~math
e=5\kappa.
~~~

---

## 1. Exact arithmetic ceiling

In the basis

~~~math
(q,j,k)
=
\left(
\log\frac43,
\log\frac98,
\log\frac{16}{15}
\right),
~~~

we have

~~~math
\kappa=(5,-10,-4),
~~~

and

~~~math
\eta_*=(-26,52,21).
~~~

Therefore

~~~math
\kappa-8\eta_*
=
(213,-426,-172).
~~~

Converted to prime logarithms,

~~~math
\boxed{
\kappa-8\eta_*
=
\log
\frac{2^{1016}5^{172}}{3^{893}}.
}
~~~

Exact big-integer comparison gives

~~~math
2^{1016}5^{172}>3^{893},
~~~

hence

~~~math
8\eta_*<\kappa.
~~~

Similarly,

~~~math
9\eta_* - \kappa
=
(-239,478,193),
~~~

so

~~~math
\boxed{
9\eta_* - \kappa
=
\log
\frac{3^{1002}}
{2^{1140}5^{193}}.
}
~~~

Exact comparison gives

~~~math
3^{1002}>2^{1140}5^{193},
~~~

hence

~~~math
\kappa<9\eta_*.
~~~

This is the exact arithmetic reason the wing ladder has seven full chambers plus one truncated chamber.

---

## 2. The fixed body and backward wing

Retain the 31-site h-chain skeleton

~~~math
\mathcal S.
~~~

Let

~~~math
\mathcal B
~~~

be its five chain bottoms and

~~~math
\mathcal C
~~~

the five h-successor cap sites from SZ-RETURN-COCYCLE-9.

Define the positive body

~~~math
\boxed{
\mathcal P
=
\bigcup_{n=0}^{5}
(\mathcal S+n\kappa).
}
~~~

Then

~~~math
|\mathcal P|
=
6\cdot31
=
186.
~~~

Define the backward wing

~~~math
\boxed{
\begin{aligned}
\mathcal W
={}&
\bigcup_{n=-5}^{-1}
((\mathcal S\setminus\mathcal B)+n\kappa)
\\
&\cup
\bigcup_{n=-5}^{0}
(\mathcal C+n\kappa).
\end{aligned}
}
~~~

Then

~~~math
|\mathcal W|
=
5\cdot26+6\cdot5
=
160.
~~~

The body and wing are disjoint.

---

## 3. Level-r new species

For each admissible level r, the new mixed species has, **on each orientation**, the exact constant set

~~~math
\boxed{
\mathcal M_r
=
\mathcal P
\sqcup
\bigcup_{a=0}^{r}
(a\eta_*+\mathcal W).
}
~~~

The companion verifier reconstructs the source orbit independently at every actual arithmetic level

~~~math
r=0,1,\ldots,7
~~~

and verifies this set equality exactly.

All translated wing tiers are disjoint throughout the pre-collision range.

Therefore

~~~math
\begin{aligned}
|\mathcal M_r|
&=
186+160(r+1),
\end{aligned}
~~~

per orientation, and the full two-orientation matrix has size

~~~math
\boxed{
N_r
=
2\bigl(186+160(r+1)\bigr).
}
~~~

Equivalently,

~~~math
\boxed{
N_r=692+320r.
}
~~~

---

## 4. Actual mixed species sizes

The arithmetic ladder is therefore:

| r | new species |
|---:|---:|
| 0 | 692 |
| 1 | 1012 |
| 2 | 1332 |
| 3 | 1652 |
| 4 | 1972 |
| 5 | 2292 |
| 6 | 2612 |
| 7 | 2932 |

The first three species

~~~math
692,1012,1332
~~~

were certified invertible in SZ-RETURN-COCYCLE-9 through 11.

The architecture theorem introduces no new invertibility claim for

~~~math
1652,1972,2292,2612,2932.
~~~

Those are now the complete remaining matrix species before

~~~math
e=5\kappa.
~~~

---

## 5. Universal row census

For each orientation of the level-r new species, the source-row census is

~~~math
\boxed{
A=67+31r,
}
~~~

~~~math
\boxed{
B=67+31r,
}
~~~

~~~math
\boxed{
D=68+31r,
}
~~~

and

~~~math
\boxed{
T=144+67r.
}
~~~

Their sum is

~~~math
346+160r
=
186+160(r+1),
~~~

as required.

Thus every new eta-star wing contributes exactly

~~~math
\boxed{
A31/B31/D31/T67.
}
~~~

This recovers the additive pattern already observed at levels 1 and 2 and proves it for every actual pre-collision level.

---

## 6. Why the wing tier repeats

The source equations use only fixed translations and two reflections.

After writing

~~~math
e
=
\lambda_{\rm ret}
+
r\eta_*
+
\delta,
~~~

and canonicalizing a new seed band as

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta,
~~~

the two reflection constants are

~~~math
\rho_A^{(r)}(C)
=
k+\lambda_{\rm ret}+r\eta_*-C,
~~~

and

~~~math
\rho_T^{(r)}(C)
=
2q+\lambda_{\rm ret}+r\eta_*-C.
~~~

Hence for any eta-tier

~~~math
C+a\eta_*,
~~~

we have

~~~math
\boxed{
\rho_*^{(r)}(C+a\eta_*)
=
\rho_*^{(0)}(C)
+
(r-a)\eta_*.
}
~~~

Translations preserve the eta-tier index.

Reflections reverse it.

This is the algebraic mechanism behind the stacked-wing architecture.

The finite source-map verification checks that, across all actual levels r=0,...,7, the only constants needed are precisely the fixed body P and the wing tiers

~~~math
a\eta_*+\mathcal W,
\qquad
0\le a\le r.
~~~

No second body, new h-chain family, or new reflection species appears before the kappa collision.

---

## 7. Universal seed-band alternation

Fix an admissible level r.

For every

~~~math
0\le m\le4
~~~

and

~~~math
0\le a\le r+1,
~~~

the new bands are

~~~math
\boxed{
m\kappa+a\eta_*
<
z
<
m\kappa+a\eta_*+\delta.
}
~~~

Each has the level-r graph

~~~math
\mathcal M_r.
~~~

For

~~~math
0\le a\le r,
~~~

the intermediate bands are

~~~math
\boxed{
m\kappa+a\eta_*+\delta
<
z
<
m\kappa+(a+1)\eta_*.
}
~~~

For r>=1, each is an exact relabeling of

~~~math
\mathcal M_{r-1}.
~~~

The relabeling leaves the positive orientation fixed and shifts the reflected orientation by

~~~math
+\eta_*.
~~~

At r=0, the intermediate species is the previously certified

~~~math
G_4
~~~

of size

~~~math
372.
~~~

---

## 8. The long residual band remains G_3

For

~~~math
0\le m<4,
~~~

after the final eta-star band there remains

~~~math
\boxed{
m\kappa
+
(r+1)\eta_*
+
\delta
<
z
<
(m+1)\kappa.
}
~~~

Throughout every admissible level this band is exactly a relabeling of the old

~~~math
G_3
~~~

species of size

~~~math
310.
~~~

Relative to the base G_3 graph, the positive orientation is shifted by

~~~math
r\eta_*,
~~~

while the negative orientation remains fixed.

Thus no new long-gap species is created anywhere in the wing ladder.

---

## 9. Universal atlas size

For a full level

~~~math
r=0,\ldots,6,
~~~

each of the first four kappa cells contains

~~~math
r+2
~~~

new M_r bands,

~~~math
r+1
~~~

intermediate M_{r-1} bands, and one long G_3 band.

The fifth cell omits the final G_3 band.

Therefore the total number of open seed bands is

~~~math
\boxed{
10r+19.
}
~~~

The exact counts are:

| r | open bands |
|---:|---:|
| 0 | 19 |
| 1 | 29 |
| 2 | 39 |
| 3 | 49 |
| 4 | 59 |
| 5 | 69 |
| 6 | 79 |
| 7 | 89 |

The same formula holds for the truncated level r=7 because its shortened delta interval leaves the ordering unchanged.

The companion verifier reconstructs all these representative atlases and confirms the predicted matrix-size sequence in every band.

---

## 10. Exact chamber typing

The architecture is not based only on representative samples.

For each level r, the source orbit has only three canonical band types requiring independent topology certification:

1. the new M_r band;
2. the intermediate M_{r-1} band;
3. the long G_3 band.

Every region boundary is affine in

~~~math
(\delta,\zeta).
~~~

For levels

~~~math
r=0,\ldots,6,
~~~

the parameter ceiling is

~~~math
0\le\delta\le\eta_*.
~~~

For level

~~~math
r=7,
~~~

it is

~~~math
0\le\delta\le\chi.
~~~

The verifier evaluates every source-row region margin at the vertices of the corresponding closed parameter polygon.

After substitution, every margin is an integer combination of

~~~math
q,j,k,
~~~

and its sign is decided exactly by prime-power comparison.

All required margins are nonnegative on the closed polygons and strict in the open chambers.

Thus the architecture is uniform over the full admissible parameter ranges.

---

## 11. Final truncated level

Because

~~~math
8\eta_*<\kappa<9\eta_*,
~~~

level r=7 cannot occupy a full eta-star width.

Its admissible residual is

~~~math
\boxed{
0<\delta<\chi,
\qquad
\chi=\kappa-8\eta_*.
}
~~~

The new species is still

~~~math
\boxed{
N_7
=
2932.
}
~~~

The intermediate species is

~~~math
M_6
~~~

of size

~~~math
2612,
~~~

and the long residual species remains

~~~math
G_3
~~~

of size

~~~math
310.
~~~

At

~~~math
\delta=\chi,
~~~

the final long G_3 interval collapses.

Exactly,

~~~math
\begin{aligned}
e
&=
\lambda_{\rm ret}
+
7\eta_*
+
\chi
\\
&=
\lambda_{\rm ret}
+
7\eta_*
+
\kappa
-
8\eta_*
\\
&=
\lambda_{\rm ret}
+
\kappa
-
\eta_*
\\
&=
h-\eta_*
\\
&=
5\kappa.
\end{aligned}
~~~

Thus

~~~math
\boxed{
e=5\kappa
}
~~~

is the next arithmetic collision.

The eta-wing theorem stops there.

---

## 12. Scope and remaining work

The theorem now classifies the complete source-orbit architecture on

~~~math
\boxed{
\lambda_{\rm ret}<e<5\kappa.
}
~~~

It does **not** prove all remaining M_r matrices invertible.

Current invertibility standing:

- M_0 / 692: certified;
- M_1 / 1012: certified;
- M_2 / 1332: certified;
- M_3 / 1652: open;
- M_4 / 1972: open;
- M_5 / 2292: open;
- M_6 / 2612: open;
- M_7 / 2932: open.

The inherited intermediate and long species are already covered whenever their referenced lower-level certificates exist.

Therefore only five genuinely new matrix species remain before the collision at

~~~math
5\kappa.
~~~

---

## 13. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-12:
ETA-WING ARCHITECTURE THEOREM /
PRE-5-KAPPA GEOMETRY EXHAUSTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 14. Next cursor

The next task should exploit the proved tier architecture rather than return to atlas enumeration.

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-13 /
WING-TIER INVERTIBILITY COMPILER}
}
~~~

Priority:

1. order M_r by
   ~~~math
   \mathcal P,
   \mathcal W,
   \eta_*+\mathcal W,
   \ldots,
   r\eta_*+\mathcal W;
   ~~~
2. derive the block coupling pattern between wing tiers;
3. determine whether reflection reversal makes the tier matrix block Toeplitz-Hankel or reducible after orientation doubling;
4. seek a reusable rational preconditioner/Schur update from M_r to M_{r+1};
5. use it to certify the remaining finite list
   ~~~math
   1652,1972,2292,2612,2932.
   ~~~

**Stop rule:** do not claim uniform all-r invertibility from the architecture theorem alone.
