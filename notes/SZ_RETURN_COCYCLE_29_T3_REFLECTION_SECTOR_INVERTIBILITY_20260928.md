# SZ-RETURN-COCYCLE-29 — T3 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_29_t3_reflection_sector_invertibility.py

Repository-side exact run:

GitHub Actions run 36461805736, job 109061935381, conclusion SUCCESS.

---

## 0. Result

The T3 collision species introduced on

~~~math
5\kappa+2\chi+\rho+\sigma+3\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau
~~~

has size

~~~math
\boxed{86774}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in the final full-tau chamber is closed:

- T3 / 86774 by this pass;
- T2 / 67780 by SZ-RETURN-COCYCLE-27;
- S0 / 18984 by SZ-RETURN-COCYCLE-21.

Thus

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+3\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau
}
~~~

is source-level closed, modulo the registered lower-dimensional seams.

---

## 1. T3 recalled

SZ-RETURN-COCYCLE-28 established

~~~math
\boxed{
\mathcal T_3
=
\mathcal T_2
\sqcup
(3\tau+\mathcal W),
}
~~~

where

~~~math
|\mathcal T_2|=33890,
\qquad
|\mathcal W|=9497.
~~~

Therefore

~~~math
|\mathcal T_3|
=
33890+9497
=
\boxed{43387}
~~~

per orientation and

~~~math
\boxed{
2\cdot43387
=
86774
}
~~~

for the full system.

This is the final checked reuse of the stabilized 9497-site tau module before omega becomes active.

---

## 2. Orientation reduction

A fresh representative T3 orbit gives

~~~math
\boxed{
\mathcal T_3^+
=
\mathcal T_3^-.
}
~~~

Each orientation contains exactly

~~~math
43387
~~~

constant sites.

Translations preserve orientation and reflections reverse it.

Hence the full matrix has the exact block form

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
\boxed{43387}.
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
113346.
}
~~~

Every source column still has at most four nonzero entries.

Thus the source matrix remains sparse enough for exact blockwise inverse verification at the largest checked sector size so far.

---

## 4. Chunked exact certificate

The verifier uses the same rational center as the earlier collision passes.

The rounded inverse witness uses denominator

~~~math
10^6,
~~~

while the rational midpoint coefficient center uses denominator

~~~math
10^9.
~~~

For each reflection sector the verifier:

1. factors the floating midpoint transpose by sparse LU;
2. solves for inverse rows in bounded chunks;
3. rounds the rows to denominator 10^6;
4. multiplies them against the sparse integer midpoint matrix;
5. computes exact integer row norms and residuals;
6. discards each block.

No dense exact 43387-by-43387 inverse is materialized.

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

Thus the sharp witness norm remains unchanged at T3.

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

The maximum exact individual residual entries are

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

The same coefficient enclosure remains valid:

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
T_3/86774
\text{ is invertible for both external parity choices}.
}
~~~

---

## 8. Final full-tau chamber closure

SZ-RETURN-COCYCLE-28 classified every generic seed band in the final full-tau chamber as one of:

1. T3 / 86774;
2. T2 / 67780;
3. S0 / 18984.

All three are now certified.

Hence

~~~math
\boxed{
5\kappa+2\chi+\rho+\sigma+3\tau
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau
}
~~~

is source-level closed for every generic seed position, modulo the registered seam set.

Combining all previous passes gives open coverage

~~~math
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau
}
~~~

away from lower-dimensional seams.

Because

~~~math
\sigma=4\tau+\omega,
~~~

the endpoint may also be written

~~~math
5\kappa+2\chi+\rho+2\sigma-\omega.
~~~

The next active residual is omega.

---

## 9. Tau-run compiler diagnosis

The checked tau sequence is now:

~~~math
\mathcal T_0,
~~~

~~~math
\mathcal T_1
=
\mathcal T_0
\sqcup
(\tau+\mathcal W),
~~~

~~~math
\mathcal T_2
=
\mathcal T_1
\sqcup
(2\tau+\mathcal W),
~~~

~~~math
\mathcal T_3
=
\mathcal T_2
\sqcup
(3\tau+\mathcal W).
~~~

The same 9497-site module W is repeated through the remaining full-tau tiers, and all three new species T1, T2, T3 retain the same coarse exact inverse envelope

~~~math
\boxed{
\|R\|_\infty<64,
\qquad
\|I-RA_0\|_\infty<1/2950.
}
~~~

This closes the explicitly checked quotient-four tau run.

No induction beyond the checked range is needed, because the Euclidean arithmetic now changes residual scale to omega.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-29:
T3 / 86774 CERTIFIED /
FINAL FULL-TAU CHAMBER CLOSED /
QUOTIENT-4 TAU RUN CLOSED}
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
5\kappa+2\chi+\rho+\sigma+4\tau.
}
~~~

At that seam:

- the surviving T2 centers collapse;
- the surviving S0 width is exactly
  ~~~math
  \omega
  =
  \sigma-4\tau.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-30 /
OMEGA COLLISION SEAM}.
}
~~~

Priority:

1. type the omega seam exactly;
2. identify the first omega-chamber source orbit;
3. determine the omega-shifted truncated return body;
4. compute the next Euclidean remainder from the actual source alphabet;
5. keep geometry and invertibility as separate passes.

**Stop rule:** do not infer the omega architecture from the tau module without retyping the source orbit.
