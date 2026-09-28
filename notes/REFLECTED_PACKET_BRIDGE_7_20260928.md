# RPB-7 — Zero-moment to Mellin-cancellation test

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO-GO / FINITE MELLIN-MOMENT ROUTE EXHAUSTED**  
**Dependencies:** RPB-0 through RPB-6.  
**Promotion status:** none.

## 0. Objective

RPB-6 rewrote the polarized bridge in multiplicative scale as

```math
m_{\rho_j}\widetilde W(\rho_j)=v_j
\qquad
(\rho_j\in\Pi),
```

where (v) is the finite selected raw source supplied by WD-T37, and

```math
\mathbf 1^Tv=0.
```

RPB-7 asks whether that zero-moment law forces any additional Mellin moment, jet, annihilation, or prime-side cancellation capable of improving the large-scale exponent.

It does not.

The zero-moment law becomes one finite linear relation among the **selected Mellin samples**. It imposes no canonical value or jet condition at any other Mellin point.

More strongly, one may preserve the same selected source while imposing arbitrarily many additional finite Mellin moment cancellations. Those cancellations do not improve the power exponent because the selected off-axis pole remains.

---

## 1. Exact Mellin translation of the zero-moment law

By RPB-6,

```math
v_j
=
m_{\rho_j}\widetilde W(\rho_j).
```

Therefore

```math
\mathbf1^Tv=0
```

is exactly

```math
\boxed{
\sum_{\rho_j\in\Pi}
m_{\rho_j}
\widetilde W(\rho_j)
=
0.
}
```

This is a relation among finitely many values of the Mellin transform at the selected zeta zeros.

It is **not** any of the following:

```math
\widetilde W(0)=0,
\qquad
\widetilde W(1)=0,
\qquad
\widetilde W'(0)=0,
\qquad
\widetilde W'(1)=0.
```

Nor does it canonically identify a polynomial moment

```math
\int_0^\infty u^kW(u)\,du.
```

Those are evaluations of (widetilde W) at entirely different points.

---

## 2. Independent finite Mellin-value freedom

Let

```math
S
=
\{s_1,\ldots,s_M\}
```

be any finite set of complex points disjoint from the selected zeros.

Fix arbitrary target values

```math
\beta_1,\ldots,\beta_M.
```

The finite interpolation construction of RPB-3 can be applied simultaneously to the union

```math
\Pi\cup S.
```

Hence there exist compact probes (f,g) for which the associated multiplicative weight (W) satisfies

```math
\boxed{
m_{\rho_j}\widetilde W(\rho_j)
=
v_j
\quad
(\rho_j\in\Pi)
}
```

and independently

```math
\boxed{
\widetilde W(s_k)
=
\beta_k
\quad
(k=1,\ldots,M).
}
```

Therefore no value of (widetilde W) away from the selected set is forced by the zero-moment relation.

In particular, for the same fixed selected source one may realize different probes with

```math
\widetilde W(1)=0
```

or

```math
\widetilde W(1)=1,
```

and similarly at (s=0) or any other finitely prescribed nonselected point.

Thus the pole-null / zero-mean gauge of RPB-6 is optional, not a consequence of WD-T37 zero moment.

---

## 3. Finite Mellin-jet interpolation

The same freedom extends to finitely many derivatives.

For a compact logarithmic probe (f),

```math
\widehat f^{(r)}(z)
=
\int
(-ix)^r f(x)e^{-izx}\,dx.
```

Suppose a finite linear combination of evaluation jets vanished on every (f\in C_c^\infty(I)):

```math
\sum_{j,r}
c_{j,r}
\widehat f^{(r)}(z_j)
=
0.
```

Then

```math
\sum_{j,r}
c_{j,r}
(-ix)^r e^{-iz_jx}
=
0
```

on the interval (I).

The functions

```math
x^r e^{-iz_jx}
```

for distinct (z_j) and finite jet orders are linearly independent. This follows, for example, by applying the corresponding products of differential operators ((D+iz_j)) to isolate the highest polynomial degree at each frequency.

Hence the finite Fourier-jet evaluation map is surjective.

Using the factorization

```math
M_{f,g}(w)
=
\overline{\widehat f(-i\overline w)}
\widehat g(iw),
```

one first chooses (g) with prescribed constant/nonzero finite jets and then chooses (f) to realize the required product jets.

Therefore, at any finite collection of nonselected Mellin points, one can prescribe

```math
\boxed{
\widetilde W^{(r)}(s_k)
}
```

arbitrarily while preserving the selected source data.

So no finite Mellin jet away from the selected zeros is forced by

```math
\mathbf1^Tv=0.
```

---

## 4. Arbitrarily high finite vanishing-moment gauges

For any integer (M\ge1), impose

```math
\widetilde W(1)
=
\widetilde W(2)
=
\cdots
=
\widetilde W(M)
=
0
```

while retaining

```math
m_{\rho_j}\widetilde W(\rho_j)
=
v_j.
```

This is allowed because nontrivial zeta zeros do not coincide with the positive integers.

Since

```math
\widetilde W(k+1)
=
\int_0^\infty
u^kW(u)\,du,
```

one may therefore encode the same WD-T37 selected source in compact weights satisfying

```math
\boxed{
\int W(u)\,du
=
\int uW(u)\,du
=
\cdots
=
\int u^{M-1}W(u)\,du
=
0.
}
```

Likewise, Mellin-jet interpolation allows finitely many logarithmic moment constraints

```math
\int
u^{s_0-1}
(\log u)^r
W(u)\,du
=
0.
```

Thus arbitrarily high **finite** wavelet-type moment cancellation is compatible with the same selected off-axis source.

---

## 5. These moment cancellations cannot improve the decisive exponent

