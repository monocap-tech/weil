# SZ-RETURN-COCYCLE-25 — T1 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_25_t1_reflection_sector_invertibility.py

---

## 0. Result

The new T1 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+2\tau
~~~

has size

~~~math
\boxed{48786}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the second tau chamber is closed:

- T1 / 48786 by this pass;
- T0 / 29792 by SZ-RETURN-COCYCLE-23;
- S0 / 18984 by SZ-RETURN-COCYCLE-21.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+2\tau
}
~~~

is source-level closed, modulo the registered lower-dimensional threshold seams.

The full 48786 matrix diagonalizes exactly into two reflection sectors of dimension 24393.

---

## 1. T1 recalled

SZ-RETURN-COCYCLE-24 defined, per orientation,

~~~math
\boxed{
\mathcal T_1
=
\mathcal T_0
\sqcup
(\tau+\mathcal W),
}
~~~

where

~~~math
|\mathcal T_0|=14896,
~~~

and

~~~math
|\mathcal W|=9497.
~~~

Hence

~~~math
|\mathcal T_1|
=
14896+9497
=
\boxed{24393}
~~~

per orientation.

The full two-orientation system has

~~~math
\boxed{
2\cdot24393
=
48786
}
~~~

variables.

---

## 2. Equal-orientation constant set

A fresh representative T1 orbit gives

~~~math
\boxed{
\mathcal T_1^+
=
\mathcal T_1^-.
}
~~~

Each orientation contains exactly

~~~math
24393
~~~

constants.

Translations preserve orientation and reflections reverse it.

Therefore the full matrix again has the exact block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix},
}
~~~

and diagonalizes into

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each reflection sector has dimension

~~~math
\boxed{24393}.
~~~

Changing external parity only swaps the two sectors.

---

## 3. Sparse sector structure

At the rational midpoint coefficient center, each 24393-sector matrix has exactly

~~~math
\boxed{63724}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

The exact count is one below the raw row-term count because of one coefficient coalescence, just as in the earlier large sector systems.

---

## 4. Chunked exact inverse compiler

The exact certificate uses the same bounded-memory left-inverse method as T0:

1. factor
   ~~~math
   A_{\sigma,0}^{T}
   ~~~
   numerically by sparse LU;
2. solve for 2048 basis vectors at a time;
3. transpose the solutions to obtain approximate inverse rows;
4. round every entry to denominator
   ~~~math
   10^6;
   ~~~
5. multiply each rounded block against the sparse integer midpoint matrix;
6. check the exact infinity norm and exact residual row norm;
7. discard the block.

Only the numerical witness generation is floating-point.

Every statement used for the invertibility certificate after rounding is exact integer/rational arithmetic.

---

## 5. Rational coefficient center

Use the same midpoint center as throughout the collision compiler:

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
\frac{915078526}{10^9}.
~~~

Exact logarithm and square-root enclosures again prove

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}
}
~~~

for both sectors.

---

## 6. Exact witness norms

The full chunked calculation gives

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

During the first partial plus-sector run the running maximum was temporarily

~~~math
\frac{63924053}{10^6},
~~~

but the final rows restore the global maximum

~~~math
\frac{63924057}{10^6}.
~~~

Thus there is no genuine sharp-norm change at T1.

---

## 7. Exact midpoint residual

Both sectors have exactly

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

The largest exact individual residual entries are:

### plus sector

~~~math
1710917232,
~~~

### minus sector

~~~math
1641840644.
~~~

Multiplying either by the sector dimension remains below the signed 64-bit range, so the exact row-sum computation is safe.

---

## 8. Physical invertibility

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
64\cdot10^{-9}
\\
&<
\frac1{2949}
<1.
\end{aligned}
~~~

Therefore both physical reflection sectors are invertible by the Neumann lemma.

Hence

~~~math
\boxed{
T_1/48786
\text{ is invertible for both external parity choices}.
}
~~~

---

## 9. Second tau chamber closure

SZ-RETURN-COCYCLE-24 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma+\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+2\tau
~~~

as one of:

1. T1 / 48786;
2. T0 / 29792;
3. S0 / 18984.

All three are now certified.

Therefore

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+2\tau
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combined with the previous traversal,

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+2\tau
}
~~~

is now covered by source-level finite-orbit invertibility away from the lower-dimensional seams.

---

## 10. Stability diagnosis

T1 is the first species produced by the nested-truncation tau ladder rather than a fixed-module ladder.

Nevertheless the same exact inverse envelope persists:

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

Thus the nested truncation changes the source-orbit geometry and sector dimension substantially without degrading the certified inverse envelope.

The sequence now includes

~~~math
14896
\to
24393
~~~

per orientation inside the tau run while retaining the same exact coarse certificate.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-25:
T1 / 48786 CERTIFIED /
SECOND TAU CHAMBER CLOSED /
24393-SECTOR CHUNKED COMPILER HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next exact topology event is

~~~math
\boxed{
e
=
5\kappa+2\chi+\rho+\sigma+2\tau.
}
~~~

At that seam:

- the surviving T0 centers collapse;
- the surviving S0 width becomes
  ~~~math
  \sigma-2\tau
  =
  2\tau+\omega.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-26 /
THIRD TAU TIER SEAM}.
}
~~~

Priority:

1. type the third tau-tier seam;
2. determine the next nested truncated body;
3. classify the chamber up to the next tau-width event;
4. preserve the distinction between the immediate tau geometry and the eventual omega remainder;
5. keep invertibility as the following pass.

**Stop rule:** continue the quotient-four tau traversal one seam at a time.
