# Quartet Channel and Residue Structure
**H1-P2.1 — Canonical pair geometry, finite inertia, residue moments, and compact synthesis**

This pass extracts the first genuinely Weil/zeta-specific theorem package after the abstract H1-P1 calculus.

The organization is:

```math
\boxed{
\text{ZW-0 pair geometry}
\longrightarrow
\text{ZW-1 zeta-divisor structure}.
}
```

Prime/pole/archimedean explicit-formula arithmetic is deferred to H1-P2.2.

---

## 1. Canonical pair coordinates

Let

```math
\gamma=T+i\delta,
\qquad
\bar\gamma=T-i\delta
```

be a nonreal conjugate pair in Bombieri's ordinate coordinate.

Let

```math
e_\gamma,
\qquad
e_{\bar\gamma}
```

be the corresponding raw coefficient vectors and let the coefficient involution satisfy

```math
Je_\gamma=e_{\bar\gamma}.
```

Define

```math
\boxed{
p
=
\frac{e_\gamma+e_{\bar\gamma}}{\sqrt2},
\qquad
n
=
\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2}.
}
```

Then

```math
\boxed{
Jp=p,
\qquad
Jn=-n.
}
```

Thus every distinct nonreal conjugate pair contributes one positive and one negative coefficient coordinate.

A real ordinate satisfies

```math
Je_\gamma=e_\gamma
```

and contributes only a positive coordinate.

---

### ZW1-T1 — Pair-diagonalization theorem

After quotienting same-frequency multiplicity-null directions, the zero-side coefficient space decomposes canonically as

```math
\boxed{
K_{+}
=
K_{\rm real}
\oplus
K_{{\rm off},+},
\qquad
K_{-}
=
K_{{\rm off},-},
}
```

where each distinct nonreal conjugate pair contributes exactly one basis direction to each of

```math
K_{{\rm off},+}
\quad\text{and}\quad
K_{{\rm off},-}.
```

**Standing:** PROVED by direct diagonalization of the conjugation involution.

### Physical pair shapes

Ignoring the common Bombieri/Green preconditioning for the moment, the two pair combinations synthesize as

```math
g^+(u)
=
\sqrt2\,e^{-iTu}\cosh(\delta u),
```

and

```math
g^-(u)
=
\sqrt2\,e^{-iTu}\sinh(\delta u).
```

Hence

```math
g^+
```

is the symmetric positive pair direction and

```math
g^-
```

is the antisymmetric negative pair direction.

---

## 2. Functional-equation quartets

An off-critical zeta quartet has the form

```math
\frac12\pm\delta\pm iT.
```

In Bombieri's ordinate coordinate

```math
\rho=\frac12+i\gamma,
```

this becomes

```math
\gamma
=
\pm T\pm i\delta.
```

Thus one simple off-critical quartet contains two distinct nonreal conjugate pairs:

```math
\{T+i\delta,T-i\delta\},
```

and

```math
\{-T+i\delta,-T-i\delta\}.
```

Therefore one simple quartet contributes two canonical negative pair directions before parity reduction.

---

### ZW1-T2 — Quartet negative-coordinate count

A selected packet containing $q$ simple disjoint off-critical zeta quartets has

```math
\boxed{
\dim M_\Pi=2q
}
```

in the unreduced pair-diagonalized negative coefficient space.

For the previously studied two-quartet packet,

```math
\boxed{
\dim M_\Pi=4.
}
```

**Standing:** PROVED from ZW1-T1 and functional-equation/conjugation symmetry.

This is a coefficient-space count. The equality with the finite Weil matrix's negative spectral index uses Bombieri's inertia theorem below.

---

## 3. Bombieri finite inertia

Bombieri proves for his finite Weil matrices that, after multiplicity-null directions are separated, the number of negative eigenvalues equals the number of distinct nonreal conjugate pairs in the finite symmetric zero set.

Equivalently, the finite Weil matrix realizes the full available negative coefficient index.

---

### ZW1-T3 — Finite Weil inertia saturation

