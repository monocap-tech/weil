# SZ-RETURN-COCYCLE-5 — First Extra Kappa Layer Closed

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_5_first_extra_layer_verify.py

---

## 0. Result

Write

~~~math
e=\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

The first extra-return chamber splits exactly into three seed bands:

~~~math
0<z<\eta,
~~~

~~~math
\eta<z<\kappa,
~~~

and

~~~math
\kappa<z<e.
~~~

The source-level affine orbit has:

- 186 variables on the lower edge band;
- 124 variables on the middle band;
- 186 variables on the upper edge band.

The upper edge system is the exact seed-reflection image of the lower edge system.

The middle 124-variable system is row-for-row isomorphic to the already reconstructed base-chamber assembler from SZ-RETURN-COCYCLE-4.

The 186-variable edge system is rigorously invertible for both external parity choices.

Therefore:

~~~math
\boxed{
\text{the entire first extra-}\kappa\text{ return chamber has trivial parity kernel.}
}
~~~

This is an independently reconstructed source-equation certificate. It does not use the missing historical 186x186 matrix artifact.

---

## 1. Exact seed topology

Set

~~~math
e=\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

The affine threshold geometry is linear in eta and the seed coordinate z.

For the lower edge chamber

~~~math
0<z<\eta<\kappa,
~~~

every source-row region inequality is a linear form on the open triangle

~~~math
0<z<\eta<\kappa.
~~~

The verifier checks each such inequality at the three closed vertices

~~~math
(\eta,z)
=
(0,0),
(\kappa,0),
(\kappa,\kappa).
~~~

After substituting each vertex, every margin is an integer linear combination of

~~~math
q=\log\frac43,
\quad
j=\log\frac98,
\quad
k=\log\frac{16}{15}.
~~~

The sign is decided exactly by comparing the corresponding rational prime-power product in 2,3,5.

All margins are nonnegative on the closed triangle and strictly positive in its interior.

Thus the discovered lower-edge orbit typing is valid uniformly on the full chamber, not merely at a sampled e,z.

The same argument is applied to the middle triangle

~~~math
0<\eta<z<\kappa.
~~~

---

## 2. Lower-edge orbit: 186 variables

Starting from one seed z with

~~~math
0<z<\eta,
~~~

and applying only the four recovered source maps gives exactly

~~~math
\boxed{186}
~~~

affine orbit points.

Every orbit point has one of the forms

~~~math
C+z
~~~

or

~~~math
C+e-z.
~~~

The two orientation classes contain

~~~math
\boxed{93+93}
~~~

variables.

Let S denote the 31-site skeleton from the base chamber.

For the +z orientation, the constants are exactly

~~~math
\boxed{
\mathcal S,
\quad
\mathcal S+\kappa,
\quad
\mathcal S+2\kappa.
}
~~~

For the e-z orientation, the constants are exactly

~~~math
\boxed{
\mathcal S-\kappa,
\quad
\mathcal S,
\quad
\mathcal S+\kappa.
}
~~~

Hence each orientation contains

~~~math
31\times3=93
~~~

variables.

This independently explains the historical first-extra-layer dimension

~~~math
\boxed{
186=31\times3\times2.
}
~~~

---

## 3. Upper-edge orbit is exactly equivalent

The substitution

~~~math
z\mapsto e-z
~~~

acts on an affine coordinate

~~~math
a+be+cz
~~~

by

~~~math
a+(b+c)e-cz.
~~~

This maps the lower-edge orbit

~~~math
0<z<\eta
~~~

bijectively to the upper-edge orbit

~~~math
\kappa<z<e.
~~~

It preserves the source row type and all row coefficients.

Therefore the two 186-variable edge matrices are permutation-equivalent.

Only one edge determinant needs certification.

---

## 4. Middle seed band is exactly the old 124 assembler

For

~~~math
\eta<z<\kappa,
~~~

the orbit closes on exactly

~~~math
\boxed{124}
~~~

variables.

Both orientation classes use precisely the base constant set

~~~math
\boxed{
\mathcal S\cup(\mathcal S+\kappa).
}
~~~

After canonical relabeling by

~~~math
(C,\text{orientation}),
~~~

every row type and every target coefficient agrees exactly with the base-chamber assembler from SZ-RETURN-COCYCLE-4.

Thus the middle band is not merely another 124-dimensional matrix with the same determinant numerically.

It is the same source-level finite system up to variable permutation.

Its kernel is already excluded by the exact determinant re-certification in SZ-RETURN-COCYCLE-4.

---

## 5. External parity gauge for the 186 system

The source equations contain two kinds of edges.

### Translation edges

These preserve the orientation coefficient of the seed variable.

### Reflection edges

These reverse the orientation coefficient.

Let G be the diagonal sign matrix taking value +1 on the C+z variables and -1 on the C+e-z variables.

If

~~~math
M_+
~~~

and

~~~math
M_-
~~~

are the 186 matrices for external parity

~~~math
\varepsilon=+1
~~~

and

~~~math
\varepsilon=-1,
~~~

respectively, then exactly

~~~math
\boxed{
M_-=G M_+ G.
}
~~~

Hence

~~~math
\boxed{
\det M_- = \det M_+.
}
~~~

External parity therefore needs only one invertibility certificate.

---

## 6. Rational midpoint matrix

Use the exact physical coefficient species

