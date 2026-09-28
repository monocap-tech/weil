# RPB-17 — Actual-zeta background screening gap at the neutral edge

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PARTIAL PASS / ACTUAL-ZETA GAP REDUCED TO FULL-NULLSPACE COVERAGE**  
**Dependencies:** RPB-15, RPB-16; Suzuki 2026; Connes–Consani–Moscovici compact-window operator theory.  
**Promotion status:** none.

## 0. Objective

RPB-16 showed that abstract compactness, right continuity, and Hilbert–Schmidt tail control do not force the unselected negative background to remain screenable on a right neighborhood of the neutral edge.

RPB-17 asks whether the **actual zeta compact-window operator** has extra spectral structure that forces a strict background gap at the endpoint itself.

There is such extra structure:

```math
\boxed{
A_{c_*}
\text{ has discrete lower-bounded spectrum}.
}
```

Therefore

```math
N_*
:=
\ker A_{c_*}
```

is finite dimensional, and the next positive full eigenvalue is separated from zero.

This reduces the background-gap problem to one finite-dimensional question:

```math
\boxed{
N_*
\cap
\ker S_M^*
=
\{0\}?
}
```

That condition is not currently proved.

---

## 1. Source gate

Primary current source:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3,
2026-09-23.
```

Suzuki recalls the Connes–Consani–Moscovici result that the canonical self-adjoint compact-window Weil operator

```math
A_a
```

has spectrum:

- bounded from below;
- discrete;
- with (+infty) as its only accumulation point.

Consequently every eigenspace, including

```math
\ker A_a,
```

is finite dimensional.

Suzuki also proves continuity of the lowest eigenvalue (lambda_a), but simplicity of that lowest eigenvalue is established only for sufficiently small (a), not at an arbitrary zero crossing.

No general theorem in the current source states

```math
\dim\ker A_{c_*}=1
```

for an arbitrary neutral edge.

---

## 2. Raw selected/background operator identity at the endpoint

Fix the finite selected negative sector

```math
M=M_\Pi
```

attached to the attained-neutral branch.

Let

```math
S_M:M\to\mathcal H
```

be its physical synthesis and let (B) denote the complementary negative background.

At the raw zero-side level,

```math
D_{\rm full}
=
P
-
S_MS_M^*
-
S_BS_B^*.
```

The background-only defect is

```math
D_B
=
P-S_BS_B^*.
```

Hence

```math
\boxed{
D_B
=
D_{\rm full}
+
S_MS_M^*.
}
```

Under carrier identification with the canonical compact-window operator at (c_*), write

```math
A_*
:=
A_{c_*}
```

and

```math
K_M
:=
S_MS_M^*.
```

Then the background-only operator is

```math
\boxed{
A_{B,*}
=
A_*
+
K_M.
}
```

Here

```math
A_*\succeq0,
\qquad
K_M\succeq0,
```

and (K_M) is finite rank.

---

## 3. Exact kernel identity

For any vector (h) in the form domain,

```math
\langle A_{B,*}h,h\rangle
=
\langle A_*h,h\rangle
+
\|S_M^*h\|^2.
```

Both terms on the right are nonnegative.

Therefore

```math
\langle A_{B,*}h,h\rangle=0
```

if and only if

```math
A_*^{1/2}h=0
```

and

```math
S_M^*h=0.
```

Equivalently,

```math
\boxed{
\ker A_{B,*}
=
\ker A_*
\cap
\ker S_M^*.
}
```

This is the exact endpoint background-nullspace formula.

---

## 4. The known endpoint neutral mode is lifted by the selected covariance

The attained-neutral branch supplies a nonzero physical mode

```math
k\in\ker A_*.
```

Its selected coordinate is nonzero:

```math
u\ne0.
```

Under the physical adjoint realization,

```math
S_M^*k
```

is the selected negative coefficient represented by that mode, up to the fixed sign/convention of the selected synthesis.

Hence

```math
\boxed{
S_M^*k\ne0.
}
```

Therefore

```math
k\notin\ker A_{B,*}.
```

So the selected covariance definitely lifts the **known** neutral direction.

This is stronger than the generic abstract picture of RPB-16.

---

## 5. Full-nullspace coverage criterion

The only possible background-null vectors are additional full null modes

```math
h\in\ker A_*
```

that are invisible to the selected sector:

```math
S_M^*h=0.
```

Thus:

```math
\boxed{
A_{B,*}
\text{ has trivial kernel}
\iff
\ker A_*
\cap
\ker S_M^*
=
\{0\}.
}
```

Call this condition **full-nullspace coverage**.

Because

```math
\ker A_*
```

is finite dimensional, this is a finite-dimensional injectivity test.

---

## 6. Trivial kernel upgrades to a positive physical spectral gap

The operator

```math
A_*
```

has discrete spectrum with (+infty) as the only accumulation point.

The finite-rank bounded perturbation

```math
K_M=S_MS_M^*
```

preserves compact resolvent / discreteness of the spectrum.

Therefore

```math
A_{B,*}
=
A_*+K_M
```

also has discrete lower-bounded spectrum.

Since

```math
A_{B,*}\succeq0,
```

if its kernel is trivial then zero is not in its spectrum.

Hence its lowest eigenvalue is strictly positive:

```math
\boxed{
\ker A_{B,*}=\{0\}
\Longrightarrow
\exists\eta_*>0:
A_{B,*}\succeq\eta_*I.
}
```

Conversely, a positive physical spectral gap obviously implies trivial kernel.

Thus:

```math
\boxed{
\text{background physical spectral gap}
\iff
\text{full-nullspace coverage}.
}
```

This equivalence uses the actual-zeta discrete-spectrum theorem and is not available in the generic abstract calculus.

---

## 7. Immediate corollary under simple full nullity

If

```math
\dim\ker A_*=1,
```

then

```math
\ker A_*
=
\mathbb Ck.
```

Since

```math
S_M^*k\ne0,
```

we get

```math
\ker A_*
\cap
\ker S_M^*
=
\{0\}.
```

Therefore:

```math
\boxed{
\dim\ker A_*=1
\Longrightarrow
A_{B,*}\succeq\eta_*I
\text{ for some }\eta_*>0.
}
```

So **simplicity of the full neutral eigenvalue is sufficient to create a strict background physical gap.**

---

## 8. What Suzuki currently proves about simplicity

Suzuki proves that for sufficiently small support (a>0),

```math
\lambda_a
```

is positive and simple, and the corresponding ground state is even.

That theorem does not apply automatically to an arbitrary neutral crossing support (c_*), because (c_*) is not known to lie in the sufficiently-small-(a) regime.

The current source explicitly treats simplicity at general (a) as an additional issue in the discussion surrounding the ground state.

Therefore the implication

```math
\lambda_{c_*}=0
\Longrightarrow
\dim\ker A_{c_*}=1
```

is not presently available.

No simplicity may be imported at the neutral edge.

---

## 9. Higher-dimensional nullspace case

Suppose

```math
r
=
\dim\ker A_*
>
1.
```

The selected sector has full-nullspace coverage if and only if the finite-dimensional map

```math
\boxed{
S_M^*|_{\ker A_*}:
\ker A_*
\to
M
}
```

is injective.

This immediately gives the necessary dimensional condition

```math
\boxed{
r
\le
\dim M.
}
```

But dimension alone is not sufficient.

One must also exclude a nonzero null mode whose selected coefficient vanishes.

Thus the exact endpoint problem is a finite matrix-rank problem once a basis of the full nullspace is known.

---

## 10. Relation to parity

The canonical compact-window operator commutes with parity.

Therefore

```math
\ker A_*
=
N_*^+
\oplus
N_*^-.
```

If the selected sector belongs to one parity block only, then any full null vector in the opposite parity block is automatically invisible to that selected sector.

In that situation full-nullspace coverage fails unless the opposite-parity nullspace is trivial.

Thus a parity-resolved version of the gap condition is required:

```math
\boxed{
S_M^*|_{N_*^{\rm selected\ parity}}
\text{ injective}
}
```

and

```math
\boxed{
N_*^{\rm opposite\ parity}
=
\{0\}
}
```

when (M) has no coupling to the opposite block.

Suzuki's parity decomposition therefore sharpens, rather than removes, the nullspace-coverage obligation.

---

## 11. Physical spectral gap versus screening contraction gap

RPB-16 phrased one desirable endpoint condition as

```math
\|X_{B,c_*}\|<1.
```

RPB-17 must separate this coefficient-space statement from the physical (L^2)-spectral statement.

The theorem proved here is:

```math
\boxed{
A_{B,*}\succeq\eta_*I
\iff
\ker A_*
\cap
\ker S_M^*
=
\{0\}.
}
```

It does **not** automatically imply

```math
\|X_{B,c_*}\|<1
```

in the native coefficient metric.

Such an implication would require a comparison between physical coercivity of the background defect and the reduced Douglas screening norm, including the relevant range/metric hypotheses.

This comparison is not currently part of Horizon 1.

So the original RPB-17 target splits into:

### Physical gap target

Finite-dimensional nullspace coverage.

### Coefficient screening-gap target

A separate metric/range comparison theorem.

The physical gap is enough to support a right-stability argument if one can also prove suitable support-parameter form/operator continuity for the background problem.

---

## 12. Does actual zeta force full-nullspace coverage?

At current standing:

```math
\boxed{
\text{NO PROOF}.
}
```

Known facts:

1. the full nullspace is finite dimensional;
2. the known selected neutral mode is detected by (S_M^*);
3. if the full nullspace is one dimensional, coverage follows;
4. more generally, coverage is a finite-dimensional injectivity condition.

Missing fact:

```math
\boxed{
\ker A_*
\cap
\ker S_M^*
=
\{0\}.
}
```

Neither zero counting, Hilbert–Schmidt tail decay, pair antisymmetry, nor the screw-potential representation currently proves this.

Thus actual-zeta structure reduces the problem sharply but does not close it.

---

## 13. Consequence for immediate background failure

If full-nullspace coverage holds, then the background has a positive physical spectral gap at the endpoint.

Immediate background failure would then require that the support-dependent background form lose a fixed positive gap instantaneously.

This is a substantially stronger instability than the critical examples in RPB-16.

If full-nullspace coverage fails, the background is already critical at the endpoint:

```math
\lambda_{B,c_*}=0.
```

Then the immediate-failure mechanisms of RPB-16 remain fully available.

Therefore the first decision point is now:

```math
\boxed{
\text{background critical at }c_*
\quad\text{vs}\quad
\text{background physically gapped at }c_*.
}
```

---

## 14. Exact next target

The strongest economical next pass is not another tail estimate.

It is the endpoint nullity problem:

> Can the actual compact-window Weil ground state at a first/retained neutral edge have multiplicity greater than one, or can a second null mode lie in the selected-orthogonal subspace?

This can be attacked through:

1. Suzuki's positivity-improving machinery beyond the small-support regime;
2. parity-resolved ground-state analysis;
3. finite-dimensional kernel matrices from the screw operator;
4. a direct selected-evaluation rank theorem on (ker A_{c_*}).

Any one of these could establish full-nullspace coverage.

---

## 15. RPB-17 determination

```math
\boxed{
\textbf{RPB-17 — ACTUAL-ZETA BACKGROUND GAP REDUCES TO FULL-NULLSPACE COVERAGE.}
}
```

Exact theorem:

```math
\boxed{
\ker A_{B,c_*}
=
\ker A_{c_*}
\cap
\ker S_M^*.
}
```

Using discreteness of the actual compact-window spectrum:

```math
\boxed{
A_{B,c_*}\succeq\eta I
\text{ for some }\eta>0
\iff
\ker A_{c_*}
\cap
\ker S_M^*
=
\{0\}.
}
```

Sufficient special case:

```math
\boxed{
\dim\ker A_{c_*}=1
\Longrightarrow
\text{strict background physical gap}.
}
```

Current obstruction:

```math
\boxed{
\text{simplicity/injectivity at an arbitrary neutral edge is not yet proved}.
}
```

Next cursor:

```text
RPB-18 / NEUTRAL GROUND-STATE SIMPLICITY AND SELECTED NULLSPACE COVERAGE
```
