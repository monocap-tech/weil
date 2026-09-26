# Imported Source Pins
**H1-P4.1 — Exact load-bearing external statements and conventions**

This file pins the external inputs identified in H1-P4.0.

It does not add new mathematical claims.

A source pin records:

1. the exact external statement consumed;
2. its source location;
3. the notation/convention transferred into Horizon 1;
4. which stable theorem IDs consume it.

---

## EXT-1 — Douglas factorization theorem

### Source

R. G. Douglas, *On majorization, factorization, and range inclusion of operators on Hilbert space*, Proceedings of the American Mathematical Society **17** (1966), 413–415.

DOI:

https://doi.org/10.1090/S0002-9939-1966-0203464-1

### Exact pin

**Theorem 1**, pp. 413–415.

For bounded Hilbert-space operators $A,B$, the following are equivalent:

```math
\operatorname{Ran}A\subseteq\operatorname{Ran}B,
```

```math
AA^{*}\le \lambda^2BB^{*}
\quad\text{for some }\lambda\ge0,
```

and

```math
A=BC
\quad\text{for some bounded }C.
```

The theorem also specifies a unique reduced/Douglas solution satisfying the minimum-norm majorization formula together with

```math
\ker A=\ker C
```

and

```math
\operatorname{Ran}C
\subseteq
\overline{\operatorname{Ran}B^{*}}.
```

### Horizon-1 convention

Apply Douglas with

```math
A=S_{-},
\qquad
B=S_{+}.
```

Then

```math
S_{-}S_{-}^{*}\preceq S_{+}S_{+}^{*}
```

is exactly the unit-majorization case and yields a reduced solution $X$ with

```math
S_{-}=-S_{+}X,
\qquad
\|X\|\le1,
```

after absorbing the sign into $X$.

### Consumed by

- WD-T02 directly;
- WD-T03, WD-T10, WD-T11 downstream through the reduced solution.

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

The primary bibliographic record and theorem identity are fixed. Project-level domain/codomain applications are a separate internal-proof question; their completed H1-P4.2 review is recorded in [Internal Proof Audit](INTERNAL_PROOF_AUDIT.md).

---

## EXT-2 — Bombieri finite Weil theory

### Source

Enrico Bombieri, *Remarks on Weil's quadratic functional in the theory of prime numbers, I*, Rendiconti Lincei, Serie 9, **11** (2000), 183–233.

Public text:

https://www.bdim.eu/item?id=RLIN_2000_9_11_3_183_0

### EXT-2A — finite negative index

### Exact pin

**Theorem 8**, printed p. 213.

Bombieri states that the number of negative eigenvalues of

```math
H(\Gamma;t)
```

equals the number of **distinct complex-conjugate pairs** in $\Gamma$.

### Consumed by

- WD-T22.

### Horizon-1 convention

The count is by distinct conjugate pairs after multiplicity-null directions are separated.

A simple off-critical zeta quartet contributes two nonreal conjugate pairs in Bombieri's ordinate coordinate; therefore a two-quartet selected packet contributes four finite negative directions.

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

---

### EXT-2B — multiplicity-null directions

### Exact pin

**Lemma 10**, printed p. 210, together with the continuation of its proof on printed p. 213 immediately before Theorem 8.

Lemma 10 states that $H(\Gamma;t)$ has eigenvalue $0$ exactly when an ordinate occurs with multiplicity greater than one; the null multiplicity is the sum of the corresponding $m(\gamma)-1$ contributions over distinct repeated ordinates.

The proof then identifies the remaining spectrum with the matrix over distinct ordinates weighted by their multiplicities.

### Consumed by

- WD-T23;
- the multiplicity convention of WD-T22.

### Horizon-1 convention

Same-frequency duplicate coefficient directions are quotient/null directions and are not counted as independent negative channels.

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

---

### EXT-2C — kernel/column decay context

### Exact pin

Section 7, **Theorem 6**, printed pp. 203–206, especially equation

```math
\boxed{(7.7)}
```

on printed p. 204.

Bombieri obtains, for fixed $t$ and $x,y$ in the stated horizontal strip,

