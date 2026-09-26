# H1-P2.2 — Explicit-Formula Arithmetic Attachment
Date: 2026-09-23

## Determination

The ZW-2 arithmetic layer is normalized and H1-P2 closes.

### Negative branch

A fixed selected zero-moment source admits selected-preserving scalarization.

The zero moment gives

```math
R_v(z)=O(|z|^{-2}),
```

and ordinary zero counting yields the quantitative far-tail estimate

```math
\boxed{
\mathcal F_{v,R}[\psi]
=
O_{v,\psi}\!\left(
\frac{\log R}{R}
\right).
}
```

Thus the infinite distant divisor is harmless for a fixed selected source.

The remaining finite/intermediate field is

```math
\mathcal N_{v,R}[\psi].
```

With

```math
H_v=\Xi R_v,
```

every complementary zero $\mu$ of multiplicity $m_\mu$ satisfies

```math
\boxed{
R_v(\mu)
=
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
}
```

Therefore

```math
\boxed{
\mathcal N_{v,R}[\psi]
=
\sum_{\mu}^{\rm near}
m_\mu\psi(\mu)
\frac{H_v^{(m_\mu)}(\mu)}
{\Xi^{(m_\mu)}(\mu)}.
}
```

This is the exact weighted next-jet field.

If an adaptive selected-preserving multiplier additionally cancels the near-minus-archimedean term, the explicit formula forces

```math
\mathcal P_v[\psi]
=
\mathcal F_v[\psi].
```

Hence adaptive near cancellation does not leave an independent prime signal.

The open interface is

```math
\texttt{AZ-NEXTJET-LOC}.
```

### Neutral branch

At fixed compact support,

```math
\log n<2c
```

selects only finitely many prime powers.

The physical Weil operator is therefore

```math
\mathcal W_c
=
\mathcal A_\infty
-
\sum_{\log n<2c}
\frac{\Lambda(n)}{\sqrt n}
(\tau_{\log n}+\tau_{-\log n})
+
\mathcal R_{\rm pole}
```

up to the fixed Fourier normalization.

Its symbol satisfies

```math
\boxed{
\Psi_c(t)
=
\log|t|
+
O_c(1).
}
```

Hence the natural form norm is logarithmic and finite prime translations do not generate positive Sobolev/quasianalytic regularity.

The open interface is

```math
\texttt{AZ-FIN-WEIL-NULL-EXTENSION}.
```

## Standing

- ZW2-T1 selected-preserving two-mode multiplier: **PROVED**;
- ZW2-T2 quantitative far-tail localization: **PROVED**;
- ZW2-T3 complementary next-jet identity: **PROVED**;
- ZW2-T4 weighted near next-jet representation: **PROVED**;
- ZW2-T5 adaptive co-cancellation identity: **PROVED**;
- ZW2-T6 finite prime-support theorem: **PROVED / imported support formula**;
- ZW2-T7 logarithmic form-domain theorem: **DERIVED**;
- ZW2-T8 no automatic quasianalytic bootstrap: **PROVED as operator-order consequence**;
- ZW2-T9 neutrality is global rather than termwise: **SCOPE/LOGICAL CONSEQUENCE**.

## Phase disposition

```math
\boxed{
\textbf{H1-P2 — ZETA-WEIL SPECIALIZATION: COMPLETE.}
```

## Next cursor

```math
\boxed{
\texttt{H1-P3.0 / NEGATIVE DEFECT MORPHOLOGY THEOREM}
}
```
