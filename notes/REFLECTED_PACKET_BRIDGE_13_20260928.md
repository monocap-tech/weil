# RPB-13 — Spectral crossing rate versus high-zero tail

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO-GO FOR RATE→FIXED CUSTODY / CAPTURE-SCALE LAW PASS**  
**Dependencies:** RPB-10, RPB-11, RPB-12, ZW1-T9.  
**Promotion status:** none.

## 0. Objective

RPB-12 reduced the neutral-to-negative custody problem to the possibility of **sign-custody escape**:

```math
Q_W^{a_n}(h_n)<0,
qquad
a_ndownarrow c_*,
```

while every fixed finite negative-coordinate head is eventually nonnegative.

The proposed next test was to compare:

1. the post-plateau spectral margin
   ```math
   m(a):=-\lambda_a>0,
   ```
   with (m(a)	o0) as (adownarrow c_*); and
2. the native high-zero tail
   ```math
   \eta_B(G)
   \ll_B
   \frac{\log G}{G}.
   ```

The key result of this pass is that **spectral crossing rate alone cannot freeze a finite selected packet**.

It can quantify how fast the required capture height must grow, but any margin tending to zero is eventually smaller than every fixed positive absolute tail bound.

---

## 1. External support-parameter input

The current Suzuki source is:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3,
revised 2026-09-23.
```

Its Theorem 1.3 proves that the lowest compact-window eigenvalue

```math
a\longmapsto\lambda_a
```

is continuous.

The proof is by upper and lower semicontinuity after scaling to a fixed interval, using compactness of the logarithmic form-domain embedding.

The theorem does **not** state a Lipschitz, Hölder, differentiable, analytic, or one-sided transversality estimate at a zero crossing.

Thus the currently imported source supplies

```math
\boxed{
\lambda_a\to\lambda_{c_*}=0
}
```

as (a\downarrow c_*), but no quantitative lower law for

```math
m(a)=-\lambda_a.
```

---

## 2. Absolute high-zero tail bound

Fix a bounded support range

```math
c_*<a\le B.
```

By the native Hilbert–Schmidt zero-synthesis estimate retained in ZW1-T9, there is a tail function

```math
\eta_B(G)
\to0
```

such that for every unit physical vector (h) supported in ([-a,a]),

```math
\boxed{
\|(I-P_G^-)S_{-,a}^*h\|^2
\le
\eta_B(G),
}
```

with the retained quantitative scale

```math
\boxed{
\eta_B(G)
\ll_B
\frac{\log G}{G}.
}
```

For a negative ground mode (h_a),

```math
Q_W^a(h_a)
=
-m(a),
```

the finite-head form satisfies

```math
Q_{G,a}(h_a)
=
-m(a)
+
\|(I-P_G^-)S_{-,a}^*h_a\|^2.
```

Hence the sufficient capture condition is

```math
\boxed{
\eta_B(G)<m(a).
}
```

---

## 3. Why no crossing rate can freeze (G) through this estimate

For every fixed finite (G),

```math
\eta_B(G)
```

is a fixed nonnegative number independent of (a).

On the other hand,

```math
m(a)\to0
\qquad
(a\downarrow c_*).
```

Therefore, whenever

```math
\eta_B(G)>0,
```

the sufficient inequality

```math
\eta_B(G)<m(a)
```

must fail for all sufficiently small

```math
a-c_*>0.
```

This remains true no matter how favorable the crossing rate is.

For example, even if one somehow proved

```math
m(c_*+\delta)
\ge
c\delta^\alpha
```

for some (c,alpha>0), the right side still tends to zero.

Thus:

```math
\boxed{
\text{absolute tail bound}
+
\text{any vanishing spectral margin}
\not\Rightarrow
\text{one fixed finite capture height}.
}
```

The rate-comparison idea in its original form is therefore structurally insufficient.

---

## 4. What a crossing rate *does* give: a moving capture scale

Although a spectral rate cannot freeze a packet, it controls how far into the negative zero sector one must go.

Define the branch-local sign-capture scale

```math
G_{\rm cap}(a,h_a)
```

as the least canonical cutoff for which

```math
Q_{G,a}(h_a)<0.
```

The tail estimate gives the upper-bound criterion

```math
\frac{C_B\log G}{G}
<
m(a).
```

For sufficiently small (m), one may choose

```math
\boxed{
G
\asymp
\frac{1}{m}
\log\frac1m
}
```

up to constants and secondary logarithms.

Hence

```math
\boxed{
G_{\rm cap}(a,h_a)
\lesssim_B
\frac{1}{m(a)}
\log\frac1{m(a)}
}
```

at the level supplied by the retained Hilbert–Schmidt tail estimate.

This is a quantitative moving-custody law.

---

## 5. Example: polynomial spectral crossing

Suppose an additional theorem gave

```math
m(c_*+\delta)
\ge
c\delta^\alpha
```

for some (c,alpha>0).

Then the capture scale obeys

```math
\boxed{
G_{\rm cap}(\delta)
\lesssim
\delta^{-\alpha}
\log\frac1\delta.
}
```

The required packet remains finite for every (delta>0), but its height still diverges as

```math
\delta\downarrow0.
```

So even a transverse polynomial crossing does not by itself yield fixed-packet custody arbitrarily close to the neutral edge.

---

## 6. Example: arbitrarily flat crossing

Continuity and monotonicity alone permit a crossing such as

```math
m(c_*+\delta)
=
e^{-1/\delta^2}
qquad
(\delta>0).
```

This is positive for every (delta>0) and tends to zero faster than every power.

The generic capture bound then allows a scale of roughly

```math
G_{\rm cap}(\delta)
\sim
e^{1/\delta^2}
\times
\text{poly}(1/\delta).
```

Nothing in Suzuki's continuity theorem excludes this type of flatness.

This example is not asserted to be the actual zeta crossing law. It records the logical weakness of continuity alone.

---

## 7. The correct condition is relative tail control

To freeze one finite packet (G_*) through the plateau edge, the needed statement is not an absolute estimate

```math
\|(I-P_{G_*}^-)S_-^*h_a\|^2
\le
\eta_B(G_*).
```

One needs a **relative** estimate tied to the vanishing negative margin:

```math
\boxed{
\|(I-P_{G_*}^-)S_{-,a}^*h_a\|^2
=
o(m(a))
\qquad
(a\downarrow c_*).
}
```

Then

```math
Q_{G_*,a}(h_a)
=
-m(a)
+
o(m(a))
<0
```

for all sufficiently close (a>c_*).

This is exactly the branch-local **relative negative-tail control** condition.

It is strong enough to rule out sign-custody escape.

The current Horizon-1 tail theorem is absolute in (G), not relative to (m(a)).

---

## 8. Equivalent finite-head transversality formulations

A fixed packet can also be secured by any theorem giving a direct finite-head sign law.

For example, for some fixed (G_*),

```math
\boxed{
Q_{G_*,c_*+\delta}(h_\delta)
\le
-c_0 m(\delta)
}
```

with (c_0>0).

Or, in a differentiable setting, one could try to prove that the first nonzero support variation of the full negative branch is already visible in a fixed selected sector.

Schematically,

```math
\boxed{
\text{finite-head first variation}
\ne0
}
```

would be the right type of transversality statement.

This is qualitatively different from knowing only the total eigenvalue crossing rate.

---

## 9. Why the original neutral selected packet remains the natural next target

The attained-neutral branch begins with a fixed finite selected coordinate

```math
u\in M_\Pi
```

satisfying the unit-gain relation at the endpoint.

The full post-plateau ground-state crossing could arise in at least two ways:

1. the same finite selected packet (Pi) itself becomes over-budget/negative under enlargement;
2. (Pi) remains neutral or nonnegative while an increasingly remote negative tail creates the strict full-form sign.

The spectral scalar

```math
\lambda_a
```

cannot distinguish these mechanisms.

Therefore the next useful object is not the total crossing rate but the support evolution of the **endpoint selected defect** itself.

---

## 10. Consequence for RPB-12

RPB-12's custody dichotomy remains exact:

```math
\boxed{
\text{bounded finite-head capture}
\quad\text{or}\quad
\text{sign-custody escape}.
}
```

RPB-13 shows that the generic comparison

```math
-\lambda_a
\quad\text{versus}\quad
(\log G)/G
```

cannot decide that dichotomy at fixed (G).

It can only quantify the moving capture scale (G_{\rm cap}(a)).

Thus sign-custody escape cannot be ruled out by a better modulus of continuity for (lambda_a) alone.

---

## 11. RPB-13 determination

```math
\boxed{
\textbf{RPB-13 — SPECTRAL CROSSING RATE ALONE CANNOT FREEZE SELECTED CUSTODY.}
}
```

Positive result:

```math
\boxed{
G_{\rm cap}
\lesssim
m^{-1}\log(m^{-1})
}
```

at the retained tail scale.

Negative result:

```math
\boxed{
m(a)\to0
\Longrightarrow
\text{no absolute fixed-}G\text{ tail estimate can by itself preserve strict sign}.
}
```

The correct missing theorem is relative tail control or finite-head transversality.

Next cursor:

```text
RPB-14 / ENDPOINT SELECTED DEFECT UNDER SUPPORT ENLARGEMENT
```

The next pass should test whether the original finite selected packet from the neutral endpoint itself crosses from unit gain to over-budget under strict enlargement, or whether full negativity can occur while that fixed selected defect remains neutral/nonnegative.
