# SZ Screw-Family Parallel Investigation — Weil Factorization and Custody Correction

**Date:** 2026-09-27  
**Branch:** `research/sz-screw-family-0`  
**Standing:** DERIVED / RECONNAISSANCE  
**Canonical effect:** NONE. The canonical SZ cursor remains `SZ-CROSS-COLLAR-3`.

## 0. Correction to the preceding reconnaissance

The preceding note observed that the raw arithmetic Green kernel

~~~math
K_a(s)=\mathbf 1_{s\ge0}\frac{\sinh(as)}{a}
~~~

has transfer matrix

~~~math
\begin{pmatrix}
2\cosh(ah)&-1\\
1&0
\end{pmatrix},
~~~

which becomes parabolic at `a=0`.

That observation is correct **for the raw one-kernel recurrence**.

It must not be identified with the actual GERM bulk transfer.

The retained GERM-34 bulk state is

~~~math
V=(X,S)^T,
\qquad
V(x+h)=M_0V(x)+\text{overlap taps},
~~~

with

~~~math
M_0=
\begin{pmatrix}
(Q-T)/R&E/R\\
-T&E
\end{pmatrix},
\qquad
\det M_0=1,
\qquad
\operatorname{tr}M_0=\Theta\approx1.979793.
~~~

Hence the actual bulk GERM transfer is elliptic at `a=0`:

~~~math
\lambda_\pm=e^{\pm i\vartheta},
\qquad
2\cos\vartheta=\Theta,
\qquad
\vartheta\approx0.14227.
~~~

Therefore the proposed shortcut

~~~math
2\mapsto2\cosh(ah)
~~~

inside the existing GERM recurrence is **INVALID**.

Any general-`a` GERM transfer must be rederived from the full coupled P/J/relay equations.

This is a custody correction, not a change to the canonical residue.

---

## 1. Unconditional Green identity for the H_ell family

Put

~~~math
a=\ell-\frac12,
\qquad
\lambda_\rho=\rho-\frac12.
~~~

Matsumoto–Suzuki define

~~~math
H_\ell(e^t)-H_\ell(1)
=
\sum_\rho
\frac{e^{\lambda_\rho t}-1}
{(\rho-\ell)((1-\rho)-\ell)}.
~~~

But

~~~math
(\rho-\ell)((1-\rho)-\ell)
=
a^2-\lambda_\rho^2.
~~~

Thus write

~~~math
g_a(t)
=
\sum_\rho
\frac{e^{\lambda_\rho t}-1}
{a^2-\lambda_\rho^2}.
~~~

This identity does not assume RH.

Let

~~~math
L_a=-\partial_t^2+a^2.
~~~

Termwise,

~~~math
L_a
\left[
\frac{e^{\lambda t}-1}{a^2-\lambda^2}
\right]
=
e^{\lambda t}
-
\frac{a^2}{a^2-\lambda^2}.
~~~

Therefore, distributionally,

~~~math
\boxed{
L_ag_a=k-C_a,
}
~~~

where

~~~math
k(t)=\sum_\rho e^{(\rho-1/2)t}
~~~

is the unweighted zero-distribution kernel in this coordinate and

~~~math
\boxed{
C_a
=
\sum_\rho
\frac{a^2}{a^2-(\rho-1/2)^2}.
}
~~~

The latter sum has the expected inverse-square tail and is finite under the standard symmetric interpretation.

At `a=0`,

~~~math
C_0=0,
\qquad
-\partial_t^2g_0=k.
~~~

This recovers the special second-derivative relation used by Suzuki.

**Standing:** DERIVED from the source-pinned H_ell definition.

---

## 2. A whole family of exact factorizations of the same Weil distribution

Let `G_a` be convolution by `g_a`.

Take a smooth compactly supported test function `f`. Integration by parts has no boundary term.

Since `L_a=-\partial^2+a^2`,

~~~math
\begin{aligned}
\langle (L_aG_a)f,f\rangle
&=
\langle G_af',f'\rangle
+
a^2\langle G_af,f\rangle.
\end{aligned}
~~~

On the other hand, convolution by the constant `C_a` contributes

~~~math
C_a\left|\int f\right|^2.
~~~

Consequently the distributional Weil kernel has the representation

~~~math
\boxed{
Q_W(f)
=
\langle G_af',f'\rangle
+
a^2\langle G_af,f\rangle
+
C_a\left|\int f\right|^2,
}
~~~

up to the fixed normalization convention already used in the Suzuki/Weil carrier.

At `a=0` this collapses to

~~~math
\boxed{
Q_W(f)=\langle G_0f',f'\rangle,
}
~~~

which is exactly why the `ell=1/2` member gives Suzuki's exceptionally clean one-channel realization.

For `a\ne0`, the same Weil object is represented by three pieces:

1. a derivative channel;
2. an `a^2` mass channel;
3. a rank-one mean channel.

Thus the additional screw functions are not additional axioms. They are alternative Green factorizations of the same quadratic form.

---

## 3. What a neutral vector actually satisfies

If

~~~math
Q_W(f)=0,
~~~

then for every real `a`,

~~~math
\boxed{
\langle G_af',f'\rangle
+
a^2\langle G_af,f\rangle
+
C_a\left|\int f\right|^2
=
0.
}
~~~

This is a lawful family of identities on the same test vector.

However, these identities are globally equivalent because they reconstruct the same distribution.

Therefore:

~~~math
\boxed{
\text{the family supplies alternative decompositions, not independent bulk constraints.}
}
~~~

Any gain must come from the fact that one decomposition exposes the finite-window boundary/collar geometry more efficiently than another.

