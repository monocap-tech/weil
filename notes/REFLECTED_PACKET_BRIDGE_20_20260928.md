# RPB-20 — Finite residual selected crossing to source custody

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / SOURCE CUSTODY SURVIVES CRITICAL CROSSING / WD-T37 MARGIN MAY NOT**  
**Dependencies:** RPB-19; WD-C3/C4/C5; ZW1-T7/T8; ZW2-T1–T4.  
**Promotion status:** none.

## 0. Objective

RPB-19 produced a strict right neighborhood

```math
c_*<a<c_*+\delta_*
```

on which:

1. the complementary background relative to one fixed finite packet (Pi') remains strictly positive;
2. the full Weil form is already negative;
3. therefore one fixed finite residual selected sector
   ```math
   M'=M_{\Pi'}
   ```
   owns every post-edge negative sign.

RPB-20 asks whether this finite residual crossing yields a fixed nonzero selected raw source strong enough to enter the existing arithmetic next-jet machinery.

It does.

The key point is that a nonzero selected source survives even if the normalized selected (J)-margin tends to zero.

---

## 1. Choose a right-approaching negative branch

Let

```math
a_n\downarrow c_*,
qquad
c_*<a_n<c_*+\delta_*.
```

For each (n), choose a physical witness

```math
g_n
```

for the residual selected defect with

```math
Q_{\rm res,a_n}(g_n)<0.
```

Let

```math
y_n
=
\mathcal E_{\Pi',a_n}^{*}g_n
=
(a_n^{+},u_n)
\in
K_+^{\rm eff}\oplus M'
```

be the corresponding residual selected analysis vector.

Because its signature is negative,

```math
[y_n,y_n]_J<0.
```

In particular

```math
y_n\ne0.
```

Normalize by coefficient norm:

```math
\boxed{
z_n
=
\frac{y_n}{\|y_n\|}
=
(\alpha_n,\nu_n),
\qquad
\|z_n\|=1.
}
```

Then

```math
[z_n,z_n]_J<0.
```

---

## 2. Negative-coordinate mass cannot vanish

Since

```math
\|\alpha_n\|^2+\|\nu_n\|^2=1
```

and

```math
\|\alpha_n\|^2-\|\nu_n\|^2<0,
```

we have

```math
\boxed{
\|\nu_n\|^2>\frac12.
}
```

Thus every normalized post-edge negative analysis vector carries at least half of its Hilbert mass in the fixed finite negative sector (M').

Because

```math
\dim M'<\infty,
```

after passage to a subsequence,

```math
\boxed{
\nu_n\to\nu_*
}
```

strongly in (M').

Moreover,

```math
\boxed{
\|\nu_*\|
\ge
\frac1{\sqrt2}
>0.
}
```

So the selected coordinate cannot collapse even though the physical negative eigenvalue tends to zero.

---

## 3. Coefficient right-limit

The positive coordinates (alpha_n) are bounded.

After passing to a further subsequence,

```math
\alpha_n\rightharpoonup\alpha_*.
```

By the fixed finite-sector right-limit theorem WD-C3,

```math
\boxed{
z_*:=(\alpha_*,\nu_*)
\in
\mathcal A_{\Pi',c_*+}.
}
```

and

```math
\nu_*\ne0.
```

Let

```math
q_n
=
[z_n,z_n]_J
\in[-1,0).
```

After another subsequence,

```math
q_n\to q_*\le0.
```

Then WD-C3 gives

```math
[z_*,z_*]_J\le q_*.
```

Two cases remain.

---

## 4. Case N− — strict normalized negative limit

If

```math
q_*<0,
```

then

```math
\boxed{
z_*\ne0,
\qquad
[z_*,z_*]_J<0.
}
```

This is the ordinary persistent strict-negative fixed-packet morphology.

The selected coordinate

```math
\nu_*\ne0
```

therefore lies exactly in the source-producing regime already used by WD-T37.

In this case the branch can re-enter the existing negative-morphology theorem directly, subject to the remaining amplitude/common-carrier hypotheses of that theorem.

---

## 5. Case N0 — critical normalized crossing

Suppose instead

```math
q_*=0.
```

Then the normalized selected vectors are asymptotically critical.

WD-C4 gives a nonzero right-limit vector with nonpositive signature.

Whether the positive coordinate converges strongly to a neutral limit or loses norm and makes the right-limit strictly negative, the selected coordinate remains

```math
\boxed{
\nu_*\ne0.
}
```

Thus even in the purely critical alternative,

```math
[z_n,z_n]_J\to0,
```

the selected arithmetic source does not disappear.

This is **critical source custody**.

---

## 6. Raw zero source

Undo the canonical pair diagonalization on the fixed finite packet (Pi').

The nonzero selected coordinate

```math
\nu_*\in M'
```

determines a finite raw residue vector

```math
v_*
=
(v_j)_{\rho_j\in\Pi'}.
```

By ZW1-T7,

```math
\boxed{
v_*\ne0,
\qquad
\mathbf 1^Tv_*=0.
}
```

Therefore the selected rational response

```math
R_{v_*}(z)
=
\sum_{\rho_j\in\Pi'}
\frac{v_{*,j}}{z-\rho_j}
```

satisfies

```math
\boxed{
R_{v_*}(z)
=
O(|z|^{-2}).
}
```

No strict (J)-margin is required for these two conclusions.

They use only:

1. fixed finite selected custody;
2. nonzero selected coordinate;
3. pair antisymmetry.

---

## 7. Arithmetic next-jet machinery does not require the strict-margin theorem once the source exists

ZW2-T1–T4 are source-level statements.

For the fixed nonzero zero-moment source (v_*), one may choose a bounded selected-preserving multiplier (psi) with

```math
\mathcal C_{v_*}[\psi]=0.
```

The distant complementary response obeys

```math
\boxed{
\mathcal F_{v_*,R}[\psi]
=
O\left(\frac{\log R}{R}\right).
}
```

The near complementary field is

```math
\boxed{
\mathcal N_{v_*,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{
H_{v_*}^{(m_\mu)}(\mu)
}{
\Xi^{(m_\mu)}(\mu)
}.
}
```

Thus the exact arithmetic localization / completed-(Xi) next-jet representation is available in **both** N− and N0.

The strict negative morphology is one route to producing the source; it is not a logical prerequisite for applying the source-level ZW2 identities after a nonzero (v_*) has already been obtained.

---

## 8. What does not transfer automatically from WD-T37

The stronger WD-T37 package begins from normalized selected negativity with a fixed margin

```math
[z_n,z_n]_J
\to
-\kappa,
\qquad
\kappa>0.
```

That hypothesis supplies additional geometric information:

- a strictly negative persistent endpoint ray;
- normalized negative margin bounded away from zero;
- the specific representative-blow-up morphology tied to selected amplitude collapse.

In the critical crossing case N0, none of those may be asserted.

Therefore:

```math
\boxed{
\text{critical source custody}
\not\Rightarrow
\text{WD-T37 strict negative morphology}.
}
```

But:

```math
\boxed{
\text{critical source custody}
\Rightarrow
\text{fixed nonzero zero-moment source}
\Rightarrow
\text{ZW2 next-jet representation}.
}
```

This is the exact distinction.

---

## 9. Source convergence is finite-dimensional

Let (U) be the fixed unitary/raw-coordinate map from the selected negative pair sector (M') to the finite raw selected residue space.

Then

```math
v_n
=
U\nu_n
\to
U\nu_*
=
v_*.
```

Hence the source itself converges strongly:

```math
\boxed{
v_n\to v_*\ne0.
}
```

In particular, after shrinking the subsequence if needed,

```math
\|v_n\|
\ge
\frac12\|v_*\|
>0.
```

So the post-edge source cannot disappear through finite-dimensional coefficient cancellation.

What may vanish is only the **signature excess** over the neutral budget.

---

## 10. Relationship with RPB-4 translated-pole custody

Because (v_*
e0) is a fixed finite selected source, RPB-3/RPB-4 also apply.

There exist compact probes (f_{v_*},g_{v_*}) such that

```math
m_{\rho_j}
M_{f_{v_*},g_{v_*}}
\left(
-(\rho_j-\tfrac12)
\right)
=
v_{*,j}
```

for all selected zeros.

The associated polarized translated Weil kernel has tail-Laplace residues

```math
\boxed{
\operatorname{Res}_{s=\rho_j-1/2}
F^{\rm mer}_{f_{v_*},g_{v_*};Y}(s)
=
\frac12v_{*,j}.
}
```

Thus the neutral-to-negative crossing now also has a fixed reflected-packet pole certificate, even in the critical normalized case.

This does not provide the missing RPB-POL-TAIL bound.

---

## 11. Updated source-production logic

Before RPB-20, the main canonical source-production route was

```math
\text{persistent strict negative ray}
\Longrightarrow
v\ne0.
```

The branch-local RPB analysis now supplies the broader implication

```math
\boxed{
\text{fixed finite residual post-neutral crossing}
\Longrightarrow
v_*\ne0,
\quad
\mathbf 1^Tv_*=0.
}
```

with a dichotomy:

```math
\boxed{
\begin{cases}
q_*<0
&
\Rightarrow
\text{strict negative-ray custody},
\\[1mm]
q_*=0
&
\Rightarrow
\text{critical source custody}.
\end{cases}
}
```

Both branches feed the same source-level arithmetic representations.

---

## 12. Does this close AZ-NEXTJET-LOC?

No.

RPB-20 produces the fixed source and therefore reaches the already known next-jet field

```math
\mathcal N_{v_*,R}[\psi].
```

It does not prove that the actual complementary divisor cannot realize that field.

Thus

```text
AZ-NEXTJET-LOC
```

remains the arithmetic exclusion/forcing interface.

What RPB-20 changes is the route into that interface:

the neutral branch no longer stops before source custody.

After finite packet enlargement and background-gap propagation, it reaches the **same fixed-source arithmetic object** even if the normalized crossing itself is only critical.

---

## 13. RPB-20 determination

```math
\boxed{
\textbf{RPB-20 — FINITE RESIDUAL CROSSING ALWAYS PRODUCES NONZERO SOURCE CUSTODY.}
}
```

Exact source theorem:

```math
\boxed{
\exists
\text{ fixed finite }v_*\ne0:
\mathbf 1^Tv_*=0,
\qquad
R_{v_*}(z)=O(|z|^{-2}).
}
```

The stronger morphology splits:

```math
\boxed{
\text{strict negative source custody}
\quad\text{or}\quad
\text{critical source custody}.
}
```

In either case the source-level ZW2 chain and the RPB-4 translated-pole certificate apply.

Next cursor:

```text
RPB-21 / CRITICAL SOURCE CUSTODY ↔ AZ-NEXTJET-LOC
```

The next pass should determine whether the existing statement of `AZ-NEXTJET-LOC` is already source-typed strongly enough to consume a critically obtained fixed source (v_*), or whether that interface currently contains hidden WD-T37 strict-margin assumptions and needs a branch-local retyping.
