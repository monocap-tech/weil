# Support Filtration and Persistence Limits
**H1-P1.2 — Right limits, endpoint jumps, and representative blow-up**

This pass abstracts the support/observation-filtration mechanism that remained after H1-P1.0 and H1-P1.1.

No theorem below uses zeta-specific arithmetic.

---

## 0. Coefficient-space filtration

Let

```math
K=K_{+}\oplus K_{-}
```

be a Hilbert space with fundamental symmetry

```math
J=
\begin{pmatrix}
I&0\\
0&-I
\end{pmatrix}.
```

Let

```math
\{\mathcal A_t\}_{t\ge c}
```

be a family of closed subspaces of $K$ satisfying

```math
\boxed{
c\le s<t
\Longrightarrow
\mathcal A_s\subseteq\mathcal A_t.
}
```

Thus larger observation/support parameter gives a larger analysis space.

Define the right-limit space at $c$ by

```math
\boxed{
\mathcal A_{c+}
:=
\bigcap_{t>c}\mathcal A_t.
}
```

Since

```math
\mathcal A_c\subseteq\mathcal A_{c+},
```

define the endpoint jump space

```math
\boxed{
\mathcal J_c
:=
\mathcal A_{c+}\ominus\mathcal A_c.
}
```

A vector in

```math
\mathcal A_{c+}\setminus\mathcal A_c
```

is called a **new right-persistent coefficient vector** at the endpoint.

---

## WD-C1 — Monotone projection limit

Let $P_t$ be the orthogonal projection onto $\mathcal A_t$.

As

```math
t\downarrow c,
```

the projections converge strongly to the projection onto the right-limit space:

```math
\boxed{
P_t
\longrightarrow
P_{c+}
}
```

in the strong operator topology.

### Proof

Choose any sequence

```math
t_n\downarrow c.
```

Then

```math
\mathcal A_{t_{n+1}}\subseteq\mathcal A_{t_n},
```

so the projections $P_{t_n}$ form a decreasing sequence of orthogonal projections.

For every $x\in K$,

```math
\|P_{t_n}x\|^2
=
\langle P_{t_n}x,x\rangle
```

decreases and the standard monotone-projection argument gives a strong limit $P$.

The range of $P$ is exactly

```math
\bigcap_n\mathcal A_{t_n}.
```

Because the filtration is monotone and $t_n\downarrow c$,

```math
\bigcap_n\mathcal A_{t_n}
=
\bigcap_{t>c}\mathcal A_t
=
\mathcal A_{c+}.
```

The limit is independent of the chosen sequence.

**Standing:** PROVED.

---

## WD-C2 — Right-limit gap duality

Define the gap spaces

```math
G_t:=\mathcal A_t^\perp.
```

Then

```math
s<t
\Longrightarrow
G_s\supseteq G_t.
```

Define

```math
\boxed{
G_{c+}
:=
\overline{\bigcup_{t>c}G_t}.
}
```

Because the $G_t$ are nested in the reverse direction,

```math
\boxed{
\mathcal A_{c+}
=
G_{c+}^\perp.
}
```

### Proof

For any family of closed subspaces,

```math
\left(\bigcap_i M_i\right)^\perp
=
\overline{\operatorname{span}\bigcup_i M_i^\perp}.
```

Here the $G_t$ form a nested family, so the linear span of their union is just their union. Hence

```math
\mathcal A_{c+}^\perp
=
\overline{\bigcup_{t>c}G_t}
=
G_{c+}.
```

**Standing:** PROVED.

### Interpretation

Right persistence is equivalently an orthogonality law against every limiting gap relation.

This is the abstract source of relations of the form

```math
\langle a,x\rangle+\langle u,w\rangle=0.
```

---

## WD-C3 — Fixed finite negative-sector compactness

Assume now

```math
K=K_{+}\oplus M,
\qquad
\dim M<\infty.
```

Let

```math
t_n\downarrow c
```

and let

```math
y_n=(a_n,u_n)\in\mathcal A_{t_n}
```

satisfy

```math
\|y_n\|=1.
```

After passing to a subsequence,

```math
a_n\rightharpoonup a
```

weakly in $K_{+}$, while

```math
u_n\to u
```

strongly in $M$.

Then

```math
\boxed{
y:=(a,u)\in\mathcal A_{c+}.
}
```

If additionally

```math
[y_n,y_n]_J\to q_*\le0,
```

then

```math
\boxed{
y\ne0
}
```

and

```math
\boxed{
[y,y]_J\le q_*.
}
```

### Proof

For any fixed $s>c$, eventually

```math
t_n<s.
```

By monotonicity,

