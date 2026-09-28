# SZ-RETURN-COCYCLE-19 — K2 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_19_k2_reflection_sector_invertibility.py

---

## 0. Result

The new K2 collision species introduced on

~~~math
5\kappa+2\chi
<
e
<
5\kappa+2\chi+\rho
~~~

has size

~~~math
\boxed{10798}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in

~~~math
\boxed{
5\kappa+2\chi
<
e
<
5\kappa+2\chi+\rho
}
~~~

is closed:

- K2 / 10798 by this pass;
- K1 / 8176 by SZ-RETURN-COCYCLE-17;
- M6 / 2612 by SZ-RETURN-COCYCLE-13.

Thus the first rho chamber is source-level closed, modulo the registered lower-dimensional threshold seams.

The same exact reflection-sector inverse envelope survives once again.

---

## 1. K2 recalled

SZ-RETURN-COCYCLE-18 defined, per orientation,

~~~math
\boxed{
\mathcal K_2
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
\sqcup
(2\chi+\mathcal X)
\sqcup
(3\chi+\mathcal X).
}
~~~

The component sizes are

~~~math
|\mathcal M_7|=1466,
~~~

~~~math
|\mathcal X|=1311.
~~~

Hence

~~~math
\begin{aligned}
|\mathcal K_2|
&=
1466+3\cdot1311
\\
&=
\boxed{5399}.
\end{aligned}
~~~

With two seed orientations,

~~~math
\boxed{
2\cdot5399
=
10798.
}
~~~

---

## 2. Equal-orientation constant set

A fresh source-orbit reconstruction in a representative K2 band gives

~~~math
\boxed{
\mathcal K_2^+
=
\mathcal K_2^-.
}
~~~

Each orientation contains exactly

~~~math
5399
~~~

constants.

Translations preserve seed orientation and reflections reverse it.

Therefore, after parallel ordering of the two copies of K2, the full matrix has block form

~~~math
\boxed{
\begin{pmatrix}
A&B\\
B&A
\end{pmatrix}.
}
~~~

Diagonalizing the orientation swap gives the two scalar reflection sectors

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each sector has dimension

~~~math
\boxed{5399}.
~~~

Changing external parity only swaps the two sectors.

---

## 3. Sparse sector structure

At the rational midpoint coefficient center, each 5399-sector matrix has exactly

~~~math
\boxed{14102}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

Thus exact residual verification remains sparse even though the orbit is now substantially larger.

---

## 4. Rational coefficient center

Use the same compiler center:

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
\frac{915078526}{10^9},
~~~

with

~~~math
d=\delta\gamma.
~~~

Exact rational atanh-series bounds for the logarithms and exact integer-square root bounds give

~~~math
\boxed{
\|A_{\sigma,\rm phys}-A_{\sigma,0}\|_\infty
<
10^{-9}
}
~~~

for both reflection sectors.

The exact row-sum perturbation bound used by the verifier is approximately

~~~math
8.93644\times10^{-10},
~~~

strictly below

~~~math
10^{-9}.
~~~

---

## 5. Exact rational inverse witnesses

For each

~~~math
\sigma\in\{+1,-1\},
~~~

a sparse numerical LU solve is used only to generate an approximate inverse.

Every inverse entry is rounded to denominator

~~~math
10^6.
~~~

All norm and residual checks after that rounding are exact integer/rational arithmetic.

Both reflection sectors independently produce

~~~math
\boxed{
\|R_\sigma\|_\infty
=
\frac{63924057}{10^6}
<64.
}
~~~

This is exactly the same sharp witness norm obtained for:

- the pre-5-kappa wing compiler;
- C0 / 5554;
- K1 / 8176.

---

## 6. Exact midpoint residual

Both K2 sectors also reproduce the same exact residual:

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

The two sectors were independently checked.

The largest exact individual residual entry remains below

~~~math
2\cdot10^9,
~~~

and its product with the row dimension is below the signed 64-bit limit, so the exact integer row-sum calculation is safe from overflow.

---

## 7. Physical invertibility

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

Thus

~~~math
R_\sigma A_{\sigma,\rm phys}
~~~

is invertible by the Neumann lemma.

Hence both physical sectors are invertible:

~~~math
\boxed{
A_{+,\rm phys},
\ A_{-,\rm phys}
\text{ invertible}.
}
~~~

Therefore the full K2 / 10798 matrix is invertible.

---

## 8. External parity

Changing external parity flips all reflection coefficients.

In the reflection-sector basis this interchanges

~~~math
A_+
~~~

and

~~~math
A_-.
~~~

Since both are certified,

~~~math
\boxed{
\text{both external parity systems are invertible}.
}
~~~

---

## 9. First rho chamber closure

SZ-RETURN-COCYCLE-18 classified every generic seed band in

~~~math
5\kappa+2\chi
<
e
<
5\kappa+2\chi+\rho
~~~

as one of:

1. K2 / 10798;
2. K1 / 8176;
3. M6 / 2612.

All three species are now certified.

Therefore

~~~math
\boxed{
5\kappa+2\chi
<
e
<
5\kappa+2\chi+\rho
}
~~~

is source-level closed for all generic seed positions, modulo the registered threshold seams.

Combined with all prior passes,

~~~math
\boxed{
0<e<5\kappa+2\chi+\rho
}
~~~

is now covered by source-level finite-orbit invertibility, apart from the seam set consistently kept separate.

---

## 10. Stability observation

The sequence

~~~math
2932
\to
5554
\to
8176
\to
10798
~~~

has now crossed three distinct collision geometries.

Nevertheless the exact rational witness envelope remains unchanged:

~~~math
\boxed{
\|R\|_\infty
=
\frac{63924057}{10^6},
}
~~~

~~~math
\boxed{
\|I-RA_0\|_\infty
=
\frac{338547930925}{10^{15}}.
}
~~~

This equality is not needed for the proof.

But it is strong evidence that the source compiler is carrying a stable finite-state inverse kernel through the successive Euclidean residual collisions.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-19:
K2 / 10798 CERTIFIED /
FIRST RHO CHAMBER CLOSED}
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
5\kappa+2\chi+\rho.
}
~~~

At that seam:

- the remaining M6 gaps collapse;
- the surviving K1 center width becomes
  ~~~math
  \sigma
  =
  \chi-\rho.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-20 /
SIGMA COLLISION SEAM}.
}
~~~

Priority:

1. type the exact seam at e=5 kappa+2 chi+rho;
2. classify the first sigma chamber;
3. determine the next truncated collision body;
4. test whether the equal-orientation/reflection-sector reduction persists;
5. identify the next Euclidean residual before attempting any broader induction.

**Stop rule:** do not extend the chi-tier formula beyond the sigma collision without retyping the source alphabet.
