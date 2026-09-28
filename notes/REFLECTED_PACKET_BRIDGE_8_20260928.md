# RPB-8 — Bridge regroup and object determination

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **REGROUP PASS / BRIDGE OBJECT IDENTIFIED / NO RH CLOSURE CLAIM**  
**Dependencies:** RPB-0 through RPB-7.  
**Promotion status:** none.

## 0. Purpose

RPB-0 through RPB-7 began with one scalar reflected-packet criterion and progressively enlarged it until the exact common parent structure became visible.

This pass freezes that hierarchy and separates:

1. the parent mathematical object;
2. its Horizon-1 representation;
3. its reflected-packet representation;
4. the successful bridge theorems;
5. exhausted subroutes;
6. the genuinely open forcing problem.

The object determination is structural, not an RH proof.

---

## 1. Parent data

Work on

```math
\mathscr D
=
C_c^\infty(\mathbb R)
```

with translations

```math
(T_tf)(x)
=
f(x-t)
```

and the complete Hermitian Weil preform

```math
\mathfrak q:
\mathscr D\times\mathscr D
\to\mathbb C.
```

The basic parent object identified by the bridge is

```math
\boxed{
(\mathscr D,T,\mathfrak q),
}
```

the branch-local **Weil translation system**.

The point is that neither (mathfrak q) alone nor one compact-window operator records the translation dynamics exposed by the reflected construction.

---

## 2. Exact common-translation invariance

For every real (a),

```math
\boxed{
\mathfrak q(T_af,T_ag)
=
\mathfrak q(f,g).
}
```

This follows term by term.

### Archimedean term

```math
\widehat{T_af}(t)
=
e^{-iat}\widehat f(t),
```

so

```math
\overline{\widehat{T_af}(t)}
\widehat{T_ag}(t)
=
\overline{\widehat f(t)}
\widehat g(t).
```

### Pole terms

At (z=\pm i/2), the two translation factors are reciprocal in the first and second variables and cancel inside each sesquilinear pole product.

### Prime-power correlations

```math
C_{T_af,T_ag}(r)
=
C_{f,g}(r).
```

Thus the whole Weil preform is invariant under simultaneous physical translation.

This gives an actual translation symmetry of the form, not merely of the asymptotic zero expansion.

---

## 3. Polarized translated Weil kernel

The translation matrix coefficients are

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
:=
\mathfrak q(T_tf,g).
}
```

By common-translation invariance,

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
\mathfrak q(T_{t/2}f,T_{-t/2}g).
}
```

Hermiticity gives

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
\overline{
\mathcal K_{\mathfrak q}(g,f;-t)
}.
}
```

So the RPB parent observable is a translation-covariant Hermitian matrix-coefficient kernel on physical probes.

No positivity of this kernel is assumed.

---

## 4. The original reflected scalar is one diagonal slice

For the frozen real even dyadic probe (h),

```math
Q_h(y)
=
\mathfrak q(T_yh,T_{-y}h).
```

Therefore

```math
\boxed{
Q_h(y)
=
\mathcal K_{\mathfrak q}(h,h;2y).
}
```

The reflected paper's parity splitting is

```math
\Delta_h(y)=2Q_h(y).
```

Thus the pasted repository studies one especially well-designed diagonal trajectory through the much larger matrix-coefficient family.

Its exact transform divisor makes that trajectory a universal detector of off-critical zeros.

It is not the whole parent object.

---

## 5. Horizon 1 is the support-compression view of the same system

For a compact support radius (c), define the physical test subspace

```math
\mathscr D_c
=
\{f\in\mathscr D:
\operatorname{supp}f\subseteq[-c,c]\}.
```

The compact-window Weil form/operator is the restriction/compression of the same (mathfrak q) to (mathscr D_c).

Horizon 1 then factors that compressed form through its zero-side positive/negative coefficient geometry and studies:

- screening;
- negative index;
- selected/background custody;
- support filtration;
- endpoint persistence;
- neutral null modes.

Schematically,

```math
\boxed{
(\mathscr D,T,\mathfrak q)
\xrightarrow{\text{support compression at }c}
\mathfrak q|_{\mathscr D_c}
\xrightarrow{\text{zero-side factorization}}
D_c
\xrightarrow{\text{defect analysis}}
\text{Horizon-1 morphologies}.
}
```

So Horizon 1 is a **static/support-filtration interrogation** of the parent translation system.

---

## 6. The reflected route is the translation-orbit view

Fix physical probes (f,g).

Instead of compressing the support and analyzing the coefficient geometry at one endpoint, follow the relative translation orbit:

```math
t
\longmapsto
\mathcal K_{\mathfrak q}(f,g;t).
```

For sufficiently separated probes, RPB-4 gives

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
\sum_\rho^{\rm dist}
m_\rho
M_{f,g}\!\left(
-\left(\rho-\frac12\right)
\right)
e^{(\rho-1/2)t}.
}
```

