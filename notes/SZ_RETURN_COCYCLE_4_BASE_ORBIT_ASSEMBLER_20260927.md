# SZ-RETURN-COCYCLE-4 — Fresh Source-Level Orbit Assembler and 124 Determinant Re-certification

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL RECONSTRUCTION  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

`experiments/sz_return_cocycle_4_base_orbit_verify.py`

---

## 0. Result

The base chamber

~~~math
0<e\le\kappa
~~~

has now been reconstructed directly from the scalar parity equations without the missing historical matrix artifact.

The fresh construction gives:

~~~math
\boxed{
31\text{ skeleton sites}
\times
2\text{ kappa offsets}
\times
2\text{ reflection orientations}
=
124\text{ scalar orbit variables}.
}
~~~

The resulting 124x124 parity system admits an exact reflection-sector factorization into two 62x62 scalar systems.

Both 62x62 determinants are rigorously certified negative using exact rational interval arithmetic, hence every 124x124 external-parity determinant is positive and nonzero.

This independently recovers the historical GERM-62 base closure at the level of source equations, dimension, parity structure, and determinant nonvanishing.

It does not claim byte identity with the missing historical assembler.

---

## 1. Exact skeleton coordinates

Retain

~~~math
q=\log\frac43,
\qquad
j=\log\frac98,
\qquad
k=\log\frac{16}{15},
~~~

and define

~~~math
h=2j+k-q=\log\frac{81}{80},
~~~

~~~math
p=q-j-k=\log\frac{10}{9},
~~~

~~~math
\kappa=5q-10j-4k=k-5h,
~~~

~~~math
r=q+j=\log\frac32,
\qquad
s=q-k=\log\frac54.
~~~

The orbit constants organize into 31 lower skeleton sites.

### A skeleton — 6 sites

~~~math
mh,
\qquad
0\le m\le5.
~~~

### B skeleton — 6 sites

~~~math
p+mh,
\qquad
0\le m\le5.
~~~

### D skeleton — 7 sites

~~~math
p+6h
~~~

and

~~~math
s+mh,
\qquad
0\le m\le5.
~~~

### T skeleton — 12 sites

~~~math
r+mh,
\qquad
0\le m\le5,
~~~

and

~~~math
q+s+mh,
\qquad
0\le m\le5.
~~~

This gives

~~~math
6+6+7+12=31.
~~~

Each skeleton site has a kappa-shifted copy.

The only threshold-role change under that copy is

~~~math
s+5h+\kappa=q,
~~~

which moves from the dead side to the tail side exactly at the tail boundary.

The resulting 62 constants have region counts

~~~math
\boxed{
A:12,
\qquad
B:12,
\qquad
D:13,
\qquad
T:25.
}
~~~

---

## 2. The reflection pair doubles 62 to 124

For one generic seed

~~~math
0<z<e,
~~~

every constant C carries the two values

~~~math
\boxed{
Y_C(z)
=
\begin{pmatrix}
x(C+z)\\
x(C+e-z)
\end{pmatrix}.
}
~~~

Both entries lie in the same A/B/D/T region throughout

~~~math
0<e\le\kappa.
~~~

Therefore the complete scalar orbit has

~~~math
\boxed{
62\times2=124
}
~~~

coordinates.

This is not inferred from the old matrix dimension.

It is generated directly from the source affine maps.

---

## 3. Exact 2x2 block row rules

Let

~~~math
\mathsf S
=
\begin{pmatrix}
0&1\\
1&0
\end{pmatrix}
~~~

be the orientation swap.

Put

~~~math
\mu=\beta\gamma.
~~~

Then every pair of source rows becomes one two-component block row.

### A row

~~~math
\boxed{
Y_C
+
\beta Y_{C+r}
+
\delta\gamma Y_{C+s}
-
\varepsilon\delta\gamma
\mathsf S Y_{k-C}
=0.
}
~~~

### B row

~~~math
\boxed{
Y_C+\beta Y_{C+r}=0.
}
~~~

### D row

~~~math
\boxed{
Y_C=0.
}
~~~

### T row

~~~math
\boxed{
Y_C
+
\mu Y_{C-q}
-
\varepsilon\mu
\mathsf S Y_{2q-C}
=0.
}
~~~

Every target constant on the right belongs to the same 62-site set.

Thus these four formulas are a complete fresh 62-node block assembler for the base chamber.

---

## 4. Hidden reflection-sector decomposition

Every 2x2 block in Section 3 lies in the commuting algebra

~~~math
\operatorname{span}\{I,\mathsf S\}.
~~~

Diagonalize

~~~math
\mathsf S
~~~

with eigenvalue

~~~math
\eta\in\{+1,-1\}.
~~~

The 124x124 matrix splits into two scalar 62x62 systems.

Only the product

~~~math
\boxed{
\sigma=\varepsilon\eta
}
~~~

appears.

For fixed sigma, the scalar rows are:

### A

~~~math
y_C
+
\beta y_{C+r}
+
\delta\gamma y_{C+s}
-
\sigma\delta\gamma y_{k-C}
=0.
~~~

### B

~~~math
y_C+\beta y_{C+r}=0.
~~~

### D

~~~math
y_C=0.
~~~

### T

~~~math
y_C
+
\mu y_{C-q}
-
\sigma\mu y_{2q-C}
=0.
~~~

Hence there are only two distinct scalar matrices,

~~~math
M_+,
\qquad
M_-,
~~~

not four.

Changing the external parity

~~~math
\varepsilon\mapsto-\varepsilon
~~~

merely swaps the two reflection sectors.

Therefore

~~~math
\boxed{
\det\mathcal M_{\varepsilon}
=
\det M_+\det M_-
}
~~~

