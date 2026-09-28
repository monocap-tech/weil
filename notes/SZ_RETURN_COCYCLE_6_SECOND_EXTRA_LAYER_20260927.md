# SZ-RETURN-COCYCLE-6 — Second Extra Kappa Layer Closed and Finite-Rank Insertion Law

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_6_second_extra_layer_verify.py

---

## 0. Result

Write

~~~math
e=2\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

The second extra-return chamber splits into five open seed bands:

~~~math
0<z<\eta,
~~~

~~~math
\eta<z<\kappa,
~~~

~~~math
\kappa<z<\kappa+\eta,
~~~

~~~math
\kappa+\eta<z<2\kappa,
~~~

and

~~~math
2\kappa<z<e.
~~~

The corresponding source-level orbit sizes are

~~~math
\boxed{
248,quad186,quad248,quad186,quad248.
}
~~~

The two 186 systems are exactly the already-certified first-extra-return system, up to the natural layer relabeling and seed reflection.

All three 248 systems are mutually equivalent under orientation-dependent kappa-layer shifts and seed reflection.

A single 248 edge system is therefore the only new matrix species in this chamber.

That 248 system is rigorously invertible for both external parity choices.

Hence:

~~~math
\boxed{
\texttt{SECOND EXTRA KAPPA RETURN: OPEN-CHAMBER CLOSED}.
}
~~~

The equality seams between the five bands remain lower-dimensional threshold cells and are not silently absorbed into the open-chamber statement.

---

## 1. Exact five-band topology

Set

~~~math
e=2\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

The source argument maps and all region boundaries are affine in eta and the seed position z.

For the lower-edge chamber

~~~math
0<z<\eta<\kappa,
~~~

the verifier checks every region margin on the closed triangle with vertices

~~~math
(\eta,z)
=
(0,0),
(\kappa,0),
(\kappa,\kappa).
~~~

For the first side chamber

~~~math
0<\eta<z<\kappa,
~~~

it checks the closed triangle with vertices

~~~math
(0,0),
(0,\kappa),
(\kappa,\kappa).
~~~

For the central 248 chamber, write

~~~math
z=\kappa+\zeta,
\qquad
0<\zeta<\eta<\kappa,
~~~

and use the same lower-edge triangle in eta,zeta.

At every vertex, each margin becomes an integer linear combination of

~~~math
q=\log\frac43,
\qquad
j=\log\frac98,
\qquad
k=\log\frac{16}{15},
~~~

whose sign is decided exactly by comparing the associated rational product of powers of 2,3,5.

All margins have the required strict sign in the open chambers.

The two upper seed bands are exact images under

~~~math
z\mapsto e-z.
~~~

Thus the five-band split is exact.

---

## 2. New 248 architecture

Let S be the 31-site skeleton from SZ-RETURN-COCYCLE-4.

On the lower 248 edge orbit, the +z orientation contains

~~~math
\boxed{
\mathcal S,
\quad
\mathcal S+\kappa,
\quad
\mathcal S+2\kappa,
\quad
\mathcal S+3\kappa,
}
~~~

while the e-z orientation contains

~~~math
\boxed{
\mathcal S-2\kappa,
\quad
\mathcal S-\kappa,
\quad
\mathcal S,
\quad
\mathcal S+\kappa.
}
~~~

Each orientation therefore has

~~~math
31\times4=124
~~~

variables.

Hence

~~~math
\boxed{
248=31\times4\times2.
}
~~~

This is generated directly by source-map orbit closure.

It is not inferred from the historical target dimension.

---

## 3. Side 186 bands are old systems

For

~~~math
\eta<z<\kappa,
~~~

the abstract row graph, after canonical labeling by

~~~math
(\text{skeleton site},\kappa\text{-layer},\text{orientation}),
~~~

is exactly the first-extra-return 186 graph from SZ-RETURN-COCYCLE-5.

Therefore this seed band is not a new determinant problem.

By seed reflection, the same holds for

~~~math
\kappa+\eta<z<2\kappa.
~~~

Both side bands are already closed.

---

## 4. Central 248 band is the same new system

For

~~~math
z=\kappa+\zeta,
\qquad
0<\zeta<\eta,
~~~

the 248 row graph becomes identical to the lower-edge row graph under the orientation-dependent layer shift

~~~math
n\mapsto n-1
\qquad
\text{on the + orientation},
~~~

~~~math
n\mapsto n+1
\qquad
\text{on the - orientation}.
~~~

Thus the central 248 matrix is a permutation/relabeling of the lower-edge matrix.

The upper 248 band is its seed-reflection copy.

There is only one genuinely new 248 matrix species.

---

## 5. Exact 186 to 248 insertion law

Compare the lower 248 graph to the previously certified lower 186 graph.

All 186 old variables occur unchanged inside the 248 graph.

The new set has exactly

~~~math
\boxed{62}
~~~

variables.

They consist of:

- one new full 31-site layer on the positive orientation;
- one new full 31-site layer on the negative orientation.

The new layer has the same internal region census as the fundamental skeleton module:

~~~math
\boxed{
A:12,
\qquad
B:12,
\qquad
D:13,
\qquad
T:25.
}
~~~

Among the 186 inherited rows, exactly

~~~math
\boxed{1}
~~~

changes source-row type.

It is the boundary row that was dead at the previous return depth and becomes a tail row at the new depth.

The interface is minimal:

~~~math
\boxed{
2\text{ old-to-new edges}
}
~~~

and

~~~math
\boxed{
2\text{ new-to-old edges}.
}
~~~

