# Public Examples and Sharpness

## H1-P5.3 — Canonical failure modes

These seven examples are the public sharpness witnesses for Horizon 1.

Each example isolates a specific failure mode at a theorem boundary. It shows
why a named hypothesis cannot simply be dropped, or why a named conclusion
cannot be strengthened without additional structure. Examples do not create
proof-producing edges in the theorem DAG.

---

## WD-X01 — Complete screening of finite truncation negativity

**Sharpens:** WD-T06.

Take

~~~math
\mathcal H=\mathbb C,
\qquad
K_-=\mathbb C,
\qquad
S_-=1,
~~~

and let $K_+=\ell^2(\mathbb N)$ with

~~~math
c_j=\frac1{\sqrt{j(j+1)}},
\qquad
S_+x=\sum_{j\ge1}c_jx_j.
~~~

Since

~~~math
\sum_{j=1}^{\infty}c_j^2=1,
~~~

the full defect is zero. For the projection $P_N$ onto the first $N$
coordinates,

~~~math
\sum_{j=1}^{N}c_j^2=1-\frac1{N+1},
~~~

so

~~~math
\boxed{
D_N=-\frac1{N+1}<0,
\qquad
D_N\uparrow0.
}
~~~

Thus strict finite negativity need not survive restoration of the infinite
positive complement.

**Lean status:** LEAN-CERTIFIED.

---

## WD-X02 — Critical norm one without a neutral vector

**Sharpens:** WD-T04.

The canonical audit model is

~~~math
\mathcal H=K_+=K_-=L^2(0,1),
\qquad
S_+=I,
\qquad
X=M_t,
\qquad
S_-=-X.
~~~

Then

~~~math
\|X\|=1
~~~

but no nonzero vector attains the norm because $|t|<1$ almost everywhere on
$(0,1)$. The defect is

~~~math
D=I-M_{t^2},
~~~

and for every nonzero $f$,

~~~math
\langle Df,f\rangle
=
\int_0^1(1-t^2)|f(t)|^2\,dt
>0.
~~~

Unit vectors concentrated near $t=1$ make the defect tend to zero. Hence

~~~math
\boxed{
\|X\|=1
\not\Rightarrow
\text{actual neutral vector}.
}
~~~

The Lean development certifies a discrete diagonal $\ell^2$ realization of
the same sharpness phenomenon: every nonzero vector loses norm strictly while
standard basis directions approach the critical gain.

**Lean status:** LEAN-CERTIFIED.

---

## WD-X03 — Individual screening is not compositional

**Sharpens:** WD-T09.

Take

~~~math
\mathcal H=K_+=M=B=\mathbb C,
\qquad
S_+=1,
~~~

and

~~~math
S_M=S_B=-r,
\qquad
\frac1{\sqrt2}<r<1.
~~~

Each negative channel separately has defect

~~~math
1-r^2>0.
~~~

Jointly,

~~~math
D_{\rm full}=1-2r^2<0.
~~~

Equivalently, each individual screening coefficient is contractive while

~~~math
\|[r\ r]\|=\sqrt2\,r>1.
~~~

Therefore

~~~math
\boxed{
\|X_M\|\le1,\ \|X_B\|\le1
\not\Rightarrow
X_MX_M^*+X_BX_B^*\preceq I.
}
~~~

**Lean status:** LEAN-CERTIFIED.

---

## WD-X04 — Direct compression does not give a uniform shorted floor

**Sharpens:** WD-T13.

Let

~~~math
K_r=
\begin{pmatrix}
1&r\\
r&1
\end{pmatrix},
\qquad
0<r<1,
~~~

with selected subspace $W=\operatorname{span}(e_1)$.

The direct selected compression is

~~~math
A=1,
~~~

but the Schur-shortened covariance is

~~~math
\boxed{
H_W=1-r^2.
}
~~~

Hence

~~~math
H_W\downarrow0
\qquad(r\uparrow1)
~~~

while $A\equiv1$. Each fixed $r<1$ is still strictly positive; the failure
is uniform across the family.

Thus

