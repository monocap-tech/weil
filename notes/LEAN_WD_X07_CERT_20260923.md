# LEAN-H1-P1 — WD-X07 Certificate
Date: 2026-09-23

## Target

$$
\boxed{
\text{WD-X07 — inverse-square far order is sharp}.
}
$$

## Formal content

Lean proves the two-point identity

$$
\frac1{z-\rho_1}
-
\frac1{z-\rho_2}
=
\frac{\rho_1-\rho_2}
{(z-\rho_1)(z-\rho_2)},
$$

and for the explicit pair

$$
(\rho_1,\rho_2)=(0,1)
$$

the real response

$$
R(x)=\frac1x-\frac1{x-1}
$$

satisfies

$$
x^2R(x)\to-1.
$$

Therefore the inverse-square coefficient is genuinely nonzero in an explicit
zero-moment example.

This formally witnesses that the universal conclusion

$$
R_v(z)=O(|z|^{-2})
$$

cannot be improved to $O(|z|^{-3})$ from zero moment alone.

## Certification evidence

Current Lean source blob:

$$
\texttt{83196783b21e40eee21ca74c12b3b8094c2af391}.
$$

The same blob was kernel-checked successfully in GitHub Actions run

$$
\texttt{35951096357}
$$

at commit

$$
\texttt{e9f158d3c8fb5b85494d08931d62cddfc8d4a534}.
$$

The pinned Lean/mathlib build and unfinished-proof/project-axiom checks passed.

## Status

$$
\boxed{
\text{WD-X07: LEAN-CERTIFIED}.
}
$$

No second theorem was started in this pass.