```math
\mathcal A_{t_n}\subseteq\mathcal A_s,
```

so eventually $y_n\in\mathcal A_s$.

Closed subspaces are weakly closed, hence the weak limit $y$ belongs to every $\mathcal A_s$, $s>c$. Therefore

```math
y\in\mathcal A_{c+}.
```

Since

```math
\|a_n\|^2+\|u_n\|^2=1
```

and

```math
\|a_n\|^2-\|u_n\|^2\to q_*,
```

we have

```math
\|u_n\|^2\to\frac{1-q_*}{2}.
```

Because $M$ is finite dimensional,

```math
\|u\|^2=\frac{1-q_*}{2}\ge\frac12,
```

so $y\ne0$.

Weak lower semicontinuity gives

```math
\|a\|^2
\le
\lim\|a_n\|^2.
```

Thus

```math
[y,y]_J
=
\|a\|^2-\|u\|^2
\le
\lim
\left(
\|a_n\|^2-\|u_n\|^2
\right)
=
q_*.
```

**Standing:** PROVED.

---

## WD-C4 — Critical-sequence dichotomy

Under the hypotheses of WD-C3, suppose

```math
[y_n,y_n]_J\to0.
```

Then

```math
\|a_n\|^2\to\frac12,
\qquad
\|u_n\|^2\to\frac12.
```

The right-limit vector $y=(a,u)$ satisfies exactly one of the following:

### N — compact critical limit

If

```math
\|a\|^2=\frac12,
```

then

```math
[y,y]_J=0
```

and weak convergence plus convergence of norms implies

```math
a_n\to a
```

strongly.

Hence

```math
y_n\to y
```

strongly and $y$ is an actual nonzero neutral vector in $\mathcal A_{c+}$.

### L — positive-mass loss

If

```math
\|a\|^2<\frac12,
```

then

```math
\boxed{
[y,y]_J<0.
}
```

Thus loss of positive coefficient norm in the limit converts an approximately neutral sequence into a strictly negative right-persistent vector.

### Consequence

For a fixed finite negative sector,

```math
\boxed{
\text{approximate criticality}
\Longrightarrow
\text{actual nonpositive right-limit ray}.
}
```

There is no third possibility in which all coefficient mass disappears.

**Standing:** PROVED.

---

## WD-C5 — Uniform negative margins produce persistent negative rays

Under the hypotheses of WD-C3, suppose there is

```math
\kappa>0
```

such that

```math
[y_n,y_n]_J\le-\kappa
```

for all $n$.

Then after passage to a subsequence there exists

```math
0\ne y\in\mathcal A_{c+}
```

such that

```math
\boxed{
[y,y]_J\le-\kappa.
}
```

If the endpoint space $\mathcal A_c$ is $J$-nonnegative, then automatically

```math
\boxed{
y\in\mathcal A_{c+}\setminus\mathcal A_c.
}
```

Thus a uniformly negative right-approaching sequence in a fixed finite negative sector forces a genuine negative endpoint jump.

**Standing:** PROVED.

---

## WD-C6 — Endpoint jump controls new negative index

Assume

```math
\mathcal A_c
```

is $J$-nonnegative.

Then every $J$-negative subspace

```math
L\subseteq\mathcal A_{c+}
```

satisfies

```math
L\cap\mathcal A_c=\{0\}.
```

Therefore the quotient map

```math
L\to
\mathcal A_{c+}/\mathcal A_c
```

is injective, and hence

```math
\boxed{
\operatorname{ind}_{-}(\mathcal A_{c+},J)
\le
\dim(\mathcal A_{c+}/\mathcal A_c)
}
```

whenever the quotient dimension is finite.

Equivalently, using the Hilbert-space jump representative,

```math
\boxed{
\operatorname{ind}_{-}(\mathcal A_{c+},J)
\le
\dim\mathcal J_c.
}
```

### Interpretation

New right-limit negative index requires an endpoint discontinuity in the analysis space.

A one-dimensional endpoint jump can carry at most one new negative direction.

**Standing:** PROVED.

---

## Physical realization

The preceding results are purely coefficient-space statements.

Representative blow-up requires an additional physical realization.

Let $\mathscr H$ be a Hilbert space with a monotone family of closed physical subspaces

```math
\mathscr H_s\subseteq\mathscr H_t
\qquad
(c\le s<t),
```

and assume right continuity at the physical level:

```math
\boxed{
\mathscr H_c
=
\bigcap_{t>c}\mathscr H_t.
}
```

Let

```math
T:\mathscr H\to K
```

be bounded, and define

```math
\boxed{
\mathcal A_t
=
\overline{T(\mathscr H_t)}.
}
```

