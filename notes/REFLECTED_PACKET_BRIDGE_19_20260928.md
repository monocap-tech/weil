# RPB-19 — Propagate finite-enlarged background gap to a right neighborhood

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / FINITE-ENLARGED BACKGROUND GAP IS RIGHT-STABLE**  
**Dependencies:** RPB-17, RPB-18; Suzuki 2026 Theorem 1.3 proof; finite selected zero-side covariance continuity.  
**Promotion status:** none.

## 0. Objective

RPB-18 produced a finite symmetric selected packet

```math
\Pi'
```

covering the entire full nullspace at the neutral edge

```math
c_*.
```

Consequently the complementary-background operator satisfies

```math
\boxed{
A_{B',c_*}
\succeq
\eta_* I
}
```

for some

```math
\eta_*>0.
```

RPB-19 asks whether this strict endpoint physical gap propagates to some strict right neighborhood of (c_*).

It does.

The proof is an extension of Suzuki's continuity proof for the lowest compact-window Weil eigenvalue. The finite selected covariance is a bounded finite-rank form perturbation whose fixed-interval realization depends continuously on the support parameter. It therefore enters Suzuki's regular remainder without changing the compactness/lower-semicontinuity mechanism.

---

## 1. External continuity mechanism

Current source:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3,
September 2026.
```

Theorem 1.3 proves continuity of

```math
a\longmapsto\lambda_a,
```

the lowest spectral value of the localized Weil form.

The proof scales

```math
[-a,a]
\to
[-1,1]
```

and writes the closed scaled form as

```math
\boxed{
\bar q_a
=
\bar q^0
+
\bar q_a^1,
}
```

where:

1. (ar q^0) is an (a)-independent lower-bounded closed logarithmic form;
2. (ar q_a^1) is a bounded quadratic form on (L^2(-1,1));
3. (ar q_a^1(w)) depends continuously on ((a,w));
4. bounded Rayleigh minimizers are therefore bounded in (H^{\log}(-1,1));
5. the compact embedding
   ```math
   H^{\log}(-1,1)
   \hookrightarrow
   L^2(-1,1)
   ```
   supplies strong subsequential convergence;
6. lower semicontinuity of (ar q^0) plus continuity of (ar q_a^1) gives lower semicontinuity of the ground level.

The upper-semicontinuity half uses a common smooth core

```math
C_c^\infty(-1,1)
```

and pointwise continuity in (a).

---

## 2. Background-only form after finite selected enlargement

Fix the RPB-18 packet

```math
\Pi'.
```

Let

```math
M'
=
M_{\Pi'}
\subset K_-
```

be its finite selected negative sector.

The complementary-background quadratic form is

```math
\boxed{
Q_{B',a}(h)
=
Q_W^a(h)
+
\|S_{M',a}^*h\|^2.
}
```

This is exactly the raw full form with the selected negative covariance restored.

Define its lowest spectral value

```math
\boxed{
\lambda_{B',a}
=
\inf_{0\ne h}
\frac{
Q_{B',a}(h)
}{
\|h\|_2^2
}.
}
```

At the neutral edge, RPB-18 gives

```math
\boxed{
\lambda_{B',c_*}
\ge
\eta_*
>
0.
}
```

---

## 3. The finite selected covariance does not change the form domain

For every fixed support (a), the map

```math
S_{M',a}^*
:
L^2(-a,a)
\to
M'
```

has finite-dimensional target.

Hence

```math
h
\mapsto
\|S_{M',a}^*h\|^2
```

is a bounded nonnegative quadratic form on (L^2(-a,a)).

Therefore:

```math
\boxed{
\mathfrak D(Q_{B',a})
=
\mathfrak D(Q_W^a).
}
```

The form norms are equivalent after adding a harmless support-local constant.

In particular, the same compact smooth core used by Suzuki for (Q_W^a) is a core for (Q_{B',a}).

Thus no new domain problem is introduced by finite custody enlargement.

---

## 4. Fixed selected zero channels are continuous under support scaling

Scale

```math
[-a,a]
\to
[-1,1].
```

For a fixed zero coordinate (gamma) in the finite packet (Pi'), the native Problem-1 physical column is the Dirichlet-Green preconditioned exponential associated with

```math
e^{-i\gamma u}.
```

Equivalently, after canonical pair diagonalization, one obtains finite linear combinations of the pair shapes

```math
e^{-iT u}\cosh(\delta u),
\qquad
e^{-iT u}\sinh(\delta u),
```

together with the fixed Dirichlet homogeneous correction required by the native metric.

Under

```math
u=ax,
```

these become functions of (x\in[-1,1]) whose coefficients and exponential/hyperbolic arguments depend continuously on (a).

For every fixed selected channel (j), denote the scaled representing vector by

```math
\phi_j(a)
\in
L^2(-1,1).
```

Then

```math
\boxed{
a
\longmapsto
\phi_j(a)
\text{ is continuous in }L^2(-1,1).
}
```

Since only finitely many selected channels occur,

```math
\boxed{
\Phi_a:
L^2(-1,1)
\to
M',
\qquad
\Phi_aw
=
(\langle w,\phi_j(a)\rangle)_j
}
```

depends continuously on (a) in operator norm.

Consequently the scaled selected covariance form

```math
p_a(w)
:=
\|\Phi_aw\|^2
```

satisfies

```math
\boxed{
|p_a(w)-p_{a_0}(w)|
\le
o_{a\to a_0}(1)
\|w\|_2^2
}
```

uniformly on the (L^2) unit sphere.

It is therefore a norm-continuous finite-rank quadratic perturbation.

---

## 5. Fixed-interval background form

Let

```math
\bar q_a
=
\bar q^0
+
\bar q_a^1
```

be Suzuki's scaled full Weil form.

The scaled background-only form is

```math
\boxed{
\bar q_{B',a}
=
\bar q^0
+
\left(
\bar q_a^1
+
p_a
\right).
}
```

The parenthesized term remains:

- bounded on (L^2(-1,1));
- locally uniformly bounded in (a);
- jointly continuous in ((a,w)) under (L^2) convergence.

Thus it belongs to exactly the same analytic class as Suzuki's original regular remainder.

No new singular term is introduced.

---

## 6. Upper semicontinuity of the background ground level

Fix (a_0>0).

Let

```math
w_0
```

be a normalized minimizer for

```math
\lambda_{B',a_0}.
```

Such a minimizer exists because a bounded finite-rank perturbation preserves closedness, lower boundedness, and compact-resolvent discreteness.

Approximate (w_0) in the background form norm by

```math
w_n
\in
C_c^\infty(-1,1),
\qquad
\|w_n\|_2=1.
```

For each fixed (n),

```math
a
\longmapsto
\bar q_{B',a}(w_n)
```

is continuous.

Hence

```math
\lambda_{B',a}
\le
\bar q_{B',a}(w_n),
```

and the same argument as Suzuki gives

```math
\boxed{
\limsup_{a\to a_0}
\lambda_{B',a}
\le
\lambda_{B',a_0}.
}
```

---

## 7. Lower semicontinuity

Let

```math
a_n\to a_0
```

and choose normalized minimizers

```math
w_n
```

for

```math
\lambda_{B',a_n}.
```

A fixed smooth test function gives a uniform upper bound for

```math
\lambda_{B',a_n}.
```

Now

```math
\lambda_{B',a_n}
=
\bar q^0(w_n)
+
\bar q_{a_n}^1(w_n)
+
p_{a_n}(w_n).
```

The finite selected term is nonnegative:

```math
p_{a_n}(w_n)
\ge0.
```

The regular Weil remainder

```math
\bar q_{a_n}^1(w_n)
```

is uniformly bounded on the (L^2) unit sphere for (a_n) in a compact neighborhood of (a_0).

Therefore the upper bound on (lambda_{B',a_n}) gives an upper bound on

```math
\bar q^0(w_n).
```

As in Suzuki's proof, ((w_n)) is bounded in

```math
H^{\log}(-1,1).
```

Compact embedding gives, after a subsequence,

```math
w_n
\to
w_*
```

strongly in (L^2(-1,1)), with

```math
\|w_*\|_2=1.
```

Lower semicontinuity gives

```math
\liminf
\bar q^0(w_n)
\ge
\bar q^0(w_*),
```

while joint continuity gives

```math
\bar q_{a_n}^1(w_n)
\to
\bar q_{a_0}^1(w_*),
```

and

```math
p_{a_n}(w_n)
\to
p_{a_0}(w_*).
```

Thus

```math
\boxed{
\liminf_{n\to\infty}
\lambda_{B',a_n}
\ge
\lambda_{B',a_0}.
}
```

---

## 8. Continuity theorem for the finite-enlarged background

Sections 6 and 7 give:

```math
\boxed{
a
\longmapsto
\lambda_{B',a}
\text{ is continuous}.
}
```

This is the finite-selected-background analogue of Suzuki's Theorem 1.3.

The proof uses no RH assumption.

It uses only:

1. Suzuki's fixed-interval logarithmic form decomposition;
2. compact embedding of (H^{\log}(-1,1)) into (L^2(-1,1));
3. finiteness and support-parameter continuity of the selected covariance.

---

## 9. Strict endpoint gap propagates

RPB-18 supplies

```math
\lambda_{B',c_*}
\ge
\eta_*
>
0.
```

By continuity, there exists

```math
\delta_*>0
```

such that

```math
\boxed{
\lambda_{B',a}
\ge
\frac{\eta_*}{2}
>
0
}
```

for

```math
|a-c_*|<\delta_*.
```

In particular,

```math
\boxed{
A_{B',a}
\succ0
\qquad
(c_*\le a<c_*+\delta_*).
}
```

Therefore the complementary negative background relative to the finite enlarged packet (Pi') remains strictly screenable on a genuine right neighborhood of the full neutral edge.

This closes the RPB-16 right-stability obstruction after finite nullspace-covering enlargement.

---

## 10. Consequence for post-plateau custody

By definition of the full plateau endpoint,

```math
\lambda_a^{\rm full}<0
\qquad
(a>c_*).
```

For

```math
c_*<a<c_*+\delta_*,
```

the (Pi')-background is strictly positive while the full form is negative.

Therefore WD-B4 applies throughout this entire right neighborhood.

The exact full defect is represented as

```math
\boxed{
D_{\rm full,a}
=
S_{{\rm eff},a}S_{{\rm eff},a}^{*}
-
S_{M',a}S_{M',a}^{*},
}
```

with

```math
\dim M'<\infty.
```

Since the full defect is negative,

```math
\boxed{
\text{one fixed finite residual selected sector }M'
\text{ owns the negative sign for every }
a\in(c_*,c_*+\delta_*).
}
```

Thus moving-background/sign-custody escape is excluded on this first post-neutral neighborhood after finite custody enlargement.

---

## 11. What this does not yet supply

The residual selected negative margin necessarily tends to zero as

```math
a\downarrow c_*,
```

because the full ground level tends to zero.

Therefore RPB-19 does not automatically produce the **uniform normalized negative-collapse hypothesis** of WD-T37:

```math
[z_n,z_n]_J
\to
-\kappa,
\qquad
\kappa>0.
```

The newly obtained branch is instead a fixed finite-dimensional selected crossing through a neutral endpoint.

It has secure custody, but its first-order/normalized crossing morphology remains to be typed.

So RPB-19 closes the **moving-custody** problem, not yet the `AZ-NEXTJET-LOC` forcing problem.

---

## 12. Updated neutral-to-negative chain

Combining RPB-10 through RPB-19 gives the branch-local chain

```math
\boxed{
\begin{aligned}
\text{attained neutral endpoint}
&\Longrightarrow
\text{finite neutral plateau}
\\
&\Longrightarrow
\text{full negative fall-through}
\\
&\Longrightarrow
\text{finite nullspace-covering packet }\Pi'
\\
&\Longrightarrow
\text{strict complementary-background gap at }c_*
\\
&\Longrightarrow
\text{background gap persists on a right neighborhood}
\\
&\Longrightarrow
\text{fixed finite residual selected custody of post-edge negativity}.
\end{aligned}
}
```

The earlier possibility that the first post-neutral sign is forced to move through arbitrarily high background coordinates is therefore eliminated after finite custody enlargement.

---

## 13. RPB-19 determination

```math
\boxed{
\textbf{RPB-19 — FINITE-ENLARGED BACKGROUND GAP PROPAGATES TO A RIGHT NEIGHBORHOOD.}
}
```

Exact new theorem:

```math
\boxed{
a
\longmapsto
\lambda_{B',a}
\text{ is continuous}
}
```

for every fixed finite selected packet (Pi').

Applied to the RPB-18 nullspace-covering packet:

```math
\boxed{
\exists\delta_*>0:
A_{B',a}\succ0
\quad
(c_*\le a<c_*+\delta_*).
}
```

Hence:

```math
\boxed{
\text{first post-neutral full negativity has fixed finite residual selected custody}.
}
```

Next cursor:

```text
RPB-20 / FINITE RESIDUAL SELECTED CROSSING → SOURCE CUSTODY
```

The next pass should determine whether the finite-dimensional residual crossing just obtained yields a nonzero selected zero-moment source in a form strong enough to enter the existing negative-morphology / next-jet machinery, or whether a new critical-crossing normalization is required.
