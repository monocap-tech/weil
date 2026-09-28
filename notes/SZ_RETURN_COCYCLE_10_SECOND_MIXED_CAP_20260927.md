# SZ-RETURN-COCYCLE-10 — Second Mixed Cap Layer Closed

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_10_second_mixed_cap_verify.py

---

## 0. Result

Let

~~~math
\eta_*:=\lambda_{\rm ret}-4\kappa=h-5\kappa.
~~~

The first mixed chamber ended at

~~~math
e=\lambda_{\rm ret}+\eta_*.
~~~

Now write

~~~math
e
=
\lambda_{\rm ret}
+
\eta_*
+
\delta,
\qquad
0<\delta<\eta_*.
~~~

The complete generic seed atlas has 29 open bands with exact size pattern

~~~math
\boxed{
1012/692/1012/692/1012/310
}
~~~

repeated across four full kappa cells, followed by

~~~math
\boxed{
1012/692/1012/692/1012.
}
~~~

Equivalently,

~~~math
\boxed{
\begin{aligned}
&1012,692,1012,692,1012,310,\\
&1012,692,1012,692,1012,310,\\
&1012,692,1012,692,1012,310,\\
&1012,692,1012,692,1012,310,\\
&1012,692,1012,692,1012.
\end{aligned}
}
~~~

All fifteen 1012 bands are one exact graph species.

All ten 692 bands are one exact graph species.

All four 310 bands are one exact graph species.

Each of the three species is rigorously invertible for both external parity choices.

Therefore

~~~math
\boxed{
\lambda_{\rm ret}+\eta_*
<
e
<
\lambda_{\rm ret}+2\eta_*
}
~~~

is closed for generic seed positions, modulo the lower-dimensional band seams.

---

## 1. Exact band geometry

Put

~~~math
e
=
\lambda_{\rm ret}
+
\eta_*
+
\delta,
\qquad
0<\delta<\eta_*.
~~~

For each

~~~math
0\le m\le4
~~~

and

~~~math
r=0,1,2,
~~~

the new 1012 bands are

~~~math
\boxed{
m\kappa+r\eta_*
<
z
<
m\kappa+r\eta_*+\delta.
}
~~~

For

~~~math
r=0,1,
~~~

the 692 bands are

~~~math
\boxed{
m\kappa+r\eta_*+\delta
<
z
<
m\kappa+(r+1)\eta_*.
}
~~~

For

~~~math
0\le m<4,
~~~

the long 310 bands are

~~~math
\boxed{
m\kappa+2\eta_*+\delta
<
z
<
(m+1)\kappa.
}
~~~

Because

~~~math
3\eta_*<\kappa,
~~~

all these open intervals have the stated nonempty geometry throughout the chamber.

The companion verifier certifies every region inequality over the full parameter polygons. At the vertices, each sign reduces to an exact prime-power comparison in 2,3,5.

No sampled-point inference is used in the chamber typing.

---

## 2. Three graph species only

Canonical affine relabeling proves:

### New bands

All fifteen bands

~~~math
m\kappa+r\eta_*
<
z
<
m\kappa+r\eta_*+\delta
~~~

have one common 1012 row graph.

### Intermediate bands

All ten 692 bands have one common row graph.

### Long bands

All four 310 bands have one common row graph.

Thus the 29-band atlas reduces to exactly three finite matrix species.

No band-by-band determinant census is needed.

---

## 3. Recall the first mixed constant set

The old 31-site skeleton is S.

Let B be its five h-chain bottoms and C its five cap sites from SZ-RETURN-COCYCLE-9.

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

Its size is

~~~math
\boxed{
|\mathcal W|
=
5\cdot26
+
6\cdot5
=
160.
}
~~~

The first mixed 692 species used, per orientation,

~~~math
\boxed{
\mathcal M
=
\mathcal P
\sqcup
\mathcal W,
}
~~~

with

~~~math
|\mathcal M|
=
186+160
=
346.
~~~

Two orientations gave

~~~math
2\cdot346=692.
~~~

---

## 4. The second mixed seam adds an eta-star wing tier

The new 1012 species uses, on **each** orientation,

~~~math
\boxed{
\mathcal N
=
\mathcal M
\cup
(\eta_*+\mathcal W).
}
~~~

The shifted wing is disjoint from the old mixed set in this chamber.

Hence

~~~math
\boxed{
|\mathcal N|
=
346+160
=
506.
}
~~~

With two orientations,

~~~math
\boxed{
2\cdot506
=
1012.
}
~~~

So the jump

~~~math
692\longrightarrow1012
~~~

has the exact explanation

~~~math
\boxed{
1012-692
=
2\cdot160.
}
~~~

It adds one eta-star-shifted copy of the full backward wing on each orientation.

This is the **second mixed cap layer**.

---

## 5. New region census

For each orientation of the 1012 species, the exact source-row counts are

~~~math
\boxed{
A:98,
\qquad
B:98,
\qquad
D:99,
\qquad
T:211.
}
~~~

These sum to

~~~math
98+98+99+211
=
506.
~~~

The new eta-star wing itself contributes, per orientation,

~~~math
\boxed{
A:31,
\qquad
B:30,
\qquad
D:32,
\qquad
T:67.
}
~~~

Thus the larger system remains a finite translated copy of already identified chain/cap geometry rather than a new arbitrary orbit skeleton.

---

## 6. Important correction: the +62 law stops here

The single-scale regime had the exact insertion rule

~~~math
G_n
=
G_{n-1}
+
\text{one 62-variable module}
~~~

with one inherited D-to-T row activation and a four-directed-edge interface.

