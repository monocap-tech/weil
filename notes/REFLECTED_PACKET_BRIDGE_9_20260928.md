# RPB-9 — Translation system ↔ screw-function representation

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS / SCREW = POTENTIALIZED TRANSLATION KERNEL / NEW ANALYTIC LAYER, NOT NEW ARITHMETIC SOURCE**  
**Dependencies:** RPB-0 through RPB-8.  
**Promotion status:** none.

## 0. Objective

RPB-8 identified the common parent object of the Horizon-1 support-compression theory and the reflected-packet translation-growth theory as the Weil translation system

```math
(\mathscr D,T,\mathfrak q),
\qquad
\mathscr D=C_c^\infty(\mathbb R).
```

RPB-9 asks whether Suzuki's zeta screw function is:

1. a genuinely independent second carrier;
2. merely one scalar slice of the translation kernel; or
3. a regularized/potentialized realization of the same parent structure.

The correct answer is **(3)**.

The screw formalism does not introduce independent zeta spectral data. It lowers the distributional order of the Weil kernel by two integrations and thereby exposes a new analytic/operator layer.

---

## 1. Source gate

Primary source:

```text
Masatoshi Suzuki,
"Weil's quadratic form via the screw function",
arXiv:2606.09096v3 (2026).
```

The current source inspected is the September 2026 revision.

Load-bearing formulas/results:

- equation (1.3): explicit continuous zeta screw function (g_\zeta(t));
- equations (1.4)–(1.6): convolution operator (G), compressed operator (G_a), and
  ```math
  B_a=D^*G_aD;
  ```
- Theorem 1.1: (A_a) is the Friedrichs extension of (B_a);
- equation (2.9): Weil form represented by the continuous screw kernel acting on derivatives;
- equation (2.10): distributional kernel (-g_\zeta''(x-y)) represents the compact-window Weil operator on smooth compact tests;
- Section 8.1 / equation (8.1): gauge-free screw difference kernel;
- Section 8.4 / equation (8.3): (Q_W(v)=Q_G(Dv));
- Theorem 1.5: self-adjoint extensions of a first-order differential operator in the screw-induced space give real-zero characteristic entire functions.

Historical source used by Suzuki:

```text
Masatoshi Suzuki,
"Aspects of the screw function corresponding to the Riemann zeta function",
arXiv:2206.03682v4 (2023).
```

Its Proposition 3.1 states the polarized identity

```math
\langle D\psi_1,D\psi_2\rangle_{G_g,a}
=
W(\psi_1*\widetilde{\psi_2}).
```

This is the exact bridge between the continuous screw kernel and the Weil sesquilinear form.

---

## 2. Screw potential and distribution kernel

To avoid collision with the physical probe (g), denote Suzuki's continuous function by

```math
s_\zeta(t).
```

Suzuki proves, distributionally, that the compact-window Weil operator has difference kernel

```math
\boxed{
k_\zeta(t)
=
-s_\zeta''(t).
}
```

For compact smooth test functions (f,g), polarization of the quadratic identity gives

```math
\boxed{
\mathfrak q(f,g)
=
\iint_{\mathbb R^2}
k_\zeta(x-y)
\overline{f(x)}
g(y)
\,dx\,dy.
}
```

Equivalently, using the project correlation

```math
C_{f,g}(r)
=
\int
\overline{f(x-r)}g(x)\,dx,
```

and evenness of (k_\zeta),

```math
\boxed{
\mathfrak q(f,g)
=
\langle k_\zeta,C_{f,g}\rangle.
}
```

Thus the translation-invariant distribution kernel of the Weil preform is exactly the negative second distributional derivative of the screw potential.

---

## 3. Exact relation to the polarized translated Weil kernel

Recall

```math
\mathcal K_{\mathfrak q}(f,g;t)
=
\mathfrak q(T_tf,g).
```

The translated correlation is

```math
C_{T_tf,g}(r)
=
C_{f,g}(r+t).
```

