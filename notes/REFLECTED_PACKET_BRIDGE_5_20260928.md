# RPB-5 — Does Horizon 1 force the polarized tail bound?

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **NO CURRENT IMPLICATION / NEW GLOBAL INTERFACE IS GENUINE**  
**Dependencies:** RPB-0 through RPB-4.  
**Promotion status:** none.

## 0. Question

RPB-4 produced, from every finite selected WD-T37 source (v), compact probes (f,g) whose polarized translated Weil coefficient

```math
Q_{f,g}(y)
=
\mathfrak q(T_yf,T_{-y}g)
```

has selected Laplace poles with residues (v_j/2).

The remaining question is whether the existing Horizon-1 theorems already imply enough tail control on (Q_{f,g}) to make one of those poles contradictory.

They do not.

The obstruction is not source custody anymore. It is a new parameter regime:

```math
\boxed{
\text{Horizon 1: } t_n\downarrow c<\infty
\qquad\text{versus}\qquad
\text{RPB tail: } y\to\infty, c(y)\to\infty.
}
```

---

## 1. Every nonzero negative source owns a right-half selected pole

Let

```math
u\in M_\Pi,
\qquad
u\ne0,
```

be the selected negative coordinate produced by WD-T37, and let (v) be its raw residue vector.

For one canonical negative pair coordinate

```math
n
=
\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2},
```

the two raw residues are proportional to

```math
(\alpha,-\alpha).
```

If (alpha\ne0), both are nonzero.

In zeta coordinates this pair is

```math
\rho_-
=
\frac12-\delta+iT,
\qquad
\rho_+
=
\frac12+\delta+iT,
\qquad
\delta>0.
```

Therefore every nonzero selected negative source contains at least one right-half coordinate with

```math
v_{\rho_+}\ne0,
\qquad
\Re\rho_+>\frac12.
```

Define its active right displacement

```math
\boxed{
\delta_v
:=
\max_{
\substack{
\rho\in\Pi\\
v_\rho\ne0\\
\Re\rho>1/2
}
}
\left(
\Re\rho-\frac12
\right)
>0.
}
```

---

## 2. Exact branch-killing tail threshold

By RPB-4, choose compact probes (f,g) encoding (v). The tail transform has, at every selected point

```math
w_\rho
=
\rho-\frac12,
```

residue

```math
\frac12v_\rho.
```

Suppose for some

```math
\kappa<2\delta_v
```

we had

```math
Q_{f,g}(y)
=
O(e^{\kappa y}).
```

Then the genuine tail Laplace transform

```math
\int_Y^\infty
Q_{f,g}(y)e^{-2sy}\,dy
```

would be holomorphic on

```math
\Re s>\frac\kappa2.
```

Choose an active selected right-half zero attaining (delta_v). Its transform point satisfies

```math
\Re w_\rho
=
\delta_v
>
\frac\kappa2,
```

while RPB-4 gives a nonzero pole residue there.

Contradiction.

Hence

```math
\boxed{
\text{for the interpolating probes, }
Q_{f,g}(y)=O(e^{\kappa y})
\text{ with }\kappa<2\delta_v
\Longrightarrow
\text{the selected negative source }v\text{ cannot exist}.
}
```

This is a source-specific exclusion theorem.

---

## 3. The unconditional scale is only (e^y)

For fixed compact (f,g), RPB-4 gives

```math
Q_{f,g}(y)
=
\sum_\rho
c_\rho^{f,g}
e^{2w_\rho y},
```

with

```math
\sum_\rho
|c_\rho^{f,g}|
<\infty.
```

The classical critical strip gives

```math
|\Re w_\rho|<\frac12.
```

Therefore for (y\ge0),

```math
\boxed{
|Q_{f,g}(y)|
\le
A_{f,g}e^y,
\qquad
A_{f,g}
=
\sum_\rho|c_\rho^{f,g}|.
}
```

So

```math
Q_{f,g}(y)=O(e^y)
```

is unconditional.

Since every active off-axis displacement satisfies

```math
0<2\delta_v<1,
```

the unconditional exponent (1) is too large to contradict any selected off-axis pole.

A genuinely useful RPB tail theorem must improve the exponent below the active selected threshold (2\delta_v).

---

## 4. Horizon-1 parameter regime

The negative morphology WD-T37 is an endpoint theorem.

It assumes

```math
t_n\downarrow c
```

for one fixed finite endpoint (c), and proves:

- a nonzero persistent selected endpoint ray;
- selected-amplitude blow-up of physical representatives;
- normalized full-Weil negativity;
- a finite zero-moment selected source (v);
- inverse-square decay of (R_v(z));
- far-divisor localization in the **zero-height cutoff** (R\to\infty);
- a finite/intermediate completed-(\Xi) next-jet field.

None of these conclusions is an estimate for a translated physical probe family with

```math
y\to\infty.
```

The symbol estimate in the neutral branch is explicitly

```math
\Psi_c(t)
=
\log|t|
+
O_c(1),
```

with a constant depending on the fixed support radius (c).

It is not uniform in

```math
c\to\infty.
```

Likewise, the finite prime-translation statement says only that at each **fixed** compact support (c), finitely many prime powers are active. Their number grows when (c) grows.

Thus Horizon 1 contains no theorem of the form

