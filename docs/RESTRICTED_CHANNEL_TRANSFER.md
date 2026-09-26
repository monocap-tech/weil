# Restricted-Channel and Finite-Index Transfer
**H1-P1.1 — Selected sectors, background budget, and shorting**

This pass extends the abstract defect calculus to a selected finite-dimensional negative sector in the presence of additional negative and positive background channels.

No theorem below uses zeta-specific arithmetic.

Throughout,

```math
S_{+}:K_{+}\to\mathcal H
```

is the positive synthesis map and the negative coefficient space is decomposed as

```math
K_{-}=M\oplus B,
```

where $M$ is the **selected negative sector** and $B$ is the **negative background**.

Write

```math
S_M=S_{-}P_M,
\qquad
S_B=S_{-}P_B.
```

Define

```math
P:=S_{+}S_{+}^{*},
```

the selected defect

```math
D_M:=P-S_MS_M^{*},
```

the background defect

```math
D_B:=P-S_BS_B^{*},
```

and the full defect

```math
\boxed{
D_{\rm full}
=
P-S_MS_M^{*}-S_BS_B^{*}.
}
```

---

## WD-B1 — Selected/background monotonicity and custody

For every $h\in\mathcal H$,

```math
\boxed{
\langle D_{\rm full}h,h\rangle
=
\langle D_Mh,h\rangle
-
\|S_B^{*}h\|^2.
}
```

Hence

```math
\boxed{
D_{\rm full}\preceq D_M.
}
```

Consequently,

```math
\boxed{
\operatorname{ind}_{-}(D_{\rm full})
\ge
\operatorname{ind}_{-}(D_M).
}
```

Every selected negative witness remains a full negative witness, with background channels only making its quadratic value more negative.

The converse is false: negativity of $D_{\rm full}$ need not come from $M$.

### Proof

The identity follows directly from the definitions. If a subspace is negative definite for $D_M$, the extra term

```math
-\|S_B^{*}h\|^2
```

preserves strict negativity on every nonzero vector of that subspace.

### Custody consequence

```math
\boxed{
\text{selected negativity}
\Longrightarrow
\text{full negativity},
}
```

but

```math
\boxed{
\text{full negativity}
\not\Longrightarrow
\text{selected negativity}.
}
```

Thus a full aggregate defect does not by itself identify which negative sector owns the defect.

**Standing:** PROVED.

---

## WD-B2 — Finite selected-sector index cap

Assume

```math
m:=\dim M<\infty.
```

Then

```math
\boxed{
\operatorname{ind}_{-}(D_M)\le m.
}
```

More generally, if

```math
b:=\dim B<\infty,
```

then

```math
\boxed{
\operatorname{ind}_{-}(D_{\rm full})
\le
\operatorname{ind}_{-}(D_M)+b.
}
```

### Proof

The perturbation

```math
S_MS_M^{*}
```

has rank at most $m$.

Let $L$ be a negative-definite subspace for $D_M$ with $\dim L>m$. Since

```math
\operatorname{codim}\ker S_M^{*}
\le m,
```

there exists $0\ne h\in L\cap\ker S_M^{*}$. But then

```math
\langle D_Mh,h\rangle
=
\langle Ph,h\rangle
\ge0,
```

contradicting negative definiteness.

For the second statement, it is enough to consider finite-dimensional negative-definite subspaces $L$ and then take the supremum. Since

```math
\operatorname{codim}\ker S_B^{*}
\le b,
```

we have

```math
\dim(L\cap\ker S_B^{*})
\ge
\dim L-b.
```

On this intersection the quadratic forms of $D_{\rm full}$ and $D_M$ agree. Therefore

```math
\dim L-b
\le
\operatorname{ind}_{-}(D_M).
```

Taking the supremum over finite-dimensional negative subspaces gives the stated index bound.

**Standing:** PROVED.

### Interpretation

A fixed $m$-dimensional selected negative sector can create at most $m$ independent negative directions, regardless of the dimension of the positive synthesis space.

---