For a finite symmetric zero set $\Gamma$,

```math
\boxed{
\operatorname{ind}_{-} H(\Gamma;t)
=
\#\{
\text{distinct nonreal conjugate pairs in }\Gamma
\}.
}
```

Consequently, for a finite selected packet $\Pi$,

```math
\boxed{
\operatorname{ind}_{-} H(\Pi;t)
=
\dim M_\Pi
}
```

after quotienting multiplicity-null directions.

For two simple quartets,

```math
\boxed{
\operatorname{ind}_{-}=4.
}
```

**Standing:** IMPORTED from Bombieri's finite-truncation theorem + exact specialization.

### Significance relative to H1-P1

WD-B2 gives only

```math
\operatorname{ind}_{-}\le\dim M_\Pi.
```

ZW1-T3 shows that the finite Weil geometry **saturates** this abstract cap.

That saturation is genuinely Weil-specific.

---

## 4. Multiplicity-null directions

Suppose a raw ordinate $\gamma$ occurs with multiplicity

```math
m(\gamma)>1.
```

Before quotienting, duplicate same-frequency coefficients contain an $(m(\gamma)-1)$-dimensional subspace whose synthesized exponential is identically zero.

These directions are algebraic multiplicity kernels rather than independent defect channels.

---

### ZW1-T4 — Distinct-frequency reduction

For each repeated ordinate of multiplicity $m$,

```math
\boxed{
m-1
}
```

raw coefficient directions are exact synthesis-null directions.

After quotienting these directions:

1. each distinct real ordinate contributes one positive coordinate;
2. each distinct nonreal conjugate pair contributes one positive and one negative coordinate;
3. the finite negative-index count is by **distinct conjugate pairs**, not raw multiplicity.

**Standing:** IMPORTED/DERIVED from Bombieri's multiplicity treatment and direct coefficient quotienting.

### Custody consequence

A raw count such as

```math
\sum_j \delta_j^2
```

over a zero multiset does not automatically count independent negative obligations.

Multiplicity must be quotiented before negative-channel dimension is interpreted.

---

## 5. Finite exponential independence

The next statement is elementary but load-bearing.

---

### ZW1-T5 — Finite distinct-frequency independence

Let

```math
\lambda_1,\dots,\lambda_N
```

be distinct complex numbers.

If

```math
\sum_{j=1}^N
c_j e^{\lambda_j u}
=
0
```

for every $u$ in a nonempty real interval, then

```math
\boxed{
c_1=\cdots=c_N=0.
}
```

### Proof

The finite exponential sum is entire in $u$. Vanishing on a real interval implies it vanishes identically.

Differentiating at one point $u_0$ for orders $0,\dots,N-1$ gives a Vandermonde system

```math
\sum_j
c_j\lambda_j^k e^{\lambda_j u_0}
=
0.
```

The Vandermonde determinant is nonzero because the $\lambda_j$ are distinct.

**Standing:** PROVED.

---

## 6. Bombieri Problem-1 independence after Green preconditioning

Bombieri's Problem-1 physical representative includes the Dirichlet Green preconditioning

```math
q_\gamma
=
\frac1{\frac14+\gamma^2}
```

and boundary-homogeneous terms.

Let

```math
L
=
-\partial_u^2+\frac14.
```

Then

```math
L e^{\pm u/2}=0,
```

while

```math
L
\left[
\frac{e^{-i\gamma u}}{\frac14+\gamma^2}
\right]
=
e^{-i\gamma u}.
```

Therefore every finite Problem-1 relation reduces, after applying $L$, to a finite distinct-frequency exponential relation.

---

### ZW1-T6 — No finite positive compensation for an anchored negative cell

Fix a selected negative pair direction $n_C$.

After quotienting multiplicity-null directions, no finite collection of distinct positive zero-side channels can synthesize an exact cancellation of $n_C$ on a nontrivial interval.

Equivalently, an exact anchored relation of the form

```math
n_C+x_{+}\in\ker E_t
```

requires

