# H1-P3.0 — Negative Defect Morphology Theorem
Date: 2026-09-23

## Determination

The negative branch is now packaged as one theorem family.

Assume a fixed finite selected packet $\Pi$, an endpoint $c$ with nonnegative selected endpoint space, and unit physical vectors $g_n$ at supports $t_n\downarrow c$ such that

```math
\varepsilon_n
=
\|\mathcal E_{\Pi,t_n}^{*}g_n\|
\to0
```

while

```math
z_n
=
\mathcal E_{\Pi,t_n}^{*}g_n/\varepsilon_n
```

satisfy

```math
[z_n,z_n]_J\to-\kappa
```

for some $\kappa>0$.

Then:

1. a nonzero persistent negative ray
   ```math
   y\in\mathcal A_{\Pi,c+}\setminus\mathcal A_{\Pi,c}
   ```
   survives with
   ```math
   [y,y]_J\le-\kappa;
   ```

2. physical representatives normalized to order-one selected amplitude have norm tending to infinity;

3. the full Weil form obeys
   ```math
   \limsup
   Q_W(g_n)/\varepsilon_n^2
   \le-\kappa;
   ```

4. the selected negative coordinate gives a nonzero raw source
   ```math
   v\ne0,
   \qquad
   \mathbf{1}^Tv=0;
   ```

5. hence
   ```math
   R_v(z)=O(z^{-2});
   ```

6. for a fixed bounded selected-preserving multiplier,
   ```math
   \mathcal F_{v,R}
   =
   O((\log R)/R);
   ```

7. all remaining complementary-divisor dependence is therefore localized, up to a vanishing far error, into
   ```math
   \mathcal N_{v,R}[\psi]
   =
   \sum_{\mu}^{\rm near}
   m_\mu\psi(\mu)
   \frac{H_v^{(m_\mu)}(\mu)}
   {\Xi^{(m_\mu)}(\mu)};
   ```

8. adaptive cancellation of the near-minus-archimedean field forces the prime term onto the far tail and gives no independent bypass.

The theorem deliberately does **not** assert a source-free lower bound on the near next-jet field.

That stronger statement belongs to the downstream actual-zeta interface.

## Stop line

```math
\boxed{
\texttt{AZ-NEXTJET-LOC}
}
```

with

```math
\boxed{
\texttt{C-ACTUAL-KPH-FLOOR}
}
```

as the stronger special-packet interface.

## Background fork

The unselected negative background either:

- escapes in norm/tail; or
- converges after subsequence to a fixed full-divisor negative ray.

That submorphology remains assigned to H1-P3.2.

## Phase cursor

```math
\boxed{
\texttt{H1-P3.1 / NEUTRAL DEFECT MORPHOLOGY THEOREM}
}
```
