# RPB-14 — Endpoint selected defect under support enlargement

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / FIXED SELECTED CRITICAL-OR-NEGATIVE DICHOTOMY / NO AUTOMATIC CROSSING**  
**Dependencies:** RPB-10 through RPB-13; WD-T02, WD-C1–C5, WD-B1.  
**Promotion status:** none.

## 0. Objective

RPB-13 showed that the total post-plateau spectral crossing rate cannot by itself freeze finite selected custody.

The remaining natural question is whether the **original finite selected packet** from the attained-neutral endpoint must itself cross from unit gain into a negative/over-budget regime under strict support enlargement.

It need not.

What is forced is a sharper monotone dichotomy:

```math
\boxed{
\text{the endpoint selected packet either}
\begin{cases}
\text{remains critical/nonnegative},\\
\text{or becomes negative and stays negative thereafter}.
\end{cases}
}
```

Full-form negativity can begin strictly earlier and can be carried entirely by the unselected negative background.

---

## 1. Endpoint selected neutral vector is genuinely realized

In the finite-exception attained-neutral setup, the selected coordinate

```math
u\in M_\Pi
```

has the endpoint physical realization

```math
C_cu=P_c^*k,
```

and

```math
N_c^*k=-u.
```

Thus the endpoint selected analysis vector is

```math
\boxed{
y_c
=
(C_cu,u)
=
(P_c^*k,-N_c^*k).
}
```

It is nonzero and neutral:

```math
\boxed{
[y_c,y_c]_J=0.
}
```

Because it comes from the endpoint physical adjoint realization, it lies in the endpoint selected analysis space

```math
y_c\in\mathcal A_{\Pi,c}.
```

This is stronger than merely being a right-limit vector.

---

## 2. Support monotonicity keeps the same neutral vector forever

The selected analysis-space filtration is monotone:

```math
\mathcal A_{\Pi,c}
\subseteq
\mathcal A_{\Pi,a}
\qquad
(a>c).
```

Hence

```math
\boxed{
y_c\in\mathcal A_{\Pi,a}
\qquad
\text{for every }a>c.
}
```

The coefficient-space (J)-form does not depend on (a), so

```math
[y_c,y_c]_J=0
```

at every larger support.

Therefore the fixed selected analysis space can never become strictly (J)-positive after the endpoint.

It always contains the same nonzero neutral direction.

---

## 3. Fixed selected packet: exact support dichotomy

For each (a\ge c), exactly one of the following holds.

### S0 — selected critical/nonnegative

```math
\mathcal A_{\Pi,a}
\text{ is }J\text{-nonnegative}.
```

Because (y_c\ne0) remains neutral inside it, this is a genuinely critical regime, not a uniformly positive one.

### S− — selected negative

```math
\mathcal A_{\Pi,a}
\text{ contains a strictly }J\text{-negative vector}.
```

Once S− occurs at some (a_0), support monotonicity preserves that same negative coefficient vector for every (a>a_0).

Thus selected negativity, once born, persists.

Define the selected crossing support

```math
\boxed{
c_\Pi
=
\inf
\left\{
a\ge c:
\mathcal A_{\Pi,a}
\text{ is }J\text{-negative}
\right\}.
}
```

Then either

```math
c_\Pi<\infty
```

and

```math
\mathcal A_{\Pi,a}
\text{ is negative for every }a>c_\Pi,
```

or

```math
\boxed{
c_\Pi=\infty,
}
```

in which case the endpoint selected packet remains critical/nonnegative at every support.

---

## 4. Screening interpretation

In the S0 regime, WD-T02 applies to the selected synthesis pair.

There is a contractive reduced screening solution

```math
X_{\Pi,a}
```

with

```math
\|X_{\Pi,a}\|\le1.
```

But because the analysis space contains the nonzero neutral vector (y_c), the strict regime

```math
\|X_{\Pi,a}\|<1
```

is impossible: WD-A4 would make the selected analysis form uniformly positive.

Hence in the nonnegative regime,

```math
\boxed{
\|X_{\Pi,a}\|=1
}
```

with an attained critical direction.

If the selected packet becomes negative, then:

- under continued exact range inclusion, the reduced screening norm satisfies
  ```math
  \|X_{\Pi,a}\|>1;
  ```
- if range inclusion fails, the selected branch is a range defect instead.

Therefore the original selected packet is not forced to cross above unit gain. It may remain exactly at unit gain indefinitely.

---

## 5. Full form versus selected form

Relative to the fixed endpoint packet (Pi), split the full negative zero sector as

```math
K_-
=
M_\Pi
\oplus
B_\Pi.
```

For a physical test (h),

```math
\boxed{
Q_W^a(h)
=
Q_{\Pi,a}(h)
-
\|S_{B_\Pi,a}^*h\|^2.
}
```

Therefore:

```math
Q_{\Pi,a}(h)<0
\Longrightarrow
Q_W^a(h)<0,
```

but the converse fails.

If

```math
Q_W^a(h)<0
```

while

```math
Q_{\Pi,a}(h)\ge0,
```

then necessarily

```math
\boxed{
\|S_{B_\Pi,a}^*h\|^2
>
Q_{\Pi,a}(h).
}
```

The strict full negative sign is then carried by the unselected negative background relative to the original endpoint packet.

---

## 6. Full crossing cannot occur later than selected crossing

Let (c_*) be the full neutral-plateau endpoint from RPB-10/11:

```math
\lambda_a^{\rm full}=0
\quad(c\le a\le c_*),
```

and

```math
\lambda_a^{\rm full}<0
\quad(a>c_*).
```

Because selected negativity implies full negativity,

```math
\boxed{
c_*
\le
c_\Pi.
}
```

Three exact configurations are therefore possible.

