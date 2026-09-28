# RPB-10 — Screw-potential / neutral null-extension test

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / NEUTRAL INTERFACE REFACTORED AS SIGN-PERSISTENCE DICHOTOMY**  
**Dependencies:** RPB-8, RPB-9, Horizon-1 WD-T38 / `AZ-FIN-WEIL-NULL-EXTENSION`.  
**Promotion status:** none.

## 0. Objective

Horizon 1 leaves the attained-neutral branch at the interface

```text
AZ-FIN-WEIL-NULL-EXTENSION
```

asking whether a nonzero endpoint neutral mode continues to satisfy the correct compact-window equation under strict right enlargement.

RPB-9 showed that Suzuki's screw function is a continuous potential for the same translation-invariant Weil kernel.

RPB-10 asks whether that potentialization turns the null-extension problem into a more rigid continuous-kernel statement.

The result is stronger but different:

1. the canonical screw factorization does **not** directly apply to every Horizon-1 neutral mode, because its first-order factorization is initially defined on (H_0^1), while the canonical Friedrichs operator has a larger domain;
2. nevertheless, the localized Weil forms are nested restrictions of one global form, so the zero-extended endpoint mode keeps quadratic value exactly zero on every larger support;
3. hence the fixed-mode extension problem collapses to a spectral-sign dichotomy:
   ```math
   \lambda_b=0
   \Longrightarrow
   \text{the same fixed mode is automatically in }\ker A_b,
   ```
   while
   ```math
   \lambda_b<0
   \Longrightarrow
   \text{the enlarged form has entered a negative regime}.
   ```

Thus the neutral interface is not an independent unique-continuation problem at the quadratic-form level.

---

## 1. Suzuki source gate