---

## WD-C7 — Endpoint representative blow-up principle

Let

```math
y\in
\mathcal A_{c+}\setminus\mathcal A_c.
```

Let

```math
t_n\downarrow c,
\qquad
\varepsilon_n\downarrow0,
```

and choose any

```math
h_n\in\mathscr H_{t_n}
```

such that

```math
\|Th_n-y\|\le\varepsilon_n.
```

Then

```math
\boxed{
\|h_n\|\to\infty.
}
```

### Proof

Suppose instead that a subsequence is bounded.

By weak compactness in Hilbert space,

```math
h_{n_k}\rightharpoonup h.
```

For every fixed $s>c$, eventually

```math
t_{n_k}<s,
```

hence

```math
h_{n_k}\in\mathscr H_s.
```

Because $\mathscr H_s$ is weakly closed,

```math
h\in\mathscr H_s
```

for every $s>c$.

Thus

```math
h\in
\bigcap_{s>c}\mathscr H_s
=
\mathscr H_c.
```

Boundedness of $T$ gives

```math
Th_{n_k}\rightharpoonup Th.
```

But

```math
Th_{n_k}\to y
```

strongly, so

```math
Th=y.
```

Hence

```math
y\in T(\mathscr H_c)\subseteq\mathcal A_c,
```

contradiction.

**Standing:** PROVED.

### Interpretation

Under the common bounded physical realization and right-continuity hypotheses above, a genuinely new endpoint coefficient vector can persist arbitrarily close to the endpoint only through loss of compactness in its physical representatives.

---

## WD-C8 — Boundary amplification functional

For

```math
y\in\mathcal A_{c+},
```

define

```math
\boxed{
\mathfrak B_y(t,\varepsilon)
:=
\inf
\left\{
\|h\|:
h\in\mathscr H_t,\
\|Th-y\|\le\varepsilon
\right\}.
}
```

If

```math
y\in\mathcal A_{c+}\setminus\mathcal A_c,
```

then

```math
\boxed{
\mathfrak B_y(t,\varepsilon)\to\infty
\quad
\text{as }
(t,\varepsilon)\to(c+,0).
}
```

More explicitly: for every $M>0$, there exist

```math
\delta>0,
\qquad
\eta>0
```

such that

```math
c<t<c+\delta,
\qquad
0<\varepsilon<\eta
```

imply

```math
\mathfrak B_y(t,\varepsilon)>M.
```

### Proof

If not, one can choose

```math
t_n\downarrow c,
\qquad
\varepsilon_n\downarrow0
```

and $h_n\in\mathscr H_{t_n}$ with

```math
\|h_n\|\le M
```

and

```math
\|Th_n-y\|\le\varepsilon_n,
```

contradicting WD-C7.

**Standing:** PROVED.

### Scope warning

Blow-up is necessary for a new endpoint vector, but it is not sufficient to prove that the vector lies outside $\mathcal A_c$: nonclosed-range phenomena can also produce large inverse cost inside an endpoint closure.

---

## WD-C9 — Vanishing coefficient amplitude and normalized blow-up

Suppose

```math
g_n\in\mathscr H_{t_n},
\qquad
\|g_n\|=1,
```

and

```math
Tg_n=\varepsilon_n z_n,
\qquad
\varepsilon_n\downarrow0,
\qquad
z_n\to y\ne0.
```

Define

```math
h_n:=\varepsilon_n^{-1}g_n.
```

Then

```math
Th_n=z_n\to y
```

while

```math
\boxed{
\|h_n\|
=
\varepsilon_n^{-1}
\to\infty.
}
```

If $y\in\mathcal A_{c+}\setminus\mathcal A_c$, this is exactly the endpoint blow-up morphology of WD-C7.

**Standing:** PROVED.

---

## Moving-sector escape

The finite-dimensional compactness in WD-C3 depends on using one fixed finite negative sector.

It fails if the selected negative coordinate itself moves through an infinite coefficient space.

---

## WD-E5 — Moving finite sectors can lose every persistent ray

Let

```math
K_{+}=\ell^2(\mathbb N),
\qquad
K_{-}=\ell^2(\mathbb N),
```

with the standard $J$-form.

Let

```math
r_n>1,
\qquad
r_n\downarrow1,
```

and define normalized vectors

```math
y_n
=
\frac{(e_n,r_ne_n)}
{\sqrt{1+r_n^2}}.
```

Then

```math
[y_n,y_n]_J
=
\frac{1-r_n^2}{1+r_n^2}
<0
```

and

```math
[y_n,y_n]_J\to0.
```

Define the decreasing filtration

