# RPB-27 — Crossing-normalized multiplier first variation

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO-GO AT CURRENT REGULARITY / CONTINUITY DOES NOT YIELD CROSSING-NORMALIZED FIRST VARIATION**  
**Dependencies:** RPB-13, RPB-19, RPB-26; WD-T34–WD-T36.  
**Promotion status:** none.

## 0. Objective

RPB-26 produced a uniformly bounded selected-preserving multiplier family

```math
\psi_a^{\rm sp}
```

along the post-neutral right branch, with uniform far-tail control.

The remaining proposed normalization is

```math
\boxed{
\frac{
\psi_a^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}{
\kappa_a-1
},
}
```

where

```math
\kappa_a
=
\lambda_{\max}(\mathsf K_a),
\qquad
\kappa_a>1
\quad(a>c_*),
\qquad
\kappa_a\to1.
```

RPB-27 asks whether the retained compact-window regularity is strong enough to
control this quotient.

It is not.

There are two separate obstructions:

1. the support-dependent compact-window form is not differentiable in the
   retained logarithmic topology once active prime translations are present;
2. even abstractly, continuity supplies no comparison between the vanishing
   rates of
   ```math
   \psi_a^{\rm sp}-\psi_{c_*}^{\rm sp}
   ```
   and
   ```math
   \kappa_a-1.
   ```

---

## 1. Current source-level regularity

Suzuki's current compact-window theorem supplies continuity of the lowest
spectral level with respect to support.

RPB-19 extends the same continuity mechanism to the finite-enlarged
background ground level.

RPB-13 already recorded that the current source supplies no general:

- Lipschitz estimate;
- Hölder estimate;
- differentiability theorem;
- analytic perturbation theorem;
- nonzero crossing derivative.

Thus there is no imported first-order support law to use.

RPB-27 now shows that this absence is structurally compatible with the
compact-window arithmetic operator itself.

---

## 2. Fixed-interval scaling of one active prime translation

Work away from a prime threshold so that the active prime-power set is fixed on
a strict right neighborhood.

Let

```math
\ell=\log n
```

be one active prime delay.

On the physical interval, the arithmetic operator contains the symmetric shift

```math
\tau_{\ell}
+
\tau_{-\ell}.
```

After scaling

```math
[-a,a]
\to
[-1,1],
```

the corresponding Fourier multiplier has the form

```math
\boxed{
m_{\ell,a}(\xi)
=
2\cos\!\left(
\frac{\ell\xi}{a}
\right)
}
```

up to the fixed coefficient
(Lambda(n)/\sqrt n).

For nearby supports (a,b),

```math
|m_{\ell,a}(\xi)-m_{\ell,b}(\xi)|
\lesssim
\min\!\left(
1,
|a-b|\,|\xi|
\right).
```

---

## 3. Logarithmic form topology

The natural compact-window form norm is controlled by

```math
\int
\log(e+|\xi|)
|\widehat f(\xi)|^2\,d\xi.
```

Therefore the relative multiplier size is governed by

```math
\sup_{r\ge0}
\frac{
\min(1,\delta r)
}{
\log(e+r)
},
qquad
\delta\asymp|a-b|.
```

For small (delta), split at (r=\delta^{-1}).

For (r\le\delta^{-1}),

```math
\frac{\delta r}{\log(e+r)}
\lesssim
\frac1{
\log(e+\delta^{-1})
}.
```

For (r\ge\delta^{-1}),

```math
\frac1{\log(e+r)}
\le
\frac1{
\log(e+\delta^{-1})
}.
```

Hence

```math
\boxed{
\sup_{r\ge0}
\frac{
\min(1,\delta r)
}{
\log(e+r)
}
\lesssim
\frac1{
\log(e+\delta^{-1})
}.
}
```

Thus one obtains the support modulus

```math
\boxed{
\omega_{\log}(\delta)
=
\frac1{
\log(e+\delta^{-1})
}.
}
```

The finite active prime sum has the same species of bound.

---

## 4. This modulus is weaker than every positive power

For every

```math
\alpha>0,
```

