# RPB-11 — Global neutral plateau and entire-zero density

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / UNBOUNDED NEUTRAL PLATEAU EXCLUDED**  
**Dependencies:** RPB-4, RPB-8, RPB-10.  
**Promotion status:** none.

## 0. Objective

RPB-10 reduced the attained-neutral branch to a spectral plateau / negative-fall-through dichotomy.

If the lowest compact-window eigenvalue remains zero on every larger support, the same endpoint mode persists as an exact kernel vector in every larger localized Weil operator.

RPB-11 asks whether such an unbounded neutral plateau can exist.

It cannot.

The contradiction is unconditional and uses:

1. compact support of the persistent mode;
2. the polarized translation / Laplace-pole expansion from RPB-4, extended to one compact (L^2) probe and one smooth compact probe;
3. Conrey's unconditional positive proportion of **simple critical-line zeros**;
4. the elementary Jensen zero-count bound for a nonzero entire function of exponential type.

No RH assumption is used.

---

## 1. Source gate for distinct critical-line zeros

Primary external input:

```text
J. B. Conrey,
"More than two fifths of the zeros of the Riemann zeta function
are on the critical line",
J. reine angew. Math. 399 (1989), 1–26.
```

Conrey states in the introduction that at least two fifths of all nontrivial zeros are **simple and on the critical line**.

Together with the Riemann–von Mangoldt asymptotic

```math
N(T)
\sim
\frac{T}{2\pi}
\log\frac{T}{2\pi e},
```

this supplies

```math
\boxed{
N_{\rm simple,crit}(T)
\gg
T\log T
}
```

distinct positive critical-line ordinates up to height (T).

This exact input was already used and audited in the reflected-packet oscillation project.

---

## 2. Assume an unbounded neutral plateau

Let (c>0) be an attained-neutral endpoint with nonzero compactly supported physical mode

```math
k\ne0,
\qquad
\operatorname{supp}k\subseteq[-c,c],
```

and suppose the neutral spectral plateau is unbounded:

```math
\boxed{
\lambda_a=0
\qquad
\text{for every }a\ge c.
}
```

By RPB-10, the same zero extension (widetilde k) then satisfies

```math
\boxed{
A_a\widetilde k=0
\qquad
(a\ge c).
}
```

---

## 3. Unbounded plateau implies global Weil radical

Take any

```math
h\in C_c^\infty(\mathbb R).
```

Choose (a) large enough that both (k) and (h) are supported in ([-a,a]).

Since

```math
A_a k=0,
```

the representation theorem for the closed form gives

```math
Q_W^a(k,h)
=
\langle A_a k,h\rangle
=
0.
```

But (Q_W^a) is simply the global Weil preform restricted to tests supported in ([-a,a]).

Hence

```math
\boxed{
\mathfrak q(k,h)=0
\qquad
\text{for every }h\in C_c^\infty(\mathbb R).
}
```

Thus (k) lies in the **global Weil radical**.

By common-translation invariance,

```math
\mathfrak q(T_tk,h)
=
\mathfrak q(k,T_{-t}h)
=
0
```

for every real (t) and every compact smooth (h).

Therefore every polarized translation coefficient

```math
\boxed{
\mathcal K_{\mathfrak q}(k,h;t)
=
0
}
```

vanishes identically.

---

## 4. Mixed-regularity extension of the polarized zero expansion

RPB-4 was stated for

```math
f,g\in C_c^\infty.
```

For RPB-11 we need only

```math
k\in L^2_c,
\qquad
h\in C_c^\infty.
```

This extension is lawful.

Because (k) has compact support,

```math
k\in L^1.
```

The correlation

```math
C_{k,h}(r)
=
\int
\overline{k(x-r)}h(x)\,dx
=
\int
\overline{k(u)}h(u+r)\,du
```

belongs to

```math
C_c^\infty(\mathbb R),
```

since every (r)-derivative falls on the smooth factor (h).

Its bilateral Laplace transform factors as

```math
M_{k,h}(w)
=
\overline{
\widehat k(-i\overline w)
}
\widehat h(iw).
```

On bounded vertical strips, the compact (L^1) transform of (k) is bounded while the transform of (h) decays faster than every power along the real direction.

Thus (M_{k,h}) has exactly the rapid vertical decay required in the RPB-4 contour argument.

Therefore, for sufficiently large positive (t),

```math
\boxed{
\mathcal K_{\mathfrak q}(k,h;t)
=
\sum_\rho^{\rm dist}
m_\rho
M_{k,h}\!\left(
-\left(\rho-\frac12\right)
\right)
e^{(\rho-1/2)t}.
}
```

The associated tail Laplace transform is normally meromorphic, with local residue

```math
\frac12
m_\rho
M_{k,h}\!\left(
-\left(\rho-\frac12\right)
\right)
```

at

```math
s=\rho-\frac12.
```

---

## 5. Global radical forces Fourier zeros at every critical-line zero

Since

```math
\mathcal K_{\mathfrak q}(k,h;t)
\equiv0,
```

its tail Laplace transform is identically zero.

Hence every meromorphic residue in the RPB-4 representation vanishes.

Let

```math
\rho
=
\frac12+i\gamma
```

be a simple critical-line zero.

Then

```math
w_\rho=i\gamma,
```

and

```math
\begin{aligned}
M_{k,h}(-i\gamma)
&=
\overline{
\widehat k(
i\overline{i\gamma}
)
}
\widehat h(
-i(i\gamma)
)
\\
&=
\overline{\widehat k(\gamma)}
\widehat h(\gamma).
\end{aligned}
```

Therefore

```math
\overline{\widehat k(\gamma)}
\widehat h(\gamma)
=
0
```

for every compact smooth (h).

