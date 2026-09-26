# Examples and Sharpness Audit
**H1-P4.4 — WD-X01 through WD-X07**

This document audits the Horizon-1 example/sharpness witnesses.

No new theorem is introduced.

EXAMPLE-AUDIT-PASSED means the explicit construction and its stated sharpness role have passed the Horizon-1 internal audit.

It does not mean independent certification or external refereeing.

---

## WD-X01 — Complete finite-to-infinite screening

Historical alias: WD-E1.

Take

```math
\mathcal H=\mathbb C,
\qquad
K_-=\mathbb C,
\qquad
S_-=1,
```

and

```math
K_+=\ell^2(\mathbb N),
\qquad
c_j=\frac1{\sqrt{j(j+1)}}.
```

Define

```math
S_+x=\sum_{j\ge1}c_jx_j.
```

Then

```math
\sum_{j=1}^\infty c_j^2=1,
```

so the full defect is

```math
D=0.
```

For the first-$N$-coordinate projection $P_N$,

```math
\sum_{j=1}^N c_j^2
=
1-\frac1{N+1},
```

hence

```math
\boxed{
D_N=-\frac1{N+1}<0,
\qquad
D_N\uparrow0.
}
```

### Audit result

The calculation is exact.

### Sharpness role

WD-X01 witnesses that WD-T06 cannot be strengthened from monotone index/sign screening to persistence of finite-truncation negativity in the strong limit.

It separates

```math
\boxed{
\text{negative at every finite truncation}
\not\Rightarrow
\text{negative in the infinite limit}.
}
```

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X02 — Critical screening without an attained neutral vector

Historical alias: WD-E2.

Take

```math
\mathcal H=K_+=K_-=L^2(0,1),
```

```math
S_+=I,
\qquad
X=M_t,
\qquad
S_-=-X,
```

where

```math
(M_tf)(t)=t f(t).
```

Then

```math
\|X\|=1.
```

But for every nonzero $f$,

```math
\|Xf\|^2
=
\int_0^1t^2|f(t)|^2\,dt
<
\int_0^1|f(t)|^2\,dt
=
\|f\|^2,
```

because $1-t^2>0$ almost everywhere.

Thus the norm is not attained.

The defect is

```math
D=I-M_{t^2},
```

so

```math
\langle Df,f\rangle
=
\int_0^1(1-t^2)|f(t)|^2\,dt
>0
```

for every nonzero $f$.

Choosing unit vectors supported in intervals approaching $t=1$ makes this defect value tend to zero.

### Audit result

The construction is exact.

### Sharpness role

WD-X02 proves that the infinite-dimensional critical case in WD-T04 genuinely has a non-attained branch.

Therefore

```math
\boxed{
\|X\|=1
\not\Rightarrow
\text{actual neutral vector}
}
```

without finite-dimensional compactness or another norm-attainment hypothesis.

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X03 — Individual screening is not compositional

Historical alias: WD-E3.

Take

```math
\mathcal H=K_+=M=B=\mathbb C,
\qquad
S_+=1,
```

and

```math
S_M=S_B=-r,
\qquad
\frac1{\sqrt2}<r<1.
```

Each negative channel separately has defect

```math
1-r^2>0.
```

Jointly,

```math
D_{\rm full}
=
1-r^2-r^2
=
1-2r^2
<0.
```

Equivalently, the separate screening maps each have norm $r<1$, while the combined map

```math
X=[r\ r]
```

has

```math
\|X\|=\sqrt2\,r>1.
```

### Audit result

The construction is exact.

### Sharpness role

WD-X03 shows the shared-budget hypothesis of WD-T09 is essential.

Separate channel contractivity does not imply joint contractivity:

```math
\boxed{
\|X_M\|\le1,\ \|X_B\|\le1
\not\Rightarrow
X_MX_M^*+X_BX_B^*\preceq I.
}
```

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X04 — Direct compression does not control the shorted covariance uniformly

Historical alias: WD-E4.

Take

```math
K_r=
\begin{pmatrix}
1&r\\
r&1
\end{pmatrix},
\qquad
0<r<1,
```

on

```math
\mathbb C^2
=
W\oplus W^\perp,
\qquad
W=\operatorname{span}(e_1).
```

The direct compression is

```math
A=1.
```

The complementary block is also $C=1$, so the Schur-shortened covariance is

```math
\boxed{
H_W
=
A-BC^{-1}B^*
=
1-r^2.
}
```

Hence

```math
H_W\downarrow0
\qquad(r\uparrow1)
```

while the direct compression remains identically $1$.

For each fixed $r<1$, $K_r$ is uniformly positive; its smallest eigenvalue is $1-r>0$.

### Audit result

The construction is exact.

### Sharpness role

WD-X04 shows that a strong direct selected-block lower bound does not provide a uniform family-level lower bound on the shorted covariance when coupling to the eliminated complement approaches degeneracy.

It does not say the fixed-$r$ shorted covariance vanishes.

Thus it sharpens WD-T13 as

```math
\boxed{
\text{direct compression floor alone}
\not\Rightarrow
\text{uniform shorted-covariance floor across a family}.
}
```

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X05 — Moving sectors can lose every persistent ray

Historical alias: WD-E5.

Let

```math
K_+=K_-=\ell^2(\mathbb N)
```

with the standard $J$-form.

Choose

```math
r_n>1,
\qquad
r_n\downarrow1,
```

and

```math
y_n
=
\frac{(e_n,r_ne_n)}{\sqrt{1+r_n^2}}.
```

Then

```math
\|y_n\|=1
```

