# Abstract Defect Calculus
## H1-P1.0 — Hilbert/Krein screening normal form

This document extracts the first zeta-independent theorem package of Horizon 1.

No statement below uses $\zeta$, $\Xi$, primes, functional-equation quartets, or the explicit formula.

## 0. Setup

Let

```math
\mathcal H,\qquad K_{+},\qquad K_{-}
```

be complex Hilbert spaces and let

```math
S_{+}\in\mathcal B(K_{+},\mathcal H),
\qquad
S_{-}\in\mathcal B(K_{-},\mathcal H).
```

Define the synthesis operator

```math
E:K_{+}\oplus K_{-}\to\mathcal H,
\qquad
E(x,u)=S_{+}x+S_{-}u.
```

Equip the coefficient space with the fundamental symmetry

```math
J=
\begin{pmatrix}
I&0\\
0&-I
\end{pmatrix},
```

so that

```math
[(x,u),(y,v)]_J
=
\langle x,y\rangle-\langle u,v\rangle.
```

Define the analysis space

```math
\boxed{
\mathcal A:=(\ker E)^\perp
=
\overline{\operatorname{Ran}E^{*}}.
}
```

Finally define the physical defect operator

```math
\boxed{
D:=EJE^{*}
=
S_{+}S_{+}^{*}-S_{-}S_{-}^{*}.
}
```

The point of H1-P1.0 is that the sign geometry of $\mathcal A$ is exactly the sign geometry of $D$.

---

## WD-A1 — Defect identity and index transfer

For every $h\in\mathcal H$,

```math
E^{*}h=(S_{+}^{*}h,S_{-}^{*}h),
```

and therefore

```math
\boxed{
[E^{*}h,E^{*}h]_J
=
\langle Dh,h\rangle.
}
```

Consequently,

```math
\boxed{
\mathcal A\text{ is }J\text{-nonnegative}
\iff
D\succeq0.
}
```

More generally,

```math
\boxed{
\operatorname{ind}_{-}(\mathcal A,J)
=
\operatorname{ind}_{-}(D),
}
```

where each side denotes the supremum of the dimensions of negative-definite subspaces.

### Proof

The identity is immediate:

```math
[E^{*}h,E^{*}h]_J
=
\|S_{+}^{*}h\|^2-\|S_{-}^{*}h\|^2
=
\langle
(S_{+}S_{+}^{*}-S_{-}S_{-}^{*})h,h
\rangle.
```

If $D\succeq0$, the $J$-form is nonnegative on $\operatorname{Ran}E^{*}$, hence by continuity on its closure $\mathcal A$.

Conversely, if $\mathcal A$ is $J$-nonnegative, then $E^{*}h\in\mathcal A$ for every $h$, so the displayed identity gives $\langle Dh,h\rangle\ge0$.

For the index statement, let $L\subset\mathcal H$ be a finite-dimensional subspace on which $D$ is negative definite. Then $L\cap\ker E^{*}=\{0\}$, because $E^{*}h=0$ gives $\langle Dh,h\rangle=0$. Hence $E^{*}|_L$ is injective and maps $L$ to a $J$-negative subspace of $\mathcal A$.

Conversely, let $M\subset\mathcal A$ be finite dimensional and $J$-negative. Compactness of the unit sphere of $M$ gives a uniform margin $\eta>0$ with

```math
[m,m]_J\le-\eta\|m\|^2
\qquad(m\in M).
```

Because $\operatorname{Ran}E^{*}$ is dense in $\mathcal A$, choose a basis of $M$ and approximate it by vectors in $\operatorname{Ran}E^{*}$ closely enough that the resulting linear map is injective and its Gram matrix remains negative definite. Thus $\operatorname{Ran}E^{*}$ contains a $J$-negative subspace of dimension $\dim M$, whose preimage under $E^{*}$ is a $D$-negative subspace of the same dimension. Taking suprema over finite dimensions gives equality.

**Standing:** PROVED.

---

## WD-A2 — Contractive screening equivalence

The following are equivalent:

1. $\mathcal A$ is $J$-nonnegative;
2. $D\succeq0$;
3.
   ```math
   S_{-}S_{-}^{*}\preceq S_{+}S_{+}^{*};
   ```
4. there exists a contraction
   ```math
   X:K_{-}\to K_{+}
   ```
   such that
   ```math
   \boxed{
   S_{-}=-S_{+}X.
   }
   ```

Among all exact solutions of $S_{+}X=-S_{-}$, there is a unique Douglas reduced solution satisfying

```math
\operatorname{Ran}X
\subseteq
(\ker S_{+})^\perp.
```

### Proof

The equivalence of 1–3 is WD-A1.

The equivalence of 3 and 4 is Douglas' factorization theorem applied to $S_{-}$ and $S_{+}$. The sign is absorbed into $X$.

**Standing:** PROVED using the imported Douglas factorization theorem.

### Interpretation

A nonnegative analysis space is exactly the statement that every negative synthesis channel can be reproduced through the positive synthesis map **within unit coefficient norm**.

Thus the “unit screening budget” is an abstract Hilbert-space factorization condition, not an arithmetic phenomenon.