```math
\frac{
\omega_{\log}(\delta)
}{
\delta^\alpha
}
\to\infty
\qquad
(\delta\downarrow0).
```

So the retained prime-shift variation is not controlled by any theorem of the
form

```math
O(\delta^\alpha).
```

In particular the current logarithmic form structure does not supply a
Lipschitz/Hölder support modulus.

This matches the qualitative regularity boundary already isolated in RPB-13.

---

## 5. Differentiating the prime shift requires positive Sobolev control

Formally,

```math
\partial_a
m_{\ell,a}(\xi)
=
2
\frac{\ell\xi}{a^2}
\sin\!\left(
\frac{\ell\xi}{a}
\right).
```

Its size grows like

```math
|\xi|.
```

But

```math
\frac{|\xi|}{
\log(e+|\xi|)
}
\to\infty.
```

Therefore the formal derivative is not a bounded quadratic-form perturbation
on the retained logarithmic form domain.

So the family is not differentiable there by the ordinary bounded-form
argument.

A derivative would require additional positive-order regularity.

---

## 6. WD-T36 supplies exactly no such regularity theorem

WD-T36 proves that the logarithmic form norm does not uniformly control any

```math
H^\varepsilon
```

norm with

```math
\varepsilon>0.
```

The resolvent extremizers satisfy

```math
A_{B,a}h_{a,u}
=
\Phi_a^*u,
```

with smooth finite-rank right-hand side.

But the current theorem package does not bootstrap this equation to
(H^1), or even to any fixed positive Sobolev exponent.

Therefore one cannot justify differentiating the support-scaled translation
term on the actual extremizer family from the retained H1 estimates.

---

## 7. Prime-threshold case is not better

If

```math
2c_*
=
\log n_0
```

for a prime power (n_0), the strict-right operator activates the finite
threshold correction described in WD-T34/WD-T38.

Then the endpoint and strict-right arithmetic operators differ by an additional
finite translation term before any derivative issue is considered.

Thus at a threshold, a first-variation theorem requires a separate
threshold-aware right-derivative analysis.

No such theorem is currently available.

---

## 8. Prime-free special regime

If no prime translation is active in the relevant support interval, the
specific obstruction of Sections 2–6 disappears.

The archimedean and finite-rank pieces may possess better support regularity.

However:

1. the current corpus still proves only continuity at arbitrary support;
2. no arbitrary-edge differentiability theorem is retained;
3. no nonzero transversality derivative for (kappa_a) is supplied.

Therefore the prime-free case remains a possible special subproject, not a
completed route in RPB-27.

---

## 9. Finite-dimensional Birman--Schwinger continuity is insufficient

The matrix

```math
\mathsf K_a
```

is finite dimensional and continuous.

Hence

```math
\kappa_a
=
\lambda_{\max}(\mathsf K_a)
```

is continuous.

But continuity allows arbitrarily flat crossing rates.

For example, the scalar model

```math
\boxed{
\kappa(c_*+\delta)
=
1+e^{-1/\delta^2}
}
```

for (delta>0) is continuous, strictly greater than (1), and approaches
(1) faster than every power of (delta).

Nothing in the current RPB/H1 hypotheses excludes this rate.

This is the same crossing-rate freedom identified abstractly in RPB-13.

---

## 10. Continuity of the multiplier family is likewise rate-free

RPB-26 proves

```math
\psi_a^{\rm sp}
\to
\psi_{c_*}^{\rm sp}
```

uniformly on the closed critical strip.

But no rate relative to

```math
\kappa_a-1
```

is known.

Two scalar toy models demonstrate the logical gap.

### Quotient blow-up

Let

```math
\kappa(c_*+\delta)-1
=
e^{-1/\delta^2},
```

and

```math
\psi_{c_*+\delta}^{\rm sp}
-
\psi_{c_*}^{\rm sp}
=
\delta\,\varphi
```

for one fixed bounded multiplier (arphi
e0).

Then both families are continuous, but

```math
\left\|
\frac{
\psi_{c_*+\delta}^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}{
\kappa(c_*+\delta)-1
}
\right\|
\to\infty.
```

### Quotient collapse

Keep the same (kappa), but take

