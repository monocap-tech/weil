# SZ Screw-Family Parallel Investigation — Ambient Rank Reconnaissance

**Date:** 2026-09-27  
**Branch:** research/sz-screw-family-0  
**Standing:** DERIVED at the ambient spectral-weight level; OPEN at the finite-window/collar level.  
**Canonical effect:** NONE.

## 1. Question

Matsumoto–Suzuki give the family

~~~math
g_{H_\ell}(t)=H_\ell(e^t)-H_\ell(1),
~~~

with spectral weight, on a real critical-line parameter gamma,

~~~math
w_\ell(\gamma)
=
\frac{1}
{\gamma^2+(\ell-1/2)^2}.
~~~

The first reconnaissance question is whether distinct ell values merely rescale the same observable or furnish algebraically independent spectral probes.

Put

~~~math
a=|\ell-1/2|,
\qquad
R_a(x)=\frac{1}{x+a^2}.
~~~

Then x=gamma^2.

## 2. Two-probe test

Take a != b. If constants A,B satisfy

~~~math
\frac{A}{x+a^2}
+
\frac{B}{x+b^2}
=
0
~~~

for two distinct values of x, then multiplying through gives

~~~math
(A+B)x + Ab^2+Ba^2=0
~~~

at two distinct points, hence identically. Therefore

~~~math
A+B=0,
\qquad
A(b^2-a^2)=0,
~~~

and so A=B=0.

Thus any two distinct parameters a^2 != b^2 are already linearly independent on any two distinct spectral squares.

In particular, the Suzuki member ell=1/2 and the Goldbach/totient member ell=1 give

~~~math
\frac1{\gamma^2},
\qquad
\frac1{\gamma^2+1/4},
~~~

which are not constant multiples of one another.

~~~math
\boxed{
\text{ambient rank of }\{\ell=1/2,\ell=1\}=2
}
~~~

whenever at least two distinct spectral squares are retained.

**Standing:** DERIVED / exact algebraic.

## 3. Finite-rank Cauchy determinant

Choose distinct nonnegative spectral squares

~~~math
x_1,\dots,x_m
~~~

and distinct nonnegative parameter squares

~~~math
\alpha_j=a_j^2,
\qquad
j=1,\dots,m.
~~~

The evaluation matrix is the Cauchy matrix

~~~math
C_{ij}
=
\frac{1}{x_i+\alpha_j}.
~~~

Its determinant is, up to the conventional ordering sign,

~~~math
\det C
=
\frac{
\prod_{i<k}(x_k-x_i)
\prod_{j<l}(\alpha_l-\alpha_j)
}{
\prod_{i,j}(x_i+\alpha_j)
}.
~~~

Provided no denominator vanishes, distinct x_i and distinct alpha_j imply

~~~math
\boxed{\det C\ne0.}
~~~

Therefore for every finite m, m distinct members of the screw family can carry rank m on an m-point spectral sample.

Equivalently, on any infinite set of distinct nonnegative x values, the family

~~~math
\left\{
\frac1{x+a^2}:a\ge0
\right\}
~~~

has unbounded finite algebraic rank.

**Standing:** DERIVED / exact algebraic.

## 4. Resolvent-difference hierarchy

Two parameters satisfy

~~~math
\frac{1}{x+a^2}
-
\frac{1}{x+b^2}
=
\frac{b^2-a^2}
{(x+a^2)(x+b^2)}.
~~~

Hence

~~~math
\frac{R_a(x)-R_b(x)}{b^2-a^2}
=
\frac{1}{(x+a^2)(x+b^2)}.
~~~

Taking b -> a formally yields the parameter derivative

~~~math
-\frac{\partial}{\partial(a^2)}R_a(x)
=
\frac{1}{(x+a^2)^2}.
~~~

Around a=0,

~~~math
R_a(x)
=
\frac1x
-
\frac{a^2}{x^2}
+
\frac{a^4}{x^3}
-\cdots
~~~

where convergent for a^2<x and otherwise interpretable as a formal resolvent expansion.

Thus the family naturally exposes a hierarchy corresponding schematically to

~~~math
\gamma^{-2},
\quad
\gamma^{-4},
\quad
\gamma^{-6},
\ldots
~~~

rather than merely repeating the original gamma^{-2} probe.

This is a structural reason to test the family against a finite-dimensional collar ambiguity.

**Standing:** DERIVED as an algebraic resolvent identity. No finite-window implication is claimed.

## 5. What this DOES establish

The working hypothesis that all H_ell screws are spectrally redundant is false.

At the ambient spectral-weight level,

~~~math
\boxed{
\text{the family has unbounded algebraic rank.}
}
~~~

Therefore a second screw can, in principle, provide genuinely new linear information.

## 6. What this does NOT establish

The present SZ difficulty is not posed directly on free spectral samples. It is posed after:

1. the Weil/screw carrier has been localized to a finite interval;
2. the explicit-formula arithmetic has been converted into delayed physical translations;
3. support thresholds and moving overlap boundaries have been imposed;
4. the surviving unknowns have been quotiented into the post-p collar defect space.

Any of those operations may collapse the ell-rank.

Therefore the implication

~~~math
\text{ambient spectral rank}>1
\quad\Longrightarrow\quad
\text{post-}p\text{ collar rank}>1
~~~

is **NOT PROVED** and must not be used.

## 7. Exact next target — SZ-SCREW-FAMILY-1

Construct the H_ell analogue of the finite-window identity used by the current ell=1/2 Suzuki carrier.

Priority:

1. derive the physical/difference-kernel representation for general ell;
2. freeze the same support and prime-threshold conventions as the canonical carrier;
3. identify the post-p overlap variables without changing custody;
4. compute the coefficient row L_ell on those variables;
5. test whether

~~~math
\operatorname{rank}\{L_{1/2},L_1\}\ge2;
~~~

6. if rank two holds, determine whether it eliminates the currently propagated scalar ambiguity;
7. only then consider a third parameter.

### Stop rules

- If every L_ell is proportional after finite-window transfer: **RANK-1 STOP**.
- If L_{1/2} and L_1 are independent: **TWO-PROBE HIT**; test direct collar closure before adding more parameters.
- If two probes leave a one-dimensional residual ambiguity: select a third ell by determinant optimization, not arbitrarily.
- No result re-enters SZ-CROSS-COLLAR-3 before source, carrier, and custody audit.

## Determination

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-0: AMBIENT RANK HIT}
}
~~~

with the essential caveat

~~~math
\boxed{
\texttt{FINITE-WINDOW RANK: OPEN}.
}
~~~
