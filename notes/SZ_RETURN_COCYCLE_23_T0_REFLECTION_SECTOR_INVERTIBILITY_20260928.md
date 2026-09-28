# SZ-RETURN-COCYCLE-23 — T0 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_23_t0_reflection_sector_invertibility.py

---

## 0. Result

The new T0 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma
<
e
<
5\kappa+2\chi+\rho+\sigma+\tau
~~~

has size

~~~math
\boxed{29792}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the first tau chamber is closed:

- T0 / 29792 by this pass;
- S0 / 18984 by SZ-RETURN-COCYCLE-21;
- K2 / 10798 by SZ-RETURN-COCYCLE-19.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma
<
e
<
5\kappa+2\chi+\rho+\sigma+\tau
}
~~~

is source-level closed, modulo the registered lower-dimensional threshold seams.

The full 29792 matrix diagonalizes exactly into two reflection sectors of dimension 14896.

---

## 1. T0 recalled

SZ-RETURN-COCYCLE-22 defined, per orientation,

~~~math
\boxed{
\mathcal T_0
=
\mathcal S_0
\sqcup
(\sigma+\mathcal Z),
}
~~~

with

~~~math
|\mathcal S_0|=9492,
~~~

and

~~~math
|\mathcal Z|=5404.
~~~

Hence

~~~math
|\mathcal T_0|
=
9492+5404
=
\boxed{14896}
~~~

per orientation.

The full two-orientation system therefore has

~~~math
\boxed{
2\cdot14896
=
29792
}
~~~

variables.

---

## 2. Equal-orientation constant set

A fresh source-orbit reconstruction in a representative T0 band gives

~~~math
\boxed{
\mathcal T_0^+
=
\mathcal T_0^-.
}
~~~

Translations preserve orientation and reflections reverse it.

Therefore the full matrix has block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix},
}
~~~

and diagonalizes into the scalar reflection sectors

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each sector has dimension

~~~math
\boxed{14896}.
~~~

Changing external parity only swaps the two sectors.

---

## 3. Sparse sector structure

At the rational midpoint coefficient center, each 14896-sector matrix has exactly

~~~math
\boxed{38913}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

The system is therefore sparse enough that the exact rational left-inverse residual can be checked in row blocks despite the large sector dimension.

---

## 4. Chunked left-inverse compiler

The exact certificate is computed without materializing a dense exact 14896-by-14896 inverse.

For each sector:

1. factor the floating transpose
   ~~~math
   A_{\sigma,0}^{T}
   ~~~
   once by sparse LU;
2. solve for 128 standard basis vectors at a time;
3. transpose those solutions to obtain approximate inverse rows;
4. round each row to denominator
   ~~~math
   10^6;
   ~~~
5. multiply the rounded block against the sparse integer midpoint matrix;
6. check the exact rational row norm and exact residual row norm;
7. discard the block before generating the next one.

This keeps the proof object bounded in memory while preserving exact post-rounding verification.

No dense exact inverse or residual matrix is required.

---

## 5. Rational coefficient center

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
\frac{915078526}{10^9}.
~~~

Exact atanh-series logarithm bounds and integer-square root bounds give

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}
}
~~~

for both reflection sectors.

---

## 6. Exact witness norms

The full chunked verification gives

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

Thus the tiny minus-sector witness-norm increase observed at S0 disappears again at T0.

The sharp rounded witness norm returns to the same value seen throughout most of the preceding compiler.

---

## 7. Exact midpoint residual

Both reflection sectors have exactly

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

The largest individual exact residual entries are:

### plus sector

~~~math
1905595184,
~~~

### minus sector

~~~math
1660409900.
~~~

Each multiplied by the sector dimension remains below the signed 64-bit limit, so the exact row-sum calculations are safe.

---

## 8. Physical invertibility

For either reflection sector,

~~~math
A_{\sigma,\rm phys}
=
A_{\sigma,0}+E_\sigma.
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
T_0/29792
\text{ is invertible for both external parity choices}.
}
~~~

---

## 9. First tau chamber closure

SZ-RETURN-COCYCLE-22 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma
<
e
<
5\kappa+2\chi+\rho+\sigma+\tau
~~~

as one of:

1. T0 / 29792;
2. S0 / 18984;
3. K2 / 10798.

All three are now certified.

Therefore

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma
<
e
<
5\kappa+2\chi+\rho+\sigma+\tau
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combined with the previous traversal,

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+\tau
}
~~~

is now covered by source-level finite-orbit invertibility away from the lower-dimensional seams.

---

## 10. Stability diagnosis

The sharp exact witness envelope remains

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

At T0 both sectors again attain the same rounded witness norm.

Thus the S0 asymmetry was not the start of a monotone conditioning deterioration.

The robust invariant remains the same bounded inverse envelope across the increasingly large collision species.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-23:
T0 / 29792 CERTIFIED /
FIRST TAU CHAMBER CLOSED /
14896-SECTOR CHUNKED COMPILER HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The immediate next topology event is

~~~math
\boxed{
e
=
5\kappa+2\chi+\rho+\sigma+\tau.
}
~~~

At that seam:

- the surviving K2 centers collapse;
- the surviving S0 center width becomes
  ~~~math
  \sigma-\tau
  =
  3\tau+\omega.
  ~~~

The Euclidean relation is

~~~math
\sigma=4\tau+\omega,
\qquad
0<\omega<\tau.
~~~

Therefore the next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-24 /
SECOND TAU TIER SEAM}.
}
~~~

Priority:

1. type the seam at one tau insertion;
2. classify the next tau-tier chamber;
3. identify the repeated or truncated tau return body;
4. determine whether a tau-tier architecture begins to repeat;
5. do not jump directly to omega until all four tau-width steps implied by the quotient-four relation are accounted for.

**Stop rule:** geometry first, invertibility second.
