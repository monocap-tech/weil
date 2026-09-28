# SZ-RETURN-COCYCLE-17 — K1 Reflection-Sector Invertibility

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_17_k1_reflection_sector_invertibility.py

---

## 0. Result

The new K1 collision species introduced on

~~~math
5\kappa+\chi<e<5\kappa+2\chi
~~~

has size

~~~math
\boxed{8176}.
~~~

It is now rigorously certified invertible for both external parity choices.

Therefore every generic seed band in

~~~math
\boxed{
5\kappa+\chi
<
e
<
5\kappa+2\chi
}
~~~

is closed:

- K1 / 8176 by this pass;
- C0 / 5554 by SZ-RETURN-COCYCLE-15;
- M6 / 2612 by SZ-RETURN-COCYCLE-13.

The key reduction is again exact orientation symmetry: both seed orientations use the same 4088-site constant set, so the 8176 matrix diagonalizes into two scalar 4088 reflection sectors.

---

## 1. K1 recalled

SZ-RETURN-COCYCLE-16 defined, per orientation,

~~~math
\boxed{
\mathcal K_1
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
\sqcup
(2\chi+\mathcal X).
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
|\mathcal K_1|
&=
1466+1311+1311
\\
&=
\boxed{4088}.
\end{aligned}
~~~

With two seed orientations,

~~~math
\boxed{
2\cdot4088=8176.
}
~~~

---

## 2. Equal-orientation constant set

A fresh source-orbit reconstruction in a representative K1 band gives

~~~math
\boxed{
\mathcal K_1^+
=
\mathcal K_1^-.
}
~~~

Each orientation contains exactly

~~~math
4088
~~~

constants.

Translations preserve seed orientation.

Reflections reverse seed orientation.

Therefore, after parallel ordering of the two copies of K1, the full matrix has the orientation-symmetric form

~~~math
\boxed{
\begin{pmatrix}
A & B\\
B & A
\end{pmatrix}.
}
~~~

Diagonalizing the orientation swap gives the scalar sectors

~~~math
\boxed{
A_+=A+B,
\qquad
A_-=A-B.
}
~~~

Each sector has dimension

~~~math
\boxed{4088}.
~~~

The opposite external parity simply interchanges the two sectors.

---

## 3. Sparse sector structure

At the rational midpoint coefficient center, each 4088-sector matrix has exactly

~~~math
\boxed{10677}
~~~

nonzero entries.

Every source-matrix column has at most four nonzero entries.

Thus the exact residual check remains sparse despite the much larger orbit.

---

## 4. Rational coefficient center

Use the same compiler center as the pre-5-kappa wing and C0 collision passes:

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

## 5. Exact inverse witness norm

For each

~~~math
\sigma\in\{+1,-1\},
~~~

a numerical sparse LU solve is used only to generate an approximate inverse.

Every inverse entry is rounded to denominator

~~~math
10^6.
~~~

Call the rational witness

~~~math
R_\sigma.
~~~

All following norm and residual calculations are exact integer arithmetic.

Both sectors produce

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
- the C0 / 5554 collision sectors.

---

## 6. Exact midpoint residual

Both K1 reflection sectors produce the exact residual

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

The verifier also bounds the largest individual exact residual entry before row summation, proving that the signed 64-bit arithmetic cannot overflow.

Thus the entire midpoint certificate is rational after numerical witness generation.

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

Therefore

~~~math
R_\sigma A_{\sigma,\rm phys}
~~~

is invertible by the Neumann lemma.

Hence

~~~math
\boxed{
A_{+,\rm phys}
\text{ and }
A_{-,\rm phys}
\text{ are both invertible}.
}
~~~

So the full 8176 K1 matrix is invertible.

---

## 8. External parity

Changing external parity flips all reflection coefficients.

In the reflection-sector basis this swaps

~~~math
A_+
~~~

and

~~~math
A_-.
~~~

Since both sectors are certified,

~~~math
\boxed{
\text{both external parity systems are invertible}.
}
~~~

---

## 9. Chamber closure

SZ-RETURN-COCYCLE-16 classified every generic band in

~~~math
5\kappa+\chi
<
e
<
5\kappa+2\chi
~~~

as one of:

1. K1 / 8176;
2. C0 / 5554;
3. M6 / 2612.

All three species are now certified.

Therefore

~~~math
\boxed{
5\kappa+\chi
<
e
<
5\kappa+2\chi
}
~~~

is source-level closed for all generic seed positions, modulo the registered threshold seams.

Combined with the previous traversal,

~~~math
\boxed{
0<e<5\kappa+2\chi
}
~~~

is now covered by source-level finite-orbit invertibility, apart from the seam set consistently kept separate.

---

## 10. Stability observation

The K1 sectors reproduce **exactly** the same rational inverse envelope as C0 and the earlier wing compiler:

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

This equality is not required for invertibility.

But it is strong evidence that the return compiler carries a stable finite-state inverse kernel across both eta-star and chi collision insertions.

The orbit size has grown from 2932 to 5554 to 8176 while the exact rational witness envelope has remained unchanged.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-17:
K1 / 8176 CERTIFIED /
SECOND CHI CHAMBER CLOSED}
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
5\kappa+2\chi.
}
~~~

At that seam:

- the surviving C0 centers collapse;
- the remaining M6 residual width becomes
  ~~~math
  \rho
  =
  \eta_*-3\chi.
  ~~~

The next bounded task is therefore

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-18 /
RHO COLLISION SEAM}.
}
~~~

Priority:

1. type the exact seam at e=5 kappa+2 chi;
2. classify the first chamber in which rho becomes active;
3. determine whether K1 acquires a rho-shifted truncated body;
4. test whether equal-orientation constant sets and reflection-sector reduction persist;
5. identify the next Euclidean residual before any further induction.

**Stop rule:** do not promote a general chi-tier theorem past the rho collision.
