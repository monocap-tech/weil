# SZ-RETURN-COCYCLE-9 — Mixed-Scale Seam and First Bidirectional Return Chamber

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_9_mixed_seam_verify.py

---

## 0. Main correction

The transition length is

~~~math
\lambda_{\rm ret}=h-\kappa.
~~~

Therefore

~~~math
\boxed{
\lambda_{\rm ret}+\kappa=h.
}
~~~

So although

~~~math
\frac{\lambda_{\rm ret}}{\kappa}\notin\mathbb Q,
~~~

the two internal return lengths are **not independent generators modulo the bulk step**.

Indeed

~~~math
\boxed{
\lambda_{\rm ret}
\equiv
-\kappa
\pmod h.
}
~~~

Thus the first mixed regime is not a genuinely two-generator Z^2 scheduler.

It is a **bidirectional one-generator kappa return problem**:

- one direction uses kappa;
- the opposite direction uses lambda_ret=h-kappa;
- modulo the bulk h-step they are inverse directions.

The new complexity at the seam comes from the finite termination of the h-chains, not from a new independent arithmetic rank.

This corrects the provisional language in SZ-RETURN-COCYCLE-8.

---

## 1. Exact seam coordinates

Recall

~~~math
\kappa=k-5h.
~~~

Then

~~~math
\lambda_{\rm ret}
=
h-\kappa
=
6h-k.
~~~

In the basis

~~~math
(q,j,k)
=
\left(
\log\frac43,
\log\frac98,
\log\frac{16}{15}
\right),
~~~

we have

~~~math
h=(-1,2,1),
~~~

~~~math
\kappa=(5,-10,-4),
~~~

and

~~~math
\boxed{
\lambda_{\rm ret}=(-6,12,5).
}
~~~

Define the remaining single-scale gap

~~~math
\eta_*
:=
\lambda_{\rm ret}-4\kappa
=
h-5\kappa.
~~~

Then

~~~math
\boxed{
\eta_*=(-26,52,21).
}
~~~

The final single-scale audit proved

~~~math
0<\eta_*<\kappa.
~~~

The first post-seam chamber is therefore

~~~math
\boxed{
e=\lambda_{\rm ret}+\delta,
\qquad
0<\delta<\eta_*.
}
~~~

---

## 2. What happens exactly at the seam

At

~~~math
e=\lambda_{\rm ret},
~~~

the positive-width mixed bands have zero width.

For generic seed positions, the orbit is still one of the already-certified old species:

~~~math
G_4
\quad\text{or}\quad
G_3.
~~~

The prospective mixed bands collapse onto the seed locations

~~~math
z=m\kappa,
~~~

and

~~~math
z=m\kappa+\eta_*,
\qquad
0\le m\le4.
~~~

The values

~~~math
z=0
~~~

and

~~~math
z=4\kappa+\eta_*
=
\lambda_{\rm ret}
~~~

are the support endpoints.

Thus there are eight interior collapsed seam seeds plus the two support endpoints.

Immediately above the seam, each collapsed seed opens into a positive-width mixed band.

So the seam is a genuine **birth of a new finite orbit species**, but not a new arithmetic generator.

---

## 3. Exact first mixed seed partition

Write

~~~math
e=\lambda_{\rm ret}+\delta,
\qquad
0<\delta<\eta_*.
~~~

For every

~~~math
0\le m\le4,
~~~

there are two mixed bands:

~~~math
\boxed{
m\kappa<z<m\kappa+\delta,
}
~~~

and

~~~math
\boxed{
m\kappa+\eta_*
<
z
<
m\kappa+\eta_*+\delta.
}
~~~

Between them lie old single-scale species.

For

~~~math
0\le m\le4,
~~~

~~~math
m\kappa+\delta
<
z
<
m\kappa+\eta_*
~~~

is a G_4 band.

For

~~~math
0\le m<4,
~~~

~~~math
m\kappa+\eta_*+\delta
<
z
<
(m+1)\kappa
~~~

is a G_3 band.

Hence the complete open-band size pattern is

~~~math
\boxed{
692/372/692/310/
692/372/692/310/
692/372/692/310/
692/372/692/310/
692/372/692.
}
~~~

