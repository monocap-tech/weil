# SZ-RETURN-COCYCLE-27 — T2 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_27_t2_reflection_sector_invertibility.py

Repository-side exact run:

GitHub Actions run 36459676902, job 109054805354, conclusion SUCCESS.

---

## 0. Result

The T2 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+2\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+3\tau
~~~

has size

~~~math
\boxed{67780}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the third tau chamber is closed:

- T2 / 67780 by this pass;
- T1 / 48786 by SZ-RETURN-COCYCLE-25;
- S0 / 18984 by SZ-RETURN-COCYCLE-21.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+2\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+3\tau
}
~~~

is source-level closed, modulo the registered lower-dimensional seams.

---

## 1. T2 recalled

SZ-RETURN-COCYCLE-26 established

~~~math
\boxed{
\mathcal T_2
=
\mathcal T_1
\sqcup
(2\tau+\mathcal W),
}
~~~

where

~~~math
|\mathcal T_1|=24393,
\qquad
|\mathcal W|=9497.
~~~

Therefore

~~~math
|\mathcal T_2|
=
24393+9497
=
\boxed{33890}
~~~

per orientation and

~~~math
\boxed{
2\cdot33890
=
67780
}
~~~

for the full system.

The same 9497-site module W used in the T1 construction is reused at shift 2 tau.

---

## 2. Orientation reduction

A fresh representative T2 orbit gives

~~~math
\boxed{
\mathcal T_2^+
=
\mathcal T_2^-.
}
~~~

Each orientation contains exactly

~~~math
33890
~~~

constants.

Translations preserve orientation and reflections reverse it.

Hence the full matrix has the exact form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix}
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

Each sector has dimension

~~~math
\boxed{33890}.
~~~

Changing external parity only interchanges the two sectors.

---

## 3. Sparse sector size

The repository-side exact run measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
88535.
}
~~~

Every source column still has at most four nonzero entries.

Thus the sector dimension has grown substantially while retaining the same sparse source structure required by the chunked certificate.

---

## 4. Exact chunked certificate

The verifier uses denominator

~~~math
10^6
~~~

for the rounded left-inverse witness and the same denominator

~~~math
10^9
~~~

for the rational midpoint coefficients.

For each sector it:

1. factors the floating midpoint transpose by sparse LU;
2. generates inverse rows in blocks;
3. rounds them to denominator 10^6;
4. multiplies the rounded rows against the sparse integer midpoint matrix;
5. computes the exact infinity norm and exact residual row sums;
6. discards each block.

No dense exact 33890-by-33890 inverse is materialized.

The repository-side run completed successfully for both sectors.

---

## 5. Exact witness norms

The measured result is

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

Thus the same sharp witness norm seen through most earlier species persists at T2.

---

## 6. Exact midpoint residual

Both sectors give exactly

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
\boxed{1905595184},
~~~

### minus sector

~~~math
\boxed{1660409900}.
~~~

The verifier checks the corresponding overflow guard before exact row summation.

---

## 7. Physical invertibility

The same exact physical coefficient enclosure remains valid:

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}.
}
~~~

Therefore

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

Hence both physical reflection sectors are invertible by the Neumann lemma.

Therefore

~~~math
\boxed{
T_2/67780
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. Third tau chamber closure

SZ-RETURN-COCYCLE-26 classified every generic seed band in the third tau chamber as one of:

1. T2 / 67780;
2. T1 / 48786;
3. S0 / 18984.

All three are now certified.

Hence

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+2\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+3\tau
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combining all previous passes gives open coverage

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+3\tau
}
~~~

away from the lower-dimensional seams.

---

## 9. Stability diagnosis

T2 is the first certified species after the 9497-site tau module has demonstrably stabilized.

The exact inverse envelope remains unchanged:

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

More strongly, both sharp measured quantities return exactly to the familiar values.

Thus the fixed-module tau phase currently has both:

- exact source-level module repetition;
- stable reflection-sector invertibility.

No induction beyond the explicitly checked tiers is asserted yet.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-27:
T2 / 67780 CERTIFIED /
THIRD TAU CHAMBER CLOSED /
33890-SECTOR CI CERTIFICATE HIT}
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
5\kappa+2\chi+\rho+\sigma+3\tau.
}
~~~

At that seam:

- the surviving T1 centers collapse;
- the surviving S0 width becomes
  ~~~math
  \sigma-3\tau
  =
  \tau+\omega.
  ~~~

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-28 /
FINAL FULL-TAU TIER SEAM}.
}
~~~

Priority:

1. type the fourth and final full tau-width insertion;
2. test whether the same 9497-site module repeats once more;
3. classify the chamber up to the point where omega becomes the active residual;
4. do not skip the last full tau tier;
5. keep invertibility of the resulting new species as the following pass.