## WD-B3 — Shared screening budget

Assume the full negative synthesis is exactly contained in the positive synthesis range, and let

```math
X=[X_M\;X_B]:
M\oplus B\to(\ker S_{+})^\perp
```

be the Douglas reduced solution of

```math
S_{+}X=-[S_M\;S_B].
```

Then

```math
S_M=-S_{+}X_M,
\qquad
S_B=-S_{+}X_B,
```

and

```math
\boxed{
D_{\rm full}
=
S_{+}
\left(
I-X_MX_M^{*}-X_BX_B^{*}
\right)
S_{+}^{*}.
}
```

Moreover,

```math
\boxed{
D_{\rm full}\succeq0
\iff
X_MX_M^{*}+X_BX_B^{*}\preceq I.
}
```

In particular, the two separate conditions

```math
\|X_M\|\le1,
\qquad
\|X_B\|\le1
```

are not sufficient for joint screening.

### Proof

The factorization follows by substitution.

The combined operator $X$ is contractive exactly when

```math
XX^{*}
=
X_MX_M^{*}+X_BX_B^{*}
\preceq I.
```

WD-A2 identifies contractivity of the reduced full screening map with nonnegativity of $D_{\rm full}$.

**Standing:** PROVED using WD-A2.

---

## WD-E3 — Individual screenability is not compositional

Take

```math
\mathcal H=K_{+}=M=B=\mathbb C,
\qquad
S_{+}=1,
```

and

```math
S_M=S_B=-r
```

with

```math
\frac1{\sqrt2}<r<1.
```

Each channel individually has reduced screening coefficient $r$, hence each individual defect is nonnegative:

```math
1-r^2>0.
```

But jointly,

```math
D_{\rm full}
=
1-2r^2<0.
```

Thus two individually contractive screens can exceed the shared unit budget when combined.

**Standing:** PROVED EXAMPLE.

---

## WD-B4 — Background elimination and residual budget

Assume the background is contractively screenable:

```math
S_B=-S_{+}X_B,
\qquad
\|X_B\|\le1,
```

with $X_B$ the reduced background screening solution.

Define the residual budget operator

```math
\boxed{
R_B:=I-X_BX_B^{*}\succeq0
}
```

and the effective positive synthesis

```math
\boxed{
S_{\rm eff}
:=
S_{+}R_B^{1/2}.
}
```

Then

```math
\boxed{
D_{\rm full}
=
S_{\rm eff}S_{\rm eff}^{*}
-
S_MS_M^{*}.
}
```

Therefore the full selected-plus-background problem is again an instance of the original two-channel defect calculus.

In particular,

```math
\boxed{
D_{\rm full}\succeq0
}
```

if and only if there exists a contraction

```math
Y:M\to K_{+}
```

such that

```math
\boxed{
S_M=-S_{\rm eff}Y.
}
```

Equivalently, the selected sector must fit inside the **residual** screening budget left after the background has been paid for.

### Proof

Since

```math
S_BS_B^{*}
=
S_{+}X_BX_B^{*}S_{+}^{*},
```

we have

```math
P-S_BS_B^{*}
=
S_{+}R_BS_{+}^{*}
=
S_{\rm eff}S_{\rm eff}^{*}.
```

Subtracting the selected covariance gives the displayed defect. WD-A2 applied to $S_{\rm eff}$ and $S_M$ gives the final equivalence.

**Standing:** PROVED.

### Recursive closure

The defect calculus is closed under legitimate elimination of a contractively screenable background.

This is the abstract form of “consume background first, then test the selected channel against what remains.”

---

## WD-B5 — Finite-sector singular-value inertia theorem

Assume

```math
m=\dim M<\infty
```

and that the selected channel is exactly screenable through the relevant positive synthesis map $T$:

```math
S_M=-TY,
```

where

```math
Y:M\to(\ker T)^\perp
```

is the Douglas reduced solution.

This statement applies either to:

- $T=S_{+}$ with no negative background; or
- $T=S_{\rm eff}$ after a background has been eliminated by WD-B4.