This converts zero geometry into spectral growth under the translation parameter.

Schematically,

```math
\boxed{
(\mathscr D,T,\mathfrak q)
\xrightarrow{\text{translation matrix coefficient}}
\mathcal K_{\mathfrak q}(f,g;t)
\xrightarrow{\text{Laplace}}
\text{individual divisor poles}.
}
```

So the reflected construction is a **dynamic/translation interrogation** of the same parent system.

---

## 7. Why the two programs initially looked opposite

Before the bridge:

### Horizon 1 appeared to have

```math
\text{strong structural theory}
\quad+\quad
\text{underidentified terminal object}.
```

### Reflected packet appeared to have

```math
\text{explicit scalar object}
\quad+\quad
\text{missing forcing theorem}.
```

RPB shows that this opposition was representation-dependent.

The real relation is:

```math
\boxed{
\text{same parent translation system}
\quad
\begin{cases}
\text{support-compression coordinates},\\
\text{translation-matrix-coefficient coordinates}.
\end{cases}
}
```

Each representation makes a different hard feature explicit and hides a different one.

Horizon 1 makes defect geometry explicit but does not automatically control long translation orbits.

The reflected route makes long translation spectral growth explicit but does not automatically force a favorable growth exponent.

---

## 8. Selected-source bridge inside the parent system

The strongest successful RPB chain is:

```math
\boxed{
\begin{aligned}
\text{WD-T37 persistent negative morphology}
&\Longrightarrow
v\ne0, \mathbf1^Tv=0
\\
&\Longrightarrow
\text{compact probes }(f_v,g_v)
\\
&\Longrightarrow
m_\rho\widetilde W_v(\rho)=v_\rho
\quad(\rho\in\Pi)
\\
&\Longrightarrow
\mathcal K_{\mathfrak q}(f_v,g_v;t)
\\
&\Longrightarrow
\text{selected Laplace poles with residue }v_\rho/2.
\end{aligned}
}
```

Thus a coefficient-space negative source from the support-compression representation can be re-expressed exactly as selected local spectral data of a translation matrix coefficient.

This is the principal bridge theorem family produced by RPB.

---

## 9. Arithmetic representation of the same matrix coefficient

Let

```math
W_{f,g}(u)
=
u^{-1/2}
C_{f,g}(-\log u).
```

Then, with

```math
X=e^t,
```

the same matrix coefficient is represented through the smoothed Chebyshev discrepancy

```math
D_W(X)
=
\sum_n
\Lambda(n)W(n/X)
-
X\int W.
```

At the power scale,

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;\log X)
\sim
-X^{-1/2}D_W(X)
}
```

up to the explicitly controlled archimedean/pole corrections.

Its Mellin transform satisfies

```math
\boxed{
\widetilde W(\rho)
=
M_{f,g}\!\left(
-\left(\rho-\frac12\right)
\right).
}
```

So the zero and prime descriptions are two transforms of one matrix coefficient.

---

## 10. Object hierarchy after RPB

The current hierarchy is:

### Level A — parent object

```math
\boxed{
(\mathscr D,T,\mathfrak q)
}
```

the Weil translation system.

### Level B — universal matrix-coefficient object

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
}
```

the polarized translated Weil kernel.

### Level C1 — support-compression representation

```math
\mathfrak q|_{\mathscr D_c}
\longleftrightarrow
W_c,D_c,
\text{ zero-side synthesis, defect morphologies}.
```

This is the principal Horizon-1 view.

### Level C2 — translation-orbit representation

```math
t\mapsto
\mathcal K_{\mathfrak q}(f,g;t).
```

This contains the reflected-packet view.

### Level C3 — logarithmic arithmetic representation

```math
C_{f,g}*d\nu_E.
```

### Level C4 — multiplicative/Mellin representation

```math
W_{f,g}
\mapsto
D_W(X),
\qquad
m_\rho\widetilde W(\rho).
```

### Derived local data

```math
v,
\quad
R_v,
\quad
\Xi\text{-next jets},
\quad
\text{Laplace poles}
```

are representation-specific coordinates or outputs.

They are not, at present, the best candidate for the parent object.

---

## 11. Object determination

The RPB investigation therefore rejects the following as the full bridge object:

### Not (Q_h)

It is one diagonal slice.

### Not the frozen packet (h)

It is a specially designed detector probe.

### Not (W_c)

It is one fixed-support compression.

### Not the selected source (v)

It is finite coefficient data produced by one defect morphology.

### Not the Mellin weight (W)

It is a probe-dependent arithmetic realization.

### Not the smoothed Chebyshev discrepancy (D_W)

It is the prime-side trajectory of one matrix coefficient.

The current best object determination is:

```math
\boxed{
\text{primitive bridge structure}
=
(\mathscr D,T,\mathfrak q),
}
```

with

