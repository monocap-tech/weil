# Weil-Defect Theory: Screening, Persistence, and Zeta-Weil Morphology

> Public technical manuscript — Horizon 1.
>
> Mathematical statements are indexed by stable WD-Txx identifiers.
> Mathematical standing, formal verification status, and imported-source
> custody are separate axes.

## Abstract

We develop an operator-theoretic defect calculus for indefinite coefficient
spaces and use it to organize the sign geometry underlying finite Weil
defects. The basic object is the physical defect

~~~math
D=S_{+}S_{+}^{*}-S_{-}S_{-}^{*},
~~~

whose negative index agrees with the negative index of the associated
coefficient-space Krein form. Nonnegativity of $D$ is equivalent, through
Douglas factorization, to contractive screening of the negative synthesis
through the positive synthesis. For the reduced-solution split used here, this
gives the full first-level screening taxonomy: range defect, over-budget
screening, strict screening, attained criticality, and non-attained
criticality.

The calculus is stable under selected/background decompositions and legitimate
background elimination. In the monotone support-filtration setting of
WD-T16/WD-T17, a normalized right-approaching sequence whose selected negative
coordinate stays in one fixed finite-dimensional sector and whose limiting
signature is nonpositive has a nonzero nonpositive right-limit subsequence.
At criticality, the resulting fixed-sector limit has the WD-T17 dichotomy: it
is neutral when the positive-coordinate norm is retained, and strictly
negative when positive-coordinate norm is lost. A moving or infinite selected
sector is a different custody regime; unselected-background noncompactness is
a separate mechanism that can occur after a selected ray is already anchored.

We then specialize this structure to the zeta-Weil setting. Conjugate-pair
geometry, finite Weil inertia, distinct-frequency rigidity, and selected
residue structure imply a zero-moment law

~~~math
\mathbf 1^{T}v=0
~~~

for selected negative raw residues. Consequently the associated rational
response has universal inverse-square far decay,

~~~math
R_v(z)=O(|z|^{-2}),
~~~

which is sharp under zero moment alone. Combining this with unit-height zeta
zero counting gives an explicit-formula far complementary tail

~~~math
O\!\left(\frac{\log R}{R}\right).
~~~

The surviving near field is a weighted completed-$\Xi$ next-jet field. At
fixed compact support, only finitely many prime-power translations are active
and the compact-window operator has logarithmic principal order,

~~~math
\Psi_c(t)=\log|t|+O_c(1),
~~~

with no automatic positive-Sobolev coercive upgrade.

These ingredients assemble into three morphology classes: persistent selected
negative defect, attained unit-gain neutral defect, and noncompact
moving/background morphology. The first two terminate at explicit
actual-zeta interfaces,

~~~text
AZ-NEXTJET-LOC
AZ-FIN-WEIL-NULL-EXTENSION
~~~

with C-ACTUAL-KPH-FLOOR retained as a stronger special-packet refinement on
the negative side. Horizon 1 proves the deduction up to these stop lines. It
does not prove the interface statements themselves and does not claim RH
closure.

---

# Part I. Abstract Weil-defect calculus

## 1. Coefficient space, synthesis, and physical defect

Let

~~~math
\mathcal H,\qquad K_{+},\qquad K_{-}
~~~

be complex Hilbert spaces and let

~~~math
S_{+}:K_{+}\to\mathcal H,
\qquad
S_{-}:K_{-}\to\mathcal H
~~~

be bounded synthesis operators. On $K_{+}\oplus K_{-}$ use

~~~math
J=
\begin{pmatrix}
I&0\\
0&-I
\end{pmatrix},
\qquad
[(x,u),(y,v)]_J
=
\langle x,y\rangle-\langle u,v\rangle.
~~~

Define

~~~math
E(x,u)=S_{+}x+S_{-}u,
\qquad
\mathcal A=(\ker E)^\perp
=\overline{\operatorname{Ran}E^{*}},
~~~

and

~~~math
\boxed{
D=EJE^{*}
=S_{+}S_{+}^{*}-S_{-}S_{-}^{*}.
}
~~~

### WD-T01 — Defect identity and index transfer

For every $h\in\mathcal H$,

~~~math
E^{*}h=(S_{+}^{*}h,S_{-}^{*}h),
~~~