Then the associated analysis space is

```math
\operatorname{graph}(-Y^{*})
```

and its indefinite form is

```math
q(a)
=
\|a\|^2-\|Y^{*}a\|^2.
```

Let

```math
\sigma_1(Y)\ge\cdots\ge\sigma_m(Y)\ge0
```

be the singular values of $Y$, with zeros included if necessary.

Then

```math
\boxed{
\operatorname{ind}_{-}
=
\#\{j:\sigma_j(Y)>1\},
}
```

and the neutral dimension of the analysis space is

```math
\boxed{
\operatorname{nul}_J
=
\#\{j:\sigma_j(Y)=1\}.
}
```

In particular,

```math
\boxed{
\|Y\|=1
\Longrightarrow
\text{an actual nonzero neutral vector exists}.
}
```

### Proof

The graph form is WD-A3 applied to $T$ and $S_M$.

Because $M$ is finite dimensional, $YY^{*}$ is finite rank and its nonzero eigenvalues are

```math
\sigma_j(Y)^2.
```

The graph form is represented on $(\ker T)^\perp$ by

```math
I-YY^{*}.
```

Its negative eigenspace is exactly the span of singular directions with $\sigma_j>1$, and its kernel inside the active finite-rank part is exactly the span of directions with $\sigma_j=1$.

If $\|Y\|=1$, the top singular value is attained because $Y$ has finite-dimensional domain.

**Standing:** PROVED.

### Major consequence

The non-attained approximate-neutral morphology of WD-A4 **cannot occur for a fixed finite-dimensional selected negative sector after a legitimate background reduction**.

It can occur only through an infinite-dimensional negative sector, a moving family of selected sectors, or another limiting operation that destroys fixed finite-dimensional compactness.

---

## WD-B6 — Sequential background consumption

Let the negative background split as

```math
B=B_1\oplus B_2.
```

Suppose $B_1$ is contractively screenable with reduced map $X_1$, and define

```math
R_1=I-X_1X_1^{*},
\qquad
S_1=S_{+}R_1^{1/2}.
```

If $B_2$ is then contractively screenable through $S_1$, say

```math
S_{B_2}=-S_1Y_2,
\qquad
\|Y_2\|\le1,
```

then after eliminating both backgrounds the residual positive covariance is

```math
\boxed{
S_{+}
\left(
R_1-R_1^{1/2}Y_2Y_2^{*}R_1^{1/2}
\right)
S_{+}^{*}.
}
```

Equivalently,

```math
\boxed{
S_1(I-Y_2Y_2^{*})S_1^{*}.
}
```

Thus admissible background elimination can be iterated, and at each step the next channel is judged against the residual budget rather than the original positive covariance.

**Standing:** PROVED.

### Scope warning

Sequential elimination is legitimate only when each later channel factors through the residual positive synthesis from the previous step.

Individual screenability through the original $S_{+}$ is insufficient.

---

## WD-B7 — Direct compression versus shorted covariance

Let $K$ be a uniformly positive bounded operator on

```math
\mathcal H=W\oplus W^\perp,
```

meaning that

```math
K\succeq mI
```

for some $m>0$, and write it in blocks as

```math
K=
\begin{pmatrix}
A&B\\
B^{*}&C
\end{pmatrix}.
```

Uniform positivity implies $C\succeq mI_{W^\perp}$, so $C$ is boundedly invertible.

Define the Schur-shortened covariance on $W$ by

```math
\boxed{
H_W:=A-BC^{-1}B^{*}.
}
```

Then

```math
\boxed{
H_W\preceq A,
}
```

and block inversion gives

```math
\boxed{
P_WK^{-1}|_W
=
H_W^{-1}.
}
```

Thus the direct compression

```math
A=P_WK|_W
```

does not determine the inverse cost seen after the complement $W^\perp$ is optimized away.

### Interpretation

Finite target dimension does not remove an infinite or large complementary inverse problem.

The relevant covariance after eliminating the complement is the shorted covariance, not the direct compression.