```math
\boxed{
\mathcal K_{\mathfrak q}
}
```

as its operational matrix-coefficient kernel.

This is stronger than saying merely that both programs use the Weil form.

The translation action is load-bearing.

Without (T), the distinction between endpoint compression and long-orbit growth is invisible.

---

## 12. What has been learned about the earlier “object problem”

The earlier question was whether the project had developed hard theory while still failing to identify the object to which the theory naturally belongs.

RPB gives a partial answer.

At least across the Horizon-1 / reflected-packet boundary, the theory naturally belongs not to one privileged scalar, vector, or compact-window operator, but to a **form equipped with a translation action**.

The apparently separate objects are then different reductions:

```math
\boxed{
\begin{array}{rcl}
\text{compact-window operator} & = & \text{support compression},\\
\text{defect source} & = & \text{zero-side coordinate residue},\\
Q_h & = & \text{diagonal translation coefficient},\\
Q_{f,g} & = & \text{polarized translation coefficient},\\
W & = & \text{multiplicative probe coordinate},\\
D_W & = & \text{prime-side dilation trajectory}.
\end{array}
}
```

This does not prove that the Weil translation system is the final primitive object of every post-Horizon construction.

It does establish that it is the correct common parent for the two programs compared in RPB.

---

## 13. Exhausted routes

The following RPB subroutes are closed unless new structure is imported.

### Fixed frozen probe as universal WD-T37 source encoder

**NO.**

One frozen probe supplies one fixed selected-source projection and can miss an individual negative pair coordinate.

### Generic threshold recurrence

**NO.**

Smooth compact probe thresholds are (C^\infty)-silent, and a nonzero compact smooth correlation kernel admits no nontrivial global finite constant-delay relation.

### Zero-moment to Mellin moment forcing

**NO.**

The source zero moment is only a finite relation among selected Mellin samples. Arbitrarily many finite Mellin moments can be imposed independently without removing the selected off-axis pole.

### Immediate Horizon-1 to RPB tail implication

**NO.**

Fixed-endpoint/support theory does not supply a large-separation exponent.

These no-go results prevent repeated traversal of structurally dead branches.

---

## 14. Open forcing routes

The live mathematical gap is now narrow in type, even if difficult in content.

### Route A — local divisor forcing

```text
AZ-NEXTJET-LOC
```

Control the actual near completed-(Xi) geometry required by the selected source.

### Route B — global translation forcing

```text
RPB-POL-TAIL
```

For source-adapted probes, prove a translation-growth / smoothed-PNT exponent below an active selected off-axis real part.

### Route C — representation bridge

Find a theorem linking the two:

```math
\text{next-jet obstruction}
\quad\Longleftrightarrow?\quad
\text{translation-tail obstruction}.
```

No such equivalence is presently proved.

A successful Route C would explain why the same selected source presents two apparently different terminal obstructions.

---

## 15. What should not be promoted yet

RPB-0 through RPB-8 remain branch-local reconnaissance.

In particular, do not yet:

1. modify the public Horizon-1 theorem DAG;
2. add `RPB-POL-TAIL` to the canonical RH-interface appendix;
3. rename (W_c), (v), or (Q_h) as the unique “Weil object”;
4. assert equivalence between `AZ-NEXTJET-LOC` and `RPB-POL-TAIL`;
5. claim the bridge closes a negative morphology or RH.

The correct current standing is object identification plus exact representation bridges.

---

## 16. RPB pass ledger

```text
RPB-0  bridge/source gate                         PASS
RPB-1  quadratic/parity normalization            PASS
RPB-2  quartet hyperbolic decomposition          PASS
RPB-3  selected-source physical interpolation    PASS after polarization
RPB-4  polarized zero expansion/local poles      PASS
RPB-5  Horizon-1 ⇒ tail forcing                   NO CURRENT IMPLICATION
RPB-6  threshold recurrence                      NO; dilation/Mellin model PASS
RPB-7  zero-moment ⇒ Mellin cancellation          NO-GO
RPB-8  regroup/object determination               PASS
```

The negative results are retained as audited route closures, not discarded residue.

---

## 17. RPB-8 determination

```math
\boxed{
\textbf{RPB-8 — COMMON PARENT OBJECT IDENTIFIED.}
}
```

At current standing:

```math
\boxed{
\text{Weil translation system}
\quad
(\mathscr D,T,\mathfrak q)
}
```

is the correct common parent of the Horizon-1 support-compression theory and the reflected-packet translation-growth theory.

Its operational observable is the polarized translated Weil kernel

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
\mathfrak q(T_tf,g).
}
```

The next test should determine whether the screw-function/operator representations already present in the wider Weil literature are themselves scalar/kernel realizations of this same translation system, or whether they carry genuinely additional structure.

Next cursor:

```text
RPB-9 / TRANSLATION SYSTEM ↔ SCREW-FUNCTION REPRESENTATION
```