and

```math
[y_n,y_n]_J
=
\frac{1-r_n^2}{1+r_n^2}
<0,
\qquad
[y_n,y_n]_J\to0.
```

Because different $n$ use orthogonal coordinates in both coefficient sectors, the $y_n$ are Hilbert-orthonormal.

Define

```math
\mathcal A_n
=
\overline{\operatorname{span}}\{y_k:k\ge n\}.
```

For an orthonormal sequence,

```math
\bigcap_n\mathcal A_n=\{0\}.
```

### Audit result

The construction is exact.

### Sharpness role

WD-X05 shows that the fixed finite negative-sector hypothesis in WD-T16/WD-T17 is essential.

A one-dimensional negative direction at each stage is not enough if the one-dimensional sector itself moves through infinitely many coordinates.

Thus

```math
\boxed{
\text{finite dimension at each stage}
\not\Rightarrow
\text{persistent ray}
}
```

unless the finite negative sector is fixed.

It is the canonical witness for the moving/full-coordinate escape side of WD-T39.

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X06 — Positive-coordinate mass loss strengthens criticality to negativity

Historical alias: WD-E6.

Let

```math
K_+=\ell^2(\mathbb N),
\qquad
M=\mathbb C,
```

and define

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

Because

```math
e_n\rightharpoonup0
```

in $\ell^2$,

```math
y_n\rightharpoonup
y
:=
\left(
0,\frac1{\sqrt2}
\right).
```

Hence

```math
\boxed{
[y,y]_J=-\frac12.
}
```

Define

```math
\mathcal A_n
=
\overline{\operatorname{span}}\{y_k:k\ge n\}.
```

For every fixed $n$, the tail $\{y_k:k\ge n\}$ lies in $\mathcal A_n$, and a closed subspace of a Hilbert space is weakly closed.

Therefore its weak limit $y$ also lies in $\mathcal A_n$, so

```math
y\in\bigcap_n\mathcal A_n.
```

The vectors $y_n$ are not orthogonal; no orthogonality is needed for this argument.

### Audit result

The construction is exact.

### Sharpness role

WD-X06 realizes the negative-fall-through branch of WD-T17.

It shows that loss of positive-coordinate norm can make a critical sequence more negative in the right limit:

```math
\boxed{
[y_n,y_n]_J=0
\quad\text{but}\quad
[y,y]_J<0.
}
```

Thus weak convergence at criticality cannot be replaced by an assumption that the limit remains neutral.

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## WD-X07 — The inverse-square far order is sharp

Historical alias: ZW1-E1.

Take two distinct selected points

```math
\rho_1\ne\rho_2
```

and

```math
v=(1,-1).
```

Then

```math
\mathbf1^Tv=0,
```

but

```math
M_1(v)
=
\rho_1-\rho_2
\ne0.
```

The rational response is explicitly

```math
R_v(z)
=
\frac1{z-\rho_1}
-
\frac1{z-\rho_2}
=
\frac{\rho_1-\rho_2}
{(z-\rho_1)(z-\rho_2)}.
```

Therefore

```math
\boxed{
R_v(z)
\sim
\frac{\rho_1-\rho_2}{z^2}.
}
```

### Audit result

The construction is exact.

### Sharpness role

WD-X07 shows that WD-T27 is optimal under the zero-moment hypothesis alone.

There is no universal implication

```math
\mathbf1^Tv=0
\Longrightarrow
R_v(z)=O(|z|^{-3}).
```

Any $O(|z|^{-3})$ improvement requires the additional first-moment condition

```math
\sum_j\rho_jv_j=0
```

or some stronger structure.

Status:

```math
\boxed{\text{EXAMPLE-AUDIT-PASSED}}
```

---

## Sharpness map

| Example | Theorem boundary sharpened |
| --- | --- |
| WD-X01 | WD-T06: finite negativity need not survive the infinite positive-complement limit |
| WD-X02 | WD-T04: critical norm one need not be attained in infinite dimension |
| WD-X03 | WD-T09: screening budget is joint, not blockwise compositional |
| WD-X04 | WD-T13: direct compression gives no uniform family-level shorted floor |
| WD-X05 | WD-T16 / WD-T17 / WD-T39: fixed-sector compactness is essential |
| WD-X06 | WD-T17: critical weak limits may fall through to strict negativity |
| WD-X07 | WD-T27: inverse-square decay is optimal under zero moment alone |

---

## H1-P4.4 determination

Every stable example/sharpness witness has been checked and attached to a precise theorem boundary.

```math
\boxed{
\text{WD-X01 through WD-X07: EXAMPLE-AUDIT-PASSED}.
}
```

This exhausts the P4 audit classes:

- WD-T01 through WD-T36: P4-AUDIT-PASSED;
- WD-T37 through WD-T39: COMPOSITE-AUDIT-PASSED;
- WD-X01 through WD-X07: EXAMPLE-AUDIT-PASSED;
- WD-S01 through WD-S05: SCOPE-ONLY;
- load-bearing external inputs: SOURCE-PINNED.

Therefore

```math
\boxed{
\textbf{H1-P4 — PROOF AUDIT AND THEOREM NORMALIZATION: COMPLETE.}
```

No open RH-facing interface has changed standing.

### Historical handoff from H1-P4.4

This handoff is historical provenance, not the live project cursor. See [Lean Formalization Track](LEAN_FORMALIZATION_TRACK.md) for current control state.

```math
\boxed{
\texttt{H1-P5.0 / PUBLIC PACKAGE ARCHITECTURE}
}
```
