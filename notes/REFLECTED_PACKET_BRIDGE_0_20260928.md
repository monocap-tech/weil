# RPB-0 — Reflected-Packet / Weil Bridge: source gate and first object map

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **OPEN / NONCANONICAL RECONNAISSANCE**  
**Promotion status:** none. No Horizon-1 theorem, standing, dependency edge, or RH-facing interface is changed by this note.

## 0. Purpose

This branch investigates whether the fixed reflected-packet observable of

> Leonard van Hemert, *Reflected-Packet Weil Kernels: Zero Expansions, Growth Criteria, and Infinite Oscillation*

is merely another scalar RH criterion, or whether it exposes a physical carrier / matrix-coefficient object that can consume the existing Weil-defect theory.

The governing separation is

```math
\boxed{
\text{exact bridge reconstruction}
\quad\Vert\quad
\text{any new proof-producing implication}.
}
```

The first task is identification, not promotion.

---

## 1. Source gate

### 1.1 Reflected-packet source

Repository:

```text
LeonardSEO/reflected-packet-growth-criteria
```

Frozen publication commit inspected:

```text
700c8e0b4cabe6da64220363e6172cbf0d157856
```

Load-bearing files inspected at that snapshot include:

- `paper/sections/01_introduction.tex`
- `paper/sections/02_frozen_specification.tex` — blob `307fb5a23568c19f0ea8265f5735df6775d3c3a8`
- `paper/sections/03_prime_pole_interaction.tex` — blob `99c1622fc9680ee07f5bf7d24f7cb9d08bc50405`
- `paper/sections/04_explicit_formula.tex` — blob `706f997bdd83b0d1a5690f4b45c4bed1521abaf0`
- `paper/sections/05_growth_criteria.tex` — blob `6970f8aa983b19c378974cf34a4f3528a1cff7e2`
- `research/source_records/REFLECTED_FROZEN_SPECIFICATION.md` — blob `beee1f10f1d5c8e1610f9174bd23e787e0b5fdf1`
- `research/source_records/REFLECTED_MAIN_THEOREM.md` — blob `a7158021802d66b26dc88f8a9fcdff6c1c5f521f`
- `research/source_records/GROWTH_CRITERIA_PROOF.md` — blob `bb1ab906ba7eb75d3a6b9b8e7f5a5d87b73ef93a`

The source repository itself marks external review as pending. Its internal audits are evidence, not external certification.

### 1.2 Weil source

This branch starts from public Horizon-1 commit

```text
b019d40205680f9761a4b0a80cbcad56ee1b606b
```

in

```text
monocap-tech/weil
```

Primary comparison surfaces:

- `docs/ZETA_WEIL_SPECIALIZATION_MAP.md`
- `docs/EXPLICIT_FORMULA_ARITHMETIC_ATTACHMENT.md`
- `docs/NEGATIVE_DEFECT_MORPHOLOGY.md`
- `docs/NEUTRAL_DEFECT_MORPHOLOGY.md`
- `docs/RH_INTERFACE_APPENDIX.md`
- `docs/RESEARCH_MAP.md`

Horizon 1 remains complete at its stated stop boundary.

---

## 2. Terminology firewall

The word **packet** is overloaded across the two programs and must not be used unqualified in this branch.

### Physical probe packet

The reflected-packet source fixes one real even function

```math
h\in C_c^\infty(\mathbb R),
\qquad
\operatorname{supp}h=[-1/2,1/2],
```

constructed from an infinite dyadic convolution. In this branch call it the

```text
physical probe packet h
```

or simply the **probe**.

### Selected zero packet

Horizon 1 uses a finite selected packet (Pi) of zero-side negative channels / divisor coordinates. In this branch call it the

```text
selected zero packet Π
```

or **selected divisor packet**.

No inference may identify (h) with (Pi), or treat a theorem quantified over one as automatically quantified over the other.

---

