# SZ-RETURN-COCYCLE-3 — Source-Level Block-Symbol Extraction: Tail Schur Row

**Date:** 2026-09-27  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / DERIVED WHERE STATED  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

## 0. Custody search result

A direct search was made across:

- the current conversation/Library surfaces;
- the private provenance repository;
- the user's GitHub repositories via code search;
- prior-conversation retrieval for GERM-61/62.

No machine-readable copy of the old GERM-62 orbit-to-row assembler, the 124x124 matrices, or their exact determinant payloads was recovered.

The only retained facts are the functional parity equations, the matrix sizes, and the statement that both parity determinants were certified nonzero.

Therefore the previous acceptance test

> reproduce the old 124x124 matrix byte-for-byte

cannot presently be executed.

This pass instead reconstructs the first load-bearing block row directly from the source equations.

That is an independent derivation, not a reconstruction from the missing determinant.

---

## 1. Exact prime coefficients

In the four-delay chamber, write the normalized prime weights as

~~~math
\beta=\frac{A_3}{A_2},
\qquad
\gamma=\frac{A_4}{A_2},
\qquad
\delta=\frac{A_5}{A_2},
~~~

with

~~~math
A_n=\frac{\Lambda(n)}{\sqrt n}.
~~~

Hence

~~~math
\boxed{
\beta=
\sqrt{\frac23}\frac{\log3}{\log2},
\qquad
\gamma=\frac1{\sqrt2},
\qquad
\delta=
\sqrt{\frac25}\frac{\log5}{\log2}.
}
~~~

Put

~~~math
\boxed{
\mu:=\beta\gamma
=
\frac{\log3}{\sqrt3\log2}.
}
~~~

Then

~~~math
0<\mu<1.
~~~

An exact proof of the upper bound is elementary:

~~~math
\sqrt3>\frac53
~~~

because 3>25/9, while

~~~math
2^{5/3}>3
~~~

because 32>27. Therefore

~~~math
2^{\sqrt3}>2^{5/3}>3,
~~~

so

~~~math
\log3<\sqrt3\log2.
~~~

Thus

~~~math
\boxed{1-\mu^2>0.}
~~~

This strict denominator is the key local Schur margin.

---

## 2. Recovered scalar parity equations

Use

~~~math
r=\log\frac32,
\quad
q=\log\frac43,
\quad
s=\log\frac54,
~~~

and

~~~math
e=L-\log\frac{16}{3},
\quad
u=L-\log5,
\quad
v=L-\log\frac92,
\quad
w=L-\log3.
~~~

The exact parity equations are

~~~math
x(t)
+
\beta x(r+t)
+
\delta\gamma
\left[
x(s+t)-\varepsilon x(u-t)
\right]
=0,
\qquad 0<t<u,
~~~

~~~math
x(t)+\beta x(r+t)=0,
\qquad u<t<v,
~~~

~~~math
x(t)=0,
\qquad v<t<q,
~~~

and the tail equation

~~~math
x(q+y)
=
-\mu
\left[
x(y)-\varepsilon x(\omega-y)
\right],
~~~

where

~~~math
\omega=L-\log4=q+e.
~~~

Also define the exact arithmetic differences

~~~math
j=\log\frac98,
\qquad
p=\log\frac{10}{9},
\qquad
k=\log\frac{16}{15}.
~~~

Then

~~~math
r=q+j,
\qquad
q-j=p+k,
\qquad
q-j-k=p.
~~~

---

## 3. Double-tail Schur block on the e-sliver

Take

~~~math
0<z<e.
~~~

Define the paired tail values

~~~math
A=x(q+z),
\qquad
B=x(q+e-z).
~~~

Applying the tail equation to both points gives

~~~math
A
=
-\mu
\left[
x(z)-\varepsilon B
\right],
~~~

~~~math
B
=
-\mu
\left[
x(e-z)-\varepsilon A
\right].
~~~

Equivalently,

~~~math
\boxed{
\begin{pmatrix}
1&-\varepsilon\mu\\
-\varepsilon\mu&1
\end{pmatrix}
\begin{pmatrix}
A\\B
\end{pmatrix}
=
-\mu
\begin{pmatrix}
x(z)\\x(e-z)
\end{pmatrix}.
}
~~~

The local tail block has determinant

~~~math
\boxed{
1-\mu^2>0.
}
~~~

Therefore it is exactly invertible.

The solution is

~~~math
\boxed{
A
=
-\frac{\mu}{1-\mu^2}
\left[
x(z)+\varepsilon\mu x(e-z)
\right],
}
~~~

~~~math
\boxed{
B
=
-\frac{\mu}{1-\mu^2}
\left[
x(e-z)+\varepsilon\mu x(z)
\right].
}
~~~

This is an exact two-channel Schur elimination.

No orbit enumeration is used.

---

## 4. Last-e slice of the middle parity row

Take

~~~math
t=q-j+z,
\qquad
0<z<e.
~~~

Then

~~~math
v-t=e-z,
~~~

and

~~~math
j+t=q+z.
~~~

After the exact r-tail elimination, the middle equation becomes

~~~math
x(q-j+z)
-
\beta^2\gamma A
+
\varepsilon\beta^2\gamma x(e-z)
=0.
~~~

Substituting the solved A gives

~~~math
\boxed{
x(q-j+z)
+
\frac{\beta^2\gamma}{1-\mu^2}
\left[
\mu x(z)+\varepsilon x(e-z)
\right]
=0.
}
~~~

Using

~~~math
q-j=p+k,
~~~

this is