---

## WD-A3 — Reduced-screening graph normal form

Assume only exact range inclusion

```math
\operatorname{Ran}S_{-}
\subseteq
\operatorname{Ran}S_{+}.
```

Let $X:K_{-}\to(\ker S_{+})^\perp$ be the Douglas reduced solution of

```math
S_{+}X=-S_{-}.
```

No contractivity assumption is made.

Then

```math
\boxed{
\ker E
=
(\ker S_{+}\oplus\{0\})
\ \widehat\oplus\
\{(Xu,u):u\in K_{-}\},
}
```

where the sum is orthogonal in $K_{+}\oplus K_{-}$.

Consequently,

```math
\boxed{
\mathcal A
=
\{(a,-X^{*}a):
a\in(\ker S_{+})^\perp\}.
}
```

On this graph,

```math
\boxed{
[(a,-X^{*}a),(a,-X^{*}a)]_J
=
\|a\|^2-\|X^{*}a\|^2.
}
```

The physical defect operator also factors as

```math
\boxed{
D
=
S_{+}(I-XX^{*})S_{+}^{*}.
}
```

### Proof

Every $(x,u)\in\ker E$ satisfies

```math
S_{+}x=-S_{-}u=S_{+}Xu,
```

hence $x-Xu\in\ker S_{+}$. Since $Xu\perp\ker S_{+}$, the stated orthogonal decomposition follows.

A vector $(a,v)$ is orthogonal to $\ker S_{+}\oplus\{0\}$ exactly when $a\perp\ker S_{+}$. Orthogonality to every $(Xu,u)$ then gives

```math
\langle a,Xu\rangle+\langle v,u\rangle=0
```

for every $u$, hence $v=-X^{*}a$.

Finally,

```math
S_{-}S_{-}^{*}
=
S_{+}XX^{*}S_{+}^{*},
```

which gives the defect factorization.

**Standing:** PROVED.

---

## WD-A4 — Complete abstract screening morphology

The reduced solution gives a complete first sign classification.

### R — Range defect

If

```math
\operatorname{Ran}S_{-}
\not\subseteq
\operatorname{Ran}S_{+},
```

then no exact screening operator exists.

By Douglas' theorem there is no finite $\lambda\ge0$ such that

```math
S_{-}S_{-}^{*}\preceq \lambda^2 S_{+}S_{+}^{*}.
```

In particular contractive screening is impossible. Since $D\succeq0$ would imply range inclusion, $D\not\succeq0$, so $\mathcal A$ contains a strictly negative direction.

This is an **unscreened negative defect**.

### B — Over-budget defect

Assume range inclusion and let $X$ be the reduced solution.

If

```math
\|X\|>1,
```

then there exists $a\in(\ker S_{+})^\perp$ with

```math
\|X^{*}a\|>\|a\|,
```

so

```math
(a,-X^{*}a)\in\mathcal A
```

is strictly $J$-negative.

This is an **exactly screenable but over-budget negative defect**.

### P — Strictly screened regime

If

```math
\|X\|=r<1,
```

then every $y=(a,-X^{*}a)\in\mathcal A$ satisfies

```math
[y,y]_J
\ge
(1-r^2)\|a\|^2.
```

Since

```math
\|y\|^2
=
\|a\|^2+\|X^{*}a\|^2
\le
(1+r^2)\|a\|^2,
```

we obtain the uniform estimate

```math
\boxed{
[y,y]_J
\ge
\frac{1-r^2}{1+r^2}\|y\|^2.
}
```

This is the **uniformly positive screened regime**.

### N — Attained critical screening

Suppose

```math
\|X\|=1
```

and the norm of $X^{*}$ is attained: there exists $a\ne0$ with

```math
\|X^{*}a\|=\|a\|.
```

Then

```math
\boxed{
(a,-X^{*}a)\ne0
}
```

is a neutral vector in $\mathcal A$.

This is the **neutral-mode boundary**.

### AN — Non-attained critical screening

Suppose

```math
\|X\|=1
```

but there is no nonzero $a$ satisfying

```math
\|X^{*}a\|=\|a\|.
```

Then every nonzero vector of $\mathcal A$ is strictly $J$-positive, but there exists a sequence $\|a_n\|=1$ such that

```math
\|X^{*}a_n\|\to1.
```

Hence, for

```math
y_n=(a_n,-X^{*}a_n),
```

the normalized $J$-margin tends to zero:

```math
\frac{[y_n,y_n]_J}{\|y_n\|^2}
\longrightarrow0.
```

This is the **approximate-neutral boundary**.

### Consequence

The abstract screening boundary is not a simple negative/neutral dichotomy.

At minimum it contains

```math
\boxed{
\text{range defect},
\quad
\text{over-budget negative defect},
\quad
\text{attained neutral mode},
\quad
\text{non-attained approximate-neutral boundary},
\quad
\text{strict positive screening}.
}
```

**Standing:** PROVED.

---

## WD-A5 — Rank-one defect specialization

Let

```math
K_{-}=\mathbb C
```

and let

```math
S_{-}\alpha=\alpha g
```