That architecture does **not** extend unchanged through the second mixed-cap seam.

Comparing the 692 and 1012 graphs:

- 320 variables are added;
- many inherited reflection targets are retimed by the eta-star shift;
- the old/new interface is not a four-edge finite-rank attachment.

Therefore:

~~~math
\boxed{
\text{the simple single-scale +62 continuant terminates at the mixed seam.}
}
~~~

What survives is a different structured compiler:

~~~math
\boxed{
\text{positive body}
+
\text{backward wing}
+
\eta_*\text{-shifted backward-wing tiers}.
}
~~~

This distinction is load-bearing.

---

## 7. External parity gauge remains exact

For every species in the chamber, translations preserve seed orientation and reflections reverse it.

With G equal to +1 on one orientation and -1 on the reflected orientation,

~~~math
\boxed{
M_- = G M_+ G.
}
~~~

Hence the two external parity choices are gauge equivalent.

Only one matrix per graph species requires an invertibility certificate.

---

## 8. Exact rational preconditioner certificates

The same rational physical-coefficient center is used:

~~~math
\beta_0
=
\frac{1294116462737}{10^{12}},
~~~

~~~math
d_0
=
\frac{1038397811807}{10^{12}},
~~~

~~~math
\mu_0
=
\frac{915078526447}{10^{12}},
~~~

where

~~~math
d=\delta\gamma.
~~~

For each matrix species, a floating inverse is used only to generate a rational left-preconditioner by denominator-10^7 rounding.

All subsequent residual and norm calculations are exact rational arithmetic.

### 1012 species

~~~math
\boxed{
\|R_{1012}\|_\infty<65
}
~~~

and

~~~math
\boxed{
\|I-R_{1012}M_{1012,0}\|_\infty
<
\frac1{26000}.
}
~~~

### 692 species

~~~math
\boxed{
\|R_{692}\|_\infty<65
}
~~~

and

~~~math
\boxed{
\|I-R_{692}M_{692,0}\|_\infty
<
\frac1{30000}.
}
~~~

### 310 species

~~~math
\boxed{
\|R_{310}\|_\infty<65
}
~~~

and

~~~math
\boxed{
\|I-R_{310}M_{310,0}\|_\infty
<
\frac1{69000}.
}
~~~

---

## 9. Physical coefficient perturbation

The exact atanh-series / integer-square enclosures retained from the preceding passes give, for all three species,

~~~math
\boxed{
\|M_{\rm phys}-M_0\|_\infty<10^{-12}.
}
~~~

Consequently:

### 1012

~~~math
\|I-RM_{\rm phys}\|_\infty
<
\frac1{26000}
+
65\times10^{-12}
<
\frac1{25000}
<1.
~~~

### 692

~~~math
\|I-RM_{\rm phys}\|_\infty
<
\frac1{30000}
+
65\times10^{-12}
<
\frac1{29000}
<1.
~~~

### 310

~~~math
\|I-RM_{\rm phys}\|_\infty
<
\frac1{69000}
+
65\times10^{-12}
<
\frac1{68000}
<1.
~~~

Therefore all three physical matrices are invertible.

By parity gauge, both external parity choices are invertible.

---

## 10. Second mixed-cap chamber conclusion

Every generic seed band for

~~~math
\lambda_{\rm ret}+\eta_*
<
e
<
\lambda_{\rm ret}+2\eta_*
~~~

is one of the three certified species:

~~~math
1012,
\qquad
692,
\qquad
310.
~~~

Thus

~~~math
\boxed{
\lambda_{\rm ret}+\eta_*
<
e
<
\lambda_{\rm ret}+2\eta_*
}
~~~

is source-level closed for generic seed positions, modulo the lower-dimensional threshold seams.

At

~~~math
e=\lambda_{\rm ret}+\eta_*
~~~

the 1012 bands collapse to zero width.

The exact collapsed seam seeds remain seam bookkeeping and are not silently promoted by continuity.

---

## 11. Structural picture after two mixed layers

The return hierarchy now has two distinct compiler phases.

### Phase I — kappa-only

A fixed 62-variable layer module iterates:

~~~math
124\to186\to248\to310\to372.
~~~

### Phase II — mixed bidirectional return

The first mixed graph is

~~~math
692
=
2(186+160).
~~~

The second mixed layer is

~~~math
1012
=
2(186+160+160).
~~~

So the new recurring object is the 160-site backward wing, not the old 62-site kappa module.

This strongly suggests an eta-star wing ladder, but only the first two mixed levels are presently certified.

No general wing-induction theorem is promoted yet.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-10:
SECOND MIXED CAP LAYER CLOSED /
ETA-STAR BACKWARD-WING TIER HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next exact threshold is

~~~math
\boxed{
e
=
\lambda_{\rm ret}
+
2\eta_*.
}
~~~

The next bounded target is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-11 / THIRD MIXED WING LAYER}.
}
~~~

Priority:

1. open
   ~~~math
   e
   =
   \lambda_{\rm ret}
   +
   2\eta_*
   +
   \delta,
   \qquad
   0<\delta<\eta_*;
   ~~~
2. determine whether the new graph adds a second eta-star-shifted copy of the same 160-site wing;
3. test the predicted per-orientation size
   ~~~math
   346+2\cdot160=666
   ~~~
   and total size
   ~~~math
   1332;
   ~~~
4. identify the full seed-band alternation;
5. if the same wing tier repeats, formulate the eta-star wing architecture theorem before proceeding to later mixed levels.

**Stop rule:** do not infer a general 160-site wing induction solely from the two observed levels.
