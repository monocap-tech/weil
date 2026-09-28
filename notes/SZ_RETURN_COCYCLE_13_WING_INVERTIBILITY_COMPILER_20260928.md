# SZ-RETURN-COCYCLE-13 — Wing-Tier Invertibility Compiler

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY COMPILER  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Companion verifier:

experiments/sz_return_cocycle_13_wing_invertibility_compiler.py

---

## 0. Result

The eta-wing architecture from SZ-RETURN-COCYCLE-12 admits a reusable invertibility compiler.

The remaining open mixed species were

~~~math
1652,quad
1972,quad
2292,quad
2612,quad
2932,
~~~

corresponding to levels

~~~math
r=3,4,5,6,7.
~~~

All five are now rigorously certified invertible for both external parity choices.

Therefore every new mixed-wing species occurring on

~~~math
\lambda_{\rm ret}<e<5\kappa
~~~

is invertible.

Combined with the inherited lower-level species certificates, this closes every generic seed band throughout the complete pre-5-kappa mixed region, modulo the registered lower-dimensional seams.

The main structural reason is that the apparent long-range Toeplitz-Hankel coupling becomes a fixed **width-two block continuant** after reversing the wing-tier order on the reflected orientation.

---

## 1. Reorder the wing stack

The level-r mixed graph has per orientation

~~~math
\mathcal M_r
=
\mathcal P
\sqcup
\bigcup_{a=0}^{r}
(a\eta_*+\mathcal W),
~~~

with

~~~math
|\mathcal P|=186,
\qquad
|\mathcal W|=160.
~~~

There are two orientations.

Naively, reflection maps tier a to a tier indexed near

~~~math
r-a.
~~~

That is why the previous matrices appear Toeplitz-Hankel.

Define the superlayer ordering:

### Positive orientation

~~~math
L_a^+
=
(a\eta_*+\mathcal W,+),
\qquad
0\le a\le r.
~~~

### Reflected orientation

reverse the tier order:

~~~math
L_a^-
=
((r-a)\eta_*+\mathcal W,-),
\qquad
0\le a\le r.
~~~

Then define the 320-variable superlayer

~~~math
\boxed{
\mathbb L_a
=
L_a^+\oplus L_a^-.
}
~~~

The body block is

~~~math
\boxed{
\mathbb P
=
(\mathcal P,+)
\oplus
(\mathcal P,-),
}
~~~

of dimension

~~~math
372.
~~~

Thus

~~~math
M_r
~~~

is ordered as

~~~math
\boxed{
\mathbb P,
\mathbb L_0,
\mathbb L_1,
\ldots,
\mathbb L_r.
}
~~~

---

## 2. Fixed width-two band structure

The source translations preserve eta-tier index up to the local successor shift already encoded in W.

The reflections satisfy the reversal relation

~~~math
\rho_*^{(r)}(C+a\eta_*)
=
\rho_*^{(0)}(C)
+
(r-a)\eta_*.
~~~

After the reflected-tier reversal, every wing-to-wing source edge satisfies

~~~math
\boxed{
|a-b|\le2.
}
~~~

Hence the wing stack is block-banded with bandwidth two.

Equivalently, the ordered matrix has the form

~~~math
\boxed{
\begin{pmatrix}
P_0 & E_0 & E_1 & 0 & 0 & \cdots \\
F_0 & A_0 & A_1 & A_2 & 0 & \cdots \\
F_1 & B_1 & A_0 & A_1 & A_2 & \ddots \\
0   & B_2 & B_1 & A_0 & A_1 & \ddots \\
\vdots & \ddots & \ddots & \ddots & \ddots & \ddots
\end{pmatrix},
}
~~~

with fixed finite blocks, modulo the opposite right-boundary reflection.

No coupling crosses more than two wing superlayers.

This is the correct normal form of the mixed compiler.

---

## 3. Body coupling is boundary-local

The 372-variable body does not couple throughout the wing chain.

It couples only to the first two and last two superlayers:

~~~math
\boxed{
\mathbb P
\leftrightarrow
\mathbb L_0,\mathbb L_1,
\mathbb L_{r-1},\mathbb L_r.
}
~~~

All interior superlayers use the same fixed source stencil.

Therefore increasing r appends one more copy of the same 320-variable interior block pattern and moves the right boundary condition outward.

This is a genuine finite-section/continuant structure.

---

## 4. Rational coefficient center

For the compiler use the coarser rational center

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

The exact physical values are

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

~~~math
\mu
=
\frac1{\sqrt3}\frac{\log3}{\log2}.
~~~

Using the exact atanh-series logarithm bounds and integer-square root bounds from the preceding passes gives

~~~math
\boxed{
\|M_{r,\rm phys}-M_{r,0}\|_\infty
<
10^{-9}
}
~~~

uniformly for all levels.

The coarser denominator is deliberate: it permits the entire rational residual certificate to be carried in exact signed 64-bit integer arithmetic after the inverse witness is generated.

---

## 5. Rational inverse witness compiler

For each finite section

~~~math
r=3,4,5,6,7,
~~~

take the rational midpoint matrix

~~~math
M_{r,0}.
~~~

A numerical sparse LU solve is used only to generate an approximate inverse.

Round every inverse entry to denominator

~~~math
10^6.
~~~

Call the resulting rational matrix

~~~math
R_r.
~~~

Invertibility is **not** inferred from the numerical solve.

The verifier then computes

~~~math
R_rM_{r,0}
~~~

with exact integer arithmetic.

Because every source matrix column has at most four nonzero entries, the exact residual verification costs only sparse matrix times dense witness, rather than a cubic exact inversion.

