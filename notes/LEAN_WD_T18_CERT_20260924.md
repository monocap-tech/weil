# LEAN WD-T18 certificate — 2026-09-24

Stable ID: **WD-T18 / WD-C6**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Filtration.EndpointJump`

Source:

`WeilDefect/Filtration/EndpointJump.lean`

Certified source blob:

`d7743465cac328c8aa6236fb12942117b8e67a7e`

## Endpoint-jump quotient

Let

$$
A_0 \subseteq A_+
$$

be closed complex Hilbert subspaces, with (A_0) the endpoint space and
(A_+) the right-limit space.

Lean defines the endpoint space internally in (A_+) by

`WeilDefect.WDT18.endpointInside`

and the algebraic jump quotient

$$
\boxed{
A_+/A_0
}
$$

by

`WeilDefect.WDT18.EndpointQuotient`.

The formal definition uses the canonical comap of (A_0) along the subtype
(A_+\hookrightarrow H). Under the standing inclusion (A_0\le A_+), this
is exactly the endpoint subspace inside the right-limit carrier.

## WD-C6 — quotient injectivity

Let

$$
q:H\to\mathbb R
$$

be any quadratic/signature functional for which the endpoint is nonnegative:

$$
y\in A_0
\quad\Longrightarrow\quad
q(y)\ge0.
$$

Suppose a finite-dimensional witness

$$
T:\mathbb C^k\to H
$$

takes values in (A_+) and is strictly negative on the unit sphere:

$$
\|x\|=1
\quad\Longrightarrow\quad
q(Tx)<0.
$$

Lean constructs the induced quotient map

`WeilDefect.WDT18.endpointQuotientMap`

and proves

$$
\boxed{
\mathbb C^k\longrightarrow A_+/A_0
\text{ is injective.}
}
$$

The proof is direct. If a nonzero witness direction vanished in the quotient,
normalize it to a unit vector. Quotient-kernel membership puts its image in
the endpoint space, where nonnegativity contradicts strict negativity.

This is formalized by

`WeilDefect.WDT18.wd_t18_endpoint_quotient_map_injective`.

## Finite negative-index bound

When the endpoint quotient is finite-dimensional, Lean proves

$$
\boxed{
k\le
\operatorname{finrank}_{\mathbb C}(A_+/A_0)
}
$$

for every (k)-dimensional strictly negative witness in (A_+).

Thus the complete set of finite negative ranks in the new right-limit carrier
is bounded by the endpoint-jump dimension.

This is formalized by

`WeilDefect.WDT18.wd_t18_endpoint_jump_negative_rank_le_quotient`.

Consequently, if

$$
\dim_{\mathbb C}(A_+/A_0)=1,
$$

then every finite negative witness satisfies

$$
\boxed{k\le1.}
$$

This is formalized by

`WeilDefect.WDT18.wd_t18_one_dimensional_jump_rank_cap`.

## Relation to the Hilbert jump representative

The mathematical WD-C6 statement also identifies

$$
A_+/A_0
$$

with the Hilbert jump representative

$$
\mathcal J_c=A_+\ominus A_0.
$$

WD-T18 certifies the quotient form, which is the dimension statement needed
for endpoint-index control. No separate orthogonal-representative theorem is
required for the certified finite-rank bound.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T18.

The proof uses the project-local `HasNegativeRank` definition from WD-T01 and
ordinary pinned mathlib facts about submodule quotients, kernels,
normalization, injective linear maps, and finite-dimensional rank.

No external endpoint-jump/index theorem is introduced.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The mathematical statement compiled without weakening.

The first compile exposed only implementation-level issues:

- the quotient constructions depend on noncomputable complex normed-field
  structure and therefore require explicit `noncomputable` declarations;
- Lean distinguished the continuous and underlying linear codomain
  restrictions during quotient-kernel simplification.

Repair pass 1 resolved these by making noncomputability explicit and carrying
the kernel argument through the underlying linear `codRestrict`.

No endpoint hypothesis, negativity condition, quotient dimension bound, or
conclusion was weakened.

## CI evidence

Successful certificate run:

`36082262379`

Workflow run number:

`140`

Repository head checked:

`f02683ec35aa1d61ee056512f2a9977e081a7990`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Filtration.EndpointJump`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T19 / WD-C7+WD-C8+WD-C9 — NEW ENDPOINT VECTORS FORCE BOUNDARY AMPLIFICATION / REPRESENTATIVE BLOW-UP}
}
$$