~~~math
\boxed{
x(p+k+z)
+
\frac{\beta^2\gamma}{1-\mu^2}
\left[
\mu x(z)+\varepsilon x(e-z)
\right]
=0.
}
\tag{V}
~~~

Thus the symmetric low-seed combination

~~~math
\boxed{
C_\varepsilon(z)
:=
\mu x(z)+\varepsilon x(e-z)
}
~~~

is represented by one high boundary value:

~~~math
\boxed{
C_\varepsilon(z)
=
-\frac{1-\mu^2}{\beta^2\gamma}
x(p+k+z).
}
\tag{C}
~~~

---

## 5. Top-e slice of the first parity row

Now take

~~~math
t=k+z,
\qquad
0<z<e.
~~~

Then

~~~math
s+t=q+z,
~~~

so the x(s+t) term is A.

Also

~~~math
u-t=e-z.
~~~

For the r+t term, the tail reduction produces the point

~~~math
v-t
=
q-j+e-k-z
=
p+e-z.
~~~

The companion point

~~~math
j+k+z
~~~

lies in the dead strip throughout the base chamber

~~~math
0<e\le\kappa,
~~~

because

~~~math
j+k
=
q-j+h,
~~~

and

~~~math
h>e.
~~~

Therefore its value vanishes.

The first parity row reduces exactly to

~~~math
x(k+z)
+
\varepsilon\beta^2\gamma x(p+e-z)
+
\delta\gamma
\left[
A-\varepsilon x(e-z)
\right]
=0.
~~~

Using the solved A,

~~~math
A-\varepsilon x(e-z)
=
-\frac{
\mu x(z)+\varepsilon x(e-z)
}{
1-\mu^2
}.
~~~

Hence

~~~math
\boxed{
x(k+z)
+
\varepsilon\beta^2\gamma x(p+e-z)
-
\frac{\delta\gamma}{1-\mu^2}
C_\varepsilon(z)
=0.
}
\tag{K1}
~~~

Finally insert (C). The denominator cancels completely:

~~~math
\boxed{
x(k+z)
+
\varepsilon\beta^2\gamma x(p+e-z)
+
\frac{\delta}{\beta^2}
x(p+k+z)
=0.
}
\tag{K2}
~~~

This is the first exact source-level kappa-scattering row.

It contains no tail variables and no Schur denominator.

---

## 6. Interpretation in return coordinates

Recall

~~~math
k=5h+\kappa,
\qquad
p=j-h.
~~~

Therefore the three arguments in (K2) are

~~~math
k+z
=
5h+\kappa+z,
~~~

~~~math
p+e-z
=
j-h+e-z,
~~~

and

~~~math
p+k+z
=
j+4h+\kappa+z.
~~~

Thus the one-return boundary row connects:

1. one kappa-shifted seed after five h-steps;
2. one reflected endpoint channel at j-h;
3. one kappa-shifted channel at j+4h.

This is exactly the morphology expected of a reusable kappa-scattering rule.

The Chebyshev bulk compiler from SZ-RETURN-COCYCLE-0 can handle the explicit h-runs once the scalar x-channels are lawfully interfaced with the retained bulk state.

That final interface is not assumed here.

---

## 7. What this changes about the missing 62-block symbol

The previous pass left the symbol extraction entirely abstract.

The present pass identifies a concrete local row generator:

~~~math
\boxed{
x(k+z)
+
\varepsilon\beta^2\gamma x(p+e-z)
+
\frac{\delta}{\beta^2}x(p+k+z)
=0.
}
~~~

Together with the seed row (V),

~~~math
\boxed{
x(p+k+z)
+
\frac{\beta^2\gamma}{1-\mu^2}
\left[
\mu x(z)+\varepsilon x(e-z)
\right]
=0,
}
~~~

these two equations form the exact boundary interface emitted whenever the orbit crosses the paired top-e tail.

Therefore a fresh source-level orbit compiler no longer needs to represent the two tail values A,B as independent columns.

They should be Schur-eliminated at row-generation time.

This can strictly reduce the compiler state relative to a naive affine-orbit assembly.

Whether the historical 124x124 assembler already performed this elimination is unknown.

---

## 8. Custody conclusion on the historical matrix

No old 124x124 payload was recovered.

Accordingly:

~~~math
\boxed{
\text{historical byte-exact validation remains unavailable.}
}
~~~

But we now have a source-level validation rule stronger than dimension matching:

> every emitted boundary-return row in a new compiler must reduce algebraically to (V) and (K2) on the base chamber.

A newly written assembler can therefore be audited row-by-row against the exact functional equations rather than against an unavailable historical matrix.

This is a lawful independent reconstruction path.

---

## 9. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-3:
DOUBLE-TAIL SCHUR HIT /
EXACT KAPPA BOUNDARY ROW EXTRACTED}
}
~~~

The old matrix artifact remains missing, but the first nontrivial block-symbol row has now been extracted exactly from the source equations.

---

## 10. Next cursor

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-4 / SOURCE-LEVEL ORBIT ASSEMBLER}
}
~~~

Required work:

1. encode affine arguments symbolically as signed seed coordinates plus exact logarithmic constants;
2. use the parity equations as the only row sources;
3. perform the double-tail Schur elimination analytically using Sections 3-5;
4. partition the base chamber only at exact affine threshold crossings;
5. close the orbit for a generic seed cell in 0<e<=kappa;
6. generate a fresh sparse matrix for each parity;
7. prove every row is a direct instance or Schur consequence of the source equations;
8. compare its dimension and determinant nonvanishing with the historical 124x124 report, without requiring identical variable ordering.

**Stop rule:** a fresh compiler that cannot recover a finite closed orbit in the already certified base chamber is incorrect and must not be extended to n>=1.
