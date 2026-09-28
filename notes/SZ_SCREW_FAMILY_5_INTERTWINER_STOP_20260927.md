# SZ Screw-Family Parallel Investigation — Intertwiner Audit and Route Disposition

**Date:** 2026-09-27  
**Branch:** `research/sz-screw-family-0`  
**Standing:** DERIVED / CUSTODY CORRECTION  
**Canonical effect:** NONE. `SZ-CROSS-COLLAR-3` remains unchanged.

## 1. The proposed Cauchy-to-tap intertwiner is not presently a lawful object

The previous pass established exact rank-two algebra for the **Green kernel boundary vectors**

~~~math
\mathcal C_0(d)=
\begin{pmatrix}d\\1\end{pmatrix},
\qquad
\mathcal C_1(d)=
\begin{pmatrix}d^3/6\\d^2/2\end{pmatrix},
~~~

with determinant `d^3/3`.

This is correct kernel algebra.

However, the actual GERM state

~~~math
V=(X,S)^T
~~~

is not identified in the retained derivation with the value/normal-derivative jet of the screw kernel. In particular, `S` is a relay variable satisfying translated P/J relations such as

~~~math
S(x)=RX(x)-QX(x-h)+ZX(x-k),
~~~

not a proved normal derivative of `X` or of the Green kernel.

Therefore no map