There are:

- ten mixed 692 bands;
- five old G_4 / 372 bands;
- four old G_3 / 310 bands.

The companion verifier certifies all region inequalities exactly over the full parameter polygons, reducing every vertex sign to an integer prime-power comparison in 2,3,5.

---

## 4. All ten mixed bands are one matrix species

For a mixed band write

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta,
~~~

where

~~~math
z_0=m\kappa
~~~

or

~~~math
z_0=m\kappa+\eta_*.
~~~

Substitute

~~~math
e=\lambda_{\rm ret}+\delta.
~~~

Every affine orbit point becomes one of

~~~math
C+\zeta,
~~~

or

~~~math
C+\delta-\zeta,
~~~

for an exact q,j,k constant C.

Using

~~~math
(C,+)
~~~

and

~~~math
(C,-)
~~~

as the canonical orientation labels, all ten mixed-band row graphs are **exactly identical**.

Thus there is one new graph species:

~~~math
\boxed{
M_0^{\rm mix}
\quad\text{of size}\quad
692.
}
~~~

No mixed-band atlas remains inside this first post-seam chamber.

---

## 5. The old species remain exactly old

The intervening 372 graphs are exact orientation-layer relabelings of G_4:

~~~math
(+):n\mapsto n-m,
~~~

~~~math
(-):n\mapsto n+m.
~~~

The intervening 310 graphs are the same relabelings of G_3.

Therefore the only new invertibility problem in the first mixed chamber is the 692 species.

All 372 and 310 bands inherit the source-level certificates from SZ-RETURN-COCYCLE-8 and SZ-RETURN-COCYCLE-7.

---

## 6. Five h-chains behind the 31-site skeleton

The old skeleton S decomposes into five finite h-chains.

### Chain 1

~~~math
0,h,2h,3h,4h,5h.
~~~

### Chain 2

~~~math
p,p+h,\ldots,p+6h.
~~~

### Chain 3

~~~math
s,s+h,\ldots,s+5h.
~~~

### Chain 4

~~~math
r,r+h,\ldots,r+5h.
~~~

### Chain 5

~~~math
q+s,q+s+h,\ldots,q+s+5h.
~~~

Their lengths are

~~~math
6,7,6,6,6,
~~~

which sum to

~~~math
31.
~~~

Let the five chain bottoms be

~~~math
\mathcal B
=
\{0,p,s,r,q+s\}.
~~~

Let the five chain tops be

~~~math
\mathcal T
=
\{
5h,
p+6h,
s+5h,
r+5h,
q+s+5h
\}.
~~~

Define the five cap sites

~~~math
\boxed{
\mathcal C
=
\mathcal T+h.
}
~~~

---

## 7. Why lambda_ret creates caps rather than a new skeleton

Because

~~~math
\lambda_{\rm ret}=h-\kappa,
~~~

for every non-top chain site C,

~~~math
\boxed{
C+\lambda_{\rm ret}
=
(C+h)-\kappa.
}
~~~

When

~~~math
C+h\in\mathcal S,
~~~

a lambda_ret return is simply:

1. advance one site along the same h-chain;
2. move one kappa layer downward.

So throughout the chain interior the old 31-site skeleton survives unchanged.

Only at the five chain tops does

~~~math
C+h
~~~

leave S.

Those five h-successors are precisely the cap set C.

Therefore:

~~~math
\boxed{
\text{the mixed seam adds five boundary caps, not a second full skeleton.}
}
~~~

This is the exact structural reason the mixed graph grows sharply while retaining a finite reusable core.

---

## 8. Exact 346-site constant set per orientation

Both reflection orientations use the same constant set.

It is

~~~math
\boxed{
\begin{aligned}
\mathcal M
={}&
\bigcup_{n=0}^{5}
(\mathcal S+n\kappa)
\\
&\cup
\bigcup_{n=-5}^{-1}
((\mathcal S\setminus\mathcal B)+n\kappa)
\\
&\cup
\bigcup_{n=-5}^{0}
(\mathcal C+n\kappa).
\end{aligned}
}
~~~

Its size is