## 3. Exact reflected-packet object

For (y>1/2), define the reflected translates

```math
h_y^{\mathrm R}(x)=h(x-y),
\qquad
h_y^{\mathrm L}(x)=h(x+y),
```

and parity combinations

```math
h_y^\pm
=
\frac{h_y^{\mathrm R}\pm h_y^{\mathrm L}}{\sqrt2}.
```

The source defines

```math
Q_h(y)
=
\mathfrak q(h_y^{\mathrm R},h_y^{\mathrm L})
```

and

```math
\Delta_h(y)
=
\mathfrak q[h_y^+]-\mathfrak q[h_y^-]
=
2Q_h(y).
```

Thus (Q_h) is not an auxiliary function placed beside the Weil form. It is a **cross matrix coefficient of the Weil preform** on a rigid one-parameter family of physical probes.

The packet transform is

```math
L_h(w)
=
\int_{-1}^{1}K_h(r)e^{wr}\,dr,
\qquad
K_h=h*h,
```

with exact divisor

```math
Z(L_h)
=
4\pi i\mathbb Z\setminus\{0\}.
```

Hence every off-critical zero is visible:

```math
\Re\rho\ne\frac12
\quad\Longrightarrow\quad
L_h\!\left(\rho-\frac12\right)\ne0.
```

After the prime/pole/archimedean cancellations, the cross coefficient has the exact zero-only expansion

```math
\boxed{
Q_h(y)
=
\sum_{\rho}^{\rm dist}
m_\rho
L_h\!\left(\rho-\frac12\right)
e^{2(\rho-1/2)y}.
}
```

The source then proves for every fixed (kappa\ge0)

```math
\boxed{
Q_h(y)=O(e^{\kappa y})
\iff
\Re\rho\le\frac12+\frac\kappa2
\text{ for every nontrivial zero }\rho.
}
```

This is a criterion theorem, not an independent proof of the required growth bound.

---

## 4. Exact semilocal embedding into the Horizon-1 physical carrier

The reflected source uses the complete compact-support preform

```math
\begin{aligned}
\mathfrak q(\Phi,\Psi)
={}&
\frac1{2\pi}
\int_{\mathbb R}
m_\infty(t)
\overline{\widehat\Phi(t)}\widehat\Psi(t)\,dt
\\
&+
\overline{\widehat\Phi(-i/2)}\widehat\Psi(i/2)
+
\overline{\widehat\Phi(i/2)}\widehat\Psi(-i/2)
\\
&-
\sum_{p,m\ge1}
\frac{\log p}{p^{m/2}}
\left[
C_{\Phi,\Psi}(m\log p)
+
C_{\Phi,\Psi}(-m\log p)
\right].
\end{aligned}
```

This has the same operator species as the compact-window form in Horizon 1:

```math
\mathcal W_c^{\rm ext}
=
\mathcal A_\infty
-
\sum_{\log n<2c}
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n})
+
\mathcal R_{\rm pole}.
```

The exact convention map still needs a line-by-line sign/factor certificate, but there is already an exact support-level bridge.

Since

```math
\operatorname{supp}h_y^{\mathrm R}
=
[y-1/2,y+1/2],
\qquad
\operatorname{supp}h_y^{\mathrm L}
=
[-y-1/2,-y+1/2],
```

both probes lie in ([-c,c]) whenever

```math
\boxed{c\ge y+\frac12.}
```

The reflected source proves that under precisely this support condition every prime power that can contribute to the cross term is already retained by the finite semilocal cutoff. Endpoint equality contributes zero because (K_h(\pm1)=0).

Therefore, at the minimal window

```math
c(y)=y+\frac12,
```

the finite semilocal form and the complete compact-support preform agree on the reflected pair.

This is the first bridge result:

```math
\boxed{
Q_h(y)
\text{ is a moving-window off-diagonal Weil matrix coefficient.}
}
```