so

~~~math
\boxed{
[E^{*}h,E^{*}h]_J
=
\langle Dh,h\rangle.
}
~~~

Hence

~~~math
\boxed{
\mathcal A\text{ is }J\text{-nonnegative}
\iff
D\succeq0
}
~~~

and

~~~math
\boxed{
\operatorname{ind}_{-}(\mathcal A,J)
=
\operatorname{ind}_{-}(D).
}
~~~

Coefficient-space negativity and physical-space negativity are therefore two
representations of the same negative-index obstruction.

### WD-T02 — Contractive screening

The following are equivalent:

~~~math
D\succeq0,
\qquad
S_{-}S_{-}^{*}\preceq S_{+}S_{+}^{*},
~~~

and the existence of a contraction

~~~math
X:K_{-}\to K_{+}
~~~

such that

~~~math
\boxed{
S_{-}=-S_{+}X.
}
~~~

This is the unit-majorization case of Douglas factorization. The external
Douglas theorem is the load-bearing imported input EXT-1.

### WD-T03 — Reduced graph normal form

Assume exact range inclusion

~~~math
\operatorname{Ran}S_{-}
\subseteq
\operatorname{Ran}S_{+}
~~~

and let $X$ be the reduced solution. Then

~~~math
\boxed{
\mathcal A
=
\{(a,-X^{*}a):
a\in(\ker S_{+})^\perp\}.
}
~~~

On this graph,

~~~math
\boxed{
[(a,-X^{*}a),(a,-X^{*}a)]_J
=
\|a\|^{2}-\|X^{*}a\|^{2},
}
~~~

and

~~~math
\boxed{
D=S_{+}(I-XX^{*})S_{+}^{*}.
}
~~~

After the range-defect branch is separated, the sign problem is therefore a
reduced-screening norm problem.

### WD-T04 — Complete screening taxonomy

The reduced solution gives five basic regimes.

1. **Range defect:** no exact screening exists.
2. **Over-budget defect:** range inclusion holds but $\|X\|>1$.
3. **Strict screening:** $\|X\|=r<1$, with
   ~~~math
   [y,y]_J
   \ge
   \frac{1-r^2}{1+r^2}\|y\|^2.
   ~~~
4. **Attained criticality:** $\|X\|=1$ and $X^{*}$ attains its norm,
   producing a nonzero neutral vector.
5. **Non-attained criticality:** $\|X\|=1$ with no nonzero norm-attaining
   vector; all nonzero vectors remain strictly positive, but normalized
   margins can tend to zero.

The last regime is an essentially infinite-dimensional boundary phenomenon.

### WD-T05 — Rank-one specialization

If $K_{-}=\mathbb C$ and $S_{-}\alpha=\alpha g$, then

~~~math
S_{-}S_{-}^{*}=g\otimes g
~~~

and

~~~math
\boxed{
D=S_{+}S_{+}^{*}-g\otimes g.
}
~~~

Thus $D\succeq0$ is equivalent to the existence of $c\in K_{+}$ with

~~~math
g=-S_{+}c,
\qquad
\|c\|\le1.
~~~

The one-negative-channel Weil defect is the rank-one case of the abstract
calculus.

---

## 2. Positive restoration and selected/background custody

### WD-T06 — Monotone positive screening

Let $P_N$ increase strongly to $I$ and define

~~~math
D_N
=
S_{+}P_NS_{+}^{*}-S_{-}S_{-}^{*}.
~~~

Then

~~~math
\boxed{
D_N\preceq D_{N+1}\preceq D,
\qquad
D_N\to D\text{ strongly},
}
~~~

and

~~~math
\boxed{
\operatorname{ind}_{-}(D_N)
\ge
\operatorname{ind}_{-}(D_{N+1}).
}
~~~

Negative directions can disappear as positive channels are restored.
WD-X01 shows that the disappearance can be complete.

Split

~~~math
K_{-}=M\oplus B
~~~

into a selected negative sector $M$ and an unselected negative background
$B$.

### WD-T07 — Selected/background custody

With

~~~math
D_M=S_{+}S_{+}^{*}-S_MS_M^{*}
~~~

and

~~~math
D_{\rm full}
=
S_{+}S_{+}^{*}
-S_MS_M^{*}
-S_BS_B^{*},
~~~

