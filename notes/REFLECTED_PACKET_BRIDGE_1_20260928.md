# RPB-1 — Exact normalization certificate at the quadratic/parity level

**Date:** 2026-09-28  
**Branch:** `research/reflected-packet-bridge`  
**Status:** **PASS WITH ONE METADATA DEFECT / OPERATOR POLARIZATION DEFERRED**  
**Dependencies:** RPB-0 only.  
**Promotion status:** none.

## 0. Question

Can the reflected observable be identified exactly with the compact-window Weil form used in Horizon 1 without silently assuming an unrecorded sesquilinear/operator normalization?

Yes, at the quadratic/parity level.

The exact safe bridge is

```math
\boxed{
Q_h(y)
=
\frac12
\left(
Q_{c(y)}(h_y^+)
-
Q_{c(y)}(h_y^-)
\right),
\qquad
c(y)=y+\frac12.
}
```

This statement does not require writing (Q_h(y)=\langle W_{c(y)}h_y^{\mathrm R},h_y^{\mathrm L}\rangle) inside the Horizon-1 notation. That operator-level polarization remains a separate bookkeeping step.

---

## 1. Conventions on the reflected side

The reflected source freezes

```math
\widehat\Phi(z)
=
\int_{\mathbb R}\Phi(x)e^{-izx}\,dx
```

and the Hermitian preform

```math
\begin{aligned}
\mathfrak q(\Phi,\Psi)
={}&
\frac1{2\pi}
\int_{\mathbb R}
m_\infty(t)
\overline{\widehat\Phi(t)}\widehat\Psi(t)\,dt
\\
&+
\overline{\widehat\Phi(-i/2)}\widehat\Psi(i/2)
+
\overline{\widehat\Phi(i/2)}\widehat\Psi(-i/2)
\\
&-
\sum_{n\ge2}
\frac{\Lambda(n)}{\sqrt n}
\left[
C_{\Phi,\Psi}(\log n)
+
C_{\Phi,\Psi}(-\log n)
\right].
\end{aligned}
```

For the real reflected probes

```math
h_y^\pm
=
\frac{h_y^{\mathrm R}\pm h_y^{\mathrm L}}{\sqrt2},
```

(h_y^+) is even and (h_y^-) is odd.

Polarization gives

```math
\Delta_h(y)
=
\mathfrak q[h_y^+]
-
\mathfrak q[h_y^-]
=
2Q_h(y).
```

---

## 2. Horizon-1 compact-window formula

The Horizon-1 source pin EXT-4 records, for a real even test (f) supported in ([-c,c]),

```math
Q_c(f)
=
2F(i/2)^2
+
\frac1{2\pi}
\int_{\mathbb R}
|F(t)|^2
\Psi_c(t)\,dt,
```

with

```math
\Psi_c(t)
=
\Re\psi\!\left(\frac14+\frac{it}{2}\right)
-
\log\pi
-
\sum_{\log n<2c}
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n).
```

The current arXiv source also explicitly treats the odd sector: for real odd (f), the same archimedean/prime part applies and the pole contribution changes sign to

```math
-2
\left(
\int f(x)\sinh(x/2)\,dx
\right)^2.
```

Thus both parity sectors needed by the reflected construction are available on the quadratic level.

---

## 3. Archimedean match

The reflected multiplier is

```math
m_\infty(t)
=
\Re\psi\!\left(\frac14+\frac{it}{2}\right)
-
\log\pi.
```

This is exactly the non-prime part of (Psi_c(t)).

The two repositories use opposite possible signs in their displayed Fourier transform conventions, but for the diagonal integral only

```math
|F(t)|^2
```

appears. Therefore the real-axis sign convention is immaterial for this bridge.

**Result:** exact diagonal match.

---

## 4. Prime-power match

For a diagonal real test (f),

```math
C_{f,f}(r)
```

has Fourier transform (|F(t)|^2). Hence the symmetric translation pair at (r=\log n) contributes the cosine multiplier.

The reflected coefficient is

```math
-\frac{\Lambda(n)}{\sqrt n}
\bigl(
C_{f,f}(\log n)+C_{f,f}(-\log n)
\bigr),
```

which becomes

```math
-\frac1{2\pi}
\int
|F(t)|^2
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n)
\,dt.
```

This is exactly the prime term inside the Horizon-1 (Psi_c).

**Result:** exact coefficient and factor match.

---

## 5. Pole match by parity

### Even sector

For real even (f),

```math
F(-i/2)=F(i/2)\in\mathbb R,
```

so the reflected pole contribution is

```math
F(-i/2)F(i/2)
+
F(i/2)F(-i/2)
=
2F(i/2)^2.
```

This is exactly the even compact-window pole term.

### Odd sector

For real odd (f),

```math
F(-i/2)=-F(i/2),
```

so the reflected pole contribution is

```math
-2F(i/2)^2.
```