**Standing:** PROVED in the uniformly positive / invertible-block setting.

### Generalization

For merely positive $K$, the Anderson–Trapp shorted operator extends this Schur-complement construction by a monotone regularized limit.

---

## WD-E4 — Direct sampling can remain strong while shorted covariance collapses

Take

```math
\mathcal H=\mathbb C^2,
\qquad
W=\operatorname{span}(e_1),
```

and

```math
K_r=
\begin{pmatrix}
1&r\\
r&1
\end{pmatrix},
\qquad
0<r<1.
```

The direct compression is always

```math
A=1.
```

But the shorted covariance is

```math
\boxed{
H_W=1-r^2,
}
```

which tends to zero as $r\uparrow1$.

Hence an excellent direct lower bound on the selected finite-dimensional target can coexist with arbitrarily poor inverse control after complement elimination.

**Standing:** PROVED EXAMPLE.

---

## WD-B8 — Finite positive shadows preserve signature but not admissibility

Let

```math
y=(a,u)
```

be a negative coefficient vector with

```math
\|u\|^2-\|a\|^2=\kappa>0.
```

For any orthogonal projection $Q$ on the positive coefficient space,

```math
\boxed{
\|u\|^2-\|Qa\|^2
\ge
\kappa.
}
```

Thus positive-coordinate truncation preserves, and can only strengthen, the algebraic negative margin.

However, if $y$ belongs to a graph analysis space

```math
u=-X^{*}a,
```

then generally

```math
u\ne-X^{*}Qa.
```

Therefore

```math
\boxed{
\text{signature shadow}
\neq
\text{admissible analysis vector}.
}
```

Finite positive truncation can certify that the coefficient signature is already visible finitely, but it does not preserve the relational constraints that made the original vector an actual persistent analysis vector.

**Standing:** PROVED.

---

## H1-P1.1 determination

The selected finite-index problem is now abstractly separated into three layers.

### Layer 1 — Selected defect custody

```math
D_{\rm full}
=
D_M-S_BS_B^{*}.
```

Selected negativity survives aggregation, but aggregate negativity does not identify the selected owner.

### Layer 2 — Shared budget and background elimination

A contractively screenable background consumes

```math
X_BX_B^{*}
```

from the unit budget and leaves

```math
R_B=I-X_BX_B^{*}.
```

The selected problem then restarts with effective positive synthesis

```math
S_{\rm eff}=S_{+}R_B^{1/2}.
```

### Layer 3 — Finite-index spectral classification

For a fixed finite selected sector, the reduced residual screening map $Y$ has finitely many singular values, and

```math
\operatorname{ind}_{-}
=
\#\{\sigma_j(Y)>1\},
```

while

```math
\operatorname{nul}_J
=
\#\{\sigma_j(Y)=1\}.
```

Therefore, for the finite-dimensional residual screening map $Y$ in this legitimate background-reduced setting, critical norm one is attained and produces a neutral mode.

Within this reduced-screening setting, the non-attained critical branch from H1-P1.0 cannot come from one fixed finite selected packet; it requires an infinite/moving selected sector or another limiting operation that destroys the fixed finite-dimensional compactness used here.

### Main conceptual result

```math
\boxed{
\text{finite selected dimension}
\text{ localizes the negative index,}
}
```

but

```math
\boxed{
\text{it does not localize the screening budget or inverse cost.}
}
```

Those remain sensitive to background coupling and complement shorting.

### Historical handoff from H1-P1.1

```math
\boxed{
\texttt{H1-P1.2 / SUPPORT FILTRATION AND PERSISTENCE LIMITS}
}
```

At the close of H1-P1.1, the next pass was assigned to abstract the remaining ingredient not yet isolated at that checkpoint:

- a monotone support/observation filtration;
- right-limit analysis spaces;
- persistence across the filtration;
- representative blow-up at a critical endpoint;
- when a moving finite-sector family can generate the approximate-neutral boundary excluded for a fixed finite sector.

That handoff was subsequently completed in H1-P1.2 before H1-P2.
