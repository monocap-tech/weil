# SZ-RETURN-COCYCLE-11 — Third Mixed Wing Layer Closed

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_11_third_mixed_wing_verify.py

---

## 0. Result

Let

~~~math
\eta_*:=h-5\kappa
=
\lambda_{\rm ret}-4\kappa.
~~~

The third mixed-wing chamber is

~~~math
e
=
\lambda_{\rm ret}
+
2\eta_*
+
\delta,
\qquad
0<\delta<\eta_*.
~~~

Its complete generic seed atlas has 39 open bands.

The exact pattern is

~~~math
\boxed{
1332/1012/1332/1012/1332/1012/1332/310
}
~~~

repeated across four full kappa cells, followed by

~~~math
\boxed{
1332/1012/1332/1012/1332/1012/1332.
}
~~~

Thus there are:

- 20 new 1332 bands;
- 15 old 1012 bands;
- 4 old 310 bands.

All 20 new bands are one exact graph species.

All 15 1012 bands are exact relabelings of the already-certified 1012 species.

All 4 long 310 bands are exact relabelings of the certified 310 species.

The new 1332 species is rigorously invertible for both external parity choices.

Therefore

~~~math
\boxed{
\lambda_{\rm ret}
+
2\eta_*
<
e
<
\lambda_{\rm ret}
+
3\eta_*
}
~~~

is source-level closed for generic seed positions, modulo the lower-dimensional threshold seams.

---

## 1. Exact chamber geometry

Write

~~~math
e
=
\lambda_{\rm ret}
+
2\eta_*
+
\delta,
\qquad
0<\delta<\eta_*.
~~~

For every

~~~math
0\le m\le4
~~~

and

~~~math
0\le r\le3,
~~~

the new 1332 bands are

~~~math
\boxed{
m\kappa+r\eta_*
<
z
<
m\kappa+r\eta_*+\delta.
}
~~~

For

~~~math
0\le r<3,
~~~

the 1012 bands are

~~~math
\boxed{
m\kappa+r\eta_*+\delta
<
z
<
m\kappa+(r+1)\eta_*.
}
~~~

For

~~~math
0\le m<4,
~~~

the long 310 bands are

~~~math
\boxed{
m\kappa+3\eta_*+\delta
<
z
<
(m+1)\kappa.
}
~~~

The exact inequality

~~~math
4\eta_*<\kappa
~~~

guarantees the stated geometry throughout the chamber.

Every region inequality is affine in the chamber parameters and is certified on the corresponding closed parameter polygon.

At each vertex the sign reduces to an integer prime-power comparison in 2,3,5.

No sampled-point inference is used in the chamber typing.

---

## 2. One new graph species

Canonical affine relabeling shows:

### 1332 bands

All 20 new bands have one common row graph.

### 1012 bands

All 15 intermediate bands have one common row graph which is exactly the prior 1012 species after the orientation relabeling

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\eta_*.
~~~

### 310 bands

All four long bands have one common row graph which is exactly the previous 310 species after the complementary orientation relabeling

~~~math
(+):C\mapsto C+\eta_*,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus the entire 39-band chamber reduces to one new finite matrix problem plus two inherited certificates.

---

## 3. Recall the mixed body and wing

Let S be the 31-site h-chain skeleton.

The positive body is

~~~math
\mathcal P
=
\bigcup_{n=0}^{5}
(\mathcal S+n\kappa),
~~~

with

~~~math
|\mathcal P|=186.
~~~

The backward wing is

~~~math
\begin{aligned}
\mathcal W
={}&
\bigcup_{n=-5}^{-1}
((\mathcal S\setminus\mathcal B)+n\kappa)
\\
&\cup
\bigcup_{n=-5}^{0}
(\mathcal C+n\kappa),
\end{aligned}
~~~

with

~~~math
|\mathcal W|=160.
~~~

The first mixed species used, per orientation,

~~~math
\mathcal P\sqcup\mathcal W
~~~

and therefore had

~~~math
186+160=346
~~~

constants.

The second mixed species added

~~~math
\eta_*+\mathcal W.
~~~

---

## 4. Third mixed species

The new 1332 species uses, on each orientation,

~~~math
\boxed{
\mathcal N_2
=
\mathcal P
\sqcup
\mathcal W
\sqcup
(\eta_*+\mathcal W)
\sqcup
(2\eta_*+\mathcal W).
}
~~~

The four pieces are pairwise disjoint in the present chamber.

Hence

~~~math
\boxed{
|\mathcal N_2|
=
186+3\cdot160
=
666.
}
~~~

With two orientations,

~~~math
\boxed{
2\cdot666
=
1332.
}
~~~

Thus

~~~math
1012\longrightarrow1332
~~~

adds exactly

~~~math
\boxed{
320
=
2\cdot160
}
~~~

variables.

This is a second repetition of the eta-star backward-wing tier.

---

## 5. Exact row census

For each orientation of the 1332 species, the row census is

~~~math
\boxed{
A:129,
\qquad
B:129,
\qquad
D:130,
\qquad
T:278.
}
~~~

These sum to

~~~math
129+129+130+278
=
666.
~~~

Relative to the 1012 species census

~~~math
A:98,
\qquad
B:98,
\qquad
D:99,
\qquad
T:211,
~~~

