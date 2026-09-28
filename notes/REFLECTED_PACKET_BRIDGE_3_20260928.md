# RPB-3 — Selected-source ↔ physical-probe custody map

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **FIXED-PROBE NO / POLARIZED FINITE INTERPOLATION PASS**  
**Dependencies:** RPB-0, RPB-1, RPB-2.  
**Promotion status:** none.

## 0. Question

Given the nonzero finite selected residue source

```math
v=(v_j)_{ho_j\in\Pi}
```

produced by the Horizon-1 persistent-negative morphology, can the reflected-packet construction carry that same source?

There are two distinct questions:

1. can the **single frozen dyadic probe** (h) carry arbitrary (v)?
2. if not, can a controlled enlargement of the physical probe class carry arbitrary finite (v)?

The answers are:

```math
\boxed{
\text{single frozen }h:\ \textbf{NO in general},
}
```

and

```math
\boxed{
\text{polarized two-probe class }(f,g):\ \textbf{YES on every finite selected set}.
}
```

The second statement is a finite interpolation theorem. Extending the full zero-only reflected growth theorem to these polarized probes is a later task.

---

## 1. Fixed-probe residue vector

For the frozen dyadic probe, define

```math
a^{(h)}_\rho
=
m_\rho
L_h\!\left(\rho-\frac12\right).
```

The tail Laplace transform in the reflected source has local residue proportional to (a^{(h)}_\rho).

Thus one fixed (h) determines one fixed divisor-weight vector

```math
a^{(h)}
=
\left(
a^{(h)}_\rho
\right)_\rho.
```

Changing the separation (y) does **not** change these local pole residues. It changes only the exponential factor

```math
e^{2(\rho-1/2)y}.
```

Scaling (h\mapsto\lambda h) scales every (a^{(h)}_\rho) by the same factor (lambda^2) in the real-even normalization.

Therefore the frozen probe does not generate a freely variable selected source.

---

## 2. One off-axis pair: symmetric and antisymmetric projection

Fix the same-height functional pair

```math
\rho_+
=
\frac12+\delta+iT,
\qquad
\rho_-
=
\frac12-\delta+iT.
```

Put

```math
A
=
L_h(\delta+iT)
=
a+ib.
```

By evenness and conjugation symmetry,

```math
L_h(-\delta+iT)
=
\overline A.
```

Thus, ordering the raw coefficient vector as ((\rho_-,\rho_+)), the frozen probe contributes

```math
m(\overline A,A).
```

Under the canonical pair diagonalization

```math
p
=
\frac{e_-+e_+}{\sqrt2},
\qquad
n
=
\frac{e_--e_+}{\sqrt2},
```

this becomes

```math
\boxed{
m(\overline A,A)
=
\sqrt2,m a\,p
-
\sqrt2,i m b\,n.
}
```

Hence:

- the positive pair coordinate is controlled by (Re A=a);
- the negative pair coordinate is controlled by (i,Im A=i b).

The exact-divisor property

```math
A\ne0
```

for an off-axis zero guarantees only

```math
(a,b)\ne(0,0).
```

It does **not** guarantee

```math
b\ne0.
```

Therefore an off-axis quartet can be fully visible to the reflected growth detector while the frozen probe has zero projection onto that pair's negative Krein coordinate.

This is a fundamental distinction:

```math
\boxed{
\text{off-axis visibility}
\not\Rightarrow
\text{negative-channel source custody}.
}
```

---

## 3. Dimensional obstruction for a fixed selected packet

Let the selected negative space be

```math
M_\Pi
```

with

```math
d=\dim M_\Pi.
```

The frozen probe determines at most one fixed negative-coordinate vector

```math
u_h^{(-)}
\in M_\Pi
```

after projection of its divisor weights onto the selected negative channels.

The WD-T37 source (uin M_\Pi) is not restricted to that one ray.

If

```math
d>1,
```

a single frozen probe cannot represent every possible selected negative source even up to scalar multiple.

If

```math
d=1,
```

representation can still fail when the frozen probe's negative projection vanishes.

Thus the fixed dyadic packet is a universal **off-axis detector**, but not a universal **defect-source encoder**.

---

## 4. The natural enlargement: polarized correlation transforms

Take arbitrary

```math
f,g\in C_c^\infty(\mathbb R)
```

and define the cross correlation

```math
C_{f,g}(r)
=
\int_{\mathbb R}
\overline{f(x-r)}g(x)\,dx.
```

Define its bilateral Laplace transform

```math
M_{f,g}(w)
=
\int_{\mathbb R}
C_{f,g}(r)e^{wr}\,dr.
```

Compact support justifies Fubini. With the Fourier convention

```math
\widehat f(z)
=
\int f(x)e^{-izx}\,dx,
```

one obtains the exact factorization

```math
\boxed{
M_{f,g}(w)
=
\overline{
\widehat f(-i\overline w)
}
\,
\widehat g(iw).
}
```

For the real-even diagonal choice (f=g=h),

```math
M_{h,h}(w)
=
\widehat h(iw)^2
=
L_h(w),
```

so the reflected packet transform is the diagonal specialization of this polarized transform.

This identifies the first natural enlargement:

```math
\boxed{
L_h
\quad\leadsto\quad
M_{f,g}.
}
```

---

## 5. Finite Fourier interpolation lemma

Let

```math
z_1,\ldots,z_N
```

be distinct complex numbers, and let (Isubset\mathbb R) be any nonempty open bounded interval.

Consider

```math
\mathcal E_I:
C_c^\infty(I)
\to
\mathbb C^N,
\qquad
f
\mapsto
\left(
\widehat f(z_1),\ldots,\widehat f(z_N)
\right).
```

