# SZ-RETURN-COCYCLE-37 — N2 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_37_n2_reflection_sector_invertibility.py

Authoritative non-assumptive repository-side run:

GitHub Actions run 36503700725.

- plus job 109200191851: SUCCESS;
- minus job 109200192024: SUCCESS.

---

## 0. Result

The N2 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
~~~

has size

~~~math
\boxed{404108}.
~~~

It is now certified invertible for both external parity choices.

Therefore every generic seed band in the third nu chamber is closed:

- N2 / 404108 by this pass;
- N1 / 298330 by SZ-RETURN-COCYCLE-35;
- O0 / 105768 by SZ-RETURN-COCYCLE-31.

Thus the third nu chamber is source-level closed, modulo the registered lower-dimensional threshold seams.

---

## 1. N2 recalled

SZ-RETURN-COCYCLE-36 established

~~~math
\boxed{
\mathcal N_2
=
\mathcal N_1
\sqcup
(2\nu+\mathcal U),
}
~~~

with

~~~math
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2},
\qquad
|\mathcal U|=52889.
~~~

Equivalently,

~~~math
\boxed{
\mathcal N_2
=
\mathcal N_1
\cup
(\nu+\mathcal N_1).
}
~~~

The per-orientation size is

~~~math
|\mathcal N_2|
=
\boxed{202054}.
~~~

Hence the full system has

~~~math
\boxed{
2\cdot202054
=
404108
}
~~~

variables.

---

## 2. Orientation reduction

The representative N2 source orbit satisfies

~~~math
\boxed{
\mathcal N_2^+
=
\mathcal N_2^-.
}
~~~

Translations preserve orientation and reflections reverse it.

Therefore the full matrix again has block form

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
\boxed{202054}.
~~~

Changing external parity swaps the sectors.

---

## 3. Sparse sector structure

The two independent repository-side jobs measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
527865.
}
~~~

Every source-matrix column still has at most four nonzero entries.

Thus the sector remains sparse at the 202054-dimensional scale.

---

## 4. Non-assumptive inverse compiler

Each sector job independently:

1. reconstructs the complete N2 source orbit;
2. forms one 202054-dimensional reflection sector;
3. factors the floating midpoint transpose by sparse LU;
4. solves for inverse rows in 256-row blocks;
5. rounds each inverse row to denominator
   ~~~math
   10^6;
   ~~~
6. multiplies the rounded blocks against the sparse integer midpoint matrix;
7. computes exact integer infinity norms and exact residual row sums.

The verifier contains no hard-coded N2 values for sector nnz, witness norm, midpoint residual, or maximum individual residual entry.

The only proof targets retained from the established envelope are

~~~math
\|R_\sigma\|_\infty<64
~~~

and

~~~math
\|I-R_\sigma A_{\sigma,0}\|_\infty<\frac1{2950}.
~~~

Both jobs completed successfully.

---

## 5. Exact witness norms

The plus sector gives

~~~math
\boxed{
\|R_+\|_\infty
=
\frac{63924057}{10^6}
=
63.924057
<64.
}
~~~

The minus sector gives

~~~math
\boxed{
\|R_-\|_\infty
=
\frac{63924064}{10^6}
=
63.924064
<64.
}
~~~

Thus the sharp rounded witness norm develops a very small sector asymmetry at N2:

~~~math
\boxed{
\|R_-\|_\infty
-
\|R_+\|_\infty
=
\frac7{10^6}.
}
~~~

The coarse proof envelope is unchanged.

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
\boxed{1641840644},
~~~

### minus sector

~~~math
\boxed{1675019116}.
~~~

The signed-integer overflow guard is checked before exact row summation.

---

## 7. Physical invertibility

The exact coefficient enclosure remains

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
N_2/404108
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. Third nu chamber closure

SZ-RETURN-COCYCLE-36 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
~~~

as one of:

1. N2 / 404108;
2. N1 / 298330;
3. O0 / 105768.

All three are now certified.

Therefore the entire third nu chamber is source-level closed for every generic seed position, modulo the registered seam set.

Combining the preceding return-cocycle passes gives open coverage through

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu.
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

N2 increases the sector dimension

~~~math
149165
\longrightarrow
202054
~~~

by exactly

~~~math
52889,
~~~

the size of the stabilized return body U.

Despite the new tier-indexed translated copy, the exact midpoint residual remains unchanged:

~~~math
\boxed{
\|I-R_\sigma A_{\sigma,0}\|_\infty
=
\frac{338547930925}{10^{15}}.
}
~~~

The plus witness norm also remains exactly at the familiar value

~~~math
\frac{63924057}{10^6},
~~~

while the minus witness norm changes only by

~~~math
\frac7{10^6}.
~~~

This is evidence of strong certificate stability across the third nu tier, but no extrapolation to later tiers is made without source-level verification.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-37:}
}
~~~

~~~math
\boxed{
\texttt{N2 / 404108 CERTIFIED /}
}
~~~

~~~math
\boxed{
\texttt{THIRD NU CHAMBER CLOSED /}
}
~~~

~~~math
\boxed{
\texttt{202054-SECTOR PARALLEL NON-ASSUMPTIVE CERTIFICATE HIT}
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
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu.
}
~~~

At that seam:

- the surviving N1 centers collapse;
- the surviving O0 width becomes
  ~~~math
  \omega-3\nu
  =
  15\nu+\lambda.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-38 / FOURTH NU TIER SEAM}.
}
~~~

Priority:

1. type the fourth nu-tier seam directly from the source orbit;
2. test the next tier-indexed U-copy rather than extrapolating it;
3. classify only the fourth nu-width chamber;
4. keep invertibility as the following pass;
5. do not bulk-jump through the quotient-eighteen run.

**Stop rule:** the tier-indexed U recurrence is strongly supported through N2, but each subsequent topology tier remains a source-level certification obligation.
