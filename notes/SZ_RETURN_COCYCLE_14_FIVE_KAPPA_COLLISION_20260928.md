# SZ-RETURN-COCYCLE-14 — 5-Kappa Collision Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_14_five_kappa_seam_verify.py

---

## 0. Result

The eta-star wing architecture terminates exactly at

~~~math
e=5\kappa.
~~~

At that seam:

- the final long G3 / 310 residual bands collapse to zero width;
- the surviving generic seed bands are only M7 / 2932 and M6 / 2612.

Immediately above the seam, a new positive residual length appears:

~~~math
\boxed{
\chi
:=
\kappa-8\eta_*.
}
~~~

The exact arithmetic bounds are

~~~math
\boxed{
0<\chi<\eta_*.
}
~~~

Thus the first post-collision chamber is

~~~math
\boxed{
e
=
5\kappa+\varepsilon,
\qquad
0<\varepsilon<\chi.
}
~~~

A new finite orbit species appears there.

Its size is

~~~math
\boxed{5554}.
~~~

The chamber has exactly 171 generic seed bands:

~~~math
\boxed{
86\times5554
+
45\times2932
+
40\times2612.
}
~~~

All 86 new 5554 bands are one exact graph species.

No invertibility claim for that new species is made in this seam pass.

---

## 1. Exact collision arithmetic

Recall

~~~math
\eta_*=h-5\kappa
~~~

and

~~~math
\lambda_{\rm ret}=h-\kappa.
~~~

Define

~~~math
\chi
=
\kappa-8\eta_*.
~~~

Then

~~~math
\chi
=
41\kappa-8h.
~~~

Using

~~~math
\kappa=k-5h,
~~~

we obtain

~~~math
\boxed{
\chi
=
41k-213h.
}
~~~

In the q,j,k basis,

~~~math
\boxed{
\chi=(213,-426,-172).
}
~~~

In prime logarithms,

~~~math
\boxed{
\chi
=
\log
\frac{2^{1016}5^{172}}{3^{893}}.
}
~~~

Exact integer comparison gives

~~~math
2^{1016}5^{172}>3^{893},
~~~

so

~~~math
\chi>0.
~~~

The eta-wing ceiling proved

~~~math
8\eta_*<\kappa<9\eta_*,
~~~

therefore

~~~math
\boxed{
0<\chi<\eta_*.
}
~~~

Finally,

~~~math
\lambda_{\rm ret}
+
7\eta_*
+
\chi
=
5\kappa.
~~~

This is the exact identity producing the collision.

---

## 2. What collapses at e=5 kappa

At level r=7 below the collision, the generic atlas consists of:

1. M7 / 2932 new bands;
2. M6 / 2612 intermediate bands;
3. four G3 / 310 long residual bands.

The long residual width is

~~~math
\kappa
-
8\eta_*
-
\delta.
~~~

At the final admissible value

~~~math
\delta=\chi
=
\kappa-8\eta_*,
~~~

this width becomes zero.

Hence all four G3 residual bands collapse simultaneously.

The generic seam atlas therefore has exactly:

~~~math
\boxed{
45\text{ M7 bands}
}
~~~

and

~~~math
\boxed{
40\text{ M6 bands}.
}
~~~

There are

~~~math
45+40=85
~~~

open generic bands at the seam.

The isolated equality seeds remain seam points and are not absorbed into either open species.

---

## 3. First chamber above the collision

Write

~~~math
e
=
5\kappa+\varepsilon,
\qquad
0<\varepsilon<\chi.
~~~

For every old eta-star anchor

~~~math
g=m\kappa+a\eta_*,
~~~

the old M7 interval is no longer a single band.

It splits locally as

~~~math
\boxed{
\begin{array}{ccl}
(g,g+\varepsilon)
&:&
C_0,
\\[1mm]
(g+\varepsilon,g+\chi)
&:&
M_7,
\\[1mm]
(g+\chi,g+\chi+\varepsilon)
&:&
C_0.
\end{array}
}
~~~

For

~~~math
a=0,\ldots,7,
~~~

the remaining interval

~~~math
\boxed{
g+\chi+\varepsilon
<
z
<
g+\eta_*
}
~~~

is the inherited M6 / 2612 species.

At a=8, the point

~~~math
g+\chi=(m+1)\kappa
~~~

is the next kappa-cell boundary, so adjacent collision bands identify under the natural affine relabeling.

Accounting for those four internal identifications gives the exact generic counts:

~~~math
\boxed{
86\text{ collision bands},
}
~~~

~~~math
\boxed{
45\text{ M7 bands},
}
~~~

~~~math
\boxed{
40\text{ M6 bands}.
}
~~~

Thus the complete first post-collision atlas has

~~~math
\boxed{
86+45+40
=
171
}
~~~

open generic seed bands.

---

## 4. The new collision species

Retain the mixed-wing body

~~~math
\mathcal P
~~~

of size

~~~math
186
~~~

and backward wing

~~~math
\mathcal W
~~~

of size

~~~math
160.
~~~

The level-7 mixed species has per orientation

~~~math
\boxed{
\mathcal M_7
=
\mathcal P
\sqcup
\bigcup_{a=0}^{7}
(a\eta_*+\mathcal W),
}
~~~

with

~~~math
|\mathcal M_7|
=
1466.
~~~

Now define the **collision return body**

~~~math
\boxed{
\mathcal X
=
\mathcal P
\sqcup
\bigcup_{a=0}^{6}
(a\eta_*+\mathcal W)
\sqcup
(7\eta_*+\mathcal C),
}
~~~

