# SZ-RETURN-COCYCLE-20 — Sigma Collision Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_20_sigma_collision_seam_verify.py

---

## 0. Result

The sigma collision occurs at

~~~math
e
=
5\kappa
+
2\chi
+
\rho.
~~~

At that seam, every remaining M6 / 2612 gap from the first rho chamber has collapsed.

The generic seam atlas therefore contains only

~~~math
\boxed{
168\text{ copies of }K_2/10798
}
~~~

and

~~~math
\boxed{
127\text{ copies of }K_1/8176.
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
\delta,
\qquad
0<\delta<\sigma.
~~~

A new graph species appears.

Its size is

~~~math
\boxed{18984}.
~~~

The complete generic atlas in this first sigma chamber contains

~~~math
\boxed{
295\times18984
+
168\times10798
+
127\times8176,
}
~~~

i.e.

~~~math
\boxed{590}
~~~

open generic seed bands.

All 295 new bands are one exact graph species.

No invertibility claim for that new species is made in this seam pass.

---

## 1. Euclidean residual chain

Recall

~~~math
\eta_*=h-5\kappa,
~~~

~~~math
\chi=\kappa-8\eta_*,
~~~

~~~math
\rho=\eta_*-3\chi,
~~~

and

~~~math
\sigma=\chi-\rho.
~~~

Define the next residual

~~~math
\boxed{
\tau:=\rho-\sigma.
}
~~~

In the q,j,k basis,

~~~math
\rho=(-665,1330,537),
~~~

~~~math
\sigma=(878,-1756,-709),
~~~

hence

~~~math
\boxed{
\tau=(-1543,3086,1246).
}
~~~

In prime logarithms,

~~~math
\boxed{
\tau
=
\log
\frac{3^{6469}}
{2^{7360}5^{1246}}.
}
~~~

Exact comparison gives

~~~math
3^{6469}
>
2^{7360}5^{1246},
~~~

so

~~~math
\tau>0.
~~~

Moreover

~~~math
\sigma-\tau
=
(2421,-4842,-1955),
~~~

so

~~~math
\boxed{
\sigma-\tau
=
\log
\frac{2^{11548}5^{1955}}
{3^{10150}}.
}
~~~

Exact comparison gives

~~~math
2^{11548}5^{1955}
>
3^{10150},
~~~

hence

~~~math
\boxed{
0<\tau<\sigma.
}
~~~

Thus the Euclidean chain now reads

~~~math
\boxed{
\rho=\sigma+\tau.
}
~~~

---

## 2. Seam at e=5 kappa + 2 chi + rho

Immediately below the seam, the local eta-cell structure was

~~~math
K_2/K_1/K_2/K_1/K_2/K_1/K_2/M_6.
~~~

At

~~~math
\delta=\rho,
~~~

the M6 residual width becomes zero.

Keeping equality seeds separate, the generic seam therefore consists only of

~~~math
\boxed{
168\text{ K}_2\text{ bands}
}
~~~

and

~~~math
\boxed{
127\text{ K}_1\text{ bands}.
}
~~~

The companion verifier reconstructs all 295 generic seam intervals and confirms the corresponding species sizes

~~~math
10798
~~~

and

~~~math
8176.
~~~

---

## 3. First sigma chamber

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
\delta,
\qquad
0<\delta<\sigma.
~~~

Every generic seam interval acquires a new left-edge band of width delta.

Thus the chamber contains:

- one new band at each of the 168 K2 anchors;
- one new band at each of the 127 K1 anchors;
- the surviving shortened K2 and K1 centers.

Therefore the exact new-anchor count is

~~~math
168+127
=
\boxed{295}.
~~~

The surviving inherited counts remain

~~~math
168
~~~

and

~~~math
127.
~~~

Hence the complete chamber has

~~~math
\boxed{
295+168+127
=
590
}
~~~

generic open bands.

---

## 4. The new S0 collision species

Retain the K2 set from SZ-RETURN-COCYCLE-18:

~~~math
\boxed{
\mathcal K_2
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
\sqcup
(2\chi+\mathcal X)
\sqcup
(3\chi+\mathcal X).
}
~~~

Its size is

~~~math
|\mathcal K_2|
=
5399
~~~

per orientation.

Let

~~~math
\mathcal C
~~~

be the five terminal cap sites, and define the top cap slice

~~~math
\boxed{
\mathcal T_X
=
7\eta_*+\mathcal C.
}
~~~

Define the sigma-collision return body

~~~math
\boxed{
\mathcal Y
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
\sqcup
(2\chi+\mathcal X)
\sqcup
(3\chi+\mathcal T_X).
}
~~~

The final full 3chi-shifted X body has therefore collapsed down to its five terminal cap sites.

Its size is

~~~math
\begin{aligned}
|\mathcal Y|
&=
1466
+
1311
+
1311
+
5
\\
&=
\boxed{4093}.
\end{aligned}
~~~

The new species has, on each orientation,

~~~math
\boxed{
\mathcal S_0
=
\mathcal K_2
\sqcup
(\rho+\mathcal Y).
}
~~~

The pieces are disjoint.

Therefore

~~~math
\begin{aligned}
|\mathcal S_0|
&=
5399+4093
\\
&=
\boxed{9492}
\end{aligned}
~~~

per orientation.

Hence the full two-orientation matrix has size

~~~math
\boxed{
2\cdot9492
=
18984.
}
~~~

---

## 5. Exact row census

For each orientation of S0, the source-row census is

~~~math
\boxed{
A:1839,
\qquad
B:1839,
\qquad
D:1840,
\qquad
T:3974.
}
~~~

These sum to

~~~math
1839+1839+1840+3974
=
9492.
~~~

K2 had census

~~~math
A:1046,
\quad
B:1046,
\quad
D:1047,
\quad
T:2260.
~~~

Therefore the rho-shifted truncated body Y contributes

~~~math
\boxed{
A:793,
\quad
B:793,
\quad
D:793,
\quad
T:1714.
}
~~~

These sum to

~~~math
4093,
~~~

exactly the size of Y.

---

## 6. Graph uniqueness

Let the exact set of K2 anchors be

~~~math
m\kappa+a\eta_*+b\chi,
~~~

with the unique values generated by

~~~math
0\le m\le4,
\qquad
0\le a\le8,
\qquad
0\le b\le3.
~~~

There are exactly

~~~math
168
~~~

such anchors.

The K1 center anchors are

~~~math
m\kappa+a\eta_*+b\chi+\rho,
~~~

with

~~~math
0\le b\le2,
~~~

giving exactly

~~~math
127
~~~

additional anchors.

The two sets are disjoint.

Thus the new S0 bands have exactly

~~~math
168+127
=
295
~~~

anchors.

Canonicalize

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta.
~~~

With the seam base

~~~math
5\kappa+2\chi+\rho,
~~~

all source arguments become

~~~math
C+\zeta
~~~

or

~~~math
C+\delta-\zeta.
~~~

After subtracting z0, every one of the 295 bands has the same row graph.

The companion verifier certifies the canonical new-band topology uniformly on

~~~math
0\le\zeta\le\delta\le\sigma
~~~

by checking every affine region margin at the three parameter-triangle vertices.

Every sign is reduced exactly to a prime-power comparison.

---

## 7. Inherited K2 species

The surviving K2 / 10798 bands are exact relabelings of the K2 graph certified in SZ-RETURN-COCYCLE-19.

The current orientation relabeling is

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\rho.
~~~

The companion verifier checks exact row-graph equality.

Thus every K2 band remains certified.

---

## 8. Inherited K1 species

The surviving K1 / 8176 bands are likewise exact relabelings of the K1 graph.

The current relabeling is again

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\rho.
~~~

Thus every K1 band remains certified.

---

## 9. Next topology event

The surviving K1 center widths are

~~~math
\sigma-\delta.
~~~

They collapse simultaneously at

~~~math
\delta=\sigma.
~~~

Therefore the next exact topology event is

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
\sigma.
}
~~~

