# RPB-32 — Friedrichs zero mode to screw-operator core domain

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / EXACT CORE-KERNEL CRITERION / ZERO EIGENVALUE DOES NOT ITSELF FORCE CORE LIFT**  
**Dependencies:** RPB-10, RPB-30, RPB-31; Suzuki 2026 v3 Theorem 1.1 and the screw realization (B_c=D^*G_cD).  
**Promotion status:** none.

## 0. Objective

RPB-31 left one possible regularity escape:

```math
h\in\ker A_c
\stackrel{?}{\Longrightarrow}
h\in\mathfrak D(B_c)
=
H_0^1(-c,c),
```

where (A_c) is Suzuki's localized Weil operator and (B_c) is the stronger
screw-operator realization.

RPB-32 asks whether the special eigenvalue (0), together with the factorization

```math
B_c
=
D^*G_cD,
```

forces that lift.

It does not do so automatically.

Instead the factorization yields an exact criterion:

```math
\boxed{
\ker A_c
\cap
H_0^1(-c,c)
=
D^{-1}(\ker G_c).
}
```

Thus the core-lift problem is exactly a compact screw-kernel problem.

---

## 1. Current Suzuki realization

For fixed support (c>0), let

```math
L_0^2(-c,c)
=
\left\{
u\in L^2(-c,c):
\int_{-c}^{c}u(x)\,dx=0
\right\}.
```

Let

```math
D
=
i\frac{d}{dx},
\qquad
\mathfrak D(D)
=
H_0^1(-c,c).
```

Suzuki defines the projected screw operator

```math
G_c:
L_0^2(-c,c)
\to
L_0^2(-c,c)
```

and the symmetric operator

```math
\boxed{
B_c
=
D^*G_cD,
\qquad
\mathfrak D(B_c)
=
H_0^1(-c,c).
}
```

The canonical compact-window Weil operator (A_c) is the Friedrichs extension
of (B_c).

Suzuki also states explicitly that

```math
\mathfrak D(A_c)
\supsetneq
H_0^1(-c,c),
```

and that the larger domain contains functions such as constants.

So there is no domain equality available to make the desired lift automatic.

---

## 2. The derivative map is an isomorphism onto the zero-mean space

For

```math
h\in H_0^1(-c,c),
```

the boundary conditions give

```math
\int_{-c}^{c}Dh\,dx
=
i(h(c)-h(-c))
=
0.
```

Hence

```math
D:
H_0^1(-c,c)
\to
L_0^2(-c,c).
```

This map is injective: if (Dh=0), then (h) is constant, and the Dirichlet
boundary condition forces (h=0).

It is also surjective. For any (u\in L_0^2(-c,c)), define

```math
h(x)
=
-i
\int_{-c}^{x}u(t)\,dt.
```

Then (h\in H_0^1(-c,c)), because the zero-mean condition gives

```math
h(c)=h(-c)=0,
```

and

```math
Dh=u.
```

Therefore

```math
\boxed{
D:
H_0^1(-c,c)
\overset{\sim}{\longrightarrow}
L_0^2(-c,c).
}
```

---

## 3. Kernel of the adjoint derivative

For

```math
D
=
i\frac{d}{dx}
```

with Dirichlet domain, the adjoint has domain

```math
\mathfrak D(D^*)
=
H^1(-c,c)
```

with no boundary condition.

Its kernel is the one-dimensional space of constants:

```math
\boxed{
\ker D^*
=
\mathbb C\mathbf1.
}
```

But (G_c) maps into the zero-mean space.

Therefore

```math
\boxed{
\ker D^*
\cap
\operatorname{Ran}G_c
=
\{0\}.
}
```

This is the key point in the zero-mode calculation.

---

## 4. Core zero mode implies screw-kernel zero mode

Take

```math
h
\in
\ker A_c
\cap
H_0^1(-c,c).
```

Because (A_c) extends (B_c),

```math
A_ch
=
B_ch.
```

Hence

```math
0
=
B_ch
=
D^*G_cDh.
```

Put

```math
u=Dh
\in
L_0^2(-c,c).
```

Since (h\in\mathfrak D(B_c)), the vector (G_cu) lies in
(mathfrak D(D^*)).

The equation

```math
D^*G_cu=0
```

shows that (G_cu) is constant.

But (G_cuin L_0^2(-c,c)), so that constant has zero mean and must vanish.

Thus

```math
\boxed{
G_cu=0.
}
```

Equivalently,

```math
\boxed{
Dh
\in
\ker G_c.
}
```

---

## 5. Every screw-kernel vector gives a core zero mode

Conversely, let

```math
u\in\ker G_c.
```

Define

```math
h
=
D^{-1}u
\in
H_0^1(-c,c).
```

Then

```math
B_ch
=
D^*G_cu
=
0.
```

Because (A_c) is an extension of (B_c),

```math
A_ch
=
0.
```

Hence

```math
\boxed{
D^{-1}(\ker G_c)
\subseteq
\ker A_c
\cap
H_0^1(-c,c).
}
```

Combining with Section 4 gives equality.

---

## 6. Screw-core kernel criterion

We obtain the exact theorem

```math
\boxed{
\ker A_c
\cap
H_0^1(-c,c)
=
D^{-1}(\ker G_c).
}
```

Since (D) is an isomorphism,

```math
\boxed{
\dim
\left(
\ker A_c
\cap
H_0^1(-c,c)
\right)
=
\dim\ker G_c.
}
```

