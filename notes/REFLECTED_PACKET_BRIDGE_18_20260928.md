# RPB-18 — Neutral ground-state simplicity and selected nullspace coverage

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / SIMPLICITY UNNECESSARY / FINITE NULLSPACE-COVERING ENLARGEMENT EXISTS**  
**Dependencies:** RPB-11, RPB-17; ZW1-T9 native zero synthesis; Conrey critical-line simple-zero density; Suzuki 2026 discrete compact-window spectrum.  
**Promotion status:** none.

## 0. Objective

RPB-17 reduced the strict endpoint background-gap problem to

```math
\ker A_{c_*}
\cap
\ker S_M^*
=
\{0\}.
```

A simple full neutral eigenvalue would make this automatic for the original selected packet, but Suzuki's current simplicity theorem applies only for sufficiently small support and does not cover an arbitrary neutral edge.

RPB-18 asks whether simplicity is actually necessary.

It is not.

The full negative analysis map is injective on the finite-dimensional full nullspace. Therefore finitely many actual negative zero coordinates already remain injective on that nullspace. Completing those coordinates to a finite symmetric zero packet gives a **nullspace-covering selected packet**.

Hence, after a finite enlargement of selected custody,

```math
\boxed{
\ker A_{c_*}
\cap
\ker S_{M_{\Pi'}}^*
=
\{0\}.
}
```

The corresponding background-only operator has a strict positive physical spectral gap at the neutral edge.

---

## 1. Source gate: simplicity is only local near (a=0)

