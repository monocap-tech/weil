# SZ-RETURN-COCYCLE-8 — Final Single-Scale Layer Closed

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_8_final_single_scale_verify.py

---

## 0. Result

The single-scale kappa-return regime ends at

~~~math
\lambda_{\rm ret}=h-\kappa.
~~~

For the fourth and final admissible extra return, write

~~~math
e=4\kappa+\eta.
~~~

Then

~~~math
e<\lambda_{\rm ret}
~~~

is equivalent to

~~~math
0<\eta<\eta_{\max},
~~~

where

~~~math
\boxed{
\eta_{\max}
=
\lambda_{\rm ret}-4\kappa
=
h-5\kappa.
}
~~~

Using

~~~math
\kappa=k-5h,
~~~

this is

~~~math
\eta_{\max}=26h-5k.
~~~

Exponentiating gives the exact arithmetic form

~~~math
\boxed{
\eta_{\max}
=
\log
\frac{3^{109}}{2^{124}5^{21}}.
}
~~~

The previously proved inequalities

~~~math
5\kappa<h<6\kappa
~~~

give

~~~math
\boxed{
0<\eta_{\max}<\kappa.
}
~~~

The final open single-scale chamber is therefore strictly narrower than one full kappa cell.

The new edge graph has

~~~math
\boxed{
372
=
31\times6\times2
}
~~~

variables and is rigorously invertible for both external parity choices.

Thus every generic seed in

~~~math
4\kappa<e<\lambda_{\rm ret}
~~~

has trivial parity kernel.

Combined with SZ-RETURN-COCYCLE-4 through 7, this exhausts the complete **open kappa-only return region**.

The endpoint

~~~math
e=\lambda_{\rm ret}
~~~

is retained as a transition seam: it is the first point at which the second internal return scale is born and is not silently absorbed into the kappa-only theorem.

---

## 1. Final nine-band seed pattern

Let

~~~math
e=4\kappa+\eta,
\qquad
0<\eta<\eta_{\max}<\kappa.
~~~

By the single-scale architecture theorem from SZ-RETURN-COCYCLE-7, the generic seed interval

~~~math
0<z<e
~~~

has nine alternating open bands.

Their source-orbit sizes are

~~~math
\boxed{
372/310/372/310/372/310/372/310/372.
}
~~~

The 310 species is the already-certified G_3 graph.

Every 372 band is a layer relabeling or seed-reflection image of one G_4 edge graph.

Thus only one new matrix species requires certification.

---

## 2. G_4 layer architecture

Let S be the fixed 31-site skeleton.

For the lower-edge G_4 graph, the positive orientation contains

~~~math
\boxed{
\mathcal S+m\kappa,
\qquad
0\le m\le5,
}
~~~

and the negative orientation contains

~~~math
\boxed{
\mathcal S+m\kappa,
\qquad
-4\le m\le1.
}
~~~

Hence each orientation contains

~~~math
31\times6=186
~~~

variables and

~~~math
\boxed{
|G_4|=372.
}
~~~

This is the n=4 instance of the architecture theorem and is independently reproduced by the companion source-orbit verifier.

---

## 3. Final insertion repeats the fixed module law

Compare G_4 to G_3.

All 310 G_3 variables occur unchanged inside G_4.

The complement contains exactly

~~~math
\boxed{62}
~~~

variables:

- one complete 31-site top layer on the positive orientation;
- one complete 31-site bottom layer on the negative orientation.

The new module again has region census

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

Exactly one inherited row changes source-row type.

It is the same distinguished skeleton boundary row identified in SZ-RETURN-COCYCLE-7.

The old/new interface again contains exactly

~~~math
\boxed{
2\text{ old-to-new}
+
2\text{ new-to-old}
}
~~~

directed edges.

Thus the final admissible return confirms the n-independent finite-rank insertion law once more.

---

## 4. External parity gauge

Translations preserve the seed orientation and reflections reverse it.

Let G be the diagonal sign matrix equal to +1 on the C+z variables and -1 on the C+e-z variables.

Then

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

Only one 372 physical matrix requires certification.

---

## 5. Rational midpoint and preconditioner

Use the same rational coefficient center as the preceding return passes:

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

Let M0 be the resulting rational 372 matrix.

A floating inverse is used only to generate a rational left-preconditioner by rounding every entry to denominator

~~~math
10^7.
~~~

The subsequent verification is exact rational arithmetic.

The verifier proves

~~~math
\boxed{
\|R\|_\infty<64,
}
~~~

and

~~~math
\boxed{
\|I-RM_0\|_\infty<\frac1{50000}.
}
~~~

For orientation only, the computed exact quantities are approximately

~~~math
\|R\|_\infty
\approx63.7156374,
~~~

and

~~~math
\|I-RM_0\|_\infty
\approx1.71597\times10^{-5}.
~~~