This matches the odd-sector correction recorded in the current compact-window source.

**Result:** exact parity-sensitive pole match.

---

## 6. Support and cutoff match

The reflected probe has

```math
\operatorname{supp}h=[-1/2,1/2].
```

Therefore

```math
\operatorname{supp}h_y^{\mathrm R}
=
[y-1/2,y+1/2],
```

```math
\operatorname{supp}h_y^{\mathrm L}
=
[-y-1/2,-y+1/2].
```

The minimal symmetric compact window containing both is

```math
\boxed{
[-c(y),c(y)],
\qquad
c(y)=y+\frac12.
}
```

The reflected semilocal convention includes prime powers with

```math
\log n\le2c,
```

whereas the Horizon-1 EXT-4 pin records the strict source convention

```math
\log n<2c.
```

At equality, however, the correlation overlap is supported at only the boundary point and is zero; for the frozen smooth packet this is equivalently

```math
K_h(\pm1)=0.
```

Therefore the strict/inclusive convention difference contributes zero on the reflected probes.

**Result:** exact value-level match at every (y>1/2).

---

## 7. Certified bridge identity

At

```math
c(y)=y+\frac12,
```

the two parity vectors lie in the same compact window and their diagonal reflected preform values equal the Horizon-1 compact-window quadratic-form values:

```math
\boxed{
\mathfrak q[h_y^+]
=
Q_{c(y)}(h_y^+),
}
```

```math
\boxed{
\mathfrak q[h_y^-]
=
Q_{c(y)}(h_y^-).
}
```

Using reflected polarization,

```math
\Delta_h(y)
=
2Q_h(y),
```

we obtain

```math
\boxed{
Q_h(y)
=
\frac12
\left[
Q_{c(y)}(h_y^+)
-
Q_{c(y)}(h_y^-)
\right].
}
```

Equivalently,

```math
\boxed{
\Delta_h(y)
=
Q_{c(y)}(h_y^+)
-
Q_{c(y)}(h_y^-).
}
```

This is the first exact theorem-level bridge suitable for use in later RPB passes, subject to independent audit before any canonical promotion.

---

## 8. What is deliberately not certified here

Horizon 1 often writes a physical operator species

```math
\mathcal W_c^{\rm ext}
=
\mathcal A_\infty
-
\sum
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n})
+
\mathcal R_{\rm pole},
```

and the abstract defect operator

```math
W_c=P_cP_c^*-N_cN_c^*.
```

The public package does not currently give, in one pinned location, the complete sesquilinear polarization convention identifying every cross matrix coefficient of these operators with the reflected source's (mathfrak q(\Phi,\Psi)).

Therefore this pass does **not** promote the notation

```math
Q_h(y)
=
\langle W_{c(y)}h_y^{\mathrm R},h_y^{\mathrm L}\rangle
```

as a certified Horizon-1 identity.

The diagonal/parity bridge above is sufficient and avoids inventing missing convention data.

---

## 9. Source-pin metadata defect found during RPB-1

Horizon-1 `docs/IMPORTED_SOURCE_PINS.md` currently identifies arXiv

```text
2608.24827
```

as a paper by **Xuefeng Zhu** with the title

```text
Weil positivity in compact windows:
a finite reduction, certified two-sided bounds, and a Landau–Widom decay law
```

The current arXiv record for the same identifier instead gives:

```text
Marcus Chuk
Weil positivity in compact windows:
certified two-sided bounds and a Landau--Widom decay law
```

The equations used by Horizon 1 remain present as equations (2)–(3), so this pass has found a **bibliographic/source-pin metadata defect**, not a demonstrated mathematical defect in EXT-4.

This discrepancy must be repaired in a separate canonical source-pin maintenance pass. It is not silently edited here.

---

## 10. Structural consequence

The reflected criterion is now certified, at the quadratic-form level, as a statement about a very specific moving two-dimensional compression of the same compact-window Weil form:

```math
\boxed{
y
\longmapsto
\left(
c(y)=y+\frac12,
\;
\operatorname{span}\{h_y^+,h_y^-\}
\right).
}
```

The scalar (Q_h(y)) is half the difference between the two parity Rayleigh numerators on that moving two-plane.

This makes the next question precise:

> How does the zero-side positive/negative channel decomposition act on the two moving parity probes (h_y^\pm)?

That is not a normalization question anymore.

It is a channel-decomposition question.

---

## 11. RPB-1 determination

```math
\boxed{
\textbf{RPB-1 — QUADRATIC/PARITY NORMALIZATION: PASS.}
}
```

with two quarantined follow-ups:

1. **RPB-META-1:** repair the EXT-4 bibliographic metadata in a separate canonical maintenance pass;
2. operator-level sesquilinear notation may be certified later if needed, but is not required for the next mathematical pass.

Next cursor:

```text
RPB-2 / ZERO-SIDE DECOMPOSITION OF THE MOVING PARITY PROBES
```
