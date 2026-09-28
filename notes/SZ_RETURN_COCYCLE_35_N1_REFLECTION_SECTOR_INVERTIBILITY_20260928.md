# SZ-RETURN-COCYCLE-35 — N1 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_35_n1_reflection_sector_invertibility.py

Repository-side exact run:

GitHub Actions run 36475877484.

- plus job 109109344358: SUCCESS;
- minus job 109109344874: SUCCESS.

---

## 0. Result

The N1 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu
~~~

has size

~~~math
\boxed{298330}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the second nu chamber is closed:

- N1 / 298330 by this pass;
- N0 / 192552 by SZ-RETURN-COCYCLE-33;
- O0 / 105768 by SZ-RETURN-COCYCLE-31.

Thus the second nu chamber is source-level closed, modulo the registered lower-dimensional threshold seams.

---

## 1. N1 recalled

SZ-RETURN-COCYCLE-34 established

~~~math
\boxed{
\mathcal N_1
=
\mathcal N_0
\sqcup
(\nu+\mathcal U),
}
~~~

where

~~~math
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2},
~~~

and

~~~math
|\mathcal T_{\nu,2}|=5.
~~~

The component sizes are

~~~math
|\mathcal N_0|=96276,
~~~

~~~math
|\mathcal U|=52889.
~~~

Hence

~~~math
|\mathcal N_1|
=
96276+52889
=
\boxed{149165}
~~~

per orientation.

The full system therefore has

~~~math
\boxed{
2\cdot149165
=
298330
}
~~~

variables.

---

## 2. Orientation reduction

A representative N1 source orbit gives

~~~math
\boxed{
\mathcal N_1^+
=
\mathcal N_1^-.
}
~~~

Each orientation contains exactly

~~~math
149165
~~~

constant sites.

Translations preserve orientation and reflections reverse it.

Therefore the full matrix has block form

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

Each reflection sector has dimension

~~~math
\boxed{149165}.
~~~

Changing external parity only swaps the two sectors.

---

## 3. Sparse sector structure

The independent repository-side jobs measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
389692.
}
~~~

Every source-matrix column has at most four nonzero entries.

Thus the sector remains sparse despite the increase to almost three hundred thousand full-system variables.

---

## 4. Parallel exact inverse compiler

The two reflection sectors were certified independently in parallel.

Each job:

1. reconstructs the complete N1 orbit;
2. forms one 149165-dimensional reflection sector;
3. factors the floating midpoint transpose by sparse LU;
4. solves for inverse rows in 256-row blocks;
5. rounds the rows to denominator
   ~~~math
   10^6;
   ~~~
6. multiplies each rounded block against the sparse integer midpoint matrix;
7. computes exact integer infinity norms and exact residual row sums.

No dense exact 149165-by-149165 inverse is materialized.

Both independent jobs completed successfully.

---

## 5. Exact witness norms

Both sectors give

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

Thus the sharp norm asymmetry seen at N0 disappears again at N1.

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
\boxed{1710917232},
~~~

### minus sector

~~~math
\boxed{1641840644}.
~~~

The signed-integer overflow guard is checked before exact row summation.

---

## 7. Physical invertibility

The same exact coefficient enclosure remains valid:

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

Hence both physical sectors are invertible by the Neumann lemma.

Therefore

~~~math
\boxed{
N_1/298330
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. Second nu chamber closure

SZ-RETURN-COCYCLE-34 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu
~~~

as one of:

1. N1 / 298330;
2. N0 / 192552;
3. O0 / 105768.

All three are now certified.

Therefore the entire second nu chamber is source-level closed for every generic seed position, modulo the registered seam set.

Combining all preceding passes gives open coverage

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu.
}
~~~

The quotient-eighteen relation remains

~~~math
\omega=18\nu+\lambda,
\qquad
0<\lambda<\nu.
~~~

---

## 9. Stability diagnosis

N1 increases the sector dimension from

~~~math
96276
\longrightarrow
149165.
~~~

It arises from another nested-truncation transition, with the new return body

~~~math
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2}.
~~~

Despite that geometric change, the exact inverse envelope remains unchanged:

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

More strongly, both sharp measured witness norms return to the familiar

~~~math
63924057/10^6.
~~~

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-35:
N1 / 298330 CERTIFIED /
SECOND NU CHAMBER CLOSED /
149165-SECTOR PARALLEL CI CERTIFICATE HIT}
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
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu.
}
~~~

At that seam:

- the surviving N0 centers collapse;
- the surviving O0 width becomes
  ~~~math
  \omega-2\nu
  =
  16\nu+\lambda.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-36 /
THIRD NU TIER SEAM}.
}
~~~

Priority:

1. type the third nu-tier seam;
2. determine whether the second-tier body U now stabilizes as a fixed module;
3. classify only the next nu-width chamber;
4. keep invertibility as the following pass;
5. do not jump through the quotient-eighteen run to lambda.

**Stop rule:** stabilization must be demonstrated by the next source orbit, not inferred from the two prior tiers.