The decimal displays are not used to decide the inequalities.

---

## 6. Physical coefficient enclosure

The physical coefficients are

~~~math
\beta
=
\sqrt{\frac23}\frac{\log3}{\log2},
~~~

~~~math
d
=
\frac1{\sqrt5}\frac{\log5}{\log2},
~~~

and

~~~math
\mu
=
\frac1{\sqrt3}\frac{\log3}{\log2}.
~~~

As in the prior passes, exact rational atanh-series bounds for the logarithms and exact integer-square bounds for the square roots give

~~~math
\boxed{
\|M_{\rm phys}-M_0\|_\infty<10^{-12}.
}
~~~

---

## 7. Physical invertibility

Combine the preconditioner and coefficient bounds:

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
\frac1{50000}
+
64\times10^{-12}
\\
&<
\frac1{49000}
<1.
\end{aligned}
~~~

Therefore

~~~math
RM_{\rm phys}
~~~

is invertible by the Neumann lemma.

Hence

~~~math
\boxed{
M_{\rm phys}\text{ is invertible}.
}
~~~

The opposite external parity is invertible by the exact gauge equivalence.

Thus every G_4 edge band has trivial parity kernel.

---

## 8. Final single-scale chamber conclusion

The nine open seed bands alternate between:

- G_4, now certified invertible;
- G_3, certified in SZ-RETURN-COCYCLE-7.

Therefore every generic seed position in

~~~math
4\kappa<e<\lambda_{\rm ret}
~~~

has trivial parity kernel.

Combining all source-level return certificates:

### n=0

~~~math
0<e<\kappa
~~~

closed by G_0 / 124.

### n=1

~~~math
\kappa<e<2\kappa
~~~

closed by G_1 / 186 plus G_0.

### n=2

~~~math
2\kappa<e<3\kappa
~~~

closed by G_2 / 248 plus G_1.

### n=3

~~~math
3\kappa<e<4\kappa
~~~

closed by G_3 / 310 plus G_2.

### n=4

~~~math
4\kappa<e<\lambda_{\rm ret}
~~~

closed by G_4 / 372 plus G_3.

Therefore

~~~math
\boxed{
0<e<\lambda_{\rm ret}
}
~~~

is source-level closed for generic seed positions, modulo the registered lower-dimensional seed seams and the chamber boundaries themselves.

The original GERM single-scale target began after the already handled initial subrange; this note records the full return-cocycle closure obtained on the present branch.

---

## 9. The endpoint is a genuine seam

At

~~~math
e=\lambda_{\rm ret}=h-\kappa,
~~~

the second internal return length enters exactly.

This is not merely another kappa-return threshold.

The return alphabet changes from one internal residual scale

~~~math
\{\kappa\}
~~~

to two scales

~~~math
\{\kappa,\lambda_{\rm ret}\}.
~~~

Therefore the endpoint is assigned to the next mixed-cocycle seam audit.

No statement of the form

~~~math
e\le\lambda_{\rm ret}
~~~

is promoted by silently including this transition point.

The correct present standing is

~~~math
\boxed{
e<\lambda_{\rm ret}
\text{ closed; }
e=\lambda_{\rm ret}
\text{ transition seam.}
}
~~~

---

## 10. What the traversal compression achieved

The original matrix-growth picture was

~~~math
124,186,248,310,372.
~~~

It is now replaced by one exact source-level architecture:

~~~math
\boxed{
G_n
=
G_{n-1}
+
\text{one fixed 62-variable module}
}
~~~

with:

- a fixed 31-site skeleton;
- two orientations;
- exactly one inherited D-to-T row activation;
- a four-directed-edge old/new interface;
- exact external-parity gauge equivalence.

Thus the finite single-scale traversal was not intrinsically five unrelated determinant problems.

It was one finite-rank return compiler iterated four times.

This is the principal positive result of the return-cocycle reconnaissance so far.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-8:
FINAL SINGLE-SCALE LAYER CLOSED /
KAPPA-ONLY RETURN REGIME EXHAUSTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

The result remains parallel residue pending audit/ratification and re-entry analysis.

---

## 12. Next cursor

The next new geometry is not another kappa layer.

It is the mixed-scale transition

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-9 / MIXED-SCALE SEAM}
}
~~~

with

~~~math
\lambda_{\rm ret}=h-\kappa.
~~~

Priority:

1. type the exact seam at
   ~~~math
   e=\lambda_{\rm ret};
   ~~~
2. identify the first chamber in which both kappa and lambda_ret returns occur;
3. determine whether the existing 31-site skeleton survives;
4. determine whether the kappa module remains one factor in a two-generator return compiler;
5. test whether the mixed scheduler is a Z^2 word over two fixed finite modules rather than a new expanding atlas.

**Stop rule:** do not extend the kappa-only G_n theorem beyond its one-scale jurisdiction.