one has

~~~math
\boxed{
D_{\rm full}\preceq D_M.
}
~~~

Hence

~~~math
\boxed{
\text{selected negativity}
\Longrightarrow
\text{full negativity}.
}
~~~

The converse fails: aggregate negativity does not identify the sector that
owns the defect.

### WD-T08 — Finite selected-sector index cap

If $\dim M=m<\infty$, then

~~~math
\boxed{
\operatorname{ind}_{-}(D_M)\le m.
}
~~~

The negative index attributable to the selected defect is therefore bounded
by the dimension of the fixed selected sector.

### WD-T09 — Shared screening budget

For the reduced full screening map $X=[X_M\;X_B]$,

~~~math
\boxed{
D_{\rm full}
=
S_{+}
\bigl(I-X_MX_M^{*}-X_BX_B^{*}\bigr)
S_{+}^{*}.
}
~~~

Therefore

~~~math
\boxed{
D_{\rm full}\succeq0
\iff
X_MX_M^{*}+X_BX_B^{*}\preceq I.
}
~~~

Separate contractivity of $X_M$ and $X_B$ is insufficient. WD-X03 is the
explicit joint-budget counterexample.

---

## 3. Background elimination, inertia, and shorting

### WD-T10 — Residual positive synthesis

If the background is contractively screened,

~~~math
S_B=-S_{+}X_B,
\qquad
\|X_B\|\le1,
~~~

define

~~~math
R_B=I-X_BX_B^{*}\succeq0,
\qquad
S_{\rm eff}=S_{+}R_B^{1/2}.
~~~

Then

~~~math
\boxed{
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^{*}
-S_MS_M^{*}.
}
~~~

Legitimate background elimination returns the problem to the original
two-channel defect category.

### WD-T11 — Finite-sector singular-value inertia

For fixed finite-dimensional $M$, let $Y$ be the reduced residual
screening map. Then

~~~math
\boxed{
\operatorname{ind}_{-}
=
\#\{j:\sigma_j(Y)>1\},
}
~~~

and

~~~math
\boxed{
\operatorname{nul}_{J}
=
\#\{j:\sigma_j(Y)=1\}.
}
~~~

The critical boundary is a unit-singular-value boundary for the selected
sector.

### WD-T12 — Sequential background consumption

Background elimination may be iterated. Each legitimately screened background
consumes positive covariance and leaves a new residual budget. The selected
problem remains inside the same defect calculus.

### WD-T13 — Shorted covariance

Under the stated uniformly positive complement hypothesis, eliminating the
positive complement replaces direct compression by

~~~math
\boxed{
H_W=A-BC^{-1}B^{*}.
}
~~~

The correction is positive, so $H_W\preceq A$. WD-X04 shows that a uniform
lower bound on $A$ alone does not yield a uniform family-level lower bound on
$H_W$.

### WD-T14 — Finite positive shadows

Finite positive projections preserve an already-established algebraic
negative margin, but they need not preserve the analysis-space relation. This
separates visibility of sign from custody of the synthesis/graph relation.

---

## 4. Support filtration and fixed-sector persistence

Let

~~~math
\mathcal A_s\subseteq\mathcal A_t
\qquad(s<t)
~~~

be a monotone family of closed analysis spaces. Define

~~~math
\boxed{
\mathcal A_{c+}
=
\bigcap_{t>c}\mathcal A_t
}
~~~

and

~~~math
\boxed{
\mathcal J_c
=
\mathcal A_{c+}\ominus\mathcal A_c.
}
~~~

### WD-T15 — Right-limit projection and gap duality

Along $t_n\downarrow c$, the monotone orthogonal projections converge to the
projection onto $\mathcal A_{c+}$. The right-limit gap is the geometric
carrier for vectors appearing arbitrarily close to the endpoint but absent at
the endpoint itself.

### WD-T16 — Fixed finite negative-sector persistence

Let

~~~math
y_n=(a_n,u_n)
~~~

be normalized right-approaching vectors with $u_n$ in one fixed
finite-dimensional selected negative sector and

~~~math
[y_n,y_n]_J\to q_{*}\le0.
~~~

After a subsequence,

~~~math
u_n\to u
~~~

strongly and

~~~math
a_n\rightharpoonup a.
~~~