### I. Coincident crossing

```math
c_\Pi=c_*.
```

The original endpoint selected packet becomes negative arbitrarily close to the full crossing.

### II. Delayed selected crossing

```math
c_*<c_\Pi<\infty.
```

There is an interval

```math
(c_*,c_\Pi]
```

on which the full Weil form is negative while the original selected packet remains critical/nonnegative.

### III. No selected crossing

```math
c_\Pi=\infty.
```

The full form becomes negative after (c_*), but the original endpoint selected packet remains critical for all larger support.

In II and III, post-plateau negativity is background-driven relative to (Pi).

---

## 7. Abstract sharpness model: full fall-through with permanent selected criticality

The failure of automatic selected crossing is already possible in the abstract defect calculus.

Take physical space

```math
\mathcal H
=
\mathbb C e_1
\oplus
\mathbb C e_2,
```

positive coefficient space

```math
K_+
=
\mathbb C p,
```

selected negative space

```math
M
=
\mathbb C u,
```

and background negative space

```math
B
=
\mathbb C b.
```

Define

```math
S_+p=e_1,
\qquad
S_Mu=e_1.
```

Thus the selected defect operator is identically

```math
\boxed{
D_M
=
S_+S_+^*
-
S_MS_M^*
=
0.
}
```

Its analysis range is the neutral line generated by

```math
(p,u).
```

Now let

```math
S_{B,a}b
=
\varepsilon(a)e_2,
```

where

```math
\varepsilon(a)=0
\quad(a\le c_*),
```

and

```math
\varepsilon(a)>0,
\qquad
\varepsilon(a)\to0
\quad(a\downarrow c_*).
```

The full physical defect is

```math
\boxed{
D_a
=
-\varepsilon(a)^2
e_2\otimes e_2.
}
```

Hence

```math
\lambda_a^{\rm full}
=
-\varepsilon(a)^2<0
```

for every (a>c_*), continuously tending to zero at the crossing.

But the fixed selected defect remains exactly critical:

```math
\boxed{
D_M=0
\quad\text{for every }a.
}
```

Thus:

```math
\boxed{
\text{full spectral fall-through}
\not\Rightarrow
\text{selected over-budget crossing}.
}
```

The obstruction is not an artifact of the zeta notation.

---

## 8. Relation to sign-custody escape

RPB-12 showed that every fixed post-plateau negative witness is captured by some finite negative head.

RPB-14 now distinguishes that statement from persistence of the **original endpoint packet**.

If (c_\Pi=\infty), finite sign capture at later supports must use negative channels outside the original (Pi).

Near (c_*), those additional channels may:

1. stabilize in one larger finite packet;
2. require successively higher packets;
3. appear as a background tail whose sign-deciding height diverges.

The third possibility is the sign-custody escape of RPB-12/13.

Thus permanent criticality of the original (Pi) is compatible with either bounded enlargement of custody or genuine moving-tail custody.

---

## 9. What the finite-exception hypothesis does and does not give

The endpoint neutral theorem assumes a finite selected coordinate

```math
u\in M_\Pi
```

and an exact unit-gain realization after the allowed reductions.

This certifies:

```math
\boxed{
\text{the selected endpoint relation is finite and critical}.
}
```

It does **not** assert:

```math
\boxed{
S_{B_\Pi,a}^*h=0
}
```

for all larger supports or all nearby post-plateau ground states.

Therefore it cannot exclude background-driven full negativity.

No theorem in Horizon 1 currently upgrades finite-exception endpoint custody to finite-exception post-crossing custody.

---

## 10. Consequence for the neutral-to-negative bridge

The desired chain

```math
\text{neutral endpoint}
\Longrightarrow
\text{full fall-through}
\Longrightarrow
\text{same selected packet negative}
\Longrightarrow
\text{WD-T37}
```

fails at the second implication.

The lawful replacement is

```math
\boxed{
\text{full fall-through}
\Longrightarrow
\begin{cases}
\text{original selected packet crosses},\\
\text{or background relative to that packet carries the sign}.
\end{cases}
}
```

If the first alternative occurs, the branch is back in fixed selected custody.

If the second occurs, one must analyze background sign creation directly.

---

## 11. Current exact target

The relevant unresolved object is now the background response relative to the endpoint neutral packet:

```math
\boxed{
b_{\Pi,a}(h)
=
S_{B_\Pi,a}^*h.
}
```

At the full crossing, the question is whether actual zeta permits

```math
Q_{\Pi,a}(h_a)\ge0
```

while

```math
\|b_{\Pi,a}(h_a)\|^2
>
Q_{\Pi,a}(h_a)
```

for post-plateau ground states (h_a).

This is not the old `AZ-NEXTJET-LOC` question, because no fixed selected negative source has yet been produced.

It is a precursor custody question about **background-driven birth of negativity**.

---

## 12. RPB-14 determination

```math
\boxed{
\textbf{RPB-14 — ENDPOINT SELECTED PACKET NEED NOT CROSS.}
}
```

Positive theorem:

```math
\boxed{
\text{the same endpoint neutral vector remains in every larger selected analysis space,}
}
```

so the original packet is permanently either critical/nonnegative or negative after one crossing.

Negative theorem:

```math
\boxed{
\text{full post-plateau negativity does not force that selected crossing.}
}
```

The exact support ordering is

```math
\boxed{
c_*
\le
c_\Pi
\le
\infty.
}
```

Next cursor:

```text
RPB-15 / BACKGROUND-DRIVEN NEGATIVITY AT THE NEUTRAL EDGE
```

The next pass should determine whether the unselected negative background relative to the endpoint neutral packet has enough compactness/vanishing at (a\downarrow c_*) to prevent it from being the sole source of the first strict negative sign.