```math
\boxed{
x_{+}
\text{ to have infinitely many distinct frequency coordinates}.
}
```

In particular, the selected pair's own positive direction $p_C$ cannot cancel $n_C$ by itself.

**Standing:** PROVED from ZW1-T5 and the Problem-1 differential reduction.

### Important scope

This theorem concerns **exact finite-support cancellation**.

It does not exclude:

- infinite positive compensation;
- approximate finite compensation;
- zero-edge screening by an infinite compact positive bath.

---

## 7. Raw residue map for negative pair coordinates

Let $u\in M_\Pi$ be a selected negative coefficient vector.

Undo the pair diagonalization and write the corresponding raw residues on the selected zero coordinates as

```math
v=(v_j)_{\rho_j\in\Pi}.
```

For one negative pair coordinate with coefficient $\alpha$,

```math
n
=
\frac{e_\gamma-e_{\bar\gamma}}{\sqrt2},
```

the raw residues are proportional to

```math
\left(
\frac{\alpha}{\sqrt2},
-\frac{\alpha}{\sqrt2}
\right).
```

Thus each negative pair contributes zero total raw residue.

---

### ZW1-T7 — Selected zero-moment theorem

For every selected negative coefficient vector

```math
u\in M_\Pi,
```

the associated raw residue vector $v$ satisfies

```math
\boxed{
\mathbf{1}^Tv
=
\sum_{\rho_j\in\Pi}v_j
=
0.
}
```

If

```math
u\ne0,
```

then

```math
v\ne0.
```

**Standing:** PROVED.

### Source of the theorem

This is not an H1-P1 consequence.

It comes from antisymmetry of the canonical negative pair channels.

No prime/pole/archimedean input is used.

---

## 8. Rational response and optimal far order

Define

```math
\boxed{
R_v(z)
=
\sum_{\rho_j\in\Pi}
\frac{v_j}{z-\rho_j}.
}
```

For large $z$,

```math
\frac1{z-\rho_j}
=
\frac1z
+
\frac{\rho_j}{z^2}
+
O(|z|^{-3}).
```

Therefore

```math
R_v(z)
=
\frac{\sum_jv_j}{z}
+
\frac{\sum_j\rho_jv_j}{z^2}
+
O(|z|^{-3}).
```

ZW1-T7 cancels the first term.

---

### ZW1-T8 — Universal inverse-square far decay

Every selected negative residue vector satisfies

```math
\boxed{
R_v(z)
=
O(|z|^{-2}).
}
```

More precisely,

```math
\boxed{
R_v(z)
=
\frac{M_1(v)}{z^2}
+
O(|z|^{-3}),
\qquad
M_1(v)
:=
\sum_j\rho_jv_j.
}
```

**Standing:** PROVED.

---

### ZW1-E1 — The inverse-square order is sharp

For one distinct pair

```math
\rho_1\ne\rho_2
```

take

```math
v=(1,-1).
```

Then

```math
\mathbf{1}^Tv=0,
```

but

```math
M_1(v)
=
\rho_1-\rho_2
\ne0.
```

Hence

```math
R_v(z)
\sim
\frac{\rho_1-\rho_2}{z^2}.
```

Therefore no source-free theorem can improve ZW1-T8 to

```math
O(|z|^{-3})
```

for every negative pair vector.

**Standing:** PROVED EXAMPLE.

### Consequence

Any first-moment cancellation

```math
\sum_j\rho_jv_j=0
```

must come from additional structure beyond canonical pair antisymmetry.

---

## 9. Native Problem-1 synthesis is compact

The physically correct Problem-1 carrier is not the unweighted $L^2$ exponential model.

Let

```math
L=-\partial_u^2+\frac14
```

on the compact interval with Dirichlet boundary conditions, and let

```math
G=L^{-1}.
```

The unweighted exponential source naturally lives in the $H^{-1}_L$ metric

```math
\|f\|_{H^{-1}_L}^2
=
\langle f,Gf\rangle.
```

For one coordinate vector $e_\gamma$, let

```math
f_\gamma(u)=e^{-i\gamma u}
```

