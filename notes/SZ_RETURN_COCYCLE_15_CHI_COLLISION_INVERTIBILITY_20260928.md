# SZ-RETURN-COCYCLE-15 — Chi-Collision Invertibility Compiler

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_15_chi_collision_invertibility.py

---

## 0. Result

The new collision species introduced immediately above

~~~math
e=5\kappa
~~~

has size

~~~math
\boxed{5554}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in

~~~math
\boxed{
5\kappa<e<5\kappa+\chi
}
~~~

is closed:

- the new C0 / 5554 bands by this pass;
- M7 / 2932 by SZ-RETURN-COCYCLE-13;
- M6 / 2612 by SZ-RETURN-COCYCLE-13.

Thus the first post-5-kappa chamber is source-level closed, modulo the lower-dimensional threshold seams.

The key compiler reduction is that the two seed orientations use the **same 2777-site constant set**. The full 5554 matrix therefore diagonalizes into two sparse scalar reflection sectors of size 2777.

---

## 1. Collision species recalled

SZ-RETURN-COCYCLE-14 defined

~~~math
\mathcal K_0
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
~~~

per orientation, with

~~~math
|\mathcal M_7|=1466,
~~~

~~~math
|\mathcal X|=1311,
~~~

hence

~~~math
\boxed{
|\mathcal K_0|
=
2777.
}
~~~

The full two-orientation system therefore has

~~~math
\boxed{
2\cdot2777
=
5554
}
~~~

variables.

The old/new interface between

~~~math
\mathcal M_7
~~~

and

~~~math
\chi+\mathcal X
~~~

is broad. Direct graph measurement shows roughly 1.6 thousand cross-edges in each direction.

Therefore a low-rank Schur update from the M7 matrix is not the correct normalization.

---

## 2. Orientation symmetry returns

Although the old/new decomposition is not low rank, both seed orientations use exactly the same constant set

~~~math
\mathcal K_0.
~~~

The source maps have two types:

### translations

These preserve orientation.

### reflections

These reverse orientation.

Hence, after ordering the two copies of

~~~math
\mathcal K_0
~~~

in parallel, the full matrix has block form

~~~math
\boxed{
\begin{pmatrix}
A & B\\
B & A
\end{pmatrix}
}
~~~

for one external parity convention, with the reflection signs absorbed into B.

Diagonalizing the orientation swap gives the two scalar reflection sectors

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each sector has dimension

~~~math
\boxed{2777}.
~~~

The opposite external parity only interchanges the two sectors.

Therefore it is enough to certify both scalar sector matrices once.

---

## 3. Sparse sector structure

At the rational coefficient center used below, each 2777-sector matrix has exactly

~~~math
\boxed{7252}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

Thus the exact residual verification remains sparse even though a dense rational inverse witness is used.

This cuts the certification problem in half relative to the full 5554 matrix and restores the reflection-sector method already seen in the original 124-variable base orbit.

---

## 4. Rational coefficient center

Use

~~~math
\beta_0
=
\frac{1294116463}{10^9},
~~~

~~~math
d_0
=
\frac{1038397812}{10^9},
~~~

~~~math
\mu_0
=
\frac{915078526}{10^9},
~~~

where

~~~math
d=\delta\gamma.
~~~

The exact physical parameters are

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

Exact rational atanh-series bounds for the logarithms and integer-square bounds for the square roots give

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}
}
~~~

for both reflection sectors.

---

## 5. Rational inverse witnesses

For each

~~~math
\sigma\in\{+1,-1\},
~~~

take the sparse rational midpoint sector

~~~math
A_{\sigma,0}.
~~~

A numerical sparse LU solve is used only to generate an approximate inverse.

Round every inverse entry to denominator

~~~math
10^6.
~~~

Call the rational witness

~~~math
R_\sigma.
~~~

All subsequent norm and residual calculations are exact integer arithmetic.

The two sectors independently produce the same exact infinity norm:

~~~math
\boxed{
\|R_+\|_\infty
=
\|R_-\|_\infty
=
\frac{63924057}{10^6}
<64.
}
~~~