More explicitly, modulo the final convention certificate identifying the form operator,

```math
Q_h(y)
=
\left\langle
W_{c(y)}h_y^{\mathrm R},
h_y^{\mathrm L}
\right\rangle,
\qquad
c(y)=y+\frac12.
```

This formula is currently a **bridge identification target**, not yet a promoted theorem, because the exact inner-product/operator normalization between the two repositories must still be certified.

---

## 5. The new object suggested by the bridge

The reflected construction naturally selects the moving two-dimensional physical subspace

```math
E_h(y)
=
\operatorname{span}
\{h_y^{\mathrm R},h_y^{\mathrm L}\}
\subset
L^2([-c(y),c(y)]).
```

The associated compressed form is a (2\times2) Hermitian matrix

```math
G_h(y)
=
\left(
\mathfrak q(h_y^i,h_y^j)
\right)_{i,j\in\{\mathrm R,\mathrm L\}}.
```

The reflected observable (Q_h(y)) is its off-diagonal entry, and

```math
\Delta_h(y)=2Q_h(y)
```

is the parity splitting between the normalized even and odd vectors in this moving two-plane.

This suggests that the primitive bridge object may not be (Q_h) alone, but the pair

```math
\boxed{
\bigl(W_{c(y)},E_h(y)\bigr)
}
```

or equivalently its (2\times2) compression (G_h(y)).

No claim is made yet that this is the final object of the Weil program.

---

## 6. Why this does not immediately consume the Horizon-1 interfaces

The parameter (y) simultaneously changes:

1. the separation of the two physical probes;
2. the minimal semilocal support radius (c(y)=y+1/2);
3. the set of active prime-power translations;
4. the physical two-plane (E_h(y)).

This differs from the principal Horizon-1 fixed-custody regimes.

### Negative branch

WD-T37 fixes a finite **selected zero packet** and derives a persistent selected source (v), zero moment, inverse-square far response, and a near completed-(\Xi) next-jet field.

The reflected construction instead fixes a **physical probe shape** (h) while moving its translates to infinity.

There is currently no proved implication

```math
\text{WD-T37 hypotheses}
\Longrightarrow
Q_h(y)=O(e^{\kappa y})
```

for any useful (kappa<1).

Therefore the reflected growth criterion does not presently discharge

```text
AZ-NEXTJET-LOC
```

or

```text
C-ACTUAL-KPH-FLOOR.
```

### Neutral branch

WD-T38 concerns a fixed endpoint null mode

```math
W_ck=0
```

and asks whether the same fixed relation transports to a strict right enlargement.

The reflected family uses moving vectors (h_y^{\mathrm R/L}) and a moving window (c(y)). It therefore does not directly solve

```text
AZ-FIN-WEIL-NULL-EXTENSION.
```

Any connection has to be proved rather than inferred from the common use of compact support.

---

## 7. First structural comparison

The two programs currently preserve different kinds of custody.

Horizon 1:

```math
\boxed{
\text{selected divisor source}
\to
\text{residue response}
\to
\text{near/far divisor geometry}.
}
```

Reflected packet:

```math
\boxed{
\text{fixed physical probe}
\to
\text{moving cross coefficient}
\to
\text{individual Laplace poles}.
}
```

In the reflected route, an off-critical zero produces a pole at its own transform point

```math
s=\rho-\frac12,
```

with nonzero residue because of the exact off-axis nonvanishing of (L_h).

This local-pole custody eliminates the need to select a rightmost off-line zero.

The bridge question is therefore not merely whether the two approaches are equivalent. It is whether one custody system can produce a quantitative statement in the other.

---

## 8. Investigation queue

### RPB-1 — Normalization certificate

Prove an exact convention map between:

- the reflected source preform (mathfrak q);
- Horizon-1 (Q_c);
- the physical operator (W_c) / (mathcal W_c^{\rm ext}).

Required output: exact factors, inner-product order, cutoff convention, endpoint convention, and Fourier signs.

