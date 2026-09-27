# SZ Screw-Family Parallel Investigation — Source Pins

**Date:** 2026-09-27  
**Branch:** `research/sz-screw-family-0`  
**Standing:** OPEN / RECONNAISSANCE  
**Canonical effect:** NONE. This branch does not move `SZ-CROSS-COLLAR-3`, alter Horizon-1 theorem standing, or promote any GERM residue.

## Scope

This file pins the external statements needed to investigate whether the Matsumoto–Suzuki family of screw functions supplies more than one independent finite-window observable.

The governing question is not whether several RH-equivalent screw functions exist. That is source-attested. The governing question is whether their distinctions survive transfer into the specific finite-window/collar defect space relevant to the current SZ traversal.

No such transfer is assumed here.

---

## EXT-SF1 — Matsumoto–Suzuki one-parameter family

### Source

Kohji Matsumoto and Masatoshi Suzuki, *M-functions and screw functions: applications to Goldbach's problem and zeros of the Riemann zeta-function*, Journal of Number Theory **280** (2026), 918–946.

arXiv:2409.00888v2.

### Exact pins

**Equation (1.9)** defines, for real `ell`,

```math
H_\ell(X)
=
\sum_\rho
\frac{X^{\rho-1/2}}
{(\rho-\ell)((1-\rho)-\ell)},
\qquad X\ge 1.
```

The sum is over nontrivial zeta zeros with multiplicity.

The text immediately following (1.9) states:

- `H_1` is the special case in equation (1.5);
- `H_{1/2}(e^t)-H_{1/2}(1)` becomes the zeta screw function studied by Suzuki previously.

**Equation (2.1) and the coefficient display immediately following it** give

```math
a_{H_\ell}(\omega)
=
\frac{2m_\omega}
{(1/2-i\omega-\ell)(1/2+i\omega-\ell)}.
```

For a real critical-line parameter `omega`, Section 2.3 records

```math
\left|
\frac{1}
{(\rho-\ell)((1-\rho)-\ell)}
\right|
=
\frac{1}
{\omega^2+(\ell-1/2)^2}.
```

**Proposition 4.1** gives the abstract screw-function criterion for a pair `Pi=(Omega,a)`.

**Corollary 4.1** states

```math
g_{H_\ell}(t)
:=
H_\ell(e^t)-H_\ell(1)
```

is a screw function on `R` if and only if RH holds.

### Imported standing

```math
\boxed{\text{SOURCE-PINNED / IMPORTED}}
```

### What this source does NOT supply

It does not, by itself, identify the finite-interval Weil operator attached to `g_{H_\ell}` for general `ell`, nor does it prove that the `ell\ne1/2` members act independently on the current SZ collar defect.

Those are internal research obligations.

---

## EXT-SF2 — Suzuki's finite-window Weil carrier

### Source

Masatoshi Suzuki, *Weil's quadratic form via the screw function*, arXiv:2606.09096, 2026. Current source version inspected: September 25, 2026.

### Exact pins

In the introduction Suzuki states that the screw-function approach converts the Weil quadratic form from its distributional formulation into one using continuous functions.

**Equation (1.3)** defines the continuous zeta screw function `g(t)` by the explicit-formula expression containing the archimedean contribution and the prime-power sum

```math
\sum_{n\le e^{|t|}}
\frac{\Lambda(n)}{\sqrt n}
(|t|-\log n).
```

The text immediately following identifies this `g` as the screw function associated with `zeta(s)` and cites the earlier equivalence with RH.

**Equation (1.4)** defines the convolution/difference-kernel operator

```math
(Gu)(x)
=
\int_{-\infty}^{\infty}
g(x-y)u(y)\,dy.
```

The introduction further states that localization to `[-a,a]` yields the finite-interval nonlocal operator framework used to study the Weil quadratic form.

### Imported standing

```math
\boxed{\text{SOURCE-PINNED / CONTEXTUAL AT ENTRY}}
```

It remains contextual for this branch until an exact map from general `H_\ell` to the finite-window Weil/collar equations is derived and audited.

---

## EXT-SF3 — Existing repository compact-window pin

The canonical repository already pins Zhu's compact-window explicit formula in `docs/IMPORTED_SOURCE_PINS.md`.

The retained convention is

```math
\log n<2c
```

for the prime-power terms active at support radius `c`, with strict inequality at thresholds.

This branch inherits that convention without modification.

---

## Custody guards

1. **No equivalence-to-transfer shortcut.**  
   `g_{H_\ell}` being RH-equivalent does not imply that a neutral vector for the `ell=1/2` finite-window carrier obeys the `ell\ne1/2` finite-window equation.

2. **No shared-divisor shortcut.**  
   Common dependence on the zeta zero set does not identify coefficient spaces, finite-window domains, or boundary traces.

3. **No rank promotion from the ambient spectrum.**  
   Algebraic independence of spectral weights does not imply independence after finite-window projection.

4. **No cursor movement.**  
   The canonical SZ cursor remains `SZ-CROSS-COLLAR-3`. This branch may generate candidates for later ratification only.

5. **Re-entry requires an audited intertwiner.**  
   Any result used against `SZ-CROSS-COLLAR-3` must explicitly identify the carrier map, support convention, defect variables, and rank statement.

---

## First internal target

Define the finite post-`p` overlap defect space `D_post`. For each admissible `ell`, derive—rather than assume—a linear observable

```math
L_\ell:D_{\mathrm{post}}\to\mathbb C
```

from the corresponding finite-window screw identity.

The decisive quantity is

```math
\boxed{
\operatorname{rank}
\operatorname{span}\{L_\ell:\ell\in\mathbb R\}.
}
```

The branch is useful only if this rank exceeds the rank supplied by the existing `ell=1/2` carrier.