Let (v\ne0) be a selected negative source and choose an active right-half selected zero

```math
\rho_+
=
\frac12+\delta+iT,
\qquad
v_{\rho_+}\ne0.
```

For every interpolating weight described above, regardless of how many finite Mellin moments are additionally set to zero,

```math
m_{\rho_+}\widetilde W(\rho_+)
=
v_{\rho_+}
\ne0.
```

RPB-4 therefore gives a nonremovable tail-transform pole at

```math
s=\rho_+-\frac12
```

with residue

```math
v_{\rho_+}/2.
```

Consequently the associated smoothed Chebyshev discrepancy cannot satisfy

```math
D_W(X)=O(X^\theta)
```

for any

```math
\theta<\Re\rho_+
```

without contradicting that pole.

Hence:

```math
\boxed{
\text{arbitrarily many finite Mellin vanishing moments}
\not\Rightarrow
\text{the RPB power saving}.
}
```

This is not merely a failure of the current proof method. For a weight still carrying a nonzero selected off-axis residue, such a subcritical exponent is incompatible with the exact local-pole certificate.

---

## 6. Discrete source moment hierarchy stops where Horizon 1 says it stops

Horizon 1 proves

```math
\sum_j v_j=0.
```

It does not prove

```math
\sum_j \rho_jv_j=0.
```

Indeed ZW1-E1 shows the first weighted source moment

```math
M_1(v)
=
\sum_j\rho_jv_j
```

can be nonzero, and this is precisely why the universal rational-response decay stops at

```math
R_v(z)=O(z^{-2})
```

rather than (O(z^{-3})).

Thus there is no hidden infinite hierarchy

```math
\sum_j \rho_j^kv_j=0
\qquad
(k=0,1,2,\ldots)
```

available from pair antisymmetry.

The only universal discrete cancellation is the zeroth source moment.

---

## 7. No canonical dilation-jet cancellation

The scale expansion is

```math
Q_W(X)
=
\sum_\rho
m_\rho\widetilde W(\rho)
X^{\rho-1/2}.
```

Applying the dilation generator

```math
\mathcal D
=
X\frac d{dX}
```

gives

```math
\mathcal D^kQ_W(X)
=
\sum_\rho
(\rho-1/2)^k
m_\rho\widetilde W(\rho)
X^{\rho-1/2}.
```

The selected zero-moment identity controls only the unweighted finite sum of selected coefficients,

```math
\sum_{\rho\in\Pi}
m_\rho\widetilde W(\rho)=0.
```

For (k\ge1), the factors ((\rho-1/2)^k) destroy that cancellation in general.

Moreover the full dilation jet contains all complementary zeros, not only the selected set.

Therefore there is no universal cancellation of a finite dilation derivative of the physical observable arising from (mathbf1^Tv=0).

---

## 8. Optional symmetry gauges are not forcing theorems

Because the interpolation space is large, one may voluntarily impose additional reciprocal/parity conditions on a specially chosen probe when those conditions are compatible with the desired selected source.

Such a construction may be useful for presentation or for exposing symmetry.

But it is an extra probe-design constraint.

It does not follow from the WD-T37 source law, and as long as an active selected right-half Mellin value remains nonzero, it cannot by itself produce a power exponent below that pole.

Thus optional probe symmetry must not be promoted into an actual-zeta exclusion mechanism.

---

## 9. Consequence for the relation between the two programs

The Horizon-1 zero-moment theorem has a precise role:

```math
\boxed{
\mathbf1^Tv=0
\Longrightarrow
R_v(z)=O(z^{-2})
}
```

on the selected-source / reciprocal-Cauchy side.

After passing to the polarized Mellin bridge, the same statement becomes only

```math
\boxed{
\sum_{\rho\in\Pi}
m_\rho\widetilde W(\rho)
=
0,
}
```

a finite relation among selected spectral samples.

It does not become a prime-side smoothing moment.

Therefore the two representations use the same source cancellation differently:

- the next-jet route converts it into improved far-divisor decay;
- the Mellin/dilation route preserves it as a finite selected-sample relation, with no automatic large-scale power gain.

This is a genuine structural distinction.

---

## 10. RPB moment-cancellation route: stop

The proposed route

```math
\mathbf1^Tv=0
\Longrightarrow
\text{extra Mellin moments}
\Longrightarrow
\text{stronger smoothed-PNT cancellation}
\Longrightarrow
\text{RPB-POL-TAIL}
```

fails at its first implication.

More strongly, arbitrarily many finite Mellin moments may be imposed by hand without changing the selected local poles, so no finite moment hierarchy can supply the missing exponent by itself.

Accordingly:

```math
\boxed{
\textbf{RPB-7 — ZERO-MOMENT → MELLIN-CANCELLATION: NO-GO.}
}
```

This subroute is exhausted.

---

## 11. Current bridge state

The successful RPB chain is now

```math
\boxed{
\begin{aligned}
\text{WD-T37 selected source }v
&\longrightarrow
\text{polarized compact probes }(f,g)\\
&\longrightarrow
\text{translated Weil coefficient }Q_{f,g}\\
&\longrightarrow
\text{Mellin weight }W\\
&\longrightarrow
m_\rho\widetilde W(\rho)=v_\rho\\
&\longrightarrow
\text{selected local Laplace poles}.
\end{aligned}
}
```

The unresolved step remains genuinely global:

```math
\boxed{
\text{prove a source-adapted smoothed-PNT power bound}
}
```

or find a different forcing principle for the same polarized kernel.

The zero-moment theorem does not supply that principle.

Next cursor:

```text
RPB-8 / BRIDGE REGROUP AND OBJECT DETERMINATION
```
