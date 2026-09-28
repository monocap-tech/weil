# SZ-RETURN-COCYCLE-7 — Third Extra Kappa Layer Closed and Single-Scale Architecture Theorem

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_7_third_extra_layer_verify.py

---

## 0. Result

Write

~~~math
e=3\kappa+\eta,
\qquad
0<\eta<\kappa.
~~~

The third extra-return chamber has the exact seven-band seed pattern

~~~math
\boxed{
310/248/310/248/310/248/310.
}
~~~

All 248 bands are exact layer relabelings/reflections of the already-certified second-extra-return graph.

All 310 bands are exact relabelings/reflections of one new 310-variable edge graph.

That 310 graph is rigorously invertible for both external parity choices.

Moreover, the transition

~~~math
248\longrightarrow310
~~~

repeats the exact insertion architecture found at

~~~math
186\longrightarrow248.
~~~

This triggers and proves the source-level **single-scale architecture theorem** recorded in Section 10 below.

---

## 1. Exact seven seed bands

For

~~~math
e=3\kappa+\eta,
\qquad
0<\eta<\kappa,
~~~

the open seed intervals are

~~~math
(0,\eta),
~~~

~~~math
(\eta,\kappa),
~~~

~~~math
(\kappa,\kappa+\eta),
~~~

~~~math
(\kappa+\eta,2\kappa),
~~~

~~~math
(2\kappa,2\kappa+\eta),
~~~

~~~math
(2\kappa+\eta,3\kappa),
~~~

and

~~~math
(3\kappa,e).
~~~

Exact affine-margin certification on the corresponding parameter triangles gives orbit sizes

~~~math
\boxed{
310,248,310,248,310,248,310.
}
~~~

All region signs are reduced at the chamber vertices to exact integer comparisons between prime-power products in 2,3,5.

Thus the band typing is uniform on the full open chamber.

---

## 2. 310 edge architecture

Let S be the fixed 31-site skeleton.

On the lower 310 edge system, the + orientation contains

~~~math
\boxed{
\mathcal S+n\kappa,
\qquad
n=0,1,2,3,4,
}
~~~

while the - orientation contains

~~~math
\boxed{
\mathcal S+n\kappa,
\qquad
n=-3,-2,-1,0,1.
}
~~~

Hence

~~~math
\boxed{
310
=
31\times5\times2.
}
~~~

Each orientation contains 155 variables.

This is generated directly from the source affine maps.

---

## 3. All seven bands reduce to two graph species

Let G_3 denote the lower 310 row graph.

Let G_2 denote the already-certified lower 248 row graph.

Then the seven seed bands have exact row graphs

~~~math
G_3,
~~~

~~~math
G_2,
~~~

~~~math
\tau_{-1,+1}G_3,
~~~

~~~math
\tau_{-1,+1}G_2,
~~~

~~~math
\tau_{-2,+2}G_3,
~~~

~~~math
\tau_{-2,+2}G_2,
~~~

~~~math
\tau_{-3,+3}G_3,
~~~

where

~~~math
\tau_{a,b}
~~~

shifts the kappa-layer label by a on the + orientation and by b on the - orientation.

Thus no middle seed band introduces a new matrix species.

Only G_3 requires new certification.

---

## 4. Exact 248 to 310 insertion law

Every variable of G_2 occurs unchanged in G_3.

The difference is exactly

~~~math
\boxed{62\text{ new variables}.}
~~~

These are one complete new 31-site layer on each orientation.

Their region census is again

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

Among all inherited rows exactly one changes source-row type.

The old/new interface contains precisely

~~~math
\boxed{
2\text{ old-to-new edges}
}
~~~

and

~~~math
\boxed{
2\text{ new-to-old edges}.
}
~~~

This is identical to the 186-to-248 attachment after the expected layer-index shift.

Thus the 62-variable return module and its interface are not accidental features of n=2.

They repeat at n=3.

---

## 5. The distinguished boundary skeleton site