### RPB-2 — Moving two-plane compression

Construct the exact (2\times2) compression (G_h(y)) inside the Horizon-1 carrier and prove the identification of (Q_h) and (Delta_h) as its cross/parity coordinates.

Questions:

- which entries depend only on separation and which depend on absolute placement?
- can the compression be represented using the existing (P_c,N_c) synthesis?
- what happens at a prime-power activation threshold?

### RPB-3 — Zero-side channel decomposition of the probe

Express (h_y^{\mathrm R/L}) in the ZW-0 / ZW-1 positive-negative pair coordinates.

Determine whether one off-axis pair contributes an explicitly hyperbolic mode to (Q_h(y)), and how this contribution sits relative to the selected/background split.

This is the first place a direct bridge to WD-T37 could exist.

### RPB-4 — Negative-morphology transfer test

Assume the lawful WD-T37 fixed-selected-source hypotheses and ask whether they force any of:

```math
|Q_h(y)|\ge c e^{\eta y}
```

along a tail or subsequence,

```math
Q_h(y)\not=O(e^{\kappa y}),
```

or a nonremovable transform singularity detectable without re-importing the full zero expansion.

A result here must be audited for circular use of the reflected RH-equivalence theorem.

### RPB-5 — Neutral/null transfer test

Test the moving reflected two-plane against a hypothetical fixed neutral mode (W_ck=0).

Determine whether null-extension or failure of null-extension creates a detectable signature in reflected matrix coefficients.

No assumption that a fixed neutral mode equals a reflected probe is permitted.

### RPB-6 — Threshold / collar geometry

The reflected cross term samples prime powers only in

```math
2y-1<\log n<2y+1.
```

As (y) varies, prime-power entries cross the two moving correlation boundaries.

Compare this exact moving-window arithmetic-delay geometry with the separate SZ/cross-collar traversal only after its source conventions are pinned. No equivalence is presumed.

### RPB-7 — Reverse forcing problem

The reflected paper leaves open the forcing statement:

```math
\boxed{
\text{why must }Q_h\text{ have bounded/subexponential growth?}
}
```

Determine whether Horizon-1 or post-Horizon structure can supply such control.

If the required statement is merely a reformulation of an already open actual-zeta interface, record the equivalence and stop.

If it is genuinely weaker or differently typed, isolate it as a new candidate interface before any promotion.

---

## 9. Circularity locks

The following arguments are forbidden in the bridge investigation:

1. using the reflected growth/RH equivalence to prove a statement that is then used as an independent proof of its own growth hypothesis;
2. assuming RH to identify a positive spectral measure and then using that measure to claim unconditional positivity;
3. identifying a physical probe packet with a selected zero packet;
4. using a finite-(y) semilocal equality as a uniform (y\to\infty) estimate;
5. treating internal audits of either repository as external review;
6. importing a post-Horizon claim into the Horizon-1 theorem DAG without a separate promotion pass.

---

## 10. RPB-0 determination

The investigation has a genuine bridge target.

What is already established at the source level is:

```math
\boxed{
\text{one fixed physical probe}
\xrightarrow{\text{reflected translation}}
\text{moving two-plane in the semilocal Weil carrier}
\xrightarrow{\mathfrak q}
Q_h(y)
\xrightarrow{\text{Laplace}}
\text{individual zero poles}.
}
```

The principal new observation for the Weil program is that the reflected object is not outside the existing form. It is a rigid **moving physical compression of the same Weil form**.

What is **not** established is any theorem forcing the required growth of (Q_h), or any implication from WD-T37/38/39 to the reflected criterion.

Therefore:

```math
\boxed{
\textbf{RPB-0: BRIDGE EXISTS / PROOF-PRODUCING TRANSFER OPEN.}
}
```

Next cursor:

```text
RPB-1 / EXACT NORMALIZATION CERTIFICATE
```