```math
|H(x,y;t)|
\ll_t
\frac{1}{(1+|x|)(1+|y|)}
\min\!\left(1,\frac1{|x-y|}\right).
```

This remains useful corroborating context for the high-height decay scale.

### H1-P4.2 correction

WD-T28 no longer consumes (7.7) as a Hilbert-Gram input. Its Hilbert–Schmidt proof now uses a direct native Dirichlet-resolvent estimate plus EXT-3 zero counting.

Bombieri's matrix is complex symmetric in the relevant nonreal-zero setting, so the audit deliberately avoids interpreting it as an ordinary Hermitian Gram matrix.

### Pin status

```math
\boxed{\text{SOURCE-PINNED / CONTEXTUAL FOR WD-T28}}
```

---

## EXT-3 — zeta zero counting in unit-height strips

### Source

E. C. Titchmarsh, revised by D. R. Heath-Brown, *The Theory of the Riemann Zeta-function*, 2nd ed., Oxford University Press, 1986.

Public scan used for pinning:

https://sites.math.rutgers.edu/~zeilberg/EM18/TitchmarshZeta.pdf

### Exact pin

Chapter IX, §9.2, **Theorem 9.2**, printed p. 211:

```math
\boxed{
N(T+1)-N(T)=O(\log T).
}
\tag{9.2.1}
```

The immediately following text states the same bound for every fixed interval length $h$ and notes that the multiplicity of a multiple zero at height $T$ is $O(\log T)$.

### Consumed by

- WD-T28, together with Bombieri (7.7);
- WD-T31, in the shell summation proving the far-tail estimate.

### Horizon-1 convention

Zeros are counted with multiplicity.

For a fixed selected packet and unit-height shell at distance $n$, the number of complementary zeros in the shell is

```math
O(\log(2+n+|T_F|)).
```

Together with

```math
R_v(\mu)=O(n^{-2}),
```

this gives the internal summation

```math
\sum_{n\ge R}\frac{\log n}{n^2}
=
O\!\left(\frac{\log R}{R}\right).
```

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

---

## EXT-4 — compact-window geometric explicit formula

### Source

Xuefeng Zhu, *Weil positivity in compact windows: a finite reduction, certified two-sided bounds, and a Landau–Widom decay law*, arXiv:2608.24827v2, 2026.

https://arxiv.org/abs/2608.24827

### Exact pin

PDF printed p. 2, equations **(2)** and **(3)**.

For

```math
\operatorname{supp}f\subseteq[-L,L],
\qquad
F=\widehat f,
```

the source writes

```math
\boxed{
Q(f)
=
2F(i/2)^2
+
\frac1{2\pi}
\int_{\mathbb R}
|F(t)|^2\Psi_L(t)\,dt
}
\tag{2}
```

for the real-even convention used there, with

```math
\boxed{
\Psi_L(t)
=
\Re\psi\!\left(\frac14+\frac{it}{2}\right)
-\log\pi
-
\sum_{\log n<2L}
\frac{2\Lambda(n)}{\sqrt n}
\cos(t\log n).
}
\tag{3}
```

The text immediately following (3) states that, because

```math
\operatorname{supp}(f*\widetilde f)
\subseteq[-2L,2L],
```

only prime powers satisfying

```math
\boxed{
\log n<2L
}
```

contribute.

### Horizon-1 convention map

Our support radius is

```math
\boxed{c=L}.
```

Therefore the active compact-window prime set is

```math
\boxed{
\{n=p^m:\log n<2c\}.
}
```

The source uses the **strict inequality** $<$.

At a threshold

```math
2c=\log n_0,
```

the threshold term is not in the source sum at $c$ under this convention, but becomes active for every sufficiently small strict right enlargement $c+\varepsilon$.

The source Fourier convention is the one in which multiplication by

```math
\cos(t\log n)
```

corresponds, up to the fixed transform-normalization convention, to the symmetric physical translation pair

```math
\frac12
\left(
\tau_{\log n}
+
\tau_{-\log n}
\right).
```

The factor $2$ in (3) cancels that $1/2$ when the physical prime-delay coefficient is written as

```math
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n}).
```

### Consumed by

