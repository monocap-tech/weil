# SZ-RETURN-COCYCLE-33 — N0 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_33_n0_reflection_sector_invertibility.py

Authoritative non-assumptive repository-side run:

GitHub Actions run 36473057676.

- plus job 109099845475: SUCCESS;
- minus job 109099845911: SUCCESS.

---

## 0. Result

The N0 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu
~~~

has size

~~~math
\boxed{192552}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the first nu chamber is closed:

- N0 / 192552 by this pass;
- O0 / 105768 by SZ-RETURN-COCYCLE-31;
- T3 / 86774 by SZ-RETURN-COCYCLE-29.

Thus the first nu chamber is source-level closed, modulo the registered lower-dimensional threshold seams.

---

## 1. N0 recalled

SZ-RETURN-COCYCLE-32 established, per orientation,

~~~math
\boxed{
\mathcal N_0
=
\mathcal O_0
\sqcup
(\omega+\mathcal V),
}
~~~

where

~~~math
\mathcal V
=
\mathcal T_3
\sqcup
\mathcal T_\nu,
~~~

and

~~~math
|\mathcal T_\nu|=5.
~~~

The component sizes are

~~~math
|\mathcal O_0|=52884,
~~~

~~~math
|\mathcal V|=43392.
~~~

Hence

~~~math
|\mathcal N_0|
=
52884+43392
=
\boxed{96276}
~~~

per orientation.

The full system therefore has

~~~math
\boxed{
2\cdot96276
=
192552
}
~~~

variables.

---

## 2. Orientation reduction

A fresh representative N0 orbit gives

~~~math
\boxed{
\mathcal N_0^+
=
\mathcal N_0^-.
}
~~~

Each orientation contains exactly

~~~math
96276
~~~

constant sites.

Translations preserve orientation while reflections reverse it.

Therefore the full matrix has exact orientation-symmetric block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix},
}
~~~

and diagonalizes to

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each scalar sector has dimension

~~~math
\boxed{96276}.
~~~

Changing external parity only interchanges the two sectors.

---

## 3. Sparse sector structure

The independent repository-side jobs measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
251519.
}
~~~

Every source-matrix column has at most four nonzero entries.

Thus the reflection sectors remain sparse despite nearly doubling from O0.

---

## 4. Parallel exact inverse compiler

For this larger system the two reflection sectors were certified independently in parallel.

Each job:

1. reconstructs the complete N0 source orbit;
2. forms one 96276-dimensional reflection sector;
3. factors its floating midpoint transpose by sparse LU;
4. solves for inverse rows in 512-row blocks;
5. rounds each row to denominator
   ~~~math
   10^6;
   ~~~
6. multiplies each rounded block against the sparse integer midpoint matrix;
7. computes exact integer infinity norms and residual row sums.

No dense exact 96276-by-96276 inverse is materialized.

The two sector jobs are mathematically independent and both completed successfully.

---

## 5. Exact witness norms

The plus sector gives

~~~math
\boxed{
\|R_+\|_\infty
=
\frac{63924057}{10^6}
<64.
}
~~~

The minus sector gives

~~~math
\boxed{
\|R_-\|_\infty
=
\frac{63924064}{10^6}
<64.
}
~~~

Thus the small seven-unit split in numerator seen previously at S0 reappears:

~~~math
\boxed{
\|R_-\|_\infty
-
\|R_+\|_\infty
=
7\times10^{-6}.
}
~~~

The load-bearing common envelope remains

~~~math
\boxed{
\|R_\sigma\|_\infty<64.
}
~~~

---

## 6. Exact midpoint residual

Despite the witness-norm split, both sectors have exactly the same midpoint residual:

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

The maximum exact individual residual entries are:

### plus sector

~~~math
\boxed{1641840644},
~~~

### minus sector

~~~math
\boxed{1675019116}.
~~~

The verifier checks the signed-integer overflow guard before exact row summation.

---

## 7. Physical invertibility

The exact physical coefficient enclosure remains

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}.
}
~~~

Using the common norm bound,

~~~math
\begin{aligned}
\|I-R_\sigma A_{\sigma,\rm phys}\|_\infty
&\le
\|I-R_\sigma A_{\sigma,0}\|_\infty
+
\|R_\sigma\|_\infty
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
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
N_0/192552
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. First nu chamber closure

SZ-RETURN-COCYCLE-32 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu
~~~

as one of:

1. N0 / 192552;
2. O0 / 105768;
3. T3 / 86774.

All three are now certified.

Therefore this entire chamber is source-level closed for every generic seed position, modulo the registered seam set.

Combining all preceding passes gives open coverage

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu.
}
~~~

Since

~~~math
\omega+\nu=\tau,
~~~

the upper endpoint may equivalently be written

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+5\tau.
}
~~~

---

## 9. Stability diagnosis

N0 is much larger than the preceding systems:

~~~math
52884
\longrightarrow
96276
~~~

sites per orientation.

It also comes from a genuine truncation transition rather than another simple W-module insertion.

Nevertheless the same robust inverse envelope survives:

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

The exact residual remains unchanged.

The tiny plus/minus norm asymmetry is therefore a rounding-level sharp-witness effect, not a failure of the uniform compiler bound.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-33:
N0 / 192552 CERTIFIED /
FIRST NU CHAMBER CLOSED /
96276-SECTOR PARALLEL CI CERTIFICATE HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 11. Next cursor

The next exact topology event is

~~~math
\boxed{
e
=
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu.
}
~~~

At that seam:

- the surviving T3 centers collapse;
- the surviving O0 width becomes
  ~~~math
  \omega-\nu
  =
  17\nu+\lambda.
  ~~~

The Euclidean relation remains

~~~math
\boxed{
\omega=18\nu+\lambda,
\qquad
0<\lambda<\nu.
}
~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-34 /
SECOND NU TIER SEAM}.
}
~~~

Priority:

1. type the seam after one nu insertion;
2. reconstruct the second nu-tier source orbit;
3. determine whether a stabilized nu module emerges after the N0 truncation transition;
4. classify the next chamber only up to its immediate nu-width event;
5. do not jump through the quotient-eighteen run to lambda.

**Stop rule:** geometry first, invertibility second.