---

## 6. Exact midpoint residual

For both sectors the exact residual is

~~~math
\boxed{
\|I-R_\sigma A_{\sigma,0}\|_\infty
=
\frac{338547930925}{10^{15}}.
}
~~~

Exactly,

~~~math
\boxed{
\frac{338547930925}{10^{15}}
<
\frac1{2950}.
}
~~~

The companion verifier also checks an entrywise residual bound before the row summation, which proves the signed 64-bit integer computation cannot overflow.

Thus the midpoint invertibility witness is completely rational after its initial numerical discovery.

---

## 7. Physical invertibility

Write

~~~math
A_{\sigma,\rm phys}
=
A_{\sigma,0}
+
E_\sigma.
~~~

Then

~~~math
\begin{aligned}
\|I-R_\sigma A_{\sigma,\rm phys}\|_\infty
&\le
\|I-R_\sigma A_{\sigma,0}\|_\infty
+
\|R_\sigma\|_\infty
\|E_\sigma\|_\infty
\\
&<
\frac1{2950}
+
64\cdot10^{-9}.
\end{aligned}
~~~

The verifier checks exactly

~~~math
\boxed{
\frac1{2950}
+
64\cdot10^{-9}
<
\frac1{2949}
<1.
}
~~~

Hence both

~~~math
R_+A_{+,\rm phys}
~~~

and

~~~math
R_-A_{-,\rm phys}
~~~

are invertible by the Neumann lemma.

Therefore

~~~math
\boxed{
A_{+,\rm phys}
\text{ and }
A_{-,\rm phys}
\text{ are invertible}.
}
~~~

Consequently the full 5554 collision matrix is invertible.

---

## 8. External parity

Changing the external parity flips every reflection coefficient.

In the orientation-sector basis this simply swaps

~~~math
A_+
~~~

and

~~~math
A_-.
~~~

Since both sectors are certified invertible,

~~~math
\boxed{
\text{both external parity systems are invertible}.
}
~~~

No additional certificate is required.

---

## 9. First post-collision chamber closure

SZ-RETURN-COCYCLE-14 proved that every generic seed band on

~~~math
5\kappa<e<5\kappa+\chi
~~~

is one of:

1. C0 / 5554;
2. M7 / 2932;
3. M6 / 2612.

The latter two were already certified by the wing-tier compiler.

The new C0 species is certified in this pass.

Therefore

~~~math
\boxed{
5\kappa<e<5\kappa+\chi
}
~~~

is source-level closed for all generic seed positions, modulo the registered threshold seams.

Together with the prior work,

~~~math
\boxed{
0<e<5\kappa+\chi
}
~~~

is now covered by source-level finite-orbit invertibility, again apart from the seam set kept separate throughout the traversal.

---

## 10. Stability observation

The exact witness bounds

~~~math
\|R_\sigma\|_\infty
=
\frac{63924057}{10^6}
~~~

and

~~~math
\|I-R_\sigma A_{\sigma,0}\|_\infty
=
\frac{338547930925}{10^{15}}
~~~

are identical to the sharp bounds produced by the pre-5-kappa wing-tier compiler.

This equality is not needed for the theorem.

But it strongly indicates that the collision module preserves the same stable finite-state inverse envelope after orientation sectorization.

The collision changes the orbit geometry without worsening the observed inverse conditioning on this rational witness scale.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-15:
5554 COLLISION SPECIES CERTIFIED /
FIRST CHI CHAMBER CLOSED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next exact topology event is

~~~math
e=5\kappa+\chi,
~~~

where all surviving M7 centers collapse.

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-16 /
SECOND CHI COLLISION SEAM}.
}
~~~

Priority:

1. type the seam at epsilon=chi;
2. identify the next post-seam residual length;
3. determine whether C0 receives a second chi-shifted collision-body tier;
4. test whether orientation sectorization persists;
5. derive the next finite compiler before attempting further chamber closure.

**Stop rule:** do not infer a general chi-tier ladder from the first collision species alone.