- WD-T34;
- the compact-window formula input of WD-T35;
- the arithmetic operator representation used in WD-T38.

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

The H1-P4.2 proof audit must still verify that every internal occurrence uses the same Fourier normalization and support-boundary convention.

---

## EXT-5 — digamma asymptotic

### Source

NIST Digital Library of Mathematical Functions, §5.11(i), equation **5.11.2**.

https://dlmf.nist.gov/5.11.E2

### Exact pin

As $z\to\infty$ in a sector bounded away from the negative real axis,

```math
\boxed{
\psi(z)
\sim
\log z
-
\frac1{2z}
-
\sum_{k\ge1}
\frac{B_{2k}}{2kz^{2k}}.
}
\tag{DLMF 5.11.2}
```

### Horizon-1 specialization

Set

```math
z=\frac14+\frac{it}{2}.
```

Then

```math
\Re\log z
=
\log|z|
=
\log|t|-\log2+O(t^{-2}),
```

and the remaining terms are bounded/decaying.

Therefore

```math
\Re\psi\!\left(\frac14+\frac{it}{2}\right)
=
\log|t|+O(1).
```

Combining with the finite bounded prime trigonometric polynomial from EXT-4 gives

```math
\boxed{
\Psi_c(t)
=
\log|t|+O_c(1).
}
```

### Consumed by

- WD-T35.

### Pin status

```math
\boxed{\text{SOURCE-PINNED}}
```

---

## Contextual sources not load-bearing in the present theorem statements

### Anderson–Trapp shorting

W. N. Anderson, Jr. and G. E. Trapp, *Shorted Operators. II.*, SIAM Journal on Applied Mathematics **28** (1975).

This supports the general positive-operator shorting framework.

The current WD-T13 statement is deliberately restricted to a strictly positive/invertible-block Schur complement and does not require the general Anderson–Trapp theorem.

Status:

```math
\boxed{\text{CONTEXTUAL / NON-LOAD-BEARING}}
```

### Suzuki operator framework

Masatoshi Suzuki, *Weil's quadratic form via the screw function*, arXiv:2606.09096 (2026).

This is useful context for nonlocal finite-interval Weil operators.

The current WD-T34–WD-T38 chain derives its concrete operator formula from EXT-4 and does not consume a theorem of Suzuki.

Status:

```math
\boxed{\text{CONTEXTUAL / NON-LOAD-BEARING}}
```

---

## Source-pin matrix

| External input | Exact pin | Stable theorem IDs | Status |
| --- | --- | --- | --- |
| Douglas factorization | Douglas (1966), Theorem 1, pp. 413–415 | WD-T02; downstream T03/T10/T11 | SOURCE-PINNED |
| Bombieri finite inertia | Bombieri (2000), Theorem 8, p. 213 | WD-T22 | SOURCE-PINNED |
| Bombieri multiplicity | Bombieri (2000), Lemma 10, p. 210 + proof continuation p. 213 | WD-T23 / T22 convention | SOURCE-PINNED |
| Bombieri kernel decay | Bombieri (2000), Theorem 6 proof, eq. (7.7), p. 204 | corroborating/contextual after P4.2 | SOURCE-PINNED / NON-LOAD-BEARING |
| Unit-height zero count | Titchmarsh (1986), Theorem 9.2, eq. (9.2.1), p. 211 | WD-T28, WD-T31 | SOURCE-PINNED |
| Compact-window formula | Zhu (2026), eqs. (2)–(3), p. 2 | WD-T34, WD-T35, WD-T38 | SOURCE-PINNED |
| Digamma asymptotic | DLMF 5.11.2 | WD-T35 | SOURCE-PINNED |

---

## H1-P4.1 determination

All load-bearing external source families identified in H1-P4.0 are now pinned to exact theorem/equation locations.

At that checkpoint, what remained was not source discovery.

The next audit was the **internal proof transitions** that consume these pins.

### Historical handoff from H1-P4.1

```math
\boxed{
\texttt{H1-P4.2 / INTERNAL PROOF AUDIT}
}
```

That handoff was subsequently completed in H1-P4.2. It is retained here as provenance, not as the live project cursor.