```math
\sup_{y\ge Y}
e^{-\kappa y}
|Q_{f,g}(y)|
<\infty
```

for the RPB probes and no operator-norm estimate with the required exponential rate along

```math
c(y)=y+O(1)\to\infty.
```

---

## 5. The two infinities must not be conflated

Horizon-1's far-tail theorem uses

```math
R\to\infty
```

where (R) is **distance in the complementary zero divisor from a fixed selected packet**:

```math
\mathcal F_{v,R}
=
O\left(\frac{\log R}{R}\right).
```

RPB-POL-TAIL uses

```math
y\to\infty
```

where (y) is **physical separation of translated probes**, and the minimal support window also tends to infinity.

These are different parameters and different asymptotic statements.

There is no lawful substitution

```math
R\leftrightarrow y.
```

The inverse-square decay of (R_v(z)) in the zero plane therefore does not by itself yield subexponential physical-separation growth.

---

## 6. Why the local endpoint negativity does not give the tail bound

WD-T37 gives physical witnesses (g_n) near one finite endpoint whose normalized Weil values satisfy

```math
\limsup
\frac{Q_W(g_n)}{\varepsilon_n^2}
\le
-\kappa.
```

The RPB probes (f,g) are constructed by finite Fourier interpolation from the resulting selected source.

They are not the endpoint witness sequence (g_n).

Moreover, RPB-POL-TAIL concerns cross values of **translated copies** of those newly constructed probes at arbitrarily large separation.

Thus there is no existing theorem chain

```math
\text{endpoint normalized negativity}
\Longrightarrow
\text{large-separation cross-term growth control}.
```

Such a chain would be new mathematics.

---

## 7. No free Cauchy-Schwarz route

If the full Weil form were already known positive semidefinite, one could use a form Cauchy-Schwarz inequality to control cross matrix coefficients.

But global Weil positivity is itself RH-equivalent.

Therefore any argument of the schematic form

```math
|\mathfrak q(f,g)|^2
\le
\mathfrak q[f]\mathfrak q[g]
```

must not be used unconditionally here.

Likewise, fixed-window logarithmic form estimates do not supply a uniform positive operator norm bound as (c\to\infty).

---

## 8. Logical position of RPB-POL-TAIL

RPB-POL-TAIL is therefore not currently a consequence of the Horizon-1 theorem DAG.

But it is now precisely typed.

For a selected source (v), choose interpolating probes (f_v,g_v). A sufficient source-specific interface is:

```math
\boxed{
\exists\kappa_v<2\delta_v:
\qquad
Q_{f_v,g_v}(y)
=
O(e^{\kappa_v y}).
}
```

A stronger source-independent version would be quantified subexponential control:

```math
\boxed{
\forall\varepsilon>0:
\qquad
Q_{f_v,g_v}(y)
=
O_\varepsilon(e^{\varepsilon y}).
}
```

The first is enough to kill the particular selected source; the second kills every off-axis selected source encoded by the probe.

---

## 9. Comparison with AZ-NEXTJET-LOC

The two interfaces now have distinct mathematical types.

### AZ-NEXTJET-LOC

Input:

```math
v
```

Question:

```math
\text{can the actual complementary divisor realize the required local weighted }\Xi\text{-jet compensation?}
```

This is a **local divisor-geometry** interface around a fixed selected packet.

### RPB-POL-TAIL

Input:

```math
v
\to
(f_v,g_v)
```

Question:

```math
\text{can one prove subcritical exponential growth of a translated physical cross coefficient?}
```

This is a **global physical-separation growth** interface.

No implication between them has yet been proved.

Therefore RPB-POL-TAIL is not merely a renaming of AZ-NEXTJET-LOC at present.

---

## 10. What RPB-5 rules out

RPB-5 rules out the hoped-for immediate splice

```math
\text{Horizon 1}
\Longrightarrow
\text{RPB tail bound}
\Longrightarrow
\text{selected-pole contradiction}.
```

The first arrow is missing.

This is useful: the reflected bridge has not secretly solved the existing RH-facing obligation.

Instead it has produced a genuinely different endpoint for future attack.

---

## 11. New investigative direction

The next question should not be another attempt to squeeze a (y\to\infty) estimate out of fixed-(c) Horizon-1 statements.

The correct next target is to analyze the **large-support evolution law** of the polarized cross coefficient itself:

```math
y
\mapsto
Q_{f,g}(y)
```

using its exact prime-window representation

```math
2y-2a
<
\log n
<
2y+2a.
```

This asks whether the moving prime-power window, after the exact pole-main cancellation, satisfies a recurrence, transfer law, cancellation law, or coercive estimate not visible in the fixed-window morphology.

That is a new regime.

---

## 12. RPB-5 determination

```math
\boxed{
\textbf{RPB-5 — HORIZON 1 DOES NOT CURRENTLY FORCE RPB-POL-TAIL.}
}
```

More precisely:

```math
\boxed{
\text{source custody: closed}
\qquad
\text{local pole custody: closed}
\qquad
\text{large-separation forcing: open}.
}
```

The reflected bridge therefore remains independent rather than collapsing back into the existing next-jet interface.

Next cursor:

```text
RPB-6 / LARGE-SEPARATION PRIME-WINDOW DYNAMICS
```
