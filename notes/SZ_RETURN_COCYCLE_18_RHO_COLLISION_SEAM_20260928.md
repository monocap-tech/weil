# SZ-RETURN-COCYCLE-18 — Rho Collision Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_18_rho_collision_seam_verify.py

---

## 0. Result

The rho collision occurs at

~~~math
e=5\kappa+2\chi.
~~~

At that seam, every surviving C0 / 5554 center from the second chi chamber collapses.

The generic seam atlas contains only:

~~~math
\boxed{
127\text{ copies of }K_1/8176
}
~~~

and

~~~math
\boxed{
40\text{ copies of }M_6/2612.
}
~~~

Immediately above the seam, write

~~~math
e
=
5\kappa
+
2\chi
+
\delta,
\qquad
0<\delta<\rho.
~~~

A new graph species appears.

Its size is

~~~math
\boxed{10798}.
~~~

The complete generic atlas in this first rho chamber contains

~~~math
\boxed{
168\times10798
+
127\times8176
+
40\times2612,
}
~~~

i.e.

~~~math
\boxed{335}
~~~

open seed bands.

All 168 new bands are one exact graph species.

No invertibility claim for the new 10798 species is made in this seam pass.

---

## 1. Euclidean residual chain

Recall

~~~math
\eta_*=h-5\kappa,
~~~

~~~math
\chi=\kappa-8\eta_*,
~~~

and

~~~math
\rho=\eta_*-3\chi.
~~~

Define the next remainder

~~~math
\boxed{
\sigma
:=
\chi-\rho.
}
~~~

In the q,j,k basis,

~~~math
\chi=(213,-426,-172),
~~~

~~~math
\rho=(-665,1330,537),
~~~

so

~~~math
\boxed{
\sigma=(878,-1756,-709).
}
~~~

In prime logarithms,

~~~math
\boxed{
\sigma
=
\log
\frac{2^{4188}5^{709}}
{3^{3681}}.
}
~~~

Exact integer comparison gives

~~~math
2^{4188}5^{709}>3^{3681},
~~~

hence

~~~math
\sigma>0.
~~~

Also

~~~math
\rho-\sigma
=
2\rho-\chi
=
(-1543,3086,1246),
~~~

which is

~~~math
\boxed{
\rho-\sigma
=
\log
\frac{3^{6469}}
{2^{7360}5^{1246}}.
}
~~~

Exact comparison gives

~~~math
3^{6469}>2^{7360}5^{1246},
~~~

so

~~~math
\boxed{
0<\sigma<\rho.
}
~~~

Thus the Euclidean chain has reached

~~~math
\boxed{
\chi
=
\rho+\sigma.
}
~~~

---

## 2. Seam at e=5 kappa + 2 chi

In the chamber immediately below the seam,

~~~math
5\kappa+\chi
<
e
<
5\kappa+2\chi,
~~~

the local species were

~~~math
K_1/C_0/K_1/C_0/K_1/M_6.
~~~

At

~~~math
e=5\kappa+2\chi,
~~~

both C0 center widths become zero.

Keeping the equality seeds separate, the generic seam atlas contains exactly

~~~math
\boxed{
127\text{ K}_1\text{ bands}
}
~~~

and

~~~math
\boxed{
40\text{ M}_6\text{ bands}.
}
~~~

The companion verifier reconstructs all 167 generic seam intervals and confirms the species dimensions

~~~math
8176
~~~

and

~~~math
2612.
~~~

No C0 generic interval survives.

---

## 3. First chamber above the rho seam

Write

~~~math
e
=
5\kappa+2\chi+\delta,
\qquad
0<\delta<\rho.
~~~

For one eta-star cell the exact local ordering is

~~~math
\boxed{
\begin{array}{ccl}
(0,\delta)
&:&K_2,\\
(\delta,\chi)
&:&K_1,\\
(\chi,\chi+\delta)
&:&K_2,\\
(\chi+\delta,2\chi)
&:&K_1,\\
(2\chi,2\chi+\delta)
&:&K_2,\\
(2\chi+\delta,3\chi)
&:&K_1,\\
(3\chi,3\chi+\delta)
&:&K_2,\\
(3\chi+\delta,\eta_*)
&:&M_6.
\end{array}
}
~~~

Translated over the exact anchor lattice, the unique generic counts are

~~~math
\boxed{
168\text{ K}_2\text{ bands},
}
~~~

~~~math
\boxed{
127\text{ K}_1\text{ bands},
}
~~~

and

~~~math
\boxed{
40\text{ M}_6\text{ bands}.
}
~~~

Thus

~~~math
168+127+40
=
\boxed{335}
~~~

generic open bands.

---

## 4. The new K2 species

Retain

~~~math
\mathcal M_7
~~~

with

~~~math
|\mathcal M_7|=1466
~~~

per orientation, and the truncated collision body

~~~math
\mathcal X
~~~

with

~~~math
|\mathcal X|=1311.
~~~

The collision ladder is now