The limit $y=(a,u)$ lies in $\mathcal A_{c+}$, and

~~~math
\boxed{
[y,y]_J\le q_{*},
\qquad
y\neq0.
}
~~~

Thus

~~~math
\boxed{
\text{fixed finite selected sector}
+
q_{*}\le0
\Longrightarrow
\text{nonzero nonpositive right-limit ray}.
}
~~~

A uniform negative margin persists as a strict negative margin.

### WD-T17 — Critical dichotomy

At criticality,

~~~math
[y_n,y_n]_J\to0.
~~~

If the positive-coordinate norms converge to the norm of the weak limit, then
the positive coordinates converge strongly and the limit is neutral. If
positive-coordinate norm is lost, the WD-T17 norm comparison gives

~~~math
\boxed{
[y,y]_J<0.
}
~~~

WD-X06 gives an explicit realization of this negative fall-through.

### WD-T18 — Endpoint-jump index control

New right-limit negative directions are carried by the endpoint quotient. The
negative index contributed by the right-limit jump is bounded by the
dimension of the endpoint gap quotient.

### WD-T19 — Boundary amplification

When a genuinely new right-limit vector is absent from the endpoint space,
normalized endpoint representatives cannot remain uniformly controlled. Under
the common physical-realization and right-continuity hypotheses of WD-T19,
vanishing endpoint amplitude therefore yields representative blow-up.

### Part I summary

Part I establishes

~~~math
\boxed{
\begin{array}{c}
\text{fixed finite selected sector}\\
+\ \text{critical or negative right approach}
\end{array}
\Longrightarrow
\text{nonzero nonpositive right-limit ray}.
}
~~~

Within a branch that retains nontrivial selected negative mass, loss of a
persistent selected ray requires leaving the fixed finite-sector regime, for
example by moving through infinitely many selected coordinates as in WD-X05.
If the selected negative mass itself vanishes, the sequence has instead left
the anchored fixed-packet hypothesis.

---

# Part II. Zeta-Weil specialization

## 5. Pair geometry, inertia, and multiplicity

### WD-T20 — Pair diagonalization

Each nonreal conjugate-pair block admits a canonical positive/negative
diagonalization. This realizes the abstract $J$-splitting in the finite Weil
pair geometry.

### WD-T21 — Simple quartet geometry

A simple off-critical functional-equation quartet contributes two distinct
nonreal conjugate-pair coordinates on the negative side before
multiplicity-null reduction.

### WD-T22 — Finite Weil inertia

Bombieri's finite Weil theorem identifies the number of negative eigenvalues
with the number of distinct nonreal conjugate pairs. Horizon 1 consumes this
as the imported source EXT-2A and specializes its count to the selected Weil
pair geometry.

### WD-T23 — Multiplicity-null reduction

Repeated ordinates generate zero directions rather than additional
independent negative channels. These null directions must be quotiented before
independent negative-index counting. The imported source is EXT-2B.

---

## 6. Frequency rigidity and zero-moment residues

### WD-T24 — Finite distinct-frequency independence

A finite linear combination of distinct exponential modes cannot vanish on a
nonempty interval unless all coefficients vanish.

### WD-T25 — No exact finite positive compensation

An anchored selected negative cell cannot be exactly reproduced by a finite
positive combination of the retained distinct-frequency Problem-1 modes.

### WD-T26 — Zero-moment law

Selected negative raw residues satisfy

~~~math
\boxed{
\mathbf 1^{T}v=0.
}
~~~

This cancellation is inherited from selected pair structure; it is not an
externally imposed moment condition.

---

## 7. Rational response and native compactness

Define

~~~math
R_v(z)=\sum_j\frac{v_j}{z-\rho_j}.
~~~

### WD-T27 — Universal inverse-square far decay

The zero-moment identity removes the $z^{-1}$ Laurent term, giving

~~~math
\boxed{
R_v(z)=O(|z|^{-2}).
}
~~~

WD-X07 shows this order is sharp under zero moment alone.

### WD-T28 — Native Problem-1 compactness

The native Problem-1 zero synthesis is Hilbert-Schmidt and the associated
off-axis helper covariance is trace class. The proof uses a native
Dirichlet-resolvent estimate together with the imported unit-height zero count
EXT-3.