and solve

```math
LF_\gamma=f_\gamma,
\qquad
F_\gamma(\pm t)=0.
```

A particular solution is

```math
\frac{e^{-i\gamma u}}{\frac14+\gamma^2},
```

and the Dirichlet correction is a linear combination of $e^{u/2}$ and $e^{-u/2}$. Because zeta ordinates stay in the fixed strip

```math
|\Im\gamma|<\frac12,
```

the boundary data of the particular solution are $O_t(|\gamma|^{-2})$, so the homogeneous correction is also $O_t(|\gamma|^{-2})$ in $L^2(-t,t)$. Hence

```math
\|F_\gamma\|_2
\ll_t
\frac1{1+|\gamma|^2},
\qquad
\|f_\gamma\|_2
\ll_t1.
```

Using

```math
\|f_\gamma\|_{H^{-1}_L}^2
=
\langle f_\gamma,Gf_\gamma\rangle
=
\langle f_\gamma,F_\gamma\rangle,
```

we obtain

```math
\boxed{
\|E_t e_\gamma\|_{H^{-1}_L}^2
\ll_t
\frac1{1+|\gamma|^2}.
}
```

Bombieri's equation (7.7) is consistent with the same high-height decay, but the Hilbert-space estimate above is the native proof used here; it does not identify Bombieri's complex-symmetric $H$-matrix with an ordinary Hilbert Gram matrix.

The standard unit-height zero count gives

```math
N(T+1)-N(T)
=
O(\log(2+T))
```

with multiplicity. Therefore

```math
\sum_{\gamma}
\|E_t e_\gamma\|_{H^{-1}_L}^2
<
\infty.
```

---

### ZW1-T9 — Hilbert-Schmidt synthesis theorem

For every fixed compact support window,

```math
\boxed{
E_t:\ell^2(\Gamma)\to H^{-1}_L(-t,t)
}
```

is Hilbert-Schmidt and hence compact.

Every restriction of $E_t$, including the positive off-axis helper synthesis

```math
S_{{\rm off},+},
```

is also Hilbert-Schmidt.

Consequently,

```math
\boxed{
K_{{\rm off},+}
=
S_{{\rm off},+}S_{{\rm off},+}^{*}
}
```

is trace class.

**Standing:** DERIVED from the direct Dirichlet-resolvent estimate above + the zeta zero count. Bombieri's kernel decay is corroborating/contextual for this theorem, not the Hilbert-Gram justification.

### Tail estimate

Let $Q_{>G}$ retain helper coordinates with height $>G$.

Then

```math
\|S_{{\rm off},+}Q_{>G}\|_{\rm HS}^2
\ll_t
\sum_{n\ge G}
\frac{\log n}{n^2}
\ll
\frac{\log G}{G}.
```

Hence

```math
\boxed{
\|S_{{\rm off},+}Q_{>G}\|
\ll_t
\sqrt{\frac{\log G}{G}},
}
```

and

```math
\boxed{
\|K_{{\rm off},+,>G}\|
\ll_t
\frac{\log G}{G}.
}
```

Thus arbitrarily high helper cells have vanishing operator-norm tail.

---

## 10. Compact assistance does not imply finite assistance

ZW1-T6 says no finite positive-frequency set can close the selected negative relation exactly.

ZW1-T9 says the infinite positive helper field is compact and has small high-height tails.

These are compatible.

A compact operator can have nonclosed range.

Thus an exact infinite compensator may require an infinite tail whose image norm is small while still being essential for exact range membership.

---

### ZW1-T10 — Finite-head approximation necessity

Suppose

```math
S_{{\rm off},+}x=y
```

with

```math
\|x\|\le1.
```

Write

```math
x=x_{\le G}+x_{>G}.
```

Then

```math
\boxed{
\operatorname{dist}
\left(
y,
\operatorname{Ran}S_{{\rm off},+,\le G}
\right)
\le
\|S_{{\rm off},+,>G}\|.
}
```

Hence every exact unit-budget infinite helper target must admit finite-head approximations at the quantitative rate

