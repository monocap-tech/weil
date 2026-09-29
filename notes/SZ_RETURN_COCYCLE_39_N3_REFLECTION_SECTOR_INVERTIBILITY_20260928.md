# SZ-RETURN-COCYCLE-39 — N3 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_39_n3_reflection_sector_invertibility.py

Authoritative non-assumptive repository-side run:

GitHub Actions run 36507687585.

- plus job 109212708263: SUCCESS;
- minus job 109212707987: SUCCESS.

---

## 0. Result

The N3 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu
~~~

has size

~~~math
\boxed{509886}.
~~~

It is certified invertible for both external parity choices.

Therefore every generic seed band in the fourth nu chamber is closed:

- N3 / 509886 by this pass;
- N2 / 404108 by SZ-RETURN-COCYCLE-37;
- O0 / 105768 by SZ-RETURN-COCYCLE-31.

Thus the fourth nu chamber is source-level closed, modulo the registered lower-dimensional threshold seams.

---

## 1. N3 recalled

SZ-RETURN-COCYCLE-38 established

~~~math
\boxed{
\mathcal N_3
=
\mathcal N_2
\sqcup
(3\nu+\mathcal U),
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
\mathcal N_3
=
\mathcal N_2
\cup
(\nu+\mathcal N_2).
}
~~~

The per-orientation size is

~~~math
|\mathcal N_3|
=
\boxed{254943}.
~~~

Hence the full system has

~~~math
\boxed{
2\cdot254943
=
509886
}
~~~

variables.

---

## 2. Orientation reduction

The representative N3 source orbit satisfies

~~~math
\boxed{
\mathcal N_3^+
=
\mathcal N_3^-.
}
~~~

Therefore the full matrix again has block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix}
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
\boxed{254943}.
~~~

---

## 3. Sparse sector structure

The two independent repository-side jobs measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
666038.
}
~~~

Every source-matrix column still has at most four nonzero entries.

Thus the reflection sectors remain sparse at the 254943-dimensional scale.

---

## 4. Non-assumptive inverse compiler

Each sector job independently:

1. reconstructs the complete N3 source orbit;
2. forms one 254943-dimensional reflection sector;
3. factors the floating midpoint transpose by sparse LU;
4. solves for inverse rows in 256-row blocks;
5. rounds each inverse row to denominator
   ~~~math
   10^6;
   ~~~
6. multiplies the rounded blocks against the sparse integer midpoint matrix;
7. computes exact integer infinity norms and exact residual row sums.

The verifier does not hard-code N3 sector nnz, witness norm, midpoint residual, or maximum individual residual entry.

The proof targets remain only

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

Both sectors give exactly

~~~math
\boxed{
\|R_+\|_\infty
=
\|R_-\|_\infty
=
\frac{63924057}{10^6}
=
63.924057
<64.
}
~~~

Thus the small N2 sector asymmetry disappears again at N3.

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
N_3/509886
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. Fourth nu chamber closure

SZ-RETURN-COCYCLE-38 classified every generic seed band on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu
~~~

as one of:

1. N3 / 509886;
2. N2 / 404108;
3. O0 / 105768.

All three are now certified.

Therefore the entire fourth nu chamber is source-level closed for every generic seed position, modulo the registered seam set.

Combining the preceding return-cocycle passes gives open coverage through

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu.
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

N3 increases the sector dimension

~~~math
202054
\longrightarrow
254943
~~~

by exactly

~~~math
52889,
~~~

the size of the stabilized return body U.

The exact midpoint residual again remains unchanged:

~~~math
\boxed{
\|I-R_\sigma A_{\sigma,0}\|_\infty
=
\frac{338547930925}{10^{15}}.
}
~~~

Both sharp rounded witness norms also return to

~~~math
\frac{63924057}{10^6}.
~~~

This is strong evidence of certificate stability across the fourth nu tier, but no extrapolation to later tiers is made without source-level verification.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-39:}
}
~~~

~~~math
\boxed{
\texttt{N3 / 509886 CERTIFIED /}
}
~~~

~~~math
\boxed{
\texttt{FOURTH NU CHAMBER CLOSED /}
}
~~~

~~~math
\boxed{
\texttt{254943-SECTOR PARALLEL NON-ASSUMPTIVE CERTIFICATE HIT}
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
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu.
}
~~~

At that seam:

- the surviving N2 centers collapse;
- the surviving O0 width becomes
  ~~~math
  \omega-4\nu
  =
  14\nu+\lambda.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-40 / FIFTH NU TIER SEAM}.
}
~~~

Priority:

1. type the fifth nu-tier seam directly from the source orbit;
2. test the next tier-indexed U-copy;
3. classify only the fifth nu-width chamber;
4. keep invertibility as the following pass;
5. do not bulk-jump through the quotient-eighteen run.

**Stop rule:** the tier-indexed U recurrence is verified through (3\nu+U), but each later nu tier remains a separate source-level certification obligation.