Every other new coupling is internal to the 62-variable module.

Therefore the second return is not an unrelated 248-dimensional problem.

It is a fixed 62-variable module attached to the 186 system through a finite-rank boundary interface.

This is the first exact source-level continuant/scattering insertion law obtained on the return-cocycle branch.

---

## 6. External parity gauge survives

As in SZ-RETURN-COCYCLE-5, translations preserve the seed orientation and reflections reverse it.

Let G be +1 on the C+z variables and -1 on the C+e-z variables.

Then the two 248 external-parity matrices satisfy

~~~math
\boxed{
M_- = G M_+ G.
}
~~~

Hence

~~~math
\boxed{
\det M_- = \det M_+.
}
~~~

Only one physical invertibility certificate is required.

---

## 7. Rational midpoint system

Use the same rational coefficient center as the first-extra pass:

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

The resulting midpoint matrix has 248 rows and only 644 nonzero entries.

A floating inverse is used only to discover a rational left-preconditioner.

Every entry of that candidate preconditioner is rounded to denominator

~~~math
10^6.
~~~

All subsequent checks are exact rational arithmetic.

---

## 8. Exact preconditioner certificate

Let R be the rounded rational preconditioner and M0 the rational midpoint matrix.

The verifier proves exactly

~~~math
\boxed{
\|R\|_\infty<64
}
~~~

and

~~~math
\boxed{
\|I-RM_0\|_\infty<\frac1{8000}.
}
~~~

For orientation, the actual exact values are approximately

~~~math
\|R\|_\infty
\approx63.311906,
~~~

and

~~~math
\|I-RM_0\|_\infty
\approx1.1719826\times10^{-4}.
~~~

The decimals are not used for certification.

---

## 9. Physical coefficient perturbation

The physical coefficients are

~~~math
\beta
=
\sqrt{\frac23}\frac{\log3}{\log2},
~~~

~~~math
d
=
\frac1{\sqrt5}\frac{\log5}{\log2},
~~~

and

~~~math
\mu
=
\frac1{\sqrt3}\frac{\log3}{\log2}.
~~~

Exact rational atanh-series enclosures for the logarithms and exact integer-square enclosures for the square roots give

~~~math
\boxed{
\|M_{\rm phys}-M_0\|_\infty<10^{-12}.
}
~~~

More precisely, the row perturbation bound is below

~~~math
5.93\times10^{-13}.
~~~

Again the decimal is orientation only.

---

## 10. Physical invertibility

Combine Sections 8 and 9:

~~~math
\begin{aligned}
\|I-RM_{\rm phys}\|_\infty
&\le
\|I-RM_0\|_\infty
+
\|R\|_\infty
\|M_{\rm phys}-M_0\|_\infty
\\
&<
\frac1{8000}
+
64\times10^{-12}
\\
&<
\frac1{1000}
<1.
\end{aligned}
~~~

Therefore

~~~math
RM_{\rm phys}
~~~

is invertible by the Neumann lemma.

Hence

~~~math
\boxed{
M_{\rm phys}\text{ is invertible}.
}
~~~

By the exact parity gauge, the same holds for the opposite external parity.

Thus the new 248 orbit has trivial parity kernel.

---

## 11. Chamber conclusion

The five generic seed bands have types

~~~math
\boxed{
248 / 186 / 248 / 186 / 248.
}
~~~

The 186 type was already certified.

The 248 type is now certified.

Therefore the complete open second-extra-return chamber

~~~math
2\kappa<e<3\kappa
~~~

is closed at the source-equation level, modulo the lower-dimensional seed seams.

This establishes

~~~math
\boxed{
\texttt{SECOND EXTRA KAPPA RETURN: OPEN-CHAMBER CLOSED}.
}
~~~

---

## 12. Reusable layer rule now visible

The first extra edge system had layer ranges

~~~math
+:
0,1,2,
~~~

~~~math
-:
-1,0,1.
~~~

The second extra edge system has

~~~math
+:
0,1,2,3,
~~~

~~~math
-:
-2,-1,0,1.
~~~

Thus one extra return inserts:

~~~math
\boxed{
\text{one new top + layer}
+
\text{one new bottom - layer}.
}
~~~

The inserted pair is one 62-variable module.

Only one inherited boundary row changes from dead to tail, and the old/new interface has four directed cross edges total.

This is the first concrete candidate for a true n to n+1 continuant recurrence.

It should be tested again at the third extra return before being promoted to an induction theorem.

---

## 13. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-6:
SECOND EXTRA KAPPA LAYER CLOSED /
62-VARIABLE FINITE-RANK INSERTION HIT}
}
~~~

No canonical SZ theorem cursor moves.

---

## 14. Next cursor

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-7 / THIRD EXTRA KAPPA LAYER}
}
~~~

Set

~~~math
e=3\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

Priority order:

1. regenerate the source orbit;
2. test the predicted seven-band alternation;
3. test whether the new edge system has
   ~~~math
   31\times5\times2=310
   ~~~
   variables;
4. compare the 248 and 310 graphs;
5. verify whether the same rule holds:
   - add one 62-variable module;
   - exactly one inherited dead row becomes tail;
   - two old-to-new and two new-to-old cross edges;
6. if the insertion law repeats unchanged, formulate the general single-scale n-return continuant theorem before separately certifying n=4.

**Induction trigger:** identical insertion architecture at n=3 licenses an attempt to prove the n-independent module theorem.

**Stop rule:** any new row species, larger interface, or altered 31-site skeleton blocks induction and must be isolated before proceeding.