where

~~~math
\mathcal C
~~~

is the five-site cap set from the mixed seam.

Its size is

~~~math
\begin{aligned}
|\mathcal X|
&=
186
+
7\cdot160
+
5
\\
&=
\boxed{1311}.
\end{aligned}
~~~

The new collision species has, on each orientation,

~~~math
\boxed{
\mathcal K_0
=
\mathcal M_7
\sqcup
(\chi+\mathcal X).
}
~~~

The two pieces are disjoint.

Therefore

~~~math
|\mathcal K_0|
=
1466+1311
=
\boxed{2777}
~~~

per orientation, and

~~~math
\boxed{
2\cdot2777
=
5554
}
~~~

for the full parity matrix.

---

## 5. What is truncated in X

The final eta-star wing tier is

~~~math
7\eta_*+\mathcal W.
~~~

The collision body X retains from that top tier only

~~~math
7\eta_*+\mathcal C,
~~~

the five cap sites.

Equivalently,

~~~math
\boxed{
\mathcal X
=
\mathcal M_7
\setminus
\left[
7\eta_*+
(\mathcal W\setminus\mathcal C)
\right].
}
~~~

Since

~~~math
|\mathcal W\setminus\mathcal C|
=
160-5
=
155,
~~~

we recover

~~~math
1466-155
=
1311.
~~~

Thus the 5-kappa collision does not append a complete copy of M7.

It appends a chi-shifted **truncation** of M7 in which the highest eta-wing tier has collapsed down to the five cap sites.

This is the new boundary module born at the collision.

---

## 6. Exact row census

For each orientation of M7, the eta-wing theorem gives

~~~math
\boxed{
A:284,
\quad
B:284,
\quad
D:285,
\quad
T:613.
}
~~~

The new 5554 species has per orientation

~~~math
\boxed{
A:538,
\quad
B:538,
\quad
D:539,
\quad
T:1162.
}
~~~

Hence the chi-shifted collision body contributes

~~~math
\boxed{
A:254,
\quad
B:254,
\quad
D:254,
\quad
T:549.
}
~~~

These sum to

~~~math
254+254+254+549
=
1311,
~~~

as required.

---

## 7. Graph uniqueness

Canonicalize a collision seed band as

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\varepsilon.
~~~

With

~~~math
e=5\kappa+\varepsilon,
~~~

all source-map arguments take the form

~~~math
C+\zeta
~~~

or

~~~math
C+\varepsilon-\zeta.
~~~

After subtracting the anchor z_0 from the orientation constants, every one of the 86 collision bands has the same row graph.

Thus:

~~~math
\boxed{
\text{there is exactly one new 5554 graph species in the first chamber.}
}
~~~

The companion verifier checks the collision-band region inequalities uniformly over

~~~math
0\le\zeta\le\varepsilon\le\chi
~~~

by evaluating every affine margin at the three parameter-triangle vertices.

Every resulting sign is reduced to an exact prime-power comparison.

---

## 8. What survives from the old compiler

The first post-collision chamber uses only three graph species:

1. the new collision graph K0 / 5554;
2. M7 / 2932;
3. M6 / 2612.

The old M7 and M6 species remain unchanged up to affine relabeling.

Therefore the 5-kappa event does **not** destroy the prior wing compiler.

It adds a new boundary module:

~~~math
\boxed{
\chi+\mathcal X.
}
~~~

What changes is the residual alphabet.

Before the collision, the final unresolved spacing was eta-star.

At the collision,

~~~math
\kappa
=
8\eta_*+\chi.
~~~

So the Euclidean residual becomes

~~~math
\boxed{
\chi.
}
~~~

This is the next return scale that must govern any continuation beyond 5 kappa.

---

## 9. Next collision

Within

~~~math
0<\varepsilon<\chi,
~~~

each surviving M7 center has width

~~~math
\chi-\varepsilon.
~~~

Therefore the next topology event is exact:

~~~math
\boxed{
\varepsilon=\chi,
}
~~~

i.e.

~~~math
\boxed{
e=5\kappa+\chi.
}
~~~

At that point all 45 surviving M7 centers collapse simultaneously.

The present seam theorem stops before that second collision.

---

## 10. Standing

The result of this pass is structural, not yet an invertibility closure.

We have:

- exact 5-kappa seam typing;
- exact first post-collision chamber geometry;
- exact 5554 collision species;
- exact collision-body decomposition;
- exact next residual scale chi;
- exact next topology threshold e=5 kappa+chi.

We do **not** yet have a source-level invertibility certificate for the 5554 species.

Therefore the open region

~~~math
5\kappa<e<5\kappa+\chi
~~~

is **not yet declared closed**.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-14:
5-KAPPA COLLISION TYPED /
CHI-RETURN BODY EXTRACTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-15 /
CHI-COLLISION INVERTIBILITY COMPILER}.
}
~~~

Priority:

1. order K0 as
   ~~~math
   \mathcal M_7
   \oplus
   (\chi+\mathcal X);
   ~~~
2. identify the old/new block interface;
3. reverse any reflected subtiers needed to recover a banded normal form;
4. build a rational preconditioner or Schur update from the certified M7 compiler;
5. certify the 5554 species;
6. only then promote
   ~~~math
   5\kappa<e<5\kappa+\chi
   ~~~
   as closed.

**Stop rule:** do not extrapolate the eta-star wing formula through the chi collision.