~~~math
6\cdot31
+
5\cdot26
+
6\cdot5
=
186+130+30
=
\boxed{346}.
~~~

Since there are two orientations,

~~~math
\boxed{
|M_0^{\rm mix}|=2\cdot346=692.
}
~~~

The source-row census per orientation is

~~~math
\boxed{
A:67,
\qquad
B:67,
\qquad
D:68,
\qquad
T:144.
}
~~~

Thus the first mixed graph is still a finite chain-layer compiler with one five-site cap correction.

---

## 9. External parity gauge survives

Translations preserve seed orientation and reflections reverse it.

Let G be +1 on the C+zeta variables and -1 on the C+delta-zeta variables.

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

Only one physical 692 matrix requires certification.

---

## 10. Exact rational preconditioner certificate

Use the same rational coefficient center as the preceding source-level return passes:

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

Let M0 be the resulting rational 692 matrix.

A floating inverse is used only to generate an entrywise rounded rational left-preconditioner with denominator

~~~math
10^7.
~~~

The certificate then uses exact integer arithmetic with common denominator

~~~math
10^{19}.
~~~

It proves

~~~math
\boxed{
\|R\|_\infty<65,
}
~~~

and

~~~math
\boxed{
\|I-RM_0\|_\infty<\frac1{30000}.
}
~~~

For orientation only, the exact rational quantities are approximately

~~~math
\|R\|_\infty
\approx63.9238639,
~~~

and

~~~math
\|I-RM_0\|_\infty
\approx2.98197349\times10^{-5}.
~~~

No floating-point sign or invertibility decision is used.

---

## 11. Physical coefficient enclosure and invertibility

The exact physical coefficient enclosure from the prior passes remains

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
\frac1{30000}
+
65\times10^{-12}
\\
&<
\frac1{29000}
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

Thus every mixed 692 band has trivial parity kernel.

---

## 12. First post-seam chamber conclusion

Every generic seed band for

~~~math
\lambda_{\rm ret}
<
e
<
\lambda_{\rm ret}+\eta_*
~~~

is one of:

- the new 692 mixed graph, certified in this pass;
- G_4 / 372, certified previously;
- G_3 / 310, certified previously.

Therefore

~~~math
\boxed{
\lambda_{\rm ret}
<
e
<
\lambda_{\rm ret}+\eta_*
}
~~~

is closed for generic seed positions, modulo the lower-dimensional seed seams.

At

~~~math
e=\lambda_{\rm ret}
~~~

the 692 bands collapse to zero width; generic seeds remain old G_4/G_3 species.

The exact collapsed seam points require the usual lower-dimensional seam bookkeeping and are not promoted here by continuity alone.

---

## 13. Structural diagnosis after the seam

The post-seam mechanism is now much narrower than anticipated.

It is not

~~~math
\boxed{
\text{two independent irrational return generators}.
}
~~~

It is

~~~math
\boxed{
\text{one bidirectional irrational kappa translation}
+
\text{five finite h-chain caps}.
}
~~~

The old 31-site skeleton remains load-bearing.

So the natural mixed compiler should be built from:

1. the already-proved 62-variable kappa layer module;
2. its reverse-direction counterpart induced by lambda_ret=h-kappa;
3. a fixed five-cap boundary correction.

This is a substantially smaller target than a general Z^2 cocycle.

---

## 14. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-9:
FIRST MIXED CHAMBER CLOSED /
BIDIRECTIONAL-KAPPA + FIVE-CAP HIT}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 15. Next cursor

The next topology change occurs when

~~~math
\delta=\eta_*,
~~~

i.e.

~~~math
e
=
\lambda_{\rm ret}+\eta_*.
~~~

The next bounded target is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-10 / SECOND MIXED CAP LAYER}.
}
~~~

Priority:

1. type the seam at delta=eta_*;
2. regenerate the first chamber beyond it;
3. determine whether the 692 graph receives another fixed cap/module attachment;
4. test whether its new species is the observed next finite enlargement rather than an uncontrolled atlas;
5. formulate a bidirectional-kappa continuant if the same cap insertion repeats.

**Stop rule:** do not reintroduce a two-generator torus model unless a new return length appears that is independent of h and kappa.