~~~math
\beta
=
\sqrt{\frac23}\frac{\log3}{\log2},
~~~

~~~math
d:=\delta\gamma
=
\frac1{\sqrt5}\frac{\log5}{\log2},
~~~

and

~~~math
\mu
=
\frac1{\sqrt3}\frac{\log3}{\log2}.
~~~

Choose the rational midpoint values

~~~math
\beta_0
=
\frac{1294116462737}{10^{12}},
~~~

~~~math
d_0
=
\frac{1038397811807}{10^{12}},
~~~

~~~math
\mu_0
=
\frac{915078526447}{10^{12}}.
~~~

Substituting these values into the 186 source-level matrix gives a rational matrix

~~~math
M_0\in M_{186}(\mathbb Q).
~~~

Exact rational elimination gives

~~~math
\boxed{
\det M_0<-1600.
}
~~~

For orientation only,

~~~math
\det M_0\approx -1620.44265154.
~~~

No floating-point sign is used.

---

## 7. Exact inverse norm

The rational inverse is computed exactly.

Its infinity norm satisfies

~~~math
\boxed{
\|M_0^{-1}\|_\infty<63.
}
~~~

For orientation only, the exact value is approximately

~~~math
62.529199065\ldots.
~~~

---

## 8. Physical coefficient enclosure

The verifier encloses

~~~math
\log2,
\quad
\log3,
\quad
\log5
~~~

with exact rational atanh-series bounds and encloses the square roots with exact integer-square comparisons.

Let

~~~math
\Delta_\beta,
\quad
\Delta_d,
\quad
\Delta_\mu
~~~

denote the resulting distances from the rational midpoint values.

Every A-row coefficient perturbation has row sum at most

~~~math
\Delta_\beta+2\Delta_d.
~~~

Every B-row has perturbation at most

~~~math
\Delta_\beta.
~~~

Every T-row has perturbation at most

~~~math
2\Delta_\mu.
~~~

Therefore the physical matrix perturbation E satisfies

~~~math
\boxed{
\|E\|_\infty<10^{-12}.
}
~~~

The actual computed bound is below

~~~math
6\times10^{-13}.
~~~

---

## 9. Neumann certificate

Combine Sections 7 and 8:

~~~math
\|M_0^{-1}E\|_\infty
\le
\|M_0^{-1}\|_\infty
\|E\|_\infty
<
63\times10^{-12}
<1.
~~~

Hence

~~~math
I+M_0^{-1}E
~~~

is invertible by the Neumann lemma.

Therefore the actual physical matrix

~~~math
M_{\rm phys}=M_0+E
~~~

is invertible.

Moreover the whole segment

~~~math
M_0+tE,
\qquad
0\le t\le1,
~~~

remains invertible, so the determinant cannot change sign.

Thus

~~~math
\boxed{
\det M_{\rm phys}<0.
}
~~~

By the parity gauge,

~~~math
\boxed{
\det M_{\rm phys}^{(+)}
=
\det M_{\rm phys}^{(-)}
<0.
}
~~~

This rigorously excludes a nonzero parity kernel on the 186-variable edge orbit.

---

## 10. Full first-extra-return determination

The first extra-return chamber has exactly:

### Edge type

~~~math
0<z<\eta
~~~

or

~~~math
\kappa<z<e:
~~~

186 variables, certified invertible.

### Middle type

~~~math
\eta<z<\kappa:
~~~

124 variables, exactly the already certified base assembler.

Therefore every generic seed position in

~~~math
0<e-\kappa<\kappa
~~~

has trivial parity kernel.

The equality seams

~~~math
z=\eta,
\qquad
z=\kappa
~~~

are threshold cells and are not silently absorbed into the open-chamber statement. They require the usual lower-dimensional seam interpretation already used in the GERM atlas.

Thus:

~~~math
\boxed{
\texttt{FIRST EXTRA KAPPA RETURN: OPEN-CHAMBER CLOSED}.
}
~~~

---

## 11. Structural consequence

The old dimension law

~~~math
124\to186
~~~

is now derived from source geometry:

~~~math
31\times2\times2
\to
31\times3\times2.
~~~

The extra return really does add one complete 31-site kappa layer.

This is no longer a pattern inferred from historical matrix sizes.

It is an exact orbit statement.

That materially strengthens the proposed reusable return compiler.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-5:
FIRST EXTRA KAPPA LAYER CLOSED /
186 SOURCE MATRIX CERTIFIED}
}
~~~

No canonical SZ theorem cursor moves.

---

## 13. Next cursor

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-6 / SECOND EXTRA KAPPA LAYER}
}
~~~

Set

~~~math
e=2\kappa+\eta,
\qquad
0<\eta\le\kappa.
~~~

Required work:

1. regenerate the affine orbit from the four source maps;
2. derive the exact seed-band split;
3. test whether the new edge orbit is
   ~~~math
   31\times4\times2=248;
   ~~~
4. determine whether the middle bands reduce to the previously certified 124 or 186 systems;
5. identify the exact n->n+1 layer insertion law;
6. certify invertibility by reusing the finite-state structure rather than recomputing an unrelated 248 determinant if possible.

**Success target:** derive a true induction/continuant step from the 186 certificate to the 248 certificate.

**Stop rule:** if the second extra layer introduces a new skeleton, new reflection species, or new row type, the one-layer compiler hypothesis must be revised before n=3.