The unique inherited row which changes type is the skeleton site

~~~math
c_* = s+5h=q-\kappa.
~~~

At the n-th edge system

~~~math
e=n\kappa+\eta,
\qquad
0<z<\eta,
~~~

the relevant inherited negative-orientation variable is

~~~math
c_*+(1-n)\kappa+e-z
=
q+\eta-z.
~~~

Since

~~~math
0<z<\eta,
~~~

this lies strictly above q and is therefore a T-row.

In the preceding (n-1)-return system the same layer instead evaluates as

~~~math
q-\kappa+\eta-z<q,
~~~

hence it is a D-row.

This proves algebraically why **exactly one inherited row** changes D to T at each extra return.

---

## 6. Exact four-edge interface in general form

The newly activated T-row at

~~~math
(c_*,1-n,-)
~~~

has the two source targets

~~~math
(0,-n,-)
~~~

and

~~~math
(c_*,n+1,+),
~~~

which are the two new layers.

Conversely, the new top positive T-row

~~~math
(c_*,n+1,+)
~~~

has two targets back in the inherited graph:

~~~math
(0,n,+)
~~~

and

~~~math
(c_*,1-n,-).
~~~

Thus the insertion interface is always exactly

~~~math
\boxed{
2\text{ inherited-to-new}
+
2\text{ new-to-inherited}
}
~~~

directed edges.

All other new-row couplings remain internal to the inserted 62-variable module.

This proves the finite-rank interface pattern independently of numerical matrix dimensions.

---

## 7. External parity gauge

As before, translations preserve seed orientation and reflections reverse it.

With G equal to +1 on C+z variables and -1 on C+e-z variables,

~~~math
\boxed{
M_- = G M_+ G.
}
~~~

Hence both external parity matrices have the same determinant and invertibility standing.

Only one 310 system requires certification.

---

## 8. Rational preconditioner certificate

At the same rational coefficient center used for the 186 and 248 systems, let M0 be the rational 310 matrix.

A floating inverse is used only to generate a rational witness R by entrywise rounding to denominator 10^6.

All following checks are exact.

The verifier proves

~~~math
\boxed{
\|R\|_\infty<64,
}
~~~

and

~~~math
\boxed{
\|I-RM_0\|_\infty<\frac1{7000}.
}
~~~

For orientation only, the exact quantities are approximately

~~~math
\|R\|_\infty
\approx63.653235,
~~~

and

~~~math
\|I-RM_0\|_\infty
\approx1.4156040\times10^{-4}.
~~~

The physical coefficient error remains

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
\frac1{7000}
+
64\times10^{-12}
\\
&<
\frac1{6000}
<1.
\end{aligned}
~~~

Thus

~~~math
\boxed{
M_{\rm phys}\text{ is invertible}.
}
~~~

The opposite external parity is invertible by the exact gauge equivalence.

Hence every generic 310 seed band has trivial parity kernel.

---

## 9. Third-return chamber conclusion

The 248 species was already certified in SZ-RETURN-COCYCLE-6.

The 310 species is certified in this pass.

Therefore every generic seed in

~~~math
3\kappa<e<4\kappa
~~~

has trivial parity kernel, apart from the lower-dimensional threshold seams between the seven open seed bands.

Thus:

~~~math
\boxed{
\texttt{THIRD EXTRA KAPPA RETURN: OPEN-CHAMBER CLOSED}.
}
~~~

---

## 10. Single-scale architecture theorem

The repeated insertion can now be proved directly from the source affine maps.

### Theorem — edge graph G_n

Let

~~~math
e=n\kappa+\eta,
\qquad
0<\eta<\kappa,
~~~

and take a lower-edge seed

~~~math
0<z<\eta.
~~~

As long as no second return scale has entered, the affine source orbit G_n has:

### Positive orientation layers

~~~math
\boxed{
\mathcal S+m\kappa,
\qquad
0\le m\le n+1.
}
~~~

### Negative orientation layers