Thus the desired full core lift

```math
\ker A_c
\subseteq
H_0^1(-c,c)
```

is equivalent to

```math
\boxed{
\dim\ker A_c
=
\dim\ker G_c.
}
```

---

## 7. The special value zero does not bypass the domain issue

The Friedrichs extension theorem says:

```math
B_c
\subset
A_c.
```

It does not say that an (A_c)-eigenvector with eigenvalue (0) belongs to
(mathfrak D(B_c)).

Suzuki explicitly emphasizes that the Friedrichs domain is strictly larger than

```math
H_0^1(-c,c).
```

The zero-mode condition adds only

```math
h\in\ker A_c.
```

By Section 6, upgrading this to the core domain is exactly the additional
statement that the neutral direction is represented in (ker G_c).

Therefore:

```math
\boxed{
0\text{ eigenvalue of }A_c
\not\Rightarrow
H_0^1\text{ core membership}
}
```

from Friedrichs theory or the factorization alone.

---

## 8. Endpoint positivity makes the compact screw operator nonnegative

At the RPB neutral edge,

```math
A_c\succeq0.
```

For every

```math
u\in L_0^2(-c,c),
```

let

```math
h=D^{-1}u
\in H_0^1(-c,c).
```

Then

```math
\begin{aligned}
\langle G_cu,u\rangle
&=
\langle B_ch,h\rangle
\\
&=
Q_W^c(h)
\\
&\ge0.
\end{aligned}
```

Thus

```math
\boxed{
G_c\succeq0
}
```

on (L_0^2(-c,c)) at the neutral edge.

Consequently:

- if (G_c) is injective, then
  ```math
  \ker A_c
  \cap
  H_0^1(-c,c)
  =
  \{0\};
  ```
- if a nonzero neutral mode lies in the screw core, then (G_c) must have an
  actual zero eigenvector.

So the core-lift question is not a regularity estimate anymore.

It is a nullity comparison between the closed Weil operator and the compact
screw operator.

---

## 9. Core-lift nullity defect

Define

```math
\boxed{
\delta_{\rm core}(c)
=
\dim\ker A_c
-
\dim\ker G_c.
}
```

At the neutral edge both nullities are finite on the (A_c) side and
nonnegative on the (G_c) side.

The screw-core criterion identifies

```math
\dim\ker G_c
```

with the dimension of the part of the neutral Weil nullspace already contained
in (H_0^1).

Hence

```math
\boxed{
\delta_{\rm core}(c)
}
```

counts the neutral Friedrichs directions that live only in the larger closed
form/operator domain.

The desired lift is exactly

```math
\boxed{
\delta_{\rm core}(c)=0.
}
```

---

## 10. Relation to the RPB-30 regularity obstruction

RPB-30 proved

```math
E_*
\cong
\ker A_c.
```

If a neutral mode belongs to (H_0^1), then its zero extension is in
(H^{1/2}).

Therefore

```math
D^{-1}(\ker G_c)
```

is a concrete subspace of the half-Sobolev neutral nullspace.

In particular,

```math
\boxed{
\ker G_c\ne\{0\}
\Longrightarrow
E_*
\cap
\mathcal R_{1/2}(c)
\ne\{0\}.
}
```

But the converse need not hold: (H^{1/2}) is weaker than (H_0^1).

Thus the screw-core route is sufficient but stronger than the minimum
regularity route.

---

## 11. What current Suzuki theory does and does not decide

Suzuki's current v3 paper proves that:

1. (B_c=D^*G_cD) on (H_0^1);
2. (A_c) is the Friedrichs extension of (B_c);
3. the Friedrichs domain is strictly larger than (H_0^1);
4. the localized spectrum is discrete and the ground level is attained.

These facts do not state the nullity identity

```math
\dim\ker A_c
=
\dim\ker G_c
```

at a degenerating support.

The paper's generalized compact-operator reformulations motivate studying
(G_c), but RPB-32 does not import a zero-eigenspace multiplicity theorem that
would identify these two kernels.

Therefore no core lift is promoted.

---

## 12. RPB-32 determination

```math
\boxed{
\textbf{RPB-32 — FRIEDRICHS ZERO-MODE CORE MEMBERSHIP IS EQUIVALENT TO A ZERO MODE OF THE PROJECTED SCREW OPERATOR.}
}
```

Exact theorem:

```math
\boxed{
\ker A_c
\cap
H_0^1(-c,c)
=
D^{-1}(\ker G_c).
}
```

Hence:

```math
\boxed{
\ker A_c
\subseteq
H_0^1(-c,c)
\iff
\dim\ker A_c
=
\dim\ker G_c.
}
```

The special eigenvalue (0) does not remove this extra nullity obligation.

At a neutral endpoint,

```math
\boxed{
G_c\succeq0.
}
```

So the next problem is finite and concrete:

> Does the actual projected screw operator (G_{c_*}) acquire a kernel of the
> same multiplicity as the neutral localized Weil operator (A_{c_*}), or is
> the neutral mode created only in the Friedrichs completion?

Next cursor:

```text
RPB-33 / PROJECTED SCREW KERNEL AT THE NEUTRAL EDGE
```

The next pass should test (ker G_{c_*}) directly—through the compact kernel,
the generalized Bombieri eigenproblem, parity, and any available Fredholm or
de Branges nondegeneracy statement—and determine whether the neutral edge is
visible already in the screw-core operator or only after Friedrichs
completion.