Hence

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
\left\langle
-s_\zeta'',
C_{f,g}(\cdot+t)
\right\rangle.
}
```

Define the smoother screw-potential coefficient

```math
\boxed{
\mathcal S_{f,g}(t)
:=
\int_{\mathbb R}
s_\zeta(r)
C_{f,g}(r+t)
\,dr.
}
```

The integral is ordinary because (s_\zeta) is continuous and (C_{f,g}) is compactly supported.

Distributional integration by parts gives

```math
\boxed{
\mathcal K_{\mathfrak q}(f,g;t)
=
-\frac{d^2}{dt^2}
\mathcal S_{f,g}(t).
}
```

Therefore the screw representation is literally a twofold potentialization of every polarized translation matrix coefficient.

---

## 4. The screw function is not an independent spectral source

Suppose only the distribution kernel

```math
k_\zeta=-s_\zeta''
```

is fixed.

Any other second primitive differs by an affine function

```math
at+b.
```

Suzuki's normalization is real and even with the canonical origin normalization, which fixes that affine gauge.

More invariantly, the screw difference kernel

```math
\boxed{
\widetilde s_\zeta(x,y)
=
s_\zeta(x-y)
-
s_\zeta(x)
-
s_\zeta(-y)
+
s_\zeta(0)
}
```

is unchanged by adding any affine function to (s_\zeta).

Thus the screw kernel depends only on the underlying second derivative (k_\zeta).

Consequently:

```math
\boxed{
\text{screw potential}
\not=
\text{independent arithmetic datum}.
}
```

It is a canonical continuous potential for the same translation-invariant Weil kernel.

---

## 5. Why it nevertheless adds real structure

Although it adds no independent zero/prime data, potentialization changes the analytic category.

### Distributional Weil realization

The original compact-window operator is represented on smooth compact tests by

```math
k_\zeta(x-y)
=
-s_\zeta''(x-y),
```

which is distributional and logarithmic-order.

### Continuous screw realization

The operator

```math
(Gu)(x)
=
\int
s_\zeta(x-y)u(y)\,dy
```

has a continuous difference kernel on compact windows.

On the zero-mean subspace, the gauge-corrected screw operator and the simpler convolution operator agree at the quadratic-form level.

Suzuki's exact relation is

```math
\boxed{
Q_W(v)
=
Q_G(Dv),
}
```

with

```math
D=i\frac d{dx}.
```

At fixed support (a),

```math
\boxed{
B_a
=
D^*G_aD,
}
```

and Suzuki's Theorem 1.1 identifies the canonical self-adjoint compact-window Weil operator (A_a) as the Friedrichs extension of (B_a).

Thus the screw formalism lowers order and replaces a distributional kernel problem by a continuous compact-kernel problem after differentiation.

This is substantial analytic structure even though it is derived from the same parent data.

---

## 6. Position in the RPB object hierarchy

RPB-8 gave

```math
(\mathscr D,T,\mathfrak q)
\longrightarrow
\mathcal K_{\mathfrak q}(f,g;t).
```

RPB-9 adds the equivalent potentialized representation

```math
\boxed{
(\mathscr D,T,\mathfrak q)
\longleftrightarrow
k_\zeta=-s_\zeta''
\longleftrightarrow
s_\zeta
}
```

with matrix coefficients related by

```math
\boxed{
\mathcal K_{\mathfrak q}
=
-\partial_t^2\mathcal S.
}
```

The hierarchy is therefore refined to

```math
\begin{array}{c}
\text{Weil translation system}\\
(\mathscr D,T,\mathfrak q)
\\[2mm]
\downarrow
\\
\text{distribution difference kernel }k_\zeta
\\[1mm]
\updownarrow\;\text{twofold potentialization}
\\[1mm]
\text{continuous screw potential }s_\zeta
\\[2mm]
\downarrow
\\
\text{compact screw operators }G_a
\text{ and extension theory}.
\end{array}
```

So the screw representation sits **below the parent system but above individual probe trajectories**.

---

## 7. Relation to the reflected-packet scalar

For the frozen diagonal probe (h),

```math
Q_h(y)
=
\mathcal K_{\mathfrak q}(h,h;2y).
```

Define

```math
S_h(y)
=
\mathcal S_{h,h}(2y).
```

Then the screw potential gives a twice-integrated version of the reflected scalar.

Up to the factor from the change (t=2y),

```math
Q_h(y)
```

is obtained by differentiating the smoothed screw-potential coefficient twice in separation.

Thus the reflected scalar is not a rival to the screw function.

It is a differentiated translation coefficient of the same potentialized kernel.

---

## 8. Potentialization does not solve RPB-POL-TAIL

Suppose a translation coefficient contains one exponential zero mode

```math
c_\rho e^{w_\rho t},
\qquad
w_\rho=\rho-\frac12\ne0.
```

If

```math
\mathcal K(t)
=
-\mathcal S''(t),
```

then the corresponding screw-potential mode is

```math
-\frac{c_\rho}{w_\rho^2}
e^{w_\rho t},
```

up to an affine integration gauge.

The exponential rate

```math
\Re w_\rho
```

is unchanged.

Therefore:

```math
\boxed{
\text{twofold screw potentialization}
\text{ does not improve the spectral abscissa.}
}
```

It can smooth the kernel and change polynomial/frequency weights, but it cannot by itself turn an off-axis exponential mode into subcritical growth.

Hence the screw function does **not** automatically discharge

```text
RPB-POL-TAIL.
```

---

## 9. Where the screw formalism may genuinely help

The analytic gain is instead strongest at finite support.

Suzuki obtains:

1. a compact continuous-kernel operator (G_a);
2. the factorization (B_a=D^*G_aD);
3. the Friedrichs-extension relation to the canonical Weil operator (A_a);
4. continuity results in the support parameter (a);
5. a first-order symmetric differential operator in a screw-induced Hilbert space with deficiency indices ((1,1));
6. self-adjoint extensions whose characteristic entire functions have real zeros.

These objects are all determined from the same Weil/screw data but are not visible in one scalar reflected trajectory.

Therefore the screw framework contributes a **new analytic mechanism**, not a new arithmetic source.

The most plausible place for that mechanism to interact with the current Weil program is the finite-support neutral/null-extension problem rather than the already identified large-separation exponent problem.

---

## 10. Positivity caution

Suzuki's continuous function (s_\zeta) exists unconditionally.

But the statement that it is a screw function in the Krein--Langer positive-kernel sense is RH-equivalent.

Equivalently, positivity of the difference kernel

```math
s_\zeta(x-y)
-
s_\zeta(x)
-
s_\zeta(-y)
+
s_\zeta(0)
```

cannot be imported unconditionally as a forcing theorem.

Likewise, under RH Suzuki obtains positive Hilbert-space interpretations that must not be fed back into an unconditional RH argument.

The unconditional content used in RPB-9 is only:

- the continuous explicit function;
- the distributional identity (k_\zeta=-s_\zeta'');
- the finite-support operator relations that Suzuki proves without RH.

---

## 11. Answer to the “multiple screw functions” possibility

At the level investigated here, there is no evidence that the reflected-packet bridge requires a second independent zeta screw function.

The scalar (Q_h), the polarized kernel (mathcal K_{\mathfrak q}), and Suzuki's (s_\zeta) are linked by exact differentiation/potentialization relations inside one translation-invariant system.

Different affine representatives of the second primitive are gauge-equivalent, and the screw difference kernel removes that ambiguity.

Thus:

```math
\boxed{
\text{apparent multiplicity of scalar objects}
\ne
\text{multiple independent screw carriers}.
}
```

This does not exclude other useful potentials, matrix-valued generalizations, or additional structures; it only says they would need genuinely new data beyond the scalar second-primitive freedom already accounted for.

---

## 12. RPB-9 determination

```math
\boxed{
\textbf{RPB-9 — SCREW REPRESENTATION = POTENTIALIZED WEIL TRANSLATION SYSTEM.}
}
```

More precisely:

```math
\boxed{
\begin{aligned}
&\text{new arithmetic source: NO},\\
&\text{continuous regularized realization: YES},\\
&\text{new finite-support operator machinery: YES},\\
&\text{automatic large-separation forcing: NO}.
\end{aligned}
}
```

The screw function is therefore neither a rival object nor merely decorative notation.

It is the canonical continuous potential layer of the same parent translation system.

Next cursor:

```text
RPB-10 / SCREW-POTENTIAL ↔ NEUTRAL NULL-EXTENSION TEST
```