~~~math
\boxed{
\text{direct compression floor}
\not\Rightarrow
\text{uniform shorted-covariance floor}.
}
~~~

**Lean status:** LEAN-CERTIFIED.

---

## WD-X05 — Moving finite sectors can lose every persistent ray

**Sharpens:** WD-T16, WD-T17, WD-T39.

Canonical model:

~~~math
K_+=K_-=\ell^2(\mathbb N),
~~~

with

~~~math
y_n=
\frac{(e_n,r_ne_n)}{\sqrt{1+r_n^2}},
\qquad
r_n>1,
\qquad
r_n\downarrow1.
~~~

Then

~~~math
\|y_n\|=1,
\qquad
[y_n,y_n]_J
=
\frac{1-r_n^2}{1+r_n^2}<0,
\qquad
[y_n,y_n]_J\to0.
~~~

Define

~~~math
\mathcal A_n
=
\overline{\operatorname{span}}\{y_k:k\ge n\}.
~~~

Because the $y_n$ use disjoint coordinates,

~~~math
\boxed{
\bigcap_n\mathcal A_n=\{0\}.
}
~~~

Thus finite dimension at each stage is insufficient for WD-T16/WD-T17. Their
compactness argument requires one fixed finite selected sector, with the
selected negative mass remaining in that fixed sector.

The Lean certificate uses a coordinate-tail realization of the same moving-
sector failure mode: normalized vectors remain strictly negative with signature
tending to zero, while the total tail intersection is trivial.

**Lean status:** LEAN-CERTIFIED.

---

## WD-X06 — Positive-coordinate mass loss makes the weak limit negative

**Sharpens:** WD-T17.

Let

~~~math
K_+=\ell^2(\mathbb N),
\qquad
M=\mathbb C,
~~~

and

~~~math
y_n=
\left(
\frac1{\sqrt2}e_n,
\frac1{\sqrt2}
\right).
~~~

Then

~~~math
\|y_n\|=1,
\qquad
[y_n,y_n]_J=0.
~~~

Since $e_n\rightharpoonup0$,

~~~math
y_n\rightharpoonup
y=
\left(
0,\frac1{\sqrt2}
\right),
~~~

and therefore

~~~math
\boxed{
[y,y]_J=-\frac12<0.
}
~~~

In this fixed-selected-coordinate example, weak convergence loses positive
norm while the selected negative coordinate remains fixed. The limiting
signature is therefore strictly negative, realizing the fall-through branch
of WD-T17.

**Lean status:** LEAN-CERTIFIED.

---

## WD-X07 — The inverse-square far order is sharp

**Sharpens:** WD-T27.

For two distinct selected points $\rho_1\neq\rho_2$, take

~~~math
v=(1,-1).
~~~

Then

~~~math
\mathbf1^Tv=0,
~~~

but

~~~math
R_v(z)
=
\frac1{z-\rho_1}
-
\frac1{z-\rho_2}
=
\frac{\rho_1-\rho_2}
{(z-\rho_1)(z-\rho_2)}.
~~~

Hence

~~~math
\boxed{
R_v(z)
\sim
\frac{\rho_1-\rho_2}{z^2}.
}
~~~

Zero moment alone does not imply a universal $O(|z|^{-3})$ bound. A
universal cubic-order improvement would require an additional first-moment
cancellation or some other stronger structure.

**Lean status:** LEAN-CERTIFIED.

---

## Sharpness map

| Example | Theorem boundary |
| --- | --- |
| WD-X01 | WD-T06 — finite negativity need not survive infinite positive restoration |
| WD-X02 | WD-T04 — critical norm one need not be attained |
| WD-X03 | WD-T09 — screening budget is joint, not blockwise compositional |
| WD-X04 | WD-T13 — direct compression does not uniformly control the shorted covariance |
| WD-X05 | WD-T16 / WD-T17 / WD-T39 — fixed-sector compactness is essential |
| WD-X06 | WD-T17 — critical weak limits may fall through to strict negativity |
| WD-X07 | WD-T27 — inverse-square far decay is optimal under zero moment alone |