Current source:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3,
September 2026.
```

Suzuki proves:

```math
\lambda_a
\text{ is continuous in }a
```

for every (a>0), and proves that for sufficiently small (a>0) the lowest eigenvalue is positive, simple, and has an even eigenfunction.

The simplicity argument uses a small-(a) limiting operator with a positivity-improving semigroup.

No theorem in the current source states simplicity of the lowest eigenvalue at an arbitrary neutral support

```math
c_*.
```

Therefore RPB-18 does not import arbitrary-edge simplicity.

---

## 2. Full nullspace is finite dimensional

Let

```math
A_*
=
A_{c_*}
```

be the canonical compact-window Weil operator at the neutral edge.

The full form is nonnegative and degenerate:

```math
A_*\succeq0,
\qquad
N_*:=\ker A_*\ne\{0\}.
```

The compact-window spectrum is discrete and lower bounded, with (+infty) as its only accumulation point.

Hence

```math
\boxed{
\dim N_*<\infty.
}
```

This finite dimensionality is the only multiplicity input needed below.

---

## 3. Full zero-side analysis of a null mode

Work under the same carrier-identification hypothesis used by the Horizon-1 zero-side/physical realization.

Let

```math
E_*:
K_+\oplus K_-
\to
\mathcal H_*
```

be the full zero-side synthesis and write

```math
E_*^*h
=
(S_+^*h,S_-^*h).
```

For every (h\in N_*),

```math
0
=
\langle A_*h,h\rangle
=
\|S_+^*h\|^2
-
\|S_-^*h\|^2.
```

Suppose

```math
S_-^*h=0.
```

Then necessarily

```math
S_+^*h=0.
```

Thus

```math
\boxed{
E_*^*h=0.
}
```

To prove injectivity of the full negative analysis on (N_*), it is therefore enough to prove that no nonzero compact-window physical vector is invisible to **all** zero-side channels.

---

## 4. Critical-line coordinates already separate the physical carrier

The native Problem-1 zero synthesis uses the Dirichlet Green metric.

Let

```math
L
=
-\partial_u^2+\frac14
```

on

```math
[-c_*,c_*]
```

with Dirichlet boundary conditions, and let

```math
G=L^{-1}.
```

For a critical-line ordinate (gamma\in\mathbb R), the native zero channel is generated, up to the fixed nonzero Bombieri/Green normalization, by

```math
f_\gamma(u)=e^{-i\gamma u}.
```

Therefore the corresponding adjoint coordinate of a physical vector (h) in the native (H_L^{-1}) realization is, up to a nonzero scalar factor,

```math
\begin{aligned}
\langle h,f_\gamma\rangle_{H_L^{-1}}
&=
\langle h,Gf_\gamma\rangle_{L^2}
\\
&=
\langle Gh,f_\gamma\rangle_{L^2}.
\end{aligned}
```

Thus vanishing of every critical-line positive coordinate implies

```math
\boxed{
\widehat{Gh}(\gamma)=0
}
```

at every critical-line zeta ordinate, with the harmless Fourier-sign convention suppressed.

---

## 5. Conrey density gives physical analysis injectivity

Because (h\in L^2(-c_*,c_*)), the Dirichlet Green image

```math
Gh
```

belongs to (H_0^1(-c_*,c_*)), hence to (L^1) on the finite interval.

Its zero extension has compact support, so

```math
F_h(z)
:=
\widehat{Gh}(z)
```

is entire of finite exponential type.

If (E_*^*h=0), then all critical-line positive coordinates vanish, so

```math
F_h(\gamma)=0
```

at every simple critical-line zero ordinate (gamma).

Conrey's unconditional theorem gives

```math
\gg
T\log T
```

distinct simple critical-line ordinates up to height (T).

But a nonzero entire function of finite exponential type has only

```math
O(T)
```

zeros in (|z|\le T), by the Jensen estimate already used in RPB-11.

Therefore

```math
F_h\equiv0.
```

Fourier injectivity gives

```math
Gh=0.
```

Since the Dirichlet operator (L) is invertible,

```math
\boxed{
h=0.
}
```

Thus the full zero-side analysis is injective on the physical carrier:

```math
\boxed{
E_*^*h=0
\Longrightarrow
h=0.
}
```

For RPB-18 only the restriction to (N_*) is needed.

---

## 6. Full negative analysis is injective on the nullspace

Return to

```math
h\in N_*.
```

If

```math
S_-^*h=0,
```

Section 3 gives

```math
E_*^*h=0.
```

Section 5 then gives

```math
h=0.
```

Therefore

```math
\boxed{
S_-^*|_{N_*}
:
N_*
\to
K_-
\text{ is injective}.
}
```

This is the decisive replacement for arbitrary-edge ground-state simplicity.

Every nonzero full null mode owns some nonzero negative zero-side coordinate.

---

## 7. Finite dimensionality upgrades injectivity to a uniform lower bound

Since

```math
\dim N_*<\infty
```

and

```math
S_-^*|_{N_*}
```

is injective, compactness of the unit sphere of (N_*) gives

```math
\boxed{
\exists\sigma_*>0:
\|S_-^*h\|
\ge
\sigma_*\|h\|
\qquad
(h\in N_*).
}
```

This is only a finite-dimensional lower bound on the full negative analysis restricted to the nullspace.

It is not a global lower-frame theorem for the infinite negative synthesis.

---

## 8. Finite negative coordinates retain injectivity

Let

```math
P_G^-:K_-\to K_-
```

be a canonical increasing finite-coordinate exhaustion with

```math
P_G^-\to I
```

strongly.

On the finite-dimensional space (N_*), strong convergence is uniform on the unit sphere after composition with the fixed linear map (S_-^*|_{N_*}):

```math
\boxed{
\|(I-P_G^-)S_-^*|_{N_*}\|
\longrightarrow0.
}
```

Choose (G_*) so that

```math
\|(I-P_{G_*}^-)S_-^*|_{N_*}\|
<
\frac{\sigma_*}{2}.
```

Then for (h\in N_*),

```math
\begin{aligned}
\|P_{G_*}^-S_-^*h\|
&\ge
\|S_-^*h\|
-
\|(I-P_{G_*}^-)S_-^*h\|
\\
&\ge
\frac{\sigma_*}{2}\|h\|.
\end{aligned}
```

Hence

```math
\boxed{
P_{G_*}^-S_-^*|_{N_*}
\text{ is injective}.
}
```

This is **finite nullspace capture**.

---

## 9. Symmetric-packet completion

The finite coordinate head selected in Section 8 may be completed, if necessary, under:

- conjugation;
- functional-equation reflection;
- pair-coordinate conventions;
- multiplicity quotient conventions.

This adds only finitely many coordinates.

Let

```math
\Pi'
```

be the resulting finite symmetric zero packet and

```math
M_{\Pi'}
```

its negative pair-coordinate sector.

Because enlarging the retained negative coordinate set cannot destroy injectivity,

```math
\boxed{
N_*
\cap
\ker S_{M_{\Pi'}}^*
=
\{0\}.
}
```

Thus (Pi') is a nullspace-covering selected packet.

It may strictly contain the original finite-exception packet.

---

## 10. Finite enlargement gives a strict endpoint background physical gap

Relative to (Pi'), the background-only operator at the neutral edge is

```math
A_{B',*}
=
A_*
+
S_{M_{\Pi'}}S_{M_{\Pi'}}^*.
```

As in RPB-17,

```math
\ker A_{B',*}
=
N_*
\cap
\ker S_{M_{\Pi'}}^*.
```

By Section 9 this kernel is trivial.

The finite-rank selected covariance preserves discreteness of the compact-window spectrum.

Therefore

```math
\boxed{
\exists\eta_*>0:
A_{B',*}
\succeq
\eta_*I.
}
```

So a strict **background physical spectral gap always exists after some finite enlargement of selected custody**.

This conclusion does not require simplicity of the neutral ground state.

---

## 11. What remains open for the original selected packet

RPB-18 does not prove

```math
N_*
\cap
\ker S_{M_\Pi}^*
=
\{0\}
```

for the original finite-exception packet (Pi).

So original-packet full-nullspace coverage remains optional.

What is proved is:

```math
\boxed{
\exists
\text{ finite symmetric enlargement }
\Pi'\supseteq\Pi
\text{ with full-nullspace coverage}.
}
```

Thus neutral multiplicity can force finite custody enlargement, but it cannot force an infinite selected packet at the endpoint.

---

## 12. Parity no longer creates an infinite obstruction

If (N_*) contains null modes of both parities while the original packet detects only one parity block, the original packet may fail coverage.

But Section 8 can select additional negative coordinates from whatever parity blocks are needed.

Because the full negative analysis is injective on all of (N_*), the finite enlargement can cover both parity components simultaneously.

Hence parity can enlarge the required finite packet, but does not obstruct finite nullspace capture.

---

## 13. Relation to RPB-17

RPB-17 identified:

```math
\text{background endpoint gap}
\iff
\text{selected coverage of the full nullspace}.
```

At that pass, coverage for the original packet was open.

RPB-18 adds:

```math
\boxed{
\text{full nullspace}
\xrightarrow{S_-^*\text{ injective}}
\text{finite negative-coordinate capture}
\xrightarrow{\text{symmetric completion}}
\text{finite nullspace-covering packet}.
}
```

Therefore the endpoint **physical** background-gap problem is closed after finite custody enlargement.

What remains is right-neighborhood propagation of that strict gap.

---

## 14. Metric separation remains

The theorem

```math
A_{B',*}\succeq\eta_*I
```

is a physical (L^2)-spectral gap.

It is not automatically the coefficient-space statement

```math
\|X_{B',c_*}\|<1.
```

However, for the immediate next problem—right-neighborhood nonnegativity of the physical background operator—the physical gap is the directly relevant quantity.

A suitable support-parameter form/operator continuity theorem would propagate it.

No such propagation is asserted in RPB-18.

---

## 15. RPB-18 determination

```math
\boxed{
\textbf{RPB-18 — ARBITRARY-EDGE SIMPLICITY IS UNNECESSARY.}
}
```

Exact chain:

```math
\boxed{
\begin{aligned}
&\dim\ker A_{c_*}<\infty,
\\
&S_-^*|_{\ker A_{c_*}}
\text{ injective},
\\
&\Longrightarrow
\exists\text{ finite symmetric packet }\Pi'
\text{ with }
\ker A_{c_*}\cap\ker S_{M_{\Pi'}}^*=\{0\},
\\
&\Longrightarrow
A_{B',c_*}\succeq\eta_*I
\text{ for some }\eta_*>0.
\end{aligned}
}
```

Current status:

```math
\boxed{
\text{endpoint background physical gap: FINITELY RECOVERABLE}.
}
```

Next cursor:

```text
RPB-19 / PROPAGATE FINITE-ENLARGED BACKGROUND GAP TO A RIGHT NEIGHBORHOOD
```

The next pass should test whether Suzuki's fixed-interval scaling/form-continuity argument extends from the full lowest eigenvalue to the background-only operator obtained by adding the finite selected covariance associated with (Pi').
