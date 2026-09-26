# LEAN WD-T16 certificate — 2026-09-24

Stable ID: **WD-T16 / WD-C3 + WD-C5**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Filtration.FiniteNegativeSector`

Source:

`WeilDefect/Filtration/FiniteNegativeSector.lean`

Certified source blob:

`f7f2a50f8183ba1a617ce1cf97855461bbbbda5f`

## Fixed finite negative sector

The certificate works on the Hilbert direct sum

$$
K_+\oplus M
$$

represented by the actual $L^2$-product
`WithLp 2 (Kpos × M)`, with $M$ finite-dimensional.

The Krein signature is encoded as

$$
J(a,u)=\|a\|^2-\|u\|^2.
$$

For unit-normalized vectors,

$$
\|(a_n,u_n)\|=1,
$$

Lean derives the exact coordinate identity

$$
\|a_n\|^2+\|u_n\|^2=1.
$$

## Native weak subsequence extraction

A reusable internal theorem proves that every norm-bounded sequence in an
arbitrary complex Hilbert space admits a weakly convergent subsequence.

No global separability hypothesis is added.

The proof localizes the sequence to the closed span of its countable range.
That closed Hilbert subspace is separable. Lean then:

1. maps it to the weak dual via the Fréchet–Riesz isometry;
2. applies mathlib's sequential Banach–Alaoglu theorem on the separable
   closed span;
3. pulls the weak-* limit back through Riesz;
4. lifts weak convergence from the closed span to the ambient Hilbert space
   by orthogonal projection.

The formal declaration is

`WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le`.

This avoids assuming Eberlein–Šmulian or a project-level reflexivity premise.

## Finite-dimensional negative coordinate

For the fixed finite-dimensional sector $M$, Lean uses compactness of
closed balls to extract a norm-convergent subsequence

$$
u_{\phi(n)}\to u.
$$

After a further subsequence, the positive coordinates satisfy

$$
a_{\phi(n)}\rightharpoonup a.
$$

The assembled coefficient vectors converge weakly and the limit lies in the
right-limit analysis space

$$
\boxed{
(a,u)\in A_{c+}.
}
$$

This is certified by

`WeilDefect.WDT16.wd_t16_fixed_negative_sector_compactness`.

Right-limit membership is proved through orthogonality against the limiting
gap relations, using WD-T15's right-limit object.

## WD-C3 — nonpositive signature limit

Suppose additionally

$$
J(a_n,u_n)\to q_*,
\qquad
q_*\le0.
$$

Lean proves the coordinate limits

$$
\|a_n\|^2\to\frac{1+q_*}{2},
\qquad
\|u_n\|^2\to\frac{1-q_*}{2}.
$$

A native weak lower-semicontinuity lemma for squared Hilbert norms gives

$$
\|a\|^2
\le
\frac{1+q_*}{2},
$$

while strong convergence in $M$ gives

$$
\|u\|^2
=
\frac{1-q_*}{2}.
$$

Hence

$$
\boxed{
J(a,u)\le q_*.
}
$$

Because $q_*\le0$,

$$
\|u\|^2
=
\frac{1-q_*}{2}
\ge
\frac12,
$$

so the right-limit vector is nonzero.

Thus Lean certifies

$$
\boxed{
q_n\to q_*\le0
\Longrightarrow
\exists,0\ne y\in A_{c+},
\quad
J(y)\le q_*.
}
$$

The formal declaration is

`WeilDefect.WDT16.wd_t16_nonpositive_limit_persists`.

## WD-C5 — uniform negative margins

If instead a fixed margin $\kappa>0$ satisfies

$$
J(a_n,u_n)\le-\kappa
$$

for every $n$, Lean proves that some nonzero right-limit vector satisfies

$$
\boxed{
0\ne y\in A_{c+},
\qquad
J(y)\le-\kappa.
}
$$

This is

`WeilDefect.WDT16.wd_t16_uniform_negative_margin_persists`.

If the endpoint space $A_c$ is $J$-nonnegative, Lean further proves

$$
\boxed{
y\in A_{c+}\setminus A_c.
}
$$

This is

`WeilDefect.WDT16.wd_t16_uniform_negative_margin_forces_endpoint_jump`.

## Formal declarations

The certificate includes:

- `WeilDefect.WDT16.CoeffSpace`;
- `WeilDefect.WDT16.coeff`;
- `WeilDefect.WDT16.jValue`;
- `WeilDefect.WDT16.WeaklyTendsto`;
- `WeilDefect.WDT16.exists_weaklyTendsto_subseq_of_norm_le`;
- `WeilDefect.WDT16.weaklyTendsto_norm_le`;
- `WeilDefect.WDT16.weaklyTendsto_norm_sq_le`;
- `WeilDefect.WDT16.weaklyTendsto_norm_sq_le_of_tendsto`;
- `WeilDefect.WDT16.exists_tendsto_subseq_finiteDimensional`;
- `WeilDefect.WDT16.weaklyTendsto_coeff`;
- `WeilDefect.WDT16.weak_limit_mem_rightLimit`;
- `WeilDefect.WDT16.wd_t16_fixed_negative_sector_compactness`;
- `WeilDefect.WDT16.wd_t16_nonpositive_limit_persists`;
- `WeilDefect.WDT16.wd_t16_uniform_negative_margin_persists`;
- `WeilDefect.WDT16.wd_t16_uniform_negative_margin_forces_endpoint_jump`;
- `WeilDefect.WDT16.wd_t16_fixed_finite_negative_sector_persistence`.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T16.

The compactness path uses ordinary pinned mathlib results:

- Fréchet–Riesz representation;
- sequential Banach–Alaoglu on a separable closed span;
- finite-dimensional compactness of closed balls;
- Hilbert orthogonal projection;
- standard topology and order-limit facts.

No project axiom, Douglas interface, or external weak-compactness premise is
introduced.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The proof-engineering repairs were confined to API normalization:

- pinned weak-dual compactness argument ordering;
- explicit Riesz / weak-dual evaluation normalization;
- one weak-* evaluation bridge;
- explicit order direction in weak lower semicontinuity;
- typed scalar constants in the signature-limit formulas.

The final audited WD-C3 conclusion was added before promotion rather than
certifying only the compactness core.

No mathematical hypothesis was weakened.

## CI evidence

Successful certificate run:

`36078296999`

Workflow run number:

`129`

Repository head checked:

`6c8bd4b57eb18c583d426c767beca21f06307f69`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Filtration.FiniteNegativeSector`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T17 / WD-C4 — FIXED-SECTOR CRITICAL DICHOTOMY}
}
$$