~~~math
\mathfrak T:(K,K')\mapsto(X,S)
~~~

has been established.

The determinant identity

~~~math
\det[
\mathfrak T\mathcal C_0,
\mathfrak T\mathcal C_1
]
=
(\det\mathfrak T)d^3/3
~~~

is consequently only conditional notation and cannot be promoted.

**Determination:** the proposed local Cauchy-to-tap intertwiner reaches a **CUSTODY STOP**.

---

## 2. The actual neutral boundary data are nonclassical

The retained compact-window neutral operator has logarithmic principal order. The downstream boundary analysis establishes only logarithmic/Stieltjes boundary structure, not a classical `C^1` jet.

The lawful boundary observables are of the following species:

1. finite prime-shadow values
   ~~~math
   e_{j,+}(u)=k_u(c-a_j),
   \qquad
   e_{j,-}(u)=k_u(-c+a_j),
   ~~~
   once the boundedness/continuity bootstrap has been established;

2. the persistent Stieltjes/logarithmic primitive traces
   ~~~math
   \gamma_+(u)
   =
   \lim_{\rho\downarrow0}
   \int_\rho^\eta\frac{k_u(c-r)}r\,dr,
   ~~~
   and analogously on the left.

These are traces of the **neutral mode**.

By contrast, `\mathcal C_0,\mathcal C_1` above are boundary vectors of the **Green kernels**.

The two notions must not be identified.

---

## 3. Suzuki's finite-interval carrier makes the distinction exact

Suzuki's Section 8.1 records

~~~math
Q_W(v)=Q_G(Dv)
~~~

for compactly supported smooth `v`, with `Dv\in L_0^2(-c,c)`.

Section 8.2 further states that

~~~math
D:H_0^1(-c,c)\to L_0^2(-c,c)
~~~

is bijective, with

~~~math
v=D^{-1}u,
\qquad
v(x)=\int_{-c}^x u(t)\,dt.
~~~

Thus the `a=0` screw realizes the finite-window Weil form through a single continuous-kernel quadratic form on the zero-mean derivative variable `u=Dv`.

This is the minimal Suzuki carrier.

---

## 4. General-a factorization in the same finite-window variable

From the exact Green identity of the preceding pass,

~~~math
Q_W(v)
=
\langle G_aDv,Dv\rangle
+
a^2\langle G_av,v\rangle
+
C_a\left|\int_{-c}^c v(x)\,dx\right|^2.
~~~

Put

~~~math
u=Dv\in L_0^2(-c,c),
\qquad
J_c:=D^{-1}.
~~~

Then

~~~math
v=J_cu.
~~~

Moreover,

~~~math
\begin{aligned}
\int_{-c}^c v(x)\,dx
&=
\int_{-c}^c\int_{-c}^x u(t)\,dt\,dx\\
&=
\int_{-c}^c(c-t)u(t)\,dt.
\end{aligned}
~~~

Since `u\in L_0^2`,

~~~math
\int_{-c}^c u(t)\,dt=0,
~~~

so

~~~math
\boxed{
\int_{-c}^c v(x)\,dx
=
-\int_{-c}^c t\,u(t)\,dt.
}
~~~

Define the first-moment functional

~~~math
m_c(u):=-\int_{-c}^c t\,u(t)\,dt.
~~~

The general screw-family factorization on Suzuki's finite-window variable is therefore

~~~math
\boxed{
Q_W(D^{-1}u)
=
\langle G_{a,c}u,u\rangle
+
a^2
\langle
J_c^*G_{a,c}J_cu,u
\rangle
+
C_a|m_c(u)|^2.
}
~~~

Equivalently, the total finite-window form operator is represented by

~~~math
\boxed{
\mathcal S_{a,c}
=
G_{a,c}
+
a^2J_c^*G_{a,c}J_c
+
C_a(m_c\otimes m_c),
}
~~~

on the appropriate common core.

At `a=0`,

~~~math
\boxed{
\mathcal S_{0,c}=G_{0,c}.
}
~~~

This explains exactly why Suzuki's `\ell=1/2` member is minimal.

**Standing:** DERIVED from the general Green identity plus Suzuki's derivative-coordinate bijection.

---

## 5. Consequence for the "missing screw" hypothesis

For `a\ne0`, the raw hyperbolic Green kernel may have simpler local recurrence than the linear tent, but the lawful finite-window Weil representation simultaneously acquires:

1. the inverse-derivative channel
   ~~~math
   a^2J_c^*G_{a,c}J_c;
   ~~~
2. the rank-one moment channel
   ~~~math
   C_a(m_c\otimes m_c).
   ~~~

Therefore a nonzero-`a` screw cannot be substituted into the current GERM recurrence by replacing the linear tent alone.

Doing so discards exactly the channels required to reconstruct the same Weil form.

The family supplies **no independent second collar equation**.

It supplies alternate factorizations of the same collar equation.

---

## 6. Why the raw boundary rank-two hit does not close the tap ambiguity

The post-`p` GERM tap directions are genuinely two-dimensional:

~~~math
\det C_{\rm tap}=-FZ/R\ne0.
~~~

The Green kernel family also has rank-two raw boundary/evaluation data.

But these facts live on different objects.

There is no theorem of the form

~~~math
\text{Green-kernel boundary rank}
\Longrightarrow
\text{neutral-mode tap rank}.
~~~

The actual neutral boundary map factors through the logarithmic form domain, prime-shadow restrictions, and Stieltjes exterior response.

Hence the rank-two kernel determinant is retained only as **representation geometry**, not as a second neutral trace.

---

## 7. Complexity comparison

The special member `a=0` uses one finite-window kernel channel:

~~~math
G_{0,c}.
~~~

Every nonzero member uses at least

~~~math
G_{a,c}
\quad+\quad
a^2J_c^*G_{a,c}J_c
\quad+\quad
\text{rank-one moment}.
~~~

Thus the naive hope that `a\ne0` would reduce the state dimension is not supported by the exact carrier.

It can still be useful as a change of representation, preconditioner, or source of identities, but any such gain must be demonstrated explicitly; it cannot come from independent information.

No such state reduction has been obtained in the present branch.

---

## 8. Route disposition

The original branch question has now been answered.

### Source question

Are there additional zeta screw functions?

~~~math
\boxed{\text{YES: a one-parameter }H_\ell\text{ family.}}
~~~

### Ambient independence question

Are their raw spectral weights distinct?

~~~math
\boxed{\text{YES: unbounded finite algebraic rank.}}
~~~

### Weil-data question

Do they encode independent bulk/collar Weil constraints?

~~~math
\boxed{\text{NO: they are Green factorizations of the same distribution.}}
~~~

### GERM shortcut question

Does a second screw currently supply a lawful second equation killing the two post-p taps?

~~~math
\boxed{\text{NO.}}
~~~

The raw kernel boundary rank cannot be transferred to the neutral GERM state without an unavailable and, at current regularity, incorrectly typed classical Cauchy intertwiner.

### Representation-simplification question

Has a nonzero-`a` factorization been shown to reduce the GERM state/return complexity?

~~~math
\boxed{\text{NO.}}
~~~

The exact finite-window carrier instead adds inverse-derivative and moment channels.

---

## 9. Determination

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-4: INTERTWINER STOP / INDEPENDENT-SCREW SHORTCUT REJECTED}
}
~~~

This is a **successful negative reconnaissance result**.

It does not weaken or alter the existing GERM traversal. It establishes that the recent traversal difficulty cannot presently be attributed to omission of an independent Matsumoto-Suzuki screw equation.

The useful residue is:

1. source-pinned one-parameter screw family;
2. exact ambient Cauchy/resolvent rank structure;
3. exact multi-Green factorization of the Weil form;
4. proof that Suzuki's `a=0` carrier is the uniquely minimal member of this family in derivative coordinates;
5. a prohibition against promoting raw Green boundary rank to neutral-mode boundary rank.

## Branch status

No re-entry into `SZ-CROSS-COLLAR-3` is licensed.

The screw-family branch should remain parallel residue unless a future problem specifically benefits from the alternate Green factorization.