~~~math
\mathcal K_0
=
\mathcal M_7
\sqcup
(\chi+\mathcal X),
~~~

~~~math
\mathcal K_1
=
\mathcal M_7
\sqcup
(\chi+\mathcal X)
\sqcup
(2\chi+\mathcal X),
~~~

and in the first rho chamber

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

All four pieces are disjoint.

Therefore

~~~math
\begin{aligned}
|\mathcal K_2|
&=
1466+3\cdot1311
\\
&=
\boxed{5399}
\end{aligned}
~~~

per orientation.

Hence the full two-orientation matrix has

~~~math
\boxed{
2\cdot5399
=
10798
}
~~~

variables.

---

## 5. Exact row census

For each orientation of K2, the source-row census is

~~~math
\boxed{
A:1046,
\qquad
B:1046,
\qquad
D:1047,
\qquad
T:2260.
}
~~~

These sum to

~~~math
1046+1046+1047+2260
=
5399.
~~~

Relative to K1,

~~~math
A:792,
\quad
B:792,
\quad
D:793,
\quad
T:1711,
~~~

the added third chi-shifted collision body contributes

~~~math
\boxed{
A:254,
\quad
B:254,
\quad
D:254,
\quad
T:549.
}
~~~

These sum to

~~~math
1311,
~~~

exactly the size of X.

Thus the same collision body has repeated a third time.

---

## 6. New-band graph uniqueness

Let

~~~math
z_0
=
m\kappa+a\eta_*+b\chi
~~~

be one of the 168 distinct new-band anchors.

Canonicalize

~~~math
z=z_0+\zeta,
\qquad
0<\zeta<\delta.
~~~

With

~~~math
e=5\kappa+2\chi+\delta,
~~~

all source arguments become

~~~math
C+\zeta
~~~

or

~~~math
C+\delta-\zeta.
~~~

After subtracting z0 from the orientation constants, all 168 new bands have the same row graph.

The companion verifier certifies the canonical new-band region inequalities uniformly over the parameter triangle

~~~math
0\le\zeta\le\delta\le\rho.
~~~

Every affine margin is reduced at the vertices to an exact prime-power sign comparison.

The remaining 167 new-band graphs are checked to be exact affine relabelings of that canonical graph.

Thus K2 is one genuine source-level species.

---

## 7. Inherited K1 species

The surviving K1 bands are exact relabelings of the K1 graph certified in SZ-RETURN-COCYCLE-17.

Relative to the prior K1 representation, the current graph is obtained by

~~~math
(+):C\mapsto C,
~~~

~~~math
(-):C\mapsto C+\chi.
~~~

The companion verifier checks exact row-graph equality under this relabeling.

Therefore every 8176 band in the current chamber inherits the K1 invertibility certificate.

---

## 8. Inherited M6 species

The surviving M6 / 2612 bands are likewise exact relabelings of the already-certified M6 graph.

The orientation shift is

~~~math
(+):C\mapsto C+\chi,
~~~

~~~math
(-):C\mapsto C.
~~~

Thus every 2612 band remains certified.

---

## 9. Next topology event

In one eta-star cell, the M6 residual width is

~~~math
\eta_*-(3\chi+\delta).
~~~

At

~~~math
\delta=\rho
~~~

this becomes

~~~math
\eta_*-(3\chi+\rho)=0.
~~~

Therefore the next topology event is

~~~math
\boxed{
e
=
5\kappa+2\chi+\rho.
}
~~~

At that seam all M6 gaps collapse.

The surviving K1 center width is

~~~math
\chi-\rho
=
\boxed{\sigma}.
~~~

Thus sigma is the next Euclidean residual exposed by the traversal.

The present pass stops before that seam.

---

## 10. Standing

The exact current standing is:

### seam

~~~math
e=5\kappa+2\chi
~~~

typed.

### first rho chamber

~~~math
5\kappa+2\chi
<
e
<
5\kappa+2\chi+\rho
~~~

classified into:

- K2 / 10798: new, invertibility open;
- K1 / 8176: certified;
- M6 / 2612: certified.

Therefore this chamber is not yet declared closed solely because K2 remains uncertified.

---

## 11. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-18:
RHO SEAM TYPED /
K2-10798 SPECIES EXTRACTED /
SIGMA RESIDUAL IDENTIFIED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 12. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-19 /
K2 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. use the equal-orientation constant set
   ~~~math
   \mathcal K_2
   ~~~
   to diagonalize the 10798 matrix into two 5399 reflection sectors;
2. test whether the same stable inverse envelope
   ~~~math
   \|R\|_\infty<64,
   \qquad
   \|I-RA_0\|_\infty<1/2950
   ~~~
   persists;
3. certify K2 if possible;
4. then promote the first rho chamber as closed;
5. only afterward type the sigma seam at
   ~~~math
   e=5\kappa+2\chi+\rho.
   ~~~

**Stop rule:** do not infer a general chi- or rho-tier theorem past the sigma collision.
