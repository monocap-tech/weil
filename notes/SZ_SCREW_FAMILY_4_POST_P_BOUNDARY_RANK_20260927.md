# SZ Screw-Family Parallel Investigation — Post-p Tap Relift and Boundary Rank

**Date:** 2026-09-27  
**Branch:** `research/sz-screw-family-0`  
**Standing:** DERIVED at the raw Green/boundary level; OPEN at the final GERM quotient.  
**Canonical effect:** NONE. `SZ-CROSS-COLLAR-3` is unchanged.

## 1. Exact retained GERM-34 algebra recovered

The pre-`p` coupled relations are

~~~math
S(x)=R X(x)-QX(x-h),
~~~

and

~~~math
S(x+h)=-T X(x)+E S(x).
~~~

Eliminating `S(x+h)` gives

~~~math
V(x+h)=M_0V(x),
\qquad
V=(X,S)^T,
~~~

with

~~~math
M_0=
\begin{pmatrix}
(Q-T)/R&E/R\\
-T&E
\end{pmatrix}.
~~~

The retained facts are

~~~math
\det M_0=1,
\qquad
\operatorname{tr}M_0=\Theta\approx1.979793.
~~~

Hence the old scalar recurrence is

~~~math
X(x+h)=\Theta X(x)-X(x-h).
~~~

For the post-`p` chamber the exact representative P-row is

~~~math
S(x)-RX(x)+QX(x-h)-ZX(x-k)=0,
~~~

while the corresponding J-row contains the new forward term

~~~math
F S(x+k).
~~~

Equivalently,

~~~math
S(x)
=
RX(x)-QX(x-h)+ZX(x-k),
~~~

~~~math
S(x+h)
=
-TX(x)+ES(x)+FS(x+k).
~~~

Using the first equation at `x+h` gives the exact two-state transfer

~~~math
\boxed{
V(x+h)
=
M_0V(x)
+
c_+S(x+k)
-
c_-X(x-(k-h)),
}
~~~

where

~~~math
\boxed{
c_+
=
F
\begin{pmatrix}
1/R\\
1
\end{pmatrix},
\qquad
c_-
=
Z
\begin{pmatrix}
1/R\\
0
\end{pmatrix}.
}
~~~

This reproduces the retained GERM-34 tap geometry.

The activation indicators at the moving head boundary are suppressed here; they do not change the tap directions.

**Standing:** DERIVED from the retained P/J equations.

---

## 2. The two post-p taps are full-rank in the state plane

The tap-direction matrix is

~~~math
C_{\rm tap}
=
\begin{pmatrix}
F/R&Z/R\\
F&0
\end{pmatrix}.
~~~

Therefore

~~~math
\boxed{
\det C_{\rm tap}
=
-\frac{FZ}{R}.
}
~~~

GERM-34 retained the two taps as nonzero, and `R\ne0` is required for the displayed transfer. Hence

~~~math
\boxed{
\operatorname{rank}C_{\rm tap}=2.
}
~~~

This explains exactly why the pre-`p` scalar recurrence ceases to close by itself: after the first genuine overlap change, forcing enters both independent directions of the two-dimensional state.

No additional bulk scalar identity can remove this merely by Cayley-Hamilton propagation.

**Standing:** DERIVED, conditional only on the retained nonzero-tap status already used by GERM-34.

---

## 3. General-a bulk relift collapses back to the same P/J equations

Let

~~~math
z=a^2
~~~

and

~~~math
K_z(s)
=
\frac{\sinh(\sqrt z\,s)}{\sqrt z}
=
s+z\frac{s^3}{6}+O(z^2).
~~~

The exact multi-Green factorization from the preceding pass is

~~~math
Q_W
=
D^*G_zD+zG_z+C_zJ.
~~~

Differentiating in `z` gives zero in the full bulk because the represented Weil distribution is independent of `z`.

At the kernel level, write

~~~math
K_0(s)=s,
\qquad
K_1(s)=\frac{s^3}{6}.
~~~

For `s>0`,

~~~math
-K_1''(s)+K_0(s)=0.
~~~

Thus the cubic-tent derivative channel and the mass channel cancel exactly in every open region on which the support pattern is unchanged.

Consequently, after all three general-`a` channels are recombined lawfully,

~~~math
\boxed{
Q(a)=Q,\quad
T(a)=T,\quad
R(a)=R,\quad
E(a)=E
}
~~~

for the **total bulk P/J operator**.

This does not mean the individual Green-channel coefficients are constant. It means their sum represents the same bulk operator, so any parameter dependence must be carried by truncation/boundary concomitants.

This is the correct resolution of the proposed GENERAL-a P/J relift.