for a fixed $g\in\mathcal H$.

Then

```math
S_{-}S_{-}^{*}
=
g\otimes g,
```

so

```math
\boxed{
D
=
S_{+}S_{+}^{*}
-
g\otimes g.
}
```

Therefore the following are equivalent:

```math
D\succeq0,
```

```math
g\otimes g\preceq S_{+}S_{+}^{*},
```

and the existence of $c\in K_{+}$ with

```math
g=-S_{+}c,
\qquad
\|c\|\le1.
```

Thus the rank-one positivity defect used in the Weil traversal is the one-negative-channel specialization of WD-A1–A4.

**Standing:** PROVED.

---

## WD-A6 — Monotone positive screening

Let $P_N$ be an increasing sequence of orthogonal projections on $K_{+}$ with

```math
P_N\to I
```

strongly.

Define

```math
S_{+,N}=S_{+}P_N
```

and

```math
D_N
=
S_{+}P_NS_{+}^{*}
-
S_{-}S_{-}^{*}.
```

Then

```math
\boxed{
D_N\preceq D_{N+1}\preceq D
}
```

and

```math
D_N\to D
```

strongly.

Consequently,

```math
\langle D_Nh,h\rangle
\uparrow
\langle Dh,h\rangle
```

for every $h\in\mathcal H$, and

```math
\boxed{
\operatorname{ind}_{-}(D_N)
\ge
\operatorname{ind}_{-}(D_{N+1}).
}
```

Finite negative index can therefore shrink under restoration of the positive complement.

It need not survive in the limit.

**Standing:** PROVED.

---

## WD-E1 — Complete spectral screening is possible

Take

```math
\mathcal H=\mathbb C,
\qquad
K_{-}=\mathbb C,
\qquad
S_{-}=1.
```

Let

```math
K_{+}=\ell^2(\mathbb N)
```

and define

```math
c_j=\frac1{\sqrt{j(j+1)}},
\qquad
S_{+}x=\sum_{j\ge1}c_jx_j.
```

Because

```math
\sum_{j=1}^\infty c_j^2
=
\sum_{j=1}^\infty\frac1{j(j+1)}
=
1,
```

the full defect is

```math
D=0.
```

For $P_N$ the projection onto the first $N$ coordinates,

```math
\sum_{j=1}^N c_j^2
=
1-\frac1{N+1},
```

so

```math
\boxed{
D_N=-\frac1{N+1}.
}
```

Thus every finite truncation has one strictly negative direction, but

```math
D_N\uparrow0.
```

This gives an exact abstract model of complete spectral screening.

**Standing:** PROVED EXAMPLE.

---

## WD-E2 — Critical screening need not produce a neutral vector

Take

```math
\mathcal H=K_{+}=K_{-}=L^2(0,1),
```

let

```math
S_{+}=I,
\qquad
X=M_t,
\qquad
S_{-}=-X,
```

where

```math
(M_tf)(t)=t f(t).
```

Then

```math
\|X\|=1,
```

but $X$ does not attain its norm on a nonzero vector because

```math
|t|<1
```

almost everywhere on $(0,1)$.

The defect is

```math
D
=
I-M_{t^2}.
```

For every nonzero $f$,

```math
\langle Df,f\rangle
=
\int_0^1(1-t^2)|f(t)|^2\,dt
>
0,
```

so there is no neutral vector.

However, unit vectors supported increasingly close to $t=1$ satisfy

```math
\langle Df_n,f_n\rangle\to0.
```

Hence the system is positive but not uniformly positive and lies on the non-attained approximate-neutral boundary.

**Standing:** PROVED EXAMPLE.

---

## H1-P1.0 determination

The first abstraction pass succeeds.

The following objects are now independent of zeta arithmetic:

```math
\boxed{
D=S_{+}S_{+}^{*}-S_{-}S_{-}^{*},
}
```

```math
\boxed{
\operatorname{ind}_{-}(\mathcal A,J)
=
\operatorname{ind}_{-}(D),
}
```

```math
\boxed{
D\succeq0
\iff
\text{contractive Douglas screening},
}
```

and, under exact range inclusion,

```math
\boxed{
\mathcal A
=
\operatorname{graph}(-X^{*}).
}
```

After the range-defect branch has been separated, the remaining exactly screenable sign problem is a reduced-screening norm problem.

The pass also corrects the earlier public morphology map:

```math
\boxed{
\text{critical screening}
\not\Rightarrow
\text{actual neutral mode}.
}
```

There is a distinct non-attained approximate-neutral boundary.

## Historical handoff from H1-P1.0

```math
\boxed{
\texttt{H1-P1.1 / RESTRICTED-CHANNEL AND FINITE-INDEX TRANSFER}
}
```

At the close of H1-P1.0, the next pass was assigned to determine how WD-A1–A6 behave when:

1. only a selected finite-dimensional negative subspace is tracked;
2. the remaining negative channels are treated as background;
3. the negative index is finite but larger than one;
4. screening is compressed or Schur-complemented through nested channel decompositions.

That is the correct bridge from the abstract calculus back toward the finite-index Weil setting.
