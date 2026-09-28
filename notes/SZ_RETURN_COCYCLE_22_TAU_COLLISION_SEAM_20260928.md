# SZ-RETURN-COCYCLE-22 — Tau Collision Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_22_tau_collision_seam_verify.py

---

## 0. Result

The tau collision occurs at

~~~math
e
=
5\kappa
+
2\chi
+
\rho
+
\sigma.
~~~

At that seam, every surviving K1 / 8176 center from the first sigma chamber collapses.

The generic seam atlas contains only

~~~math
\boxed{
295\text{ copies of }S_0/18984
}
~~~

and

~~~math
\boxed{
168\text{ copies of }K_2/10798.
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
\delta,
\qquad
0<\delta<\tau.
~~~

A new graph species appears.

Its size is

~~~math
\boxed{29792}.
~~~

The complete generic atlas in this first tau chamber contains

~~~math
\boxed{
463\times29792
+
295\times18984
+
168\times10798,
}
~~~

i.e.

~~~math
\boxed{926}
~~~

open generic seed bands.

All 463 new bands are one exact graph species.

No invertibility claim for that new species is made in this seam pass.

---

## 1. Euclidean residual chain

Recall

~~~math
\rho=\sigma+\tau.
~~~

The next division is not one subtraction.

Exact arithmetic gives

~~~math
\boxed{
\sigma
=
4\tau
+
\omega,
}
~~~

where

~~~math
\boxed{
\omega
:=
\sigma-4\tau.
}
~~~

In the q,j,k basis,

~~~math
\tau=(-1543,3086,1246),
~~~

so

~~~math
\boxed{
\omega=(7050,-14100,-5693).
}
~~~

In prime logarithms,

~~~math
\boxed{
\omega
=
\log
\frac{2^{33628}5^{5693}}
{3^{29557}}.
}
~~~

Exact integer comparison gives

~~~math
2^{33628}5^{5693}>3^{29557},
~~~

hence

~~~math
\omega>0.
~~~

Also

~~~math
\tau-\omega
=
(-8593,17186,6939),
~~~

with

~~~math
\boxed{
\tau-\omega
=
\log
\frac{3^{36026}}
{2^{40988}5^{6939}}.
}
~~~

Exact comparison gives

~~~math
3^{36026}>2^{40988}5^{6939},
~~~

so

~~~math
\boxed{
0<\omega<\tau.
}
~~~

Thus the continued Euclidean arithmetic has quotient four at this stage.

The first tau chamber treated here is only the first of those tau-width insertions.

---

## 2. Seam at the tau collision

Immediately below the seam, the first sigma chamber contained:

- S0 / 18984 new bands;
- K2 / 10798 centers;
- K1 / 8176 centers.

At

~~~math
\delta=\sigma,
~~~

all K1 centers collapse.

The K2 center width becomes

~~~math
\rho-\sigma
=
\boxed{\tau}.
~~~

Keeping equality seeds separate, the generic seam atlas therefore contains exactly

~~~math
\boxed{
295\text{ S}_0\text{ bands}
}
~~~

and

~~~math
\boxed{
168\text{ K}_2\text{ bands}.
}
~~~

The companion verifier reconstructs all 463 seam intervals directly.

---

## 3. First tau chamber

Write

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
\delta,
\qquad
0<\delta<\tau.
~~~

Every generic seam interval acquires a new left-edge band of width delta.

The 295 S0 seam intervals and the 168 K2 seam intervals have disjoint new-band anchors.

Hence the new-anchor count is

~~~math
295+168
=
\boxed{463}.
~~~

The surviving inherited counts remain

~~~math
295
~~~

and

~~~math
168.
~~~

Therefore the full chamber has

~~~math
\boxed{
463+295+168
=
926
}
~~~

generic open bands.

---

## 4. The new T0 collision species

Retain the certified S0 constant set

~~~math
\mathcal S_0
~~~

of size

~~~math
9492
~~~

per orientation.

Define the five-site terminal rho-cap slice

~~~math
\boxed{
\mathcal T_{\rho}
=
\rho
+
3\chi
+
\mathcal T_X,
}
~~~

where

~~~math
\mathcal T_X
=
7\eta_*+\mathcal C
~~~

is the five-site terminal cap slice from the sigma collision.

Define the tau-collision return body

~~~math
\boxed{
\mathcal Z
=
\mathcal K_2
\sqcup
\mathcal T_{\rho}.
}
~~~

Since

~~~math
|\mathcal K_2|=5399
~~~

and

~~~math
|\mathcal T_{\rho}|=5,
~~~

we have

~~~math
\boxed{
|\mathcal Z|=5404.
}
~~~

The new species uses, on each orientation,

~~~math
\boxed{
\mathcal T_0
=
\mathcal S_0
\sqcup
(\sigma+\mathcal Z).
}
~~~

The two pieces are disjoint.

Therefore

~~~math
\begin{aligned}
|\mathcal T_0|
&=
9492+5404
\\
&=
\boxed{14896}
\end{aligned}
~~~

per orientation.

Hence the full two-orientation matrix has

~~~math
\boxed{
2\cdot14896
=
29792
}
~~~

variables.

---

## 5. Exact row census

For each orientation of T0, the exact source-row census is

~~~math
\boxed{
A:2886,
\qquad
B:2886,
\qquad
D:2887,
\qquad
T:6237.
}
~~~

These sum to

~~~math
2886+2886+2887+6237
=
14896.
~~~

S0 had census

~~~math
A:1839,
\quad
B:1839,
\quad
D:1840,
\quad
T:3974.
~~~

Therefore the sigma-shifted truncated body Z contributes

~~~math
\boxed{
A:1047,
\quad
B:1047,
\quad
D:1047,
\quad
T:2263.
}
~~~

These sum to

~~~math
5404,
~~~

exactly the size of Z.

---

## 6. Graph uniqueness

The new-band anchors are the union of:

1. the 295 S0 seam anchors;
2. the 168 K2 right-edge anchors shifted by sigma.

The sets are disjoint, giving exactly

~~~math
\boxed{463}
~~~

anchors.

Canonicalize

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta.
~~~

With seam base

~~~math
5\kappa+2\chi+\rho+\sigma,
~~~

every source argument reduces to

~~~math
C+\zeta
~~~

or

~~~math
C+\delta-\zeta.
~~~

After subtracting the anchor, every one of the 463 new bands has the same row graph.

The companion verifier certifies the canonical topology uniformly on

~~~math
0\le\zeta\le\delta\le\tau
~~~

by checking every affine region margin at the parameter-triangle vertices.

Every sign is reduced exactly to a prime-power comparison.

---

## 7. Inherited S0 species

The surviving S0 / 18984 bands are exact relabelings of the S0 graph certified in SZ-RETURN-COCYCLE-21.

The current relabeling is

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\sigma.
~~~

The companion verifier checks row-by-row graph equality.

Thus every surviving S0 band remains certified invertible.

---

## 8. Inherited K2 species

The surviving K2 / 10798 bands are also exact relabelings of the K2 graph certified in SZ-RETURN-COCYCLE-19.

Their current relabeling is the complementary shift

~~~math
(+):C\mapsto C+\sigma,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus every surviving K2 band remains certified.

---

## 9. Immediate next topology event

In the first tau chamber the surviving K2 center width is

~~~math
\tau-\delta.
~~~

Therefore it collapses at

~~~math
\boxed{
\delta=\tau.
}
~~~

At that point the surviving S0 center width is

~~~math
\sigma-\tau.
~~~

Using

~~~math
\sigma=4\tau+\omega,
~~~

this becomes

~~~math
\boxed{
3\tau+\omega.
}
~~~

So omega is not yet the immediate geometric center width after one tau insertion.

Rather, it is the Euclidean remainder after four tau-width steps.

This distinction is load-bearing: the traversal should next certify T0 and then type the subsequent tau tier, rather than jumping directly to an omega chamber.

---

## 10. Standing

The exact current standing is:

### seam

~~~math
e
=
5\kappa+2\chi+\rho+\sigma
~~~

typed.

### first tau chamber

~~~math
5\kappa+2\chi+\rho+\sigma
<
e
<
5\kappa+2\chi+\rho+\sigma+\tau
~~~

classified into:

- T0 / 29792: new, invertibility open;
- S0 / 18984: certified;
- K2 / 10798: certified.

Therefore this chamber is not yet declared closed solely because T0 remains uncertified.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-22:
TAU SEAM TYPED /
T0-29792 SPECIES EXTRACTED /
QUOTIENT-4 OMEGA REMAINDER IDENTIFIED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-23 /
T0 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize T0 into its two 14896 reflection sectors;
2. use the chunked rational left-inverse compiler from S0;
3. test whether the uniform envelope
   ~~~math
   \|R\|_\infty<64,
   \qquad
   \|I-RA_0\|_\infty<1/2950
   ~~~
   persists;
4. close the first tau chamber if certified;
5. only then type the next tau-tier seam at delta=tau.

**Stop rule:** do not jump from the quotient-four identity directly to omega before the intervening tau tiers are typed.