For any fixed real (gamma), Fourier evaluation

```math
h\mapsto\widehat h(\gamma)
```

is a nonzero linear functional on (C_c^\infty), so one can choose (h) with

```math
\widehat h(\gamma)\ne0.
```

Hence

```math
\boxed{
\widehat k(\gamma)=0
}
```

at every simple critical-line zero ordinate.

The same argument works at every nontrivial zero in the appropriate complex evaluation point; the critical-line subset alone is enough for the density contradiction.

---

## 6. Compact support gives an entire function of finite exponential type

Because

```math
\operatorname{supp}k\subseteq[-c,c]
```

and (k\in L^2subset L^1) on that finite interval,

```math
F(z)
:=
\widehat k(z)
=
\int_{-c}^{c}
k(x)e^{-izx}\,dx
```

is entire.

Moreover

```math
|F(z)|
\le
\|k\|_1
e^{c|\Im z|}
\le
\|k\|_1e^{c|z|}.
```

Thus (F) is an entire function of finite exponential type.

If (F\not\equiv0), Jensen's formula gives a linear zero-count bound

```math
\boxed{
n_F(R)
=
O_k(R),
}
```

where (n_F(R)) counts zeros in (|z|\le R), with multiplicity.

### Self-contained Jensen estimate

After factoring any zero at the origin, assume (F(0)\ne0).

Jensen gives

```math
\int_0^R
\frac{n_F(r)}{r}\,dr
=
\frac1{2\pi}
\int_0^{2\pi}
\log
\left|
\frac{F(Re^{i\theta})}{F(0)}
\right|
d\theta.
```

The exponential-type estimate bounds the right side by

```math
cR+O_k(1).
```

Hence

```math
n_F(R/2)\log2
\le
cR+O_k(1),
```

which proves

```math
n_F(R)=O_k(R).
```

No external Paley–Wiener zero-density theorem is required.

---

## 7. Conrey density contradicts nonzero exponential type

Section 5 forces (F=\widehat k) to vanish at every simple critical-line zeta ordinate.

Conrey supplies

```math
\gg
T\log T
```

distinct such positive ordinates up to (T).

Therefore

```math
n_F(T)
\gg
T\log T.
```

But Section 6 gives, for a nonzero compact mode,

```math
n_F(T)=O(T).
```

Contradiction.

Thus

```math
\boxed{
\widehat k\equiv0.
}
```

Fourier injectivity on (L^1\cap L^2) yields

```math
\boxed{
k=0,
}
```

contradicting the nonzero neutral-mode hypothesis.

Therefore:

```math
\boxed{
\text{there is no nonzero compactly supported global Weil radical vector.}
}
```

---

## 8. Unbounded neutral plateau is impossible

The contradiction proves:

```math
\boxed{
\text{an attained nonzero neutral endpoint mode cannot persist
for every larger compact support.}
}
```

Equivalently, the plateau endpoint

```math
c_*
=
\sup
\{a\ge c:\lambda_a=0\}
```

from RPB-10 is finite.

By monotonicity and continuity of (lambda_a),

```math
\boxed{
\lambda_a<0
\qquad
(a>c_*).
}
```

Thus every nonzero attained-neutral branch eventually enters a negative full compact-window regime.

---

## 9. Updated neutral morphology

Combining RPB-10 and RPB-11:

```math
\boxed{
\begin{aligned}
\text{attained endpoint neutral mode}
&\Longrightarrow
\text{fixed-mode zero plateau on }[c,c_*]
\\
&\Longrightarrow
\text{negative full-form regime for every }a>c_*,
\end{aligned}
}
```

with

```math
c_*<\infty.
```

There is no infinite neutral alternative.

So the old support interface

```text
AZ-FIN-WEIL-NULL-EXTENSION
```

is eliminated as an independent infinite-horizon obstruction **inside the branch-local RPB analysis**.

What remains is custody of the eventual negative direction.

---

## 10. What this does not yet prove

The conclusion

```math
\lambda_a<0
```

means that the **full localized Weil form** has a negative direction.

It does not automatically identify:

- a fixed finite selected packet (Pi);
- a persistent selected negative sector;
- the WD-T37 source (v);
- a packet-uniform negative margin.

Therefore RPB-11 does not by itself feed the fall-through into the completed fixed-packet negative morphology theorem.

The remaining neutral-to-negative bridge is a **selected-custody extraction problem**.

This is now the only remaining issue on the attained-neutral side.

---

## 11. Relation to RH

No RH assumption appears in the proof.

The only zeta-zero density input is Conrey's unconditional theorem that a positive proportion of all zeros are simple and on the critical line.

The argument does not assume:

- all zeros are on the critical line;
- all zeros are simple;
- linear independence of ordinates;
- global Weil positivity;
- a global spectral operator with prescribed zeta spectrum.

The contradiction concerns only a hypothetical compactly supported global radical vector.

---

## 12. RPB-11 determination

```math
\boxed{
\textbf{RPB-11 — GLOBAL NEUTRAL PLATEAU EXCLUDED.}
}
```

More explicitly:

```math
\boxed{
\begin{aligned}
&\text{nonzero compact global Weil radical: impossible},\\
&\text{unbounded neutral spectral plateau: impossible},\\
&\text{attained neutral branch: eventually full-form negative}.
\end{aligned}
}
```

The old neutral null-extension stop is therefore replaced, at current branch standing, by:

```text
RPB-NEUTRAL-TO-SELECTED-NEG
```

meaning:

> extract lawful fixed selected negative custody from the eventual full compact-window negative regime, or prove that only moving/background negative morphology can occur.

Next cursor:

```text
RPB-12 / NEUTRAL FALL-THROUGH → SELECTED NEGATIVE CUSTODY
```