~~~math
\boxed{
\mathcal S+m\kappa,
\qquad
-n\le m\le1.
}
~~~

Therefore

~~~math
\boxed{
|G_n|
=
31(n+2)\times2
=
62(n+2).
}
~~~

### Inductive insertion

For n>=1,

~~~math
G_n
~~~

contains

~~~math
G_{n-1}
~~~

as an induced inherited subsystem except for the single boundary row at c_* described in Section 5.

The complement consists of:

~~~math
\mathcal S+(n+1)\kappa
~~~

on the positive orientation and

~~~math
\mathcal S-n\kappa
~~~

on the negative orientation.

Thus

~~~math
\boxed{
|G_n\setminus G_{n-1}|=62.
}
~~~

The only inherited row change is

~~~math
D\to T
~~~

at

~~~math
(c_*,1-n,-),
~~~

and the old/new interface consists of the four directed edges in Section 6.

This proves the n-independent module architecture.

---

## 11. General seed-band alternation

For

~~~math
e=n\kappa+\eta,
\qquad
0<\eta<\kappa,
~~~

the generic seed interval

~~~math
0<z<e
~~~

splits into

~~~math
2n+1
~~~

open bands.

For

~~~math
0\le m\le n,
~~~

the edge bands

~~~math
m\kappa<z<m\kappa+\eta
~~~

are layer relabelings of G_n.

For

~~~math
0\le m<n,
~~~

the side bands

~~~math
m\kappa+\eta<z<(m+1)\kappa
~~~

are layer relabelings of G_{n-1}.

Hence the dimension pattern is universally

~~~math
\boxed{
62(n+2),
62(n+1),
62(n+2),
62(n+1),
\ldots,
62(n+2).
}
~~~

The proof is the exact seed-coordinate substitutions

~~~math
z=m\kappa+\zeta
~~~

for edge bands and

~~~math
z=m\kappa+\eta+\zeta
~~~

for side bands, followed by the orientation layer shifts

~~~math
(+):m\mapsto m-r,
\qquad
(-):m\mapsto m+r.
~~~

No numerical return atlas is required for this classification.

---

## 12. Scope of the theorem

This architecture theorem concerns the **single-scale kappa-return regime** only.

It does not prove invertibility of G_n for arbitrary n.

It says that all such invertibility questions are iterates of one fixed 62-variable finite-rank module attachment.

In the actual current arithmetic chamber, the return-count bound gives only

~~~math
n\in\{0,1,2,3,4\}.
~~~

The cases

~~~math
n=0,1,2,3
~~~

are now source-level certified.

Only

~~~math
n=4
~~~

remains before the second internal return scale enters.

---

## 13. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-7:
THIRD EXTRA LAYER CLOSED /
N-INDEPENDENT 62-MODULE ARCHITECTURE PROVED}
}
~~~

No canonical SZ theorem cursor moves.

---

## 14. Next cursor

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-8 / FINAL SINGLE-SCALE LAYER}
}
~~~

The architecture no longer needs rediscovery.

Set

~~~math
e=4\kappa+\eta,
\qquad
0<\eta<\lambda_{\rm ret}-4\kappa.
~~~

Since

~~~math
4\kappa<\lambda_{\rm ret}<5\kappa,
~~~

this is the final admissible single-scale return count.

Tasks:

1. instantiate the proved G_4 architecture:
   ~~~math
   |G_4|=62\cdot6=372;
   ~~~
2. generate the 372 source matrix directly from the module theorem;
3. certify its physical invertibility, preferably using the finite-rank insertion and a preconditioner/Schur update from G_3 rather than rediscovering the graph;
4. combine with G_3 to close every generic seed band through the end of the single-scale interval;
5. then stop the kappa-only compiler and hand off to the mixed kappa/lambda_ret cocycle.

**Success condition:** G_4 invertible.

**Post-success standing:** the complete finite single-scale region kappa<e<=lambda_ret is closed modulo threshold seams; the next genuinely new problem begins at e>lambda_ret.