```math
\boxed{
O_t\!\left(
\sqrt{\frac{\log G}{G}}
\right).
}
```

**Standing:** PROVED from ZW1-T9.

### Scope

This is a necessary approximation condition.

It does not prove exact finite-head membership.

---

## 11. Metric separation: unweighted mirror frames versus native Problem-1 synthesis

The prior traversal also developed unweighted $L^2(-t,t)$ sampling/frame statements for extracted real-ordinate or positive-mirror exponential families.

Those statements live in a different metric from Bombieri's native Problem-1 synthesis.

Because ZW1-T9 shows the native infinite Problem-1 synthesis is compact,

```math
\boxed{
\text{native Problem-1 }S_{+}
\text{ cannot be bounded below on an infinite-dimensional coefficient space}.
}
```

Therefore any valid lower frame bound for an unweighted exponential/mirror family must not be reinterpreted as

```math
S_{+}S_{+}^{*}\succeq aI
```

for the native Problem-1 operator on an infinite-dimensional carrier.

---

### ZW1-S1 — Positive-channel completeness input is metric-typed

The project retains harmonic-analytic sampling/completeness information for suitable unweighted zeta-ordinate/mirror families.

At H1-P2.1 standing, this information is classified as:

```math
\boxed{
\text{auxiliary unweighted }L^2/PW_t\text{ input},
}
```

not as a native Problem-1 coercivity theorem.

**Standing:** SCOPE NORMALIZATION.

### Consequence

The independent Weil-defect package does not require a global native positive-channel lower frame bound.

The load-bearing native facts needed here are instead:

- exact pair geometry;
- finite inertia;
- infinite-compensation necessity;
- compact/Hilbert-Schmidt synthesis;
- selected residue zero moment.

This removes the metric mismatch from the canonical theorem spine.

---

## 12. What is now genuinely ZW-1?

After H1-P2.1, the following statements are certified as stronger than generic H1-P1 theory:

```math
\boxed{
\begin{aligned}
&\text{canonical conjugate-pair }(+,-)\text{ diagonalization};\\
&\text{quartet-to-pair multiplicity};\\
&\text{finite Weil inertia saturation};\\
&\text{multiplicity-null quotient structure};\\
&\text{finite distinct-frequency independence};\\
&\text{infinite-compensation necessity};\\
&\mathbf{1}^Tv=0;\\
&R_v(z)=O(|z|^{-2})\text{ with sharp universal order};\\
&\text{Hilbert-Schmidt/compact native zero synthesis};\\
&\text{trace-class off-axis positive helper covariance}.
\end{aligned}
}
```

No prime-side explicit formula has been used to obtain this package.

---

## H1-P2.1 determination

H1-P2.1 closes.

The central theorem chain is now

```math
\boxed{
\text{off-axis pair}
\Longrightarrow
(+,-)\text{ channels}
\Longrightarrow
\text{finite negative-index saturation}
}
```

and, for a selected negative packet,

```math
\boxed{
u
\Longrightarrow
\mathbf{1}^Tv=0
\Longrightarrow
R_v(z)=O(|z|^{-2}).
}
```

At the same time,

```math
\boxed{
\text{exact selected negative cancellation}
\Longrightarrow
\text{infinitely many distinct positive frequencies},
}
```

while the native infinite synthesis is compact/Hilbert-Schmidt.

This combination precisely identifies the zero-side screening problem before arithmetic re-entry.

---

## Historical handoff from H1-P2.1

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P2.2 / EXPLICIT-FORMULA ARITHMETIC ATTACHMENT}
}
```

At the close of H1-P2.1, the next pass was assigned to normalize the ZW-2 layer:

1. selected-preserving scalar multipliers;
2. far-tail localization from the zero moment;
3. completed $\Xi$ next-jet identity;
4. prime/pole/archimedean co-adaptation;
5. compact-window finite prime-shift operator;
6. logarithmic principal symbol;
7. exact boundary between arithmetic theorem and RH-facing open interface.
