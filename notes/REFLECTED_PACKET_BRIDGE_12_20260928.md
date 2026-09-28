# RPB-12 — Neutral fall-through to selected negative custody

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / FINITE SUPPORT CUSTODY YES / FIXED-PACKET CUSTODY DICHOTOMY**  
**Dependencies:** RPB-10, RPB-11, ZW1-T9, WD-T39.  
**Promotion status:** none.

## 0. Objective

RPB-11 proves that an attained neutral branch cannot remain neutral for arbitrarily large support.

Hence there is a finite plateau endpoint

```math
c_*<infty
```

such that

```math
\lambda_a<0
\qquad
(a>c_*).
```

RPB-12 asks whether this eventual **full-form negativity** can be lawfully converted into a **fixed finite selected packet** suitable for re-entry into the Horizon-1 negative morphology.

The answer separates into two levels.

### Fixed support

Yes:

```math
\boxed{
Q_W(h)<0
\Longrightarrow
\text{some finite selected negative packet already makes }h\text{ negative}.
}
```

### Approach to the plateau edge

Not automatically.

As

```math
a\downarrow c_*,
qquad
\lambda_a\uparrow0,
```

the finite height required to capture the strict negative sign may diverge.

This gives a precise custody dichotomy:

```math
\boxed{
\text{bounded finite-head capture}
\quad\text{or}\quad
\text{sign-custody escape}.
}
```

The second branch is not excluded by existing Horizon-1 compactness alone.

---

## 1. Full zero-side sign identity

At one fixed compact support (a), write the full zero-side decomposition as

```math
Q_W^a(h)
=
\|S_{+,a}^*h\|^2
-
\|S_{-,a}^*h\|^2.
```

Let

```math
P_G^-:K_-	o K_-
```

be an increasing finite-rank coordinate exhaustion of the negative zero-side sector, and put

```math
Q_{G,a}(h)
=
\|S_{+,a}^*h\|^2
-
\|P_G^-S_{-,a}^*h\|^2.
```

Then exactly

```math
\boxed{
Q_{G,a}(h)
=
Q_W^a(h)
+
\|(I-P_G^-)S_{-,a}^*h\|^2.
}
```

Thus finite negative truncation can only make the form less negative.

---

## 2. Every strict full negative witness has finite selected custody

Assume

```math
Q_W^a(h)<0.
```

Since

```math
S_{-,a}^*h\in K_-\cong\ell^2,
```

we have

```math
\|(I-P_G^-)S_{-,a}^*h\|
\longrightarrow0.
```

Choose (G) so large that

```math
\|(I-P_G^-)S_{-,a}^*h\|^2
<
-Q_W^a(h).
```

Then

```math
\boxed{
Q_{G,a}(h)<0.
}
```

So every strict full-form negative witness is already negative for some finite selected packet.

This is an exact finite-head capture theorem; no spectral approximation theorem is needed.

---

## 3. Quantitative finite-head capture from native Hilbert–Schmidt decay

ZW1-T9 proves that at fixed compact support the native zero synthesis is Hilbert–Schmidt, with high zero-height tails satisfying the same inverse-height square-summability scale.

For a bounded support range

```math
a\le B,
```

the direct Dirichlet-resolvent estimate may be dominated by the corresponding (B)-window constant.

Hence there is a tail function

```math
\eta_B(G)
\to0
```

with the retained scale

```math
\boxed{
\eta_B(G)
\ll_B
\frac{\log G}{G}
}
```

such that for every unit physical vector supported in ([-a,a]subseteq[-B,B]),

```math
\boxed{
\|(I-P_G^-)S_{-,a}^*h\|^2
\le
\eta_B(G).
}
```

Therefore if

```math
Q_W^a(h)
\le
-m
<0,
```

any (G) satisfying

```math
\eta_B(G)<m
```

gives finite-head sign capture.

So packet height is quantitatively controlled by the available negative margin.

---

## 4. Apply to the post-plateau ground branch

By RPB-10/11 and Suzuki's continuity theorem,

```math
\lambda_{c_*}=0,
qquad
\lambda_a<0
\quad(a>c_*),
```

and

```math
\lambda_a\to0
\qquad
(a\downarrow c_*).
```

Take a sequence

```math
a_n\downarrow c_*,
```

and normalized ground modes or normalized negative witnesses (h_n) with

```math
Q_W^{a_n}(h_n)
=
\lambda_{a_n}
<0.
```

Put

```math
m_n
=
-\lambda_{a_n}
>0.
```

Then

```math
m_n\to0.
```

For every (n), Section 2 gives a finite capture height (G_n).

The uniform tail estimate allows one to choose (G_n) with

```math
\eta_B(G_n)
<
m_n.
```

As the margin vanishes, this estimate alone does not keep (G_n) bounded.

---

## 5. Canonical custody dichotomy

Choose a monotone canonical exhaustion (P_G^-), and let (G_n) be the least admissible cutoff in that exhaustion for which

```math
Q_{G_n,a_n}(h_n)<0.
```

After passing to a subsequence, exactly one of two alternatives occurs.

### A. Bounded finite-head capture

There is a finite (G_*) such that

```math
G_n\le G_*
```

along a subsequence.

Then the single finite packet

```math
\Pi_*
=
\operatorname{Ran}P_{G_*}^-
```

captures strict selected negativity arbitrarily close to the plateau edge:

```math
\boxed{
Q_{\Pi_*,a_n}(h_n)<0.
}
```

This is lawful **fixed finite selected custody**.

It places the branch back inside the fixed-packet support-filtration framework.