### WD-T29 — Quantitative finite-head approximation

Compactness yields controlled approximation of an infinite helper target by a
finite head. It does not by itself yield an exact finite replacement.

---

## 8. Explicit-formula arithmetic

### WD-T30 — Two-mode selected-preserving multiplier

Under the two-mode hypotheses, a scalar multiplier can preserve the selected
conditions while cancelling one chosen complementary mode. This is a finite
algebraic tool, not a global uniform annihilator.

### WD-T31 — Far complementary tail

Combine

~~~math
R_v(\mu)=O(|\mu|^{-2})
~~~

with EXT-3:

~~~math
N(T+1)-N(T)=O(\log T).
~~~

Shell summation gives

~~~math
\boxed{
\mathcal F_{v,R}[\psi]
=
O\!\left(\frac{\log R}{R}\right)
}
~~~

under the stated bounded multiplier hypotheses.

### WD-T32 — Weighted completed next-jet field

After the far tail is separated, the near complementary response is

~~~math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
}
~~~

This is the finite/intermediate arithmetic field left after the zero-moment
far-field gain.

### WD-T33 — Adaptive cocancellation guard

At a fixed cutoff, adaptive cancellation of one near-minus-archimedean
contribution collapses the corresponding prime term onto the far term. The
explicit formula is reallocated, not bypassed.

### WD-T34 — Finite prime-power translations

For support radius $c$, the compact-window explicit formula activates only

~~~math
\boxed{
\log n<2c.
}
~~~

The active prime-power set is finite. At an equality threshold, the strict
endpoint convention excludes the threshold term while the strict right limit
includes the corresponding finite threshold correction. The source is EXT-4.

### WD-T35 — Logarithmic form order

Using EXT-5 together with EXT-4,

~~~math
\boxed{
\Psi_c(t)=\log|t|+O_c(1).
}
~~~

The compact-window Weil form therefore has logarithmic Fourier/form order.

### WD-T36 — No free positive-Sobolev bootstrap

Logarithmic form control does not imply a uniform coercive estimate at any
fixed positive Sobolev order. Finitely many prime translations do not change
the principal order and add no smoothing.

### Part II summary

The zeta-Weil specialization supplies

~~~math
\boxed{
\mathbf 1^{T}v=0
\Longrightarrow
R_v(z)=O(|z|^{-2})
\Longrightarrow
\mathcal F_{v,R}
=
O\!\left(\frac{\log R}{R}\right),
}
~~~

while the near field is the weighted completed-$\Xi$ next-jet object. On the
neutral side, the compact-window operator has logarithmic principal order plus
finitely many arithmetic translations and no hidden regularity upgrade.

---

# Part III. Defect morphology

## 9. WD-T37 — Persistent selected negative morphology

Assume the fixed-packet hypotheses of WD-T37, including a strict normalized
negative limit. WD-T16 then yields a nonzero selected negative limit
coordinate, and WD-T07 transfers the resulting selected negativity to the full
coefficient problem. The zeta-Weil chain then supplies:

1. a nonzero selected raw residue source;
2. the zero-moment law;
3. inverse-square rational-response decay;
4. the $O((\log R)/R)$ far complementary estimate;
5. localization of the remaining burden into the weighted completed-$\Xi$
   next-jet field;
6. the adaptive-cocancellation guard.

Thus

~~~math
\boxed{
\begin{aligned}
\text{fixed-packet persistent negative defect}
&\Longrightarrow
\text{nonzero zero-moment selected source}\\
&\Longrightarrow
O(|z|^{-2})\text{ far response}\\
&\Longrightarrow
O((\log R)/R)\text{ far field}\\
&\Longrightarrow
\text{weighted near next-jet morphology}.
\end{aligned}
}
~~~

The branch stops at

~~~text
AZ-NEXTJET-LOC
~~~

and the stronger special-packet refinement

~~~text
C-ACTUAL-KPH-FLOOR
~~~

remains downstream and open.

---

## 10. WD-T38 — Attained unit-gain neutral morphology

Suppose the fixed selected critical branch is attained and the finite-exception
unit-gain, physical adjoint realization, and carrier-identification hypotheses
of WD-T38 are all available. Those hypotheses give a nonzero compact-window
null mode