**Standing:** DERIVED at the total-operator level from parameter-independence of the Weil distribution and the exact Green factorization.

---

## 4. The first variation is pure boundary data

Although

~~~math
-K_1''+K_0=0
~~~

in the open bulk, integration by parts across a truncated fiber leaves the boundary concomitant of `K_1`.

At an active positive gap `d>0`, the base and first-variation Cauchy vectors are

~~~math
\mathcal C_0(d)
=
\begin{pmatrix}
K_0(d)\\
K_0'(d)
\end{pmatrix}
=
\begin{pmatrix}
d\\
1
\end{pmatrix},
~~~

and

~~~math
\mathcal C_1(d)
=
\begin{pmatrix}
K_1(d)\\
K_1'(d)
\end{pmatrix}
=
\begin{pmatrix}
d^3/6\\
d^2/2
\end{pmatrix}.
~~~

Their determinant is

~~~math
\boxed{
\det[\mathcal C_0(d),\mathcal C_1(d)]
=
\frac{d^3}{3}>0.
}
~~~

Therefore the first screw-family variation supplies boundary data that are **not proportional** to the original Suzuki boundary data at any positive active gap.

This is an exact rank-two result at the raw Green boundary level.

~~~math
\boxed{
\texttt{RAW BOUNDARY SCREW-FAMILY RANK}=2.
}
~~~

No RH assumption is used.

---

## 5. The actual post-p delays make the rank separation explicit

The retained arithmetic lengths are

~~~math
h=\log\frac{81}{80},
\qquad
k=\log\frac{16}{15},
~~~

so

~~~math
k-h
=
\log\frac{256}{243}>0.
~~~

The two post-`p` taps occur at the distinct positive delay scales

~~~math
k,
\qquad
k-h.
~~~

If one records only Green values rather than full Cauchy data, the base/first-variation evaluation matrix is

~~~math
\begin{pmatrix}
k&k-h\\
k^3/6&(k-h)^3/6
\end{pmatrix}.
~~~

Its determinant is

~~~math
\boxed{
\frac{k(k-h)}6
\left((k-h)^2-k^2\right)
=
-\frac{h\,k(k-h)(2k-h)}6
\ne0.
}
~~~

So even the two raw delay evaluations already separate the first screw-family variation from the base screw.

Again, this is before the P/J quotient.

---

## 6. What remains between this hit and CROSS-COLLAR-3

We now know:

1. the post-`p` tap space in `V=(X,S)` is two-dimensional;
2. the base Suzuki screw plus the first screw-family variation have rank two as raw boundary Cauchy data;
3. the entire family is redundant in the bulk;
4. therefore the only possible loss of the new information occurs in the finite map

~~~math
\boxed{
\text{raw boundary Cauchy data}
\longrightarrow
\text{GERM P/J tap state}.
}
~~~

This is a much smaller problem than the full return/monodromy atlas.

The existing GERM-36 local atom determinants are strictly nonzero, which is evidence that the local quotient maps are not generically rank-collapsing, but this is not yet the exact intertwiner required here.

No promotion is made from those determinants alone.

---

## 7. Exact next target

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-4 / CAUCHY-TO-TAP INTERTWINER}
}
~~~

Derive the local map

~~~math
\mathfrak T:
(\text{Green value},\text{Green normal derivative})
\longrightarrow
(X,S)\text{ tap coordinates}
~~~

at the moving post-`p` boundary.

Then compute

~~~math
\boxed{
\det
\left[
\mathfrak T\mathcal C_0(d),
\mathfrak T\mathcal C_1(d)
\right].
}
~~~

If `\mathfrak T` is a two-dimensional invertible local atom map, then automatically

~~~math
\det
[
\mathfrak T\mathcal C_0,
\mathfrak T\mathcal C_1
]
=
(\det\mathfrak T)\frac{d^3}{3}
\ne0,
~~~

and the screw-family supplies the missing second boundary trace directly.

### Stop rules

- `\operatorname{rank}\mathfrak T=2`: **BOUNDARY-RANK HIT**; attempt direct two-trace closure of the post-`p` ambiguity before any further return atlas.
- `\operatorname{rank}\mathfrak T=1`: identify the exact quotient killing the new trace; family route stops unless another boundary component avoids it.
- failure to identify `\mathfrak T` without changing custody: **INTERTWINER STOP**, not a negative mathematical result.

## Determination

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-3: BULK RELIFT COLLAPSES / RAW BOUNDARY RANK-TWO HIT}
}
~~~

The investigation has now isolated a single finite local intertwiner as the gate between the new screw-family information and the existing GERM state.