Then

```math
\boxed{
\mathcal E_I
\text{ is surjective}.
}
```

### Proof

If the coordinate evaluation functionals were linearly dependent, there would exist coefficients (c_j), not all zero, such that

```math
\sum_{j=1}^N
c_j\widehat f(z_j)
=
0
```

for every (f\in C_c^\infty(I)).

Equivalently,

```math
\int_I
f(x)
\left(
\sum_{j=1}^N
c_j e^{-iz_jx}
\right)
dx
=
0
```

for every such test function.

Hence the exponential polynomial

```math
\sum_{j=1}^N
c_j e^{-iz_jx}
```

vanishes on (I).

Finite distinct-frequency independence, already certified in ZW1-T5, forces

```math
c_1=\cdots=c_N=0,
```

a contradiction.

Therefore the (N) evaluation functionals are linearly independent. Since the target is (N)-dimensional, the map is surjective.

---

## 6. Exact finite selected-source interpolation

Let

```math
\Pi
=
\{\rho_1,\ldots,\rho_N\}
```

be any finite selected set of distinct nontrivial zeros and put

```math
w_j
=
\rho_j-\frac12.
```

Let

```math
v=(v_1,\ldots,v_N)
\in\mathbb C^N
```

be any desired raw selected source. In particular, (v) may be the zero-moment source supplied by WD-T37.

Choose a compactly supported probe (g) satisfying

```math
\widehat g(iw_j)=1
\qquad
(j=1,\ldots,N).
```

This is possible by the finite interpolation lemma.

Next choose (f) satisfying

```math
\overline{
\widehat f(-i\overline{w_j})
}
=
\frac{v_j}{m_{\rho_j}}.
```

Again, finite interpolation gives such an (f).

Then

```math
M_{f,g}(w_j)
=
\frac{v_j}{m_{\rho_j}},
```

and therefore

```math
\boxed{
m_{\rho_j}
M_{f,g}(w_j)
=
v_j
\qquad
(j=1,\ldots,N).
}
```

So every finite selected raw source is exactly realizable as polarized packet-transform data on its selected zero set.

No RH assumption is used.

No zero-moment hypothesis is required for interpolation; the WD-T37 zero moment is simply preserved if (v) has it.

---

## 7. Support control

The interpolation lemma works in **any** nonempty bounded interval (I).

Consequently the two probes (f,g) can be chosen with support in an arbitrarily prescribed compact interval of positive width.

Thus finite selected-source interpolation does not require an expanding intrinsic probe support.

After translating the probes apart, the enclosing semilocal window grows only because of the separation parameter, exactly as in the frozen reflected construction.

This is important for compatibility with support filtration.

---

## 8. What is still missing

The interpolation theorem controls the values

```math
M_{f,g}(w_j)
```

on the finite selected set.

It does **not** force

```math
M_{f,g}(w)=0
```

at every unselected zeta zero.

In general the same probes generate additional coefficients on the complementary divisor.

Therefore

```math
\boxed{
\text{selected-source interpolation}
\ne
\text{selected-source isolation}.
}
```

This is not necessarily a defect.

For a Laplace-pole argument, complementary poles at distinct locations cannot cancel the local principal part at a selected pole. What remains to be proved is that the complete polarized Weil matrix coefficient admits the corresponding zero-only expansion and normally meromorphic tail transform with these residues.

That generalized transform statement has not yet been promoted from the diagonal reflected source.

---

## 9. Object-level consequence

RPB-3 changes the object-identification picture.

The frozen scalar

```math
Q_h(y)
```

is too rigid to carry arbitrary Horizon-1 defect sources.

But its natural parent object,

```math
\boxed{
(f,g,y)
\longmapsto
\mathfrak q(f_y^{\mathrm L},g_y^{\mathrm R}),
}
```

has enough finite-dimensional freedom, at the correlation-transform level, to encode any selected source.

Thus the current candidate primitive bridge object is not one scalar trajectory.

It is the **polarized translated Weil kernel**

```math
\boxed{
\mathcal K(f,g;y)
=
\mathfrak q(f_y^{\mathrm L},g_y^{\mathrm R}).
}
```

The original reflected observable is the symmetric diagonal specialization obtained from (f=g=h), orientation reversal, and the frozen parity symmetry.

This is consistent with the earlier suspicion that the object may live one level above a single screw function or scalar kernel.

---

## 10. Relation to AZ-NEXTJET-LOC

The result does not discharge

```text
AZ-NEXTJET-LOC
```

yet.

What it does establish is that the selected source (v) is **not intrinsically inaccessible** to a physical packet representation.

There is an exact finite probe interpolation map

```math
\boxed{
v
\longmapsto
(f,g)
}
```

at the selected divisor points.

The next test is whether the resulting polarized translated matrix coefficient gives a lawful local-pole certificate for that selected source without reintroducing the weighted near-next-jet obstruction in another guise.

If yes, the reflected route supplies a genuinely different terminal interface.

If the generalized pole certificate is equivalent to the same near-field control, then the two routes meet at AZ-NEXTJET-LOC.

---

## 11. RPB-3 determination

```math
\boxed{
\begin{aligned}
&\text{fixed dyadic probe as universal source encoder: }\mathbf{NO},\\
&\text{polarized compact probes as finite source encoders: }\mathbf{YES}.
\end{aligned}
}
```

Therefore:

```math
\boxed{
\textbf{RPB-3 — SOURCE CUSTODY RECOVERED ONLY AFTER POLARIZATION.}
}
```

Next cursor:

```text
RPB-4 / POLARIZED ZERO EXPANSION AND LOCAL-POLE CERTIFICATE
```