---

## 6. Uniform witness norm

For every remaining level

~~~math
r=3,4,5,6,7,
~~~

the exact rational witness has the same infinity norm:

~~~math
\boxed{
\|R_r\|_\infty
=
\frac{63924057}{10^6}.
}
~~~

Therefore

~~~math
\boxed{
\|R_r\|_\infty<64.
}
~~~

The equality of the sharp certificate across all five finite sections is a concrete stability signature of the block continuant.

It is not required for the proof, but it confirms that the added wing tiers are not degrading the inverse bound over the actual finite ladder.

---

## 7. Uniform midpoint residual

The exact residual is likewise identical at all five levels:

~~~math
\boxed{
\|I-R_rM_{r,0}\|_\infty
=
\frac{338547930925}{10^{15}}.
}
~~~

Numerically, only for orientation,

~~~math
\frac{338547930925}{10^{15}}
=
0.000338547930925.
~~~

Exactly,

~~~math
\boxed{
\frac{338547930925}{10^{15}}
<
\frac1{2950}.
}
~~~

The verifier also bounds every individual integer residual entry before row summation, ruling out 64-bit overflow in the exact calculation.

---

## 8. Physical invertibility

Write

~~~math
M_{r,\rm phys}
=
M_{r,0}+E_r.
~~~

Then

~~~math
\begin{aligned}
\|I-R_rM_{r,\rm phys}\|_\infty
&\le
\|I-R_rM_{r,0}\|_\infty
+
\|R_r\|_\infty
\|E_r\|_\infty
\\
&<
\frac1{2950}
+
64\cdot10^{-9}.
\end{aligned}
~~~

The verifier checks exactly that

~~~math
\boxed{
\frac1{2950}
+
64\cdot10^{-9}
<
\frac1{2949}
<1.
}
~~~

Therefore

~~~math
R_rM_{r,\rm phys}
~~~

is invertible by the Neumann lemma.

Hence

~~~math
\boxed{
M_{r,\rm phys}\text{ is invertible}
}
~~~

for every

~~~math
r=3,4,5,6,7.
~~~

---

## 9. External parity

Exactly as in all previous source-level parity systems, translations preserve seed orientation and reflections reverse it.

Let G be the diagonal orientation-sign matrix.

Then

~~~math
\boxed{
M_r^{(-)}
=
G M_r^{(+)}G.
}
~~~

Thus both external parity choices are gauge equivalent.

The certificate in Section 8 therefore closes both parities simultaneously.

---

## 10. Closed remaining species

The compiler certifies:

### r=3

~~~math
\boxed{
N_3=1652.
}
~~~

### r=4

~~~math
\boxed{
N_4=1972.
}
~~~

### r=5

~~~math
\boxed{
N_5=2292.
}
~~~

### r=6

~~~math
\boxed{
N_6=2612.
}
~~~

### r=7

~~~math
\boxed{
N_7=2932.
}
~~~

All are physically invertible for both parity choices.

No additional matrix species remain in the eta-wing ladder.

---

## 11. Pre-5-kappa closure

SZ-RETURN-COCYCLE-12 classified every generic seed band on

~~~math
\lambda_{\rm ret}<e<5\kappa
~~~

as one of:

1. a new mixed level M_r;
2. the preceding mixed level M_{r-1};
3. the fixed G_3 / 310 long-gap species.

Invertibility standing is now:

- M_0 / 692: certified;
- M_1 / 1012: certified;
- M_2 / 1332: certified;
- M_3 / 1652: certified here;
- M_4 / 1972: certified here;
- M_5 / 2292: certified here;
- M_6 / 2612: certified here;
- M_7 / 2932: certified here;
- G_3 / 310: certified.

Therefore

~~~math
\boxed{
\lambda_{\rm ret}<e<5\kappa
}
~~~

is source-level closed for every generic seed position, modulo the registered lower-dimensional threshold seams.

Together with the single-scale work,

~~~math
\boxed{
0<e<5\kappa
}
~~~

is now covered by source-level finite-orbit invertibility, again modulo the seam set already kept separate throughout the traversal.

---

## 12. What has actually been compiled

The traversal has now passed through three descriptions.

### Raw matrix view

~~~math
124,186,248,310,372,692,1012,1332,1652,\ldots,2932.
~~~

### First compression

The kappa-only range is one fixed 62-variable module insertion.

### Second compression

The mixed range is one fixed 160-site backward wing stacked in eta-star tiers.

### Final compiler normal form

After reflecting the negative-orientation tier order, the mixed wing stack is a fixed width-two 320-variable block continuant with a 372-variable body boundary.

This is the reusable object that replaces the large matrix atlas.

---

## 13. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-13:
WING-TIER INVERTIBILITY COMPILER HIT /
ALL PRE-5-KAPPA SPECIES CLOSED}
}
~~~

No canonical SZ theorem cursor moves automatically.

The result remains parallel residue pending audit/ratification and re-entry analysis.

---

## 14. Next cursor

The next arithmetic event is no longer another eta-star wing tier.

It is the collision

~~~math
\boxed{
e=5\kappa.
}
~~~

The appropriate next task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-14 /
5-KAPPA COLLISION SEAM}.
}
~~~

Priority:

1. type the exact seam at e=5 kappa;
2. determine which wing/long-gap bands collapse there;
3. identify the next residual return length born after the collision;
4. test whether the block-continuant compiler survives under a new boundary module;
5. keep all seam points separate from the open-chamber theorem until explicitly audited.

**Stop rule:** do not extend the eta-wing theorem past e=5 kappa without retyping the return alphabet.
