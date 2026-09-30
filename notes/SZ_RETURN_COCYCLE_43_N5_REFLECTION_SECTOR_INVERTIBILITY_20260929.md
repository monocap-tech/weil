# SZ-RETURN-COCYCLE-43 — N5 Reflection-Sector Invertibility

**Date:** 2026-09-29/30  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL INVERTIBILITY CERTIFICATE  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Verifier: `experiments/sz_return_cocycle_43_n5_reflection_sector_invertibility.py`

Authoritative non-assumptive run: GitHub Actions **36638029002**

- plus job **109643362552**: SUCCESS
- minus job **109643362760**: SUCCESS

## Result

The N5 collision species from SZ-RETURN-COCYCLE-42 has full size

[
\boxed{721442},
]

with equal orientation sets of size

[
\boxed{360721}.
]

Hence the full system diagonalizes into two reflection sectors of dimension 360721.

Both sectors have exact sparsity

[
\boxed{
\operatorname{nnz}(A_+)
=
\operatorname{nnz}(A_-)
=
942384.
}
]

The rounded inverse witness norms are identical:

[
\boxed{
\|R_+\|_\infty
=
\|R_-\|_\infty
=
\frac{63924057}{10^6}
=
63.924057
<64.
}
]

Thus the tiny seven-millionth plus/minus asymmetry seen at N2 and N4 does not appear at N5.

Both sectors give exactly

[
\boxed{
\|I-R_\sigma A_{\sigma,0}\|_\infty
=
\frac{338547930925}{10^{15}}
<
\frac1{2950}.
}
]

Maximum exact individual residual entries:

- plus: `1710917232`
- minus: `1641840644`

The exact physical coefficient enclosure remains

[
\|A_{\sigma,\mathrm{phys}}-A_{\sigma,0}\|_\infty<10^{-9}.
]

Therefore

[
\|I-R_\sigma A_{\sigma,\mathrm{phys}}\|_\infty
<
\frac1{2949}
<
1.
]

Hence both physical reflection sectors are invertible by the Neumann lemma, and therefore

[
\boxed{
N_5/721442
\text{ is invertible for both external parity choices}.
}
]

## Sixth nu chamber closure

SZ-RETURN-COCYCLE-42 classified the sixth nu chamber into:

1. N5 / 721442
2. N4 / 615664
3. O0 / 105768

All three are now certified.

Therefore the sixth nu chamber is source-level closed, modulo the registered lower-dimensional threshold seams, and open coverage extends through

[
\boxed{
0<e<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+6\nu.
}
]

The quotient-eighteen relation remains

[
\omega=18\nu+\lambda,
\qquad
0<\lambda<\nu.
]

At the next seam the surviving O0 width is

[
\omega-6\nu=12\nu+\lambda.
]

## Determination

[
\boxed{
\texttt{SZ-RETURN-COCYCLE-43:
N5 / 721442 CERTIFIED /
SIXTH NU CHAMBER CLOSED /
360721-SECTOR PARALLEL NON-ASSUMPTIVE CERTIFICATE HIT}
}
]

No canonical SZ theorem cursor moves automatically.

## Next cursor

[
\boxed{
\texttt{SZ-RETURN-COCYCLE-44 / SEVENTH NU TIER SEAM}
}
]

No seventh-tier work is performed in this pass.