---

## 4. Why ell=1/2 is genuinely distinguished

The special value

~~~math
a=0
~~~

simultaneously removes

~~~math
a^2\langle G_af,f\rangle
~~~

and

~~~math
C_a\left|\int f\right|^2.
~~~

It is therefore the only member of this Green family whose natural finite-window factorization consists solely of the differentiated screw channel.

This explains, structurally, why Suzuki's chosen screw is so powerful and why the literature naturally developed that member first.

The existence of the H_ell family does **not** show that Suzuki omitted an equally simple second screw.

What it shows is that there is a family of less-minimal factorizations with potentially useful extra bookkeeping channels.

---

## 5. Correct compressed comparison

The previous schematic compressed-resolvent identity

~~~math
PR_a(I-P)R_bP
~~~

captured a real leakage phenomenon but was incomplete as a model for the Weil form.

A lawful finite-window comparison of `a=0` and `a\ne0` must carry all three general-`a` pieces:

~~~math
\boxed{
D^*G_{a,c}D
+
a^2G_{a,c}
+
C_a J_c,
}
~~~

where `J_c` denotes the rank-one mean form on the chosen finite-window core, with any projection/closure corrections written explicitly.

At `a=0` this reduces to Suzuki's

~~~math
D^*G_{0,c}D.
~~~

Therefore the next finite-window rank test is not a two-row test for `G_0` and `G_a` alone.

It is a test of whether the **three-channel general-a decomposition** converts the current overlap ambiguity into a lower-complexity transfer problem.

---

## 6. Small-a expansion

The arithmetic Green kernel has the even expansion

~~~math
\frac{\sinh(as)}{a}
=
s
+
\frac{a^2s^3}{6}
+
\frac{a^4s^5}{120}
+\cdots.
~~~

Thus every finite prime-delay coefficient obtained from finitely many evaluations of the Green kernel has an analytic expansion in

~~~math
z=a^2.
~~~

The first variation is the cubic-tent channel

~~~math
\boxed{
K^{[1]}(s)=\frac{s^3}{6}.
}
~~~

Similarly,

~~~math
C_a=a^2C^{[1]}+O(a^4).
~~~

Differentiating the exact factorization at `z=a^2=0` gives a universal identity

~~~math
\boxed{
0
=
\langle \dot G_0f',f'\rangle
+
\langle G_0f,f\rangle
+
C^{[1]}\left|\int f\right|^2.
}
~~~

This is not a new condition on a neutral vector; it holds for every admissible `f`.

But it may be used as an exact elimination identity when rewriting the collar equations.

This is now the cleanest candidate for reducing the GERM state dimension.

---

## 7. Interaction with the existing GERM atom library

GERM-36 has strict nonsingularity margins at `a=0` for the local atom matrices:

~~~math
\det M_0=1,
~~~

~~~math
\det D_0<-\frac1{40},
~~~

~~~math
\det P_0>\frac14,
~~~

~~~math
\det J_0>\frac94,
~~~

~~~math
\det T_0=1,
~~~

and

~~~math
|\det D_1|>\frac{627}{360}.
~~~

If the exact general-`a` P/J/relay coefficients are obtained by the lawful replacement of the finite Green evaluations by their `K_a` analogues, then those coefficients depend analytically on `a^2`.

The strict margins imply that there exists a nonzero neighborhood

~~~math
|a|<a_*
~~~

on which every one of these **finite local atom types** remains nonsingular.

This is only a continuity consequence; no explicit `a_* >0` is claimed before the coefficient formulas are rederived.

Hence the screw-family deformation is locally compatible with the already-certified finite atom structure.

It does not automatically resolve the later irrational return atlas.

---

## 8. Reassessment of the two proposed payoffs

### A. Independent boundary rank

**Not established.**

The family does not automatically add independent equations. The mass and mean channels must be included, and the whole decomposition is globally equivalent to the original Weil form.

### B. Regularized transfer

**Still live, but in corrected form.**

The actual GERM matrix is already elliptic at `a=0`; it is not the raw Jordan matrix.

The useful question is therefore not whether `a>0` diagonalizes the raw recurrence.

It is whether the three-channel `a\ne0` factorization admits a smaller or more separable state representation of the P/J/relay system than the present `a=0` formulation.

That requires an exact rederivation.

---

## 9. Next cursor

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-3 / GENERAL-a P-J RELIFT}
}
~~~

Tasks:

1. take the exact GERM-34 P/J equations before elimination;
2. replace every linear-tent prime contribution by the general hyperbolic Green kernel;
3. include the `a^2 G_a` mass channel and rank-one mean term required by the exact Weil factorization;
4. derive `Q(a),T(a),R(a),E(a)` and the tap vectors exactly;
5. verify the `a\to0` limit recovers the retained GERM-34 system;
6. compute the first `a^2` variation;
7. test whether the cubic-tent identity eliminates one of the post-p overlap variables or one return channel;
8. only then test a concrete `a=1/2` carrier.

### Stop rules

- Failure to recover the exact GERM-34 coefficients at `a=0`: **CUSTODY STOP**.
- Exact recovery but no state reduction at first variation: continue to finite `a=1/2` only if a structural simplification remains.
- One eliminated overlap/return coordinate: **RELIFT HIT**.
- No reduction and larger state dimension: **NO-GAIN STOP** for this family route.

## Determination

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-2: MULTI-GREEN FACTORIZATION HIT / NAIVE RANK MODEL REJECTED}
}
~~~

The branch remains live, but the lawful mechanism is now an alternative factorization/elimination route rather than an extra-bulk-constraint route.