```math
\psi_{c_*+\delta}^{\rm sp}
-
\psi_{c_*}^{\rm sp}
=
e^{-2/\delta^2}\varphi.
```

Then

```math
\left\|
\frac{
\psi_{c_*+\delta}^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}{
\kappa(c_*+\delta)-1
}
\right\|
\to0.
```

Thus continuity alone permits both extremes.

---

## 11. The logarithmic support modulus still does not compare to the crossing rate

Even if one upgrades the multiplier continuity to a bound of the form

```math
\|
\psi_a^{\rm sp}
-
\psi_{c_*}^{\rm sp}
\|_{\rm strip}
\lesssim
\omega_{\log}(a-c_*),
```

this does not control the crossing-normalized quotient.

One would need a lower relation such as

```math
\kappa_a-1
\gtrsim
\omega_{\log}(a-c_*)
```

or a matched two-sided asymptotic.

No such lower bound is known.

Indeed RPB-13 already showed that absolute support-tail information does not
produce a crossing-rate floor.

---

## 12. Kato/Hellmann--Feynman route is not currently lawful

A standard first-variation strategy would seek:

```math
\mathsf K_a
=
\mathsf K_{c_*}
+
(a-c_*)\mathsf K'_{c_*}
+
o(a-c_*),
```

then use a top eigenvector (u_*) to obtain

```math
\kappa_a-1
=
(a-c_*)
\langle
\mathsf K'_{c_*}u_*,
u_*
\rangle
+
o(a-c_*).
```

But RPB-27 has not established the required differentiability of the underlying
support family.

The prime-shift derivative obstruction in Section 5 prevents importing such a
formula from the retained logarithmic form theory.

Thus no Hellmann--Feynman identity is promoted.

---

## 13. Exact remaining interface

The needed theorem is now precise.

One requires a support-transversality statement supplying enough control to
compare

```math
\boxed{
\psi_a^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}
```

with

```math
\boxed{
\kappa_a-1.
}
```

Possible sufficient inputs include:

1. one-sided differentiability of the resolvent/extremizer family together
   with a nonzero derivative;
2. a two-sided modulus theorem;
3. a direct crossing-normalized compactness theorem;
4. additional regularity of the resolvent extremizer strong enough to
   differentiate the prime translations.

None is currently supplied by H1 or by the RPB chain.

---

## 14. Consequence for the next-jet program

RPB-26 successfully produced a uniformly bounded moving multiplier family and
uniform far-tail control.

RPB-27 shows that the remaining difficulty is not:

- source custody;
- background custody;
- compactness;
- far-tail decay;
- multiplier boundedness.

It is specifically:

```math
\boxed{
\text{support first-variation / transversality custody}.
}
```

Without that datum, crossing normalization cannot manufacture a nonzero
limiting next-jet forcing term.

---

## 15. RPB-27 determination

```math
\boxed{
\textbf{RPB-27 — CROSSING-NORMALIZED FIRST VARIATION IS NOT AVAILABLE AT CURRENT LOGARITHMIC REGULARITY.}
}
```

Established obstruction:

```math
\boxed{
\text{active prime support variation}
\sim
\omega_{\log}(\delta)
=
\frac1{\log(e+\delta^{-1})}
}
```

in the retained logarithmic form topology, while the formal derivative has
order (|\xi|) and is not controlled by that topology.

Consequently:

```math
\boxed{
\frac{
\psi_a^{\rm sp}
-
\psi_{c_*}^{\rm sp}
}{
\kappa_a-1
}
}
```

has no controlled nonzero limit from the present hypotheses.

Next cursor:

```text
RPB-28 / RESOLVENT-EXTREMIZER REGULARITY BOOTSTRAP TEST
```

The next pass should test whether the **special right-hand side**
(Phi_a^*u) in

```math
A_{B,a}h_{a,u}
=
\Phi_a^*u
```

provides more regularity for the resolvent extremizer than the generic
logarithmic form domain, despite WD-T36's failure of uniform coercivity. If
the selected resolvent vectors lie in a positive Sobolev class uniformly, the
prime-shift derivative obstruction could be bypassed on this finite selected
family even though it remains false globally.