~~~math
\boxed{
W_c k=0.
}
~~~

WD-T34–WD-T36 type the operator as:

- finitely many active prime-power translations;
- threshold-aware endpoint/right-limit correction;
- logarithmic principal order;
- no automatic positive-Sobolev coercive gain;
- global quadratic cancellation rather than termwise vanishing.

The branch stops at

~~~text
AZ-FIN-WEIL-NULL-EXTENSION
~~~

which asks for the actual support/null-extension rigidity needed beyond the
compact-window null equation. No such theorem is imported upstream.

---

## 11. WD-T39 — Noncompact moving/background morphology

WD-T39 separates noncompactness before and after fixed selected custody is
anchored.

### Full-coordinate moving escape

For a uniformly bounded full coefficient sequence, if every fixed block of a
self-adjoint finite-coordinate exhaustion tends to zero, then

~~~math
\boxed{
w_n\rightharpoonup0.
}
~~~

This is a full-carrier condition, not merely selected-negative escape.

### Fixed selected-packet custody

If one fixed finite selected packet retains selected negative norm bounded away
from zero, finite-dimensional compactness gives, after passage to a
subsequence, a nonzero strong selected-coordinate limit. WD-X05 shows the
contrasting regime in which the selected one-dimensional sector itself moves
through infinitely many coordinates.

### Unselected-background trichotomy

After a fixed selected negative ray is anchored, the normalized unselected
background has, after a subsequence, one of three regimes:

~~~math
\boxed{
\begin{array}{ll}
\mathbf{B_\infty}:&
\|b_n\|\to\infty,\\
\mathbf{B_T}:&
b_n\text{ bounded with positive tail/weak norm loss},\\
\mathbf{B_F}:&
b_n\to b\text{ strongly}.
\end{array}
}
~~~

If the selected limit has strict margin $-\kappa$, then every bounded weak
background limit satisfies

~~~math
\boxed{
[Y_{\rm full},Y_{\rm full}]_{\rm full}
\le
-\kappa-\|b\|^2<0.
}
~~~

Background escape can prevent strong full-coefficient compactness, but it does
not erase an already anchored fixed selected ray.

WD-T39 introduces no new RH-facing interface.

---

# Part IV. Sharpness and failure modes

## 12. Canonical sharpness witnesses

### WD-X01 — Finite negativity can screen completely

Every finite truncation may be strictly negative while the restored infinite
positive complement gives zero defect. This is sharpness for WD-T06.

### WD-X02 — Critical norm one need not be attained

The canonical audit model uses multiplication by $t$ on $L^2(0,1)$. The
Lean certificate uses a discrete diagonal $\ell^2$ realization of the same
sharpness phenomenon. In both,

~~~math
\boxed{
\|X\|=1
\not\Rightarrow
\text{actual neutral vector}.
}
~~~

This sharpens WD-T04.

### WD-X03 — Individual screening is not compositional

Two separately contractive scalar screens can have combined norm greater than
one. This sharpens the joint-budget theorem WD-T09.

### WD-X04 — Direct compression does not uniformly control shorting

A family with direct compression identically $1$ can have shorted covariance
$1-r^2\downarrow0$. This sharpens WD-T13.

### WD-X05 — Moving finite sectors can lose every persistent ray

Normalized strictly negative vectors may move through successive coordinates
so that each late vector lies in each earlier tail sector while

~~~math
\boxed{
\bigcap_N\mathcal A_N=\{0\}.
}
~~~

This sharpens WD-T16, WD-T17, and the moving-sector branch of WD-T39.

### WD-X06 — Critical weak limits can become negative

With

~~~math
y_n=
\left(
\frac1{\sqrt2}e_n,
\frac1{\sqrt2}
\right),
~~~

one has $\|y_n\|=1$ and $[y_n,y_n]_J=0$, but

~~~math
y_n\rightharpoonup
\left(
0,\frac1{\sqrt2}
\right)
~~~

with

~~~math
\boxed{
[y,y]_J=-\frac12.
}
~~~

This realizes the negative-fall-through branch of WD-T17.

### WD-X07 — Inverse-square far decay is sharp

For two distinct selected points and $v=(1,-1)$,

~~~math
R_v(z)
\sim
\frac{\rho_1-\rho_2}{z^2}.
~~~