is **exactly independent of external parity**.

This explains, rather than merely checks, why both historical parity cases close together.

---

## 5. Exact symbolic determinant reduction

Treat

~~~math
b=\beta,
\qquad
d=\delta\gamma,
\qquad
m=\mu
~~~

as formal variables.

The fresh verifier derives

~~~math
P_+(b,d,m)=\det M_+,
~~~

~~~math
P_-(b,d,m)=\det M_-.
~~~

Each is an exact integer polynomial with

~~~math
\boxed{76\text{ nonzero monomials}.}
~~~

No floating-point matrix determinant is used in the sign certificate.

The physical parameters are

~~~math
\beta
=
\sqrt{\frac23}\frac{\log3}{\log2},
~~~

~~~math
\delta\gamma
=
\frac1{\sqrt5}\frac{\log5}{\log2},
~~~

~~~math
\mu
=
\frac1{\sqrt3}\frac{\log3}{\log2}.
~~~

---

## 6. Exact rational sign certificate

The companion verifier bounds logarithms using the rational atanh expansion

~~~math
\log x
=
2\sum_{n=0}^{N}
\frac{y^{2n+1}}{2n+1}
+
R_N,
\qquad
y=\frac{x-1}{x+1},
~~~

with exact positive remainder bound

~~~math
0<R_N
\le
\frac{
2y^{2N+3}
}{
(2N+3)(1-y^2)
}.
~~~

Square roots are enclosed using exact integer-square comparisons on a decimal rational grid.

The resulting rational boxes for

~~~math
\beta,
\quad
\delta\gamma,
\quad
\mu
~~~

are substituted term-by-term into the exact 76-term determinant polynomials.

The output intervals are, decimals shown only for orientation,

~~~math
\boxed{
P_+
\in
-9.833915844527356\ldots
\pm O(10^{-44}),
}
~~~

and

~~~math
\boxed{
P_-
\in
-14.188192196640292\ldots
\pm O(10^{-44}).
}
~~~

The interval upper endpoints are strictly negative.

Therefore

~~~math
\boxed{
P_+<0,
\qquad
P_-<0.
}
~~~

Consequently

~~~math
\boxed{
\det\mathcal M_{+1}
=
\det\mathcal M_{-1}
=
P_+P_-
>0.
}
~~~

For orientation,

~~~math
P_+P_-
=
139.52548804774037\ldots
~~~

with rigorous interval width below

~~~math
3\times10^{-43}.
~~~

---

## 7. What has been independently recovered

The fresh source-level reconstruction now recovers all of the following without the missing historical matrix artifact:

1. finite orbit closure;
2. exact orbit size 124;
3. the 62-site constant graph;
4. both external parity systems;
5. determinant nonvanishing;
6. exact equality of the two external-parity determinants;
7. a reduction from 124 scalar variables to two 62-variable reflection sectors.

Thus the historical GERM-62 base closure is no longer merely report-level residue.

The new branch contains an independently reproducible source-level verifier for its essential algebraic claim.

This does **not** promote it into the canonical SZ theorem line.

---

## 8. Additive correction to SZ-RETURN-COCYCLE-2

The earlier note described the repeated return compiler as a pure block Laurent operator.

That wording is too strong.

The source equations contain both translations and reflections.

In a kappa-layer ordering, translation terms produce Toeplitz-type couplings while reflection terms produce Hankel-type couplings.

The correct structural species is therefore

~~~math
\boxed{
\text{finite affine Toeplitz--Hankel system}
}
~~~

or equivalently a finite representation of the translation-reflection semigroup.

A pure Laurent symbol is obtained only after an additional doubling/reindexing theorem that has not yet been proved.

This correction is additive; the fixed finite-affine compiler conclusion survives.

---

## 9. Explanation of the historical +62 law

The base orbit has the exact form

~~~math
31\text{ skeleton sites}
\times
2\text{ kappa-offset layers}
\times
2\text{ orientations}.
~~~

Thus

~~~math
124=31\cdot2\cdot2.
~~~

The historical chamber sizes are

~~~math
124,186,248,310,372.
~~~

They satisfy

~~~math
\boxed{
124+62n
=
31(n+2)\cdot2.
}
~~~

This strongly identifies each additional kappa-return with one additional 31-site kappa layer carrying the same two reflection orientations.

For the base chamber this is now proved by direct orbit closure.

For n>=1 it remains a structural prediction until the enlarged source-level orbit is explicitly generated.

No promotion of the n>=1 dimension formula is made from factorization alone.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-4:
124 ORBIT RECONSTRUCTED /
62+62 REFLECTION FACTORIZATION /
EXACT DETERMINANT RE-CERTIFICATION}
}
~~~

This is the first pass on the return-cocycle branch that independently reconstructs a historically certified finite matrix result from the original functional equations.

---

## 11. Next cursor

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-5 / FIRST EXTRA KAPPA LAYER}
}
~~~

Required work:

1. write
   ~~~math
   e=\kappa+\eta,
   \qquad
   0<\eta\le\kappa;
   ~~~
2. regenerate the affine orbit directly from the same four source row maps;
3. determine whether it closes on
   ~~~math
   31\times3\times2=186
   ~~~
   scalar variables;
4. derive the exact added-layer block couplings;
5. test whether the reflection-sector decomposition survives;
6. obtain the 186 determinant from the fresh compiler rather than the historical target;
7. compare the new layer with the base 31-site skeleton to identify the reusable n->n+1 rule.

**Stop rule:** failure to obtain exactly 186 variables from the source maps means the proposed layer interpretation is false and must be discarded before n=2.