```math
\boxed{
\mathcal A_n
:=
\overline{\operatorname{span}}
\{y_k:k\ge n\}.
}
```

Because the $y_k$ are Hilbert-orthonormal,

```math
\boxed{
\bigcap_{n=1}^\infty\mathcal A_n
=
\{0\}.
}
```

Thus every stage contains a finite one-dimensional negative direction with margin tending to zero, but no nonzero persistent right-limit vector survives.

The negative coordinate itself moves through the orthogonal directions $e_n$.

**Standing:** PROVED EXAMPLE.

### Consequence

```math
\boxed{
\text{moving finite packets}
\text{ can realize approximate neutrality without persistence}.
}
```

This is the principal abstract mechanism excluded by WD-C3 for a fixed finite negative sector.

---

## WD-E6 — Positive-mass escape strengthens a fixed-sector limit

Let

```math
K_{+}=\ell^2(\mathbb N),
\qquad
M=\mathbb C.
```

Define

```math
y_n
=
\left(
\frac1{\sqrt2}e_n,
\frac1{\sqrt2}
\right).
```

Then

```math
\|y_n\|=1
```

and

```math
[y_n,y_n]_J=0.
```

But

```math
y_n\rightharpoonup
\left(
0,\frac1{\sqrt2}
\right)
=:y,
```

and

```math
\boxed{
[y,y]_J=-\frac12.
}
```

If

```math
\mathcal A_n
=
\overline{\operatorname{span}}
\{y_k:k\ge n\},
```

then $y\in\mathcal A_n$ for every $n$, since each $\mathcal A_n$ is weakly closed and contains the tail of the sequence.

Hence

```math
y\in\bigcap_n\mathcal A_n.
```

This explicitly realizes the positive-mass-loss branch of WD-C4.

**Standing:** PROVED EXAMPLE.

---

## H1-P1.2 determination

The remaining support-filtration mechanism is now abstractly classified.

### 1. Right persistence is an endpoint jump

```math
\mathcal A_{c+}
=
\bigcap_{t>c}\mathcal A_t
```

and

```math
\mathcal J_c
=
\mathcal A_{c+}\ominus\mathcal A_c.
```

New negative index cannot appear without a nontrivial endpoint jump when $\mathcal A_c$ is nonnegative.

### 2. Fixed finite negative sectors force a nonpositive right-limit ray

For unit right-approaching vectors in a fixed finite negative sector,

```math
[y_n,y_n]_J\to q_*\le0
```

forces a nonzero

```math
y\in\mathcal A_{c+}
```

with

```math
[y,y]_J\le q_*.
```

Approximate neutrality becomes either:

- an actual neutral right-limit vector; or
- a stricter negative persistent vector caused by positive-coordinate mass loss.

### 3. Moving sectors are the genuine escape

If the selected negative direction itself moves through an infinite coefficient field, the whole sequence may escape weakly and leave no persistent ray.

Thus the non-attained approximate-neutral morphology from H1-P1.0 is now localized to:

```math
\boxed{
\text{infinite-sector or moving-sector noncompactness}.
}
```

### 4. New endpoint vectors require physical blow-up

Under a common bounded physical realization,

```math
y\in\mathcal A_{c+}\setminus\mathcal A_c
```

forces every increasingly accurate inward/right-endpoint representation to have norm tending to infinity.

This is the abstract representative-blow-up theorem previously encountered in the Weil traversal.

---

## H1-P1 completion

The abstract defect calculus now contains:

1. synthesis/defect/index equivalence;
2. Douglas screening and graph normal form;
3. selected/background shared budget;
4. recursive background elimination;
5. finite-sector singular-value inertia;
6. complement shorting;
7. monotone support filtration;
8. right-limit gap duality;
9. persistent-ray compactness;
10. endpoint jump/index control;
11. representative blow-up;
12. moving-sector escape.

Therefore

```math
\boxed{
\textbf{H1-P1 — ABSTRACT DEFECT CALCULUS: COMPLETE.}
}
```

### Historical handoff from H1-P1

```math
\boxed{
\texttt{H1-P2.0 / ZETA-WEIL SPECIALIZATION MAP}
}
```

At H1-P1 completion, the handoff to H1-P2 was to map each zeta-Weil object to its precise H1-P1 abstract carrier before importing arithmetic strengthening:

- positive and negative quartet channels $\to S_{+},S_{-}$;
- selected packet $\to M$;
- unselected negative divisor $\to B$;
- support window $\to\mathcal A_t$;
- persistent ray $\to\mathcal J_c$;
- zero-moment residue law $\to$ genuinely new zeta-specific structure;
- explicit formula and next jets $\to$ post-abstraction arithmetic attachments.