Zero moment alone therefore cannot imply universal cubic far decay. This
sharpens WD-T27.

---

# Part V. Standing, verification, and boundary

## 13. Mathematical standing and formal verification

Horizon 1 uses two independent status axes.

The **mathematical standing** records whether an item is an internal proof,
derived statement, imported theorem plus specialization, conditional
composite, example, scope rule, or open interface.

The **formal verification standing** records what Lean verifies:

~~~text
LEAN-CERTIFIED
LEAN-CERTIFIED-FROM-IMPORTED-PREMISE
LEAN-BLOCKED
SCOPE-ONLY
~~~

LEAN-CERTIFIED-FROM-IMPORTED-PREMISE means that Lean certifies a downstream
deduction from an explicit premise; it does not certify the external theorem
represented by that premise.

At the close of LEAN-H1, every stable Horizon-1 theorem and example has a
durable final formal status. See
[Public Verification Matrix](PUBLIC_VERIFICATION_MATRIX.md) and
[Lean Status](LEAN_STATUS.md).

---

## 14. Imported-source custody

The load-bearing external inputs are:

- EXT-1 — Douglas factorization;
- EXT-2A/2B — Bombieri finite inertia and multiplicity;
- EXT-3 — unit-height zeta zero counting;
- EXT-4 — compact-window geometric explicit formula;
- EXT-5 — digamma asymptotic.

Exact theorem/equation pins and convention transfers are recorded in
[Imported Source Pins](IMPORTED_SOURCE_PINS.md).

---

## 15. Outputs delivered to the actual-zeta boundary

The negative branch leaves

~~~text
AZ-NEXTJET-LOC
~~~

as its next unresolved actual-zeta obligation after the zero-moment law,
inverse-square far response, and $O((\log R)/R)$ far-shell reduction. The
stronger special-packet refinement C-ACTUAL-KPH-FLOOR is tracked separately.

The attained neutral branch leaves

~~~text
AZ-FIN-WEIL-NULL-EXTENSION
~~~

as its unresolved support/right-limit obligation after reduction to a
compact-window null equation for a logarithmic-order operator with finitely
many arithmetic translations.

These are open downstream obligations, not theorem IDs.

The noncompact morphology adds no new actual-zeta interface; it classifies
coefficient-custody failures around the fixed-packet branches.

---

## 16. Scope rules

The public package retains five jurisdiction rules.

1. Unweighted sampling/frame statements do not transfer automatically to
   native Problem-1 coercivity.
2. Prime, pole, and archimedean explicit-formula terms are an alternate
   representation of the Weil form, not extra positive screening coordinates.
3. Neutrality is a global quadratic cancellation, not termwise vanishing.
4. Weighted near next-jet localization does not imply a source-free uniform
   lower bound.
5. Unselected-background escape does not erase an already anchored fixed
   selected negative ray.

---

## 17. Conclusion

Horizon 1 produces an independent Weil-defect theory with:

- a fully audited abstract operator core;
- a typed zeta-Weil specialization;
- fixed-packet negative and neutral morphology theorems;
- a separate noncompact moving/background morphology;
- seven sharpness witnesses;
- an exhausted Lean certification track;
- explicit imported-source custody;
- explicit downstream actual-zeta interfaces.

Its central structural conclusion is not a proof of RH. It is a classification
of defect mechanisms and a precise transfer of responsibility to the remaining
actual-zeta interface problem.

The boundary is:

~~~math
\boxed{
\text{independent Weil-defect theory}
\quad\Vert\quad
\text{actual-zeta interface problem}.
}
~~~

Discharging the open interfaces is new work beyond this manuscript.

---

# Appendices

## Appendix A. Stable theorem index

See [Public Theorem Index](PUBLIC_THEOREM_INDEX.md).

## Appendix B. Verification matrix

See [Public Verification Matrix](PUBLIC_VERIFICATION_MATRIX.md).

## Appendix C. Dependency map

See [Public Dependency Map](PUBLIC_DEPENDENCY_MAP.md).

## Appendix D. Examples and sharpness

See [Public Examples and Sharpness](PUBLIC_EXAMPLES.md).

## Appendix E. RH-facing interfaces

See [RH Interface Appendix](RH_INTERFACE_APPENDIX.md).
