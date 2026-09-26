# LEAN WD-T19 certificate — 2026-09-24

Stable ID: **WD-T19 / WD-C7 + WD-C8 + WD-C9**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Filtration.RepresentativeBlowup`

Source:

`WeilDefect/Filtration/RepresentativeBlowup.lean`

Certified source blob:

`6645820485d46afe8566e1812de0e301fb290ba2`

## Physical realization

Let

$$
\mathscr H_t
$$

be a monotone family of closed complex Hilbert subspaces, and let

$$
T:\mathscr H\to K
$$

be bounded linear.

Lean defines the closed physical image

$$
\overline{T(\mathscr H_t)}
$$

by

`WeilDefect.WDT19.analysisSpace`.

The physical filtration is assumed right-continuous at the endpoint:

$$
\mathscr H_c
=
\bigcap_{t>c}\mathscr H_t.
$$

## Weak-limit infrastructure

The module proves native reusable lemmas showing that:

- strong convergence implies the project weak-convergence predicate;
- bounded complex-linear maps preserve weak convergence;
- weak Hilbert-space limits are unique;
- a weak limit of vectors drawn from a monotone filtration belongs to the
  physical right-limit intersection.

The last statement is formalized by

`WeilDefect.WDT19.weak_limit_mem_physical_rightLimit`.

No imported compactness premise is introduced: the proof reuses the
already-certified Hilbert subsequence compactness theorem from WD-T16.

## WD-C7 — endpoint representative blow-up

Assume

$$
y\notin \overline{T(\mathscr H_c)}.
$$

Let

$$
t_n\to c,
\qquad
h_n\in\mathscr H_{t_n},
\qquad
Th_n\to y.
$$

Lean proves

$$
\boxed{
\|h_n\|\to\infty.
}
$$

The contradiction mechanism is exactly the mathematical argument:

1. failure of norm divergence yields a frequently bounded subsequence;
2. WD-T16 extracts a weakly convergent subsubsequence;
3. monotonicity and right continuity put its weak limit in
   $\mathscr H_c$;
4. bounded linearity sends the weak limit to $Tx$;
5. strong convergence of the image gives the same weak limit $y$;
6. weak-limit uniqueness forces $Tx=y$, contradicting
   $y\notin\overline{T(\mathscr H_c)}$.

This is formalized by

`WeilDefect.WDT19.wd_t19_endpoint_representative_blowup`.

## WD-C8 — boundary amplification

Lean defines the explicit local amplification predicate

`WeilDefect.WDT19.BoundaryAmplifies`.

For every finite physical norm budget

$$
M>0,
$$

there are

$$
\delta>0,
\qquad
\eta>0
$$

such that

$$
c<t<c+\delta,
\qquad
h\in\mathscr H_t,
\qquad
\|Th-y\|<\eta
$$

imply

$$
\boxed{
M<\|h\|.
}
$$

Thus the boundary amplification is certified in the full local
two-parameter form, not merely along a preselected sequence.

The proof negates the local statement, chooses shrinking windows
$r_n=1/(n+1)$, constructs bounded representatives inside those windows,
and invokes WD-C7.

This is formalized by

`WeilDefect.WDT19.wd_t19_boundary_amplification`.

## WD-C9 — normalized blow-up

Suppose

$$
\|g_n\|=1,
\qquad
Tg_n=\varepsilon_n z_n,
\qquad
\varepsilon_n>0,
\qquad
\varepsilon_n\to0.
$$

Lean defines

$$
h_n
=
\varepsilon_n^{-1}g_n
$$

using the complex scalar embedding and proves

$$
\boxed{
Th_n=z_n,
}
$$

$$
\boxed{
\|h_n\|=\varepsilon_n^{-1},
}
$$

and therefore

$$
\boxed{
\|h_n\|\to\infty.
}
$$

This is formalized by

`WeilDefect.WDT19.wd_t19_vanishing_amplitude_normalized_blowup`.

## Imported-premise boundary

No external representative-blow-up, boundary-amplification, or inverse-cost
theorem is imported.

The proof uses:

- WD-T15 right-limit notation;
- WD-T16 native Hilbert weak-subsequence compactness;
- standard pinned mathlib facts on adjoints, filters, submodules,
  normalization, and Hilbert weak convergence.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The theorem statements compiled without weakening.

The initial compile exposed only implementation-level issues:

- adjoint application required explicit parenthesization;
- the C8 contradiction already returned the norm budget as a non-strict
  inequality;
- the shrinking-radius convergence needed a non-simplifying normalization;
- the squeeze theorem required explicit bounding functions;
- the atTop contradiction needed a strictly larger threshold;
- C9 required direct expansion of the local normalized representative rather
  than rewriting by the local function definition.

Repair pass 1 resolved these issues.

No right-continuity hypothesis, new-vector hypothesis, norm-divergence
conclusion, local amplification quantifier, or C9 reciprocal-growth identity
was weakened.

## CI evidence

Successful certificate run:

`36083158273`

Workflow run number:

`144`

Repository head checked:

`33f5a187baf7e195c19e179bb3b6b9befb7a0700`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Filtration.RepresentativeBlowup`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T20 / ZW1-T1 — CANONICAL CONJUGATE-PAIR DIAGONALIZATION INTO POSITIVE/NEGATIVE WEIL CHANNELS}
}
$$