Further classification still depends on the normalized selected signature:

- a strict limiting selected margin feeds the WD-T37 negative morphology;
- a vanishing selected margin is a fixed-packet critical approach and must be classified by the WD-T17/WD-T38 machinery rather than silently promoted to WD-T37.

So bounded sign capture is enough to freeze custody, but not by itself enough to assert the WD-T37 hypotheses.

### B. Sign-custody escape

For every fixed (G),

```math
Q_{G,a_n}(h_n)
\ge0
```

eventually, while

```math
Q_W^{a_n}(h_n)<0
```

for every (n).

Equivalently,

```math
\boxed{
G_n\to\infty.
}
```

The full negative sign is then tipped only by an increasingly remote negative tail.

This is **sign-custody escape**.

---

## 6. Sign-custody escape is weaker than moving selected-sector escape

In sign-custody escape, low negative coordinates need not disappear.

One may have, for a fixed finite projection (P_R^-),

```math
P_R^-S_-^*h_n
\to
u_R\ne0,
```

while every fixed finite head still fails to capture the strict sign.

Thus:

```math
\boxed{
\text{sign-custody escape}
\not\Rightarrow
\text{full coefficient weak escape}.
}
```

The mechanism is instead:

```math
\boxed{
\text{anchored neutral core}
+
\text{vanishing remote negative excess}.
}
```

This is why the existing WD-T39 moving-sector theorem does not automatically exclude it.

---

## 7. Abstract sharpness model

The distinction is genuine already in coefficient space.

Let the positive sector contain one unit vector (p), and the negative sector have orthonormal basis

```math
u,e_1,e_2,\ldots
```

with

```math
\|p\|
=
\|u\|
=
1.
```

The endpoint vector

```math
y_*
=
(p,u)
```

is neutral:

```math
[y_*,y_*]_J=0.
```

Now define

```math
y_n
=
\frac{
(p,u+\varepsilon_ne_n)
}{
\sqrt{2+\varepsilon_n^2}
},
\qquad
\varepsilon_n\downarrow0.
```

Then

```math
y_n\to
\frac1{\sqrt2}(p,u)
```

strongly, while

```math
[y_n,y_n]_J
=
-
\frac{
\varepsilon_n^2
}{
2+\varepsilon_n^2
}
<0.
```

For every fixed finite negative head not containing (e_n), the truncated signature remains neutral/nonnegative, but the full vector is strictly negative.

Thus sign-custody escape is compatible with:

- strong convergence to a nonzero neutral endpoint vector;
- fixed low-coordinate anchoring;
- vanishing full negative margin.

No generic compactness theorem can rule it out.

---

## 8. Relation to the original finite-exception neutral packet

The Horizon-1 neutral branch starts with a finite selected coordinate

```math
u\in M_\Pi
```

and a reduced/unit-gain neutral relation.

That does **not** assert that the complete full-divisor negative analysis coordinate of the physical mode has finite support.

The finite-exception hypothesis is a statement about the retained selected/effective relation after the allowed reductions.

Therefore it does not eliminate the possibility that post-plateau strict negativity is supplied by an increasingly long unselected negative tail.

No fixed-packet re-entry may be inferred from the word “finite-exception” alone.

---

## 9. What is now closed on the neutral side

RPB-10 and RPB-11 already show:

```math
\text{attained neutral mode}
\Longrightarrow
\text{finite zero plateau}
\Longrightarrow
\text{eventual full-form negativity}.
```

RPB-12 adds:

```math
\boxed{
\text{every post-plateau negative window has finite selected sign custody}.
}
```

Thus there is no support at which strict negativity is irreducibly infinite-coordinate in the literal sense.

The only remaining question is **uniformity of that finite custody as the plateau edge is approached**.

---

## 10. Remaining neutral-to-negative interface

The branch-local interface

```text
RPB-NEUTRAL-TO-SELECTED-NEG
```

can now be narrowed to:

> Can actual zeta realize sign-custody escape at the end of a neutral spectral plateau?

Equivalently:

```math
\boxed{
\text{must some fixed finite negative zero packet
capture the post-plateau sign arbitrarily close to }c_*?
}
```

If yes, the branch re-enters fixed-packet morphology.

If no, the negative transition is carried by increasingly high negative zero channels whose total contribution is asymptotically small but sign-decisive.

That is a precise arithmetic compactness/custody question.

---

## 11. Candidate mechanism for the next pass

The native tail estimate gives

```math
\eta_B(G)
\ll_B
\frac{\log G}{G}.
```

Hence sign-custody escape requires the post-plateau negative margin to be no larger than arbitrarily remote negative tails.

A natural next test is to compare the rate at which

```math
-\lambda_a
\to0
```

as (a\downarrow c_*) with the high-zero tail law.

If the spectral crossing has a quantitative lower rate that beats the available tail decay, fixed finite custody follows.

If the crossing can be flatter than every fixed tail threshold, sign-custody escape remains viable.

This comparison is not present in Horizon 1.

---

## 12. RPB-12 determination

```math
\boxed{
\textbf{RPB-12 — FINITE NEGATIVE CUSTODY EXISTS POINTWISE,}
}
```

but

```math
\boxed{
\textbf{FIXED-PACKET CUSTODY NEAR THE PLATEAU EDGE IS NOT AUTOMATIC.}
}
```

Exact dichotomy:

```math
\boxed{
\text{bounded finite-head capture}
\quad\text{or}\quad
\text{sign-custody escape}.
}
```

Next cursor:

```text
RPB-13 / SPECTRAL CROSSING RATE ↔ HIGH-ZERO TAIL
```