Primary source:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3,
version of September 23/25, 2026.
```

The source records:

- (L^2(-a,a)) as a subspace of (L^2(\mathbb R)) by zero extension;
- the localized closed Weil form (Q_W^a);
- its associated canonical self-adjoint operator (A_a);
- the continuous screw convolution (G_a);
- the symmetric first-order-factorized operator
  ```math
  B_a=D^*G_aD,
  \qquad
  \mathfrak D(B_a)=H_0^1(-a,a);
  ```
- Theorem 1.1:
  ```math
  A_a
  \text{ is the Friedrichs extension of }B_a;
  ```
- the explicit warning that
  ```math
  \mathfrak D(A_a)
  \supsetneq
  H_0^1(-a,a);
  ```
- Theorem 1.3:
  the lowest eigenvalue (lambda_a) is continuous in (a).

The arguments below use only these unconditional statements and elementary closed-form spectral theory.

---

## 2. Endpoint neutral setup

Assume the Horizon-1 attained-neutral branch with carrier identification.

Thus for some (c>0) there is a nonzero physical mode

```math
k\ne0
```

such that the localized Weil form is nonnegative at the endpoint and

```math
\boxed{
A_ck=0.
}
```

Equivalently,

```math
\boxed{
Q_W^c(k)=0.
}
```

Let (widetilde k) denote its zero extension to the whole line.

For every (b>c), regard the same (widetilde k) as an element of (L^2(-b,b)).

The localized forms are restrictions of the same global Weil form, so

```math
\boxed{
Q_W^b(\widetilde k)
=
Q_W^c(k)
=
0.
}
```

No new prime/pole/archimedean contribution is created merely because the ambient support window is enlarged: the test function itself is unchanged.

At a support threshold, any newly allowed translation whose shift equals the full diameter of the old support has only null-measure overlap with the zero-extended (L^2) vector. Thus the strict/right-limit convention does not change this quadratic value.

---

## 3. Lowest-eigenvalue monotonicity

Define

```math
\lambda_a
=
\inf_{0\ne f\in\mathfrak D(Q_W^a)}
\frac{
Q_W^a(f)
}{
\|f\|_2^2
}.
```

If

```math
a<b,
```

then zero extension gives an inclusion of the localized form domains, so the variational class only grows.

Therefore

```math
\boxed{
\lambda_b
\le
\lambda_a.
}
```

At the neutral endpoint,

```math
Q_W^c\ge0
```

and (Q_W^c(k)=0), hence

```math
\boxed{
\lambda_c=0.
}
```

Consequently, for every (b>c),

```math
\boxed{
\lambda_b\le0.
}
```

The enlarged compact-window problem can never return to a strictly positive ground level while the same zero-valued test remains available.

---

## 4. Fixed-mode persistence whenever the enlarged form remains nonnegative

Fix (b>c).

Suppose

```math
\lambda_b=0.
```

Since (lambda_b) is the bottom of the spectrum, this is equivalent to

```math
Q_W^b\ge0.
```

Let (A_bge0) be the associated self-adjoint operator.

For its closed nonnegative quadratic form,

```math
Q_W^b(f)
=
\|A_b^{1/2}f\|_2^2.
```

But the zero-extended endpoint mode satisfies

```math
Q_W^b(\widetilde k)=0.
```

Hence

```math
A_b^{1/2}\widetilde k=0.
```

By the spectral theorem this implies

```math
\widetilde k\in\mathfrak D(A_b)
```

and

```math
\boxed{
A_b\widetilde k=0.
}
```

Therefore:

```math
\boxed{
\lambda_b=0
\Longrightarrow
\text{the same fixed endpoint mode persists as an exact null mode at support }b.
}
```

No exterior unique-continuation theorem is required for this implication.

---

## 5. The only alternative is negative spectral fall-through

Again fix (b>c).

Since

```math
\lambda_b\le0,
```

the only alternative to (lambda_b=0) is

```math
\boxed{
\lambda_b<0.
}
```

Then there exists a physical test in the enlarged support with strictly negative Weil quadratic value.

Thus the exact right-enlargement dichotomy is

```math
\boxed{
\begin{cases}
\lambda_b=0
&
\Longrightarrow
\widetilde k\in\ker A_b,
\\[1mm]
\lambda_b<0
&
\Longrightarrow
\text{the enlarged full Weil form has a negative direction}.
\end{cases}
}
```

This is the **neutral sign-persistence dichotomy**.

### Custody warning

The second branch is a negative **full compact-window form** statement.

It does not by itself identify:

- the same selected packet (Pi);
- the same selected negative source;
- a WD-T37 fixed-packet negative morphology.

A separate selected-custody step is required before feeding this negative direction into the existing negative morphology theorem.

---

## 6. Continuity organizes the right side into a plateau

Suzuki's Theorem 1.3 gives continuity of

```math
a\longmapsto\lambda_a.
```

Combined with the monotonicity above and (lambda_c=0), the set

```math
\{a\ge c:\lambda_a=0\}
```

is an initial interval.

Define

```math
c_*
=
\sup
\{a\ge c:\lambda_a=0\}.
```

Then, subject to the usual convention if the set is unbounded:

```math
\boxed{
\lambda_a=0
\quad
(c\le a\le c_*),
}
```

and if (c_*<\infty),

```math
\boxed{
\lambda_a<0
\quad
(a>c_*).
}
```

By Section 4, throughout the whole zero plateau,

```math
\boxed{
\widetilde k\in\ker A_a.
}
```

So the same endpoint mode persists automatically until the first support at which the bottom of the compact-window spectrum becomes negative.

There is no third possibility in this full-form spectral classification.

---

## 7. Relation to the old null-extension interface

Horizon 1 formulated

```text
AZ-FIN-WEIL-NULL-EXTENSION
```

as a fixed-vector support/right-limit problem.

RPB-10 shows that, at the level of the canonical localized closed forms, the interface can be sharpened.

The actual question is not:

> can one somehow prove by unique continuation that the endpoint null equation propagates into a collar?

Instead:

```math
\boxed{
\text{does the lowest compact-window spectral value stay at zero,
or does it become negative?}
}
```

If it stays zero, the fixed mode already persists by form theory.

If it becomes negative, the neutral branch has exited into a negative full-form regime.

Thus the prior interface overstates the independent support-rigidity burden.

---

## 8. What the screw factorization adds — and what it cannot add automatically

Suzuki gives

```math
B_a
=
D^*G_aD,
\qquad
\mathfrak D(B_a)
=
H_0^1(-a,a),
```

and proves that (A_a) is its Friedrichs extension.

A tempting argument would be

```math
A_ak=0
\Longrightarrow
D^*G_aDk=0.
```

This is **not valid for a general canonical neutral mode**, because Suzuki explicitly notes

```math
\mathfrak D(A_a)
\supsetneq
H_0^1(-a,a).
```

The Horizon-1 neutral mode is only known to lie in the form/operator domain supplied by carrier identification.

Therefore the continuous-kernel factorization cannot be applied to (k) without an additional regularity theorem.

This blocks the naive direct screw-collar argument.

---

## 9. Stronger continuous-kernel null equation under an extra (H_0^1) hypothesis

Assume additionally that for some support (b),

```math
\widetilde k
\in
H_0^1(-b,b).
```

Then (widetilde k\in\mathfrak D(B_b)), and because (A_b) is an extension of (B_b),

```math
A_b\widetilde k=0
\Longrightarrow
B_b\widetilde k=0.
```

Hence

```math
D^*G_bD\widetilde k=0.
```

Now

```math
D\widetilde k
\in
L_0^2(-b,b)
```

because the Dirichlet endpoint values vanish, and by definition

```math
G_b:
L_0^2(-b,b)
\to
L_0^2(-b,b).
```

Let

```math
u
=
G_bD\widetilde k.
```

Then

```math
D^*u=0.
```

The kernel of (D^*) consists of constants, while (u) has zero mean.

Therefore

```math
\boxed{
G_bD\widetilde k=0.
}
```

Under the additional (H_0^1) regularity, the neutral mode therefore yields a genuine null equation for Suzuki's compact continuous-kernel operator.

This is stronger analytically than the distributional compact-window equation.

It is not unconditional in the present Horizon-1 branch.

---

## 10. Consequences for the screw-potential program

The screw representation contributes two useful facts to the neutral branch.

### A. It organizes the support parameter spectrally

Suzuki proves continuity of the ground level (lambda_a), turning the right-enlargement problem into a continuous monotone zero-plateau/negative-fall-through picture.

### B. Under additional (H_0^1) regularity, it lowers the null equation to

```math
G_aDk=0,
```

a continuous compact-kernel equation.

But it does not supply that regularity for the canonical neutral mode for free.

So the screw framework simplifies the neutral interface without yet yielding an unconditional contradiction.

---

## 11. Does RPB-10 close the neutral branch?

Not globally.

It closes the **independent null-extension uncertainty under continued nonnegativity**:

```math
\boxed{
Q_W^b\ge0
\Longrightarrow
\widetilde k\in\ker A_b.
}
```

What remains is a global alternative:

1. the same nonzero neutral mode persists along a zero spectral plateau; or
2. the full compact-window form becomes negative at some larger support.

The second case must be routed back through selected negative-sector custody before WD-T37 can be invoked.

The first case is now a sharply defined new problem: can a nonzero compactly supported mode remain in the kernel of every sufficiently large localized Weil operator?

That is a different question from the original local collar interface.

---

## 12. Next target

The correct next pass is to test the persistent-plateau alternative.

If

```math
\widetilde k\in\ker A_a
```

for all arbitrarily large (a), then for every compactly supported test (h),

```math
\mathfrak q(\widetilde k,h)=0
```

once (a) contains both supports.

Thus (widetilde k) becomes a global null vector for the Weil distribution.

On the zero side, such a relation should force the Fourier transform of (widetilde k) to vanish on a divisor whose counting density may exceed what a nonzero finite-exponential-type entire function can support.

That route must be checked without assuming RH or positivity of the global form.

Next cursor:

```text
RPB-11 / GLOBAL NEUTRAL PLATEAU AND ENTIRE-ZERO DENSITY
```

---

## 13. RPB-10 determination

```math
\boxed{
\textbf{RPB-10 — NEUTRAL NULL-EXTENSION REFACTORED.}
}
```

At current branch standing:

```math
\boxed{
\text{endpoint neutral mode}
\Longrightarrow
\begin{cases}
\text{automatic fixed-mode persistence while }\lambda_a=0,\\
\text{negative full-form fall-through when }\lambda_a<0.
\end{cases}
}
```

The screw potential provides a stronger continuous-kernel null equation only under an additional (H_0^1) regularity hypothesis.

No RH closure is claimed.
