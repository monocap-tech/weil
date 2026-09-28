# SZ-RETURN-COCYCLE-21 — S0 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_21_s0_reflection_sector_invertibility.py

---

## 0. Result

The new S0 collision species introduced on

~~~math
5\kappa+2\chi+\rho
<
e
<
5\kappa+2\chi+\rho+\sigma
~~~

has size

~~~math
\boxed{18984}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the first sigma chamber is closed:

- S0 / 18984 by this pass;
- K2 / 10798 by SZ-RETURN-COCYCLE-19;
- K1 / 8176 by SZ-RETURN-COCYCLE-17.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho
<
e
<
5\kappa+2\chi+\rho+\sigma
}
~~~

is source-level closed, modulo the registered lower-dimensional threshold seams.

The full 18984 matrix again diagonalizes exactly into two reflection sectors, now of size 9492.

---

## 1. S0 recalled

SZ-RETURN-COCYCLE-20 defined

~~~math
\boxed{
\mathcal S_0
=
\mathcal K_2
\sqcup
(\rho+\mathcal Y)
}
~~~

per orientation, with

~~~math
|\mathcal K_2|=5399,
~~~

~~~math
|\mathcal Y|=4093.
~~~

Hence

~~~math
|\mathcal S_0|
=
5399+4093
=
\boxed{9492}
~~~

per orientation.

The full two-orientation matrix therefore has

~~~math
\boxed{
2\cdot9492
=
18984
}
~~~

variables.

---

## 2. Equal-orientation constant set

A fresh source-orbit reconstruction in a representative S0 band gives

~~~math
\boxed{
\mathcal S_0^+
=
\mathcal S_0^-.
}
~~~

Translations preserve seed orientation, while reflections reverse it.

Therefore the full matrix has orientation-symmetric block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix}.
}
~~~

Diagonalizing the orientation swap gives

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each scalar sector has dimension

~~~math
\boxed{9492}.
~~~

Changing external parity only interchanges the two sectors.

---

## 3. Sparse sector structure

At the rational midpoint coefficient center, each 9492-sector matrix has exactly

~~~math
\boxed{24795}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

The larger dimension makes a full dense rational inverse witness unnecessarily expensive to materialize, but it does not obstruct exact certification.

---

## 4. Chunked rational left-inverse compiler

Let

~~~math
A_{\sigma,0}
~~~

be one rational midpoint sector.

To certify its inverse without materializing a dense exact 9492-by-9492 matrix:

1. factor the floating matrix
   ~~~math
   A_{\sigma,0}^{T}
   ~~~
   once by sparse LU;
2. solve
   ~~~math
   A_{\sigma,0}^{T}x=e_i
   ~~~
   for blocks of standard basis vectors;
3. transpose the block to obtain rows of an approximate left inverse;
4. round every entry to denominator
   ~~~math
   10^6;
   ~~~
5. multiply each rounded row block against the sparse rational midpoint matrix using exact signed-integer arithmetic;
6. accumulate the exact infinity norm and exact residual row norm;
7. discard the block and continue.

Thus exact verification uses only bounded row blocks.

No dense exact inverse and no dense exact residual matrix are retained.

The companion verifier uses 64-row blocks.

---

## 5. Rational coefficient center

As in the prior collision compiler, use

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

Exact logarithm and square-root enclosures give

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

The two reflection sectors are extremely close but no longer produce literally identical rounded-inverse norms.

The exact chunked calculation gives

~~~math
\boxed{
\|R_+\|_\infty
=
\frac{63924057}{10^6}
<64,
}
~~~

and

~~~math
\boxed{
\|R_-\|_\infty
=
\frac{63924064}{10^6}
<64.
}
~~~

The difference is

~~~math
7\times10^{-6}.
~~~

This is the first observed departure from exact equality of the rounded witness norms in the collision sequence.

It has no effect on the common coarse stability bound

~~~math
\boxed{
\|R_\sigma\|_\infty<64.
}
~~~

---

## 7. Exact midpoint residual

Despite the small witness-norm split, both sectors retain exactly the same midpoint residual:

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

The largest exact residual entry is also checked before row summation:

### plus sector

~~~math
1641840644.
~~~

### minus sector

~~~math
1675019116.
~~~

Multiplying either by 9492 remains below the signed 64-bit range, so the exact row-sum calculation is safe.

---

## 8. Physical invertibility

For either sector write

~~~math
A_{\sigma,\rm phys}
=
A_{\sigma,0}+E_\sigma.
~~~

Using the common coarse bound

~~~math
\|R_\sigma\|_\infty<64
~~~

gives

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

Therefore both physical sectors are invertible by the Neumann lemma.

Hence

~~~math
\boxed{
S_0/18984
\text{ is invertible for both external parities}.
}
~~~

---

## 9. First sigma chamber closure

SZ-RETURN-COCYCLE-20 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho
<
e
<
5\kappa+2\chi+\rho+\sigma
~~~

as one of:

1. S0 / 18984;
2. K2 / 10798;
3. K1 / 8176.

All three are now certified.

Therefore

~~~math
\boxed{
5\kappa+2\chi+\rho
<
e
<
5\kappa+2\chi+\rho+\sigma
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combined with all prior passes,

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma
}
~~~

is now covered by source-level finite-orbit invertibility away from the lower-dimensional seams.

---

## 10. Stability diagnosis

The earlier collision sequence

~~~math
5554,
8176,
10798
~~~

reproduced exactly the same rounded witness norm and residual.

At S0 / 18984:

- the residual remains exactly unchanged;
- the plus-sector witness norm remains unchanged;
- the minus-sector witness norm increases only by
  ~~~math
  7\times10^{-6}.
  ~~~

Thus the stronger statement of exact witness identity stops here.

The load-bearing invariant is instead the uniform envelope

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

That envelope survives the sigma collision intact.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-21:
S0 / 18984 CERTIFIED /
FIRST SIGMA CHAMBER CLOSED /
CHUNKED SECTOR COMPILER HIT}
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
5\kappa+2\chi+\rho+\sigma.
}
~~~

At that seam:

- the surviving K1 centers collapse;
- the surviving K2 center width becomes
  ~~~math
  \tau
  =
  \rho-\sigma.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-22 /
TAU COLLISION SEAM}.
}
~~~

Priority:

1. type the exact tau seam;
2. identify the new truncated return body above it;
3. determine whether orientation-sector equality persists;
4. compute the next Euclidean remainder;
5. keep invertibility and geometry as separate passes.

**Stop rule:** do not extrapolate the S0 truncation pattern past the tau seam without retyping the source orbit.