the new wing tier contributes exactly

~~~math
\boxed{
A:31,
\qquad
B:31,
\qquad
D:31,
\qquad
T:67.
}
~~~

These sum to

~~~math
31+31+31+67
=
160.
~~~

---

## 6. Additive correction to SZ-RETURN-COCYCLE-10

The previous note correctly gave:

~~~math
A:67,B:67,D:68,T:144
~~~

for the first mixed species and

~~~math
A:98,B:98,D:99,T:211
~~~

for the second mixed species.

Therefore the difference is

~~~math
\boxed{
31,31,31,67.
}
~~~

One later explanatory line in that note stated the tier contribution as

~~~math
31,30,32,67.
~~~

That line was a bookkeeping typo.

The exact companion verifier and the displayed total censuses imply the corrected contribution

~~~math
\boxed{
A31/B31/D31/T67.
}
~~~

No determinant, topology, dimension, or chamber-closure statement from SZ-RETURN-COCYCLE-10 is affected.

This is an additive correction; the historical note is not rewritten.

---

## 7. External parity gauge

Translations preserve seed orientation and reflections reverse it.

Let G equal +1 on one orientation and -1 on the reflected orientation.

Then the two external-parity matrices satisfy

~~~math
\boxed{
M_- = G M_+ G.
}
~~~

Hence

~~~math
\boxed{
\det M_- = \det M_+.
}
~~~

Only one physical 1332 matrix requires certification.

---

## 8. Rational preconditioner certificate

Use the same rational physical-coefficient center:

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
\frac{915078526447}{10^{12}},
~~~

where

~~~math
d=\delta\gamma.
~~~

Let M0 be the resulting rational 1332 matrix.

A floating inverse is used only to generate a rational left-preconditioner by entrywise rounding to denominator

~~~math
10^7.
~~~

All subsequent residual and norm computations are exact rational arithmetic.

The verifier proves

~~~math
\boxed{
\|R\|_\infty<65,
}
~~~

and

~~~math
\boxed{
\|I-RM_0\|_\infty
<
\frac1{26000}.
}
~~~

For orientation only, the exact rational quantities are approximately

~~~math
\|R\|_\infty
\approx
63.9240687,
~~~

and

~~~math
\|I-RM_0\|_\infty
\approx
3.80889116\times10^{-5}.
~~~

The decimals are not used for the certificate.

---

## 9. Physical coefficient perturbation

The retained exact atanh-series and integer-square enclosures give

~~~math
\boxed{
\|M_{\rm phys}-M_0\|_\infty<10^{-12}.
}
~~~

Therefore

~~~math
\begin{aligned}
\|I-RM_{\rm phys}\|_\infty
&\le
\|I-RM_0\|_\infty
+
\|R\|_\infty
\|M_{\rm phys}-M_0\|_\infty
\\
&<
\frac1{26000}
+
65\times10^{-12}
\\
&<
\frac1{25000}
<1.
\end{aligned}
~~~

Hence

~~~math
\boxed{
M_{\rm phys}\text{ is invertible}.
}
~~~

The opposite external parity follows from the exact gauge equivalence.

Thus every 1332 band has trivial parity kernel.

---

## 10. Third mixed-wing chamber conclusion

Every generic seed band is one of:

- the new 1332 species, certified here;
- the prior 1012 species, exactly relabeled;
- the prior 310 species, exactly relabeled.

Therefore

~~~math
\boxed{
\lambda_{\rm ret}
+
2\eta_*
<
e
<
\lambda_{\rm ret}
+
3\eta_*
}
~~~

is closed for generic seed positions.

The equality seams remain lower-dimensional threshold cells and are not silently absorbed into the open-chamber result.

---

## 11. Mixed wing pattern after three levels

The mixed compiler now has three independently reconstructed levels.

### Level 0

~~~math
692
=
2(186+160).
~~~

### Level 1

~~~math
1012
=
2(186+2\cdot160).
~~~

### Level 2

~~~math
1332
=
2(186+3\cdot160).
~~~

The same 160-site backward wing is being stacked at successive eta-star offsets.

This has now repeated twice after the original mixed species.

That is sufficient to trigger a separate source-level architecture theorem attempt.

It is **not** yet promoted here as an all-level invertibility theorem.

---

## 12. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-11:
THIRD MIXED WING LAYER CLOSED /
SECOND ETA-STAR WING REPEAT CONFIRMED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 13. Next cursor

The next bounded task is no longer another blind matrix enlargement.

It is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-12 / ETA-WING ARCHITECTURE THEOREM}.
}
~~~

Priority:

1. prove directly from the source affine maps that, for the full mixed-wing ladder before the next kappa collision, the level-r new species has per-orientation constant set
   ~~~math
   \mathcal P
   \sqcup
   \bigcup_{a=0}^{r}
   (a\eta_*+\mathcal W);
   ~~~
2. derive
   ~~~math
   |M_r|
   =
   2\bigl(186+160(r+1)\bigr);
   ~~~
3. derive the universal seed-band alternation between level r, level r-1, and the long 310 species;
4. determine the exact maximal r before the next arithmetic collision using the ratio kappa/eta_star;
5. only then decide which remaining finite wing levels require separate invertibility certificates.

**Stop rule:** do not infer all-level invertibility from the three certified levels.