At that seam the K2 centers retain width

~~~math
\rho-\sigma
=
\boxed{\tau}.
~~~

Thus tau is the next Euclidean residual exposed by the traversal.

The present pass stops before that seam.

---

## 10. Standing

The exact standing is:

### seam

~~~math
e
=
5\kappa+2\chi+\rho
~~~

typed.

### first sigma chamber

~~~math
5\kappa+2\chi+\rho
<
e
<
5\kappa+2\chi+\rho+\sigma
~~~

classified into:

- S0 / 18984: new, invertibility open;
- K2 / 10798: certified;
- K1 / 8176: certified.

Therefore the chamber is not yet declared closed solely because S0 remains uncertified.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-20:
SIGMA SEAM TYPED /
S0-18984 SPECIES EXTRACTED /
TAU RESIDUAL IDENTIFIED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-21 /
S0 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. use the equal-orientation constant set
   ~~~math
   \mathcal S_0
   ~~~
   to diagonalize the 18984 matrix into two 9492 reflection sectors;
2. test whether the stable rational inverse envelope persists;
3. certify S0 if possible;
4. then promote the first sigma chamber as closed;
5. only afterward type the tau seam at
   ~~~math
   e=5\kappa+2\chi+\rho+\sigma.
   ~~~

**Stop rule:** do not infer a general rho- or sigma-tier ladder past the tau collision.
