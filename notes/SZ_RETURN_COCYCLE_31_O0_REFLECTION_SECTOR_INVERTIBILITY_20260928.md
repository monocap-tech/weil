# SZ-RETURN-COCYCLE-31 — O0 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_31_o0_reflection_sector_invertibility.py

Repository-side exact run:

GitHub Actions run 36465246178, job 109073574376, conclusion SUCCESS.

---

## 0. Result

The O0 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
~~~

has size

~~~math
\boxed{105768}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the first omega chamber is closed:

- O0 / 105768 by this pass;
- T3 / 86774 by SZ-RETURN-COCYCLE-29;
- S0 / 18984 by SZ-RETURN-COCYCLE-21.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+4\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
}
~~~

is source-level closed, modulo the registered lower-dimensional seams.

---

## 1. O0 recalled

SZ-RETURN-COCYCLE-30 established

~~~math
\boxed{
\mathcal O_0
=
\mathcal T_3
\sqcup
(4\tau+\mathcal W),
}
~~~

with

~~~math
|\mathcal T_3|=43387,
\qquad
|\mathcal W|=9497.
~~~

Therefore

~~~math
|\mathcal O_0|
=
43387+9497
=
\boxed{52884}
~~~

per orientation, and the full system has

~~~math
\boxed{
2\cdot52884
=
105768
}
~~~

variables.

---

## 2. Orientation reduction

A representative O0 orbit gives

~~~math
\boxed{
\mathcal O_0^+
=
\mathcal O_0^-.
}
~~~

Each orientation contains exactly

~~~math
52884
~~~

constant sites.

Translations preserve orientation and reflections reverse it.

Thus the full matrix has block form

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

Each scalar reflection sector has dimension

~~~math
\boxed{52884}.
~~~

Changing external parity only interchanges the two sectors.

---

## 3. Sparse sector size

The repository-side run measured

~~~math
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
138157.
}
~~~

Every source-matrix column has at most four nonzero entries.

Thus the sparse source structure survives at the largest checked sector size so far.

---

## 4. Exact chunked certificate

The rounded inverse witness uses denominator

~~~math
10^6,
~~~

and the rational midpoint coefficient center uses denominator

~~~math
10^9.
~~~

For each reflection sector, the verifier:

1. factors the floating midpoint transpose by sparse LU;
2. generates inverse rows in 1024-row blocks;
3. rounds them to denominator 10^6;
4. multiplies each rounded block against the sparse integer midpoint matrix;
5. computes exact integer infinity norms and exact residual row sums;
6. discards the block before continuing.

No dense exact 52884-by-52884 inverse is materialized.

The full repository-side run completed successfully for both sectors.

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

Thus the sharp rounded witness norm remains unchanged at O0.

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

The signed-integer overflow guard is checked before exact row summation.

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

Hence

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
O_0/105768
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. First omega chamber closure

SZ-RETURN-COCYCLE-30 classified every generic seed band in the first omega chamber as one of:

1. O0 / 105768;
2. T3 / 86774;
3. S0 / 18984.

All three are now certified.

Therefore

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+4\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combining all preceding passes gives open coverage

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega
}
~~~

away from the lower-dimensional seams.

Since

~~~math
\tau=\omega+\nu,
~~~

the next active residual is nu.

---

## 9. Stability diagnosis

O0 is the first species in a chamber whose active width is omega, but its source architecture still completes the fourth stabilized W-module at shift 4 tau.

Despite this arithmetic change, the exact inverse envelope remains

~~~math
\boxed{
\|R_\sigma\|_\infty<64,
\qquad
\|I-R_\sigma A_{\sigma,0}\|_\infty<1/2950.
}
~~~

More strongly, the sharp measured witness norm and midpoint residual remain exactly equal to the familiar values.

Thus the transition from tau-width geometry to omega-width geometry has not degraded the checked inverse compiler.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-31:
O0 / 105768 CERTIFIED /
FIRST OMEGA CHAMBER CLOSED /
52884-SECTOR CI CERTIFICATE HIT}
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
5\kappa+2\chi+\rho+\sigma+4\tau+\omega.
}
~~~

At that seam:

- the surviving S0 centers collapse;
- the surviving T3 center width becomes
  ~~~math
  \nu
  =
  \tau-\omega.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-32 /
NU COLLISION SEAM}.
}
~~~

Priority:

1. type the nu seam exactly;
2. reconstruct the first nu-chamber orbit;
3. determine the new truncated return body from the actual source alphabet;
4. compute the next Euclidean remainder;
5. keep geometry and invertibility as separate passes.

**Stop rule:** do not infer the nu architecture from O0 or the tau ladder without retyping the source orbit.
