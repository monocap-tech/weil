# LEAN WD-T17 certificate — 2026-09-24

Stable ID: **WD-T17 / WD-C4**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Filtration.CriticalDichotomy`

Source:

`WeilDefect/Filtration/CriticalDichotomy.lean`

Certified source blob:

`7102a25b28f7a8cf72e805f845bad23daf535aa2`

## Critical fixed-sector regime

The certificate assumes the WD-T16 fixed finite negative-sector setting, with
unit-normalized coefficient vectors

$$
y_n=(a_n,u_n)
$$

and critical signatures

$$
J(y_n)=\|a_n\|^2-\|u_n\|^2\to0.
$$

Using

$$
\|a_n\|^2+\|u_n\|^2=1,
$$

Lean proves

$$
\|a_n\|^2\to\frac12,
\qquad
\|u_n\|^2\to\frac12.
$$

WD-T16 compactness supplies a subsequence, written again as $y_n$, with

$$
a_n\rightharpoonup a,
\qquad
u_n\to u,
\qquad
y=(a,u)\in A_{c+}.
$$

The negative coordinate satisfies

$$
\|u\|^2=\frac12,
$$

so the limit vector is nonzero.

## Weak plus norm convergence implies strong convergence

The module proves the reusable Hilbert-space lemma

`WeilDefect.WDT17.weaklyTendsto_strong_of_norm_sq_tendsto`.

If

$$
v_n\rightharpoonup v
$$

and

$$
\|v_n\|^2\to\|v\|^2,
$$

then

$$
v_n\to v
$$

in norm.

The proof is kernel-transparent: it expands

$$
\|v_n-v\|^2
=
\|v_n\|^2
-2\operatorname{Re}\langle v_n,v\rangle
+\|v\|^2
$$

and sends each term to its limit.

## WD-C4 — exact dichotomy

Lean defines two explicit branches.

### N — neutral compact attainment

If

$$
\|a\|^2=\frac12,
$$

then the already-proved negative-coordinate identity gives

$$
J(a,u)=0.
$$

Since the approximating positive norms also converge to $1/2$, weak
convergence upgrades to

$$
a_n\to a
$$

strongly. Together with $u_n\to u$, Lean proves

$$
y_n\to y
$$

strongly in the $L^2$ coefficient Hilbert space.

This branch is encoded by

`WeilDefect.WDT17.NeutralCriticalBranch`.

### L — positive-mass loss

If

$$
\|a\|^2<\frac12,
$$

then

$$
J(a,u)
=
\|a\|^2-\frac12
<0.
$$

Thus an approximately neutral sequence falls through to a strictly negative
right-persistent limit whenever positive mass is lost weakly.

This branch is encoded by

`WeilDefect.WDT17.NegativeFallthroughBranch`.

## Exhaustive and mutually exclusive

The assembled theorem

`WeilDefect.WDT17.wd_t17_fixed_sector_critical_dichotomy`

returns a concrete compactness subsequence and nonzero right-limit vector and
proves

$$
\boxed{
N\ \lor\ L
}
$$

together with

$$
\boxed{
\neg(N\ \land\ L).
}
$$

Hence exactly one branch occurs.

Supporting declarations include:

- `WeilDefect.WDT17.weaklyTendsto_strong_of_norm_sq_tendsto`;
- `WeilDefect.WDT17.NeutralCriticalBranch`;
- `WeilDefect.WDT17.NegativeFallthroughBranch`;
- `WeilDefect.WDT17.wd_t17_critical_positive_mass_le_half`;
- `WeilDefect.WDT17.wd_t17_fixed_sector_critical_dichotomy`;
- `WeilDefect.WDT17.wd_t17_neutral_branch`;
- `WeilDefect.WDT17.wd_t17_loss_branch`.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T17.

The proof reuses native WD-T16 compactness and ordinary pinned mathlib
Hilbert-space/topological facts. No external critical-dichotomy premise is
introduced.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The mathematical branch structure compiled without revision.

Repair work was confined to:

- real/complex normalization of the Hilbert norm-square identity;
- orientation of eventual equalities used in critical coordinate limits;
- expansion of the norm-square difference formula;
- the `WithLp` product convergence coercion.

No theorem statement, branch condition, or compactness hypothesis was
weakened.

## CI evidence

Successful certificate run:

`36081480092`

Workflow run number:

`136`

Repository head checked:

`ed92f76a62c26ab48f35f7637c07bdf9568dccab`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Filtration.CriticalDichotomy`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T18 / WD-C6 — ENDPOINT-JUMP QUOTIENT BOUNDS NEW RIGHT-LIMIT NEGATIVE INDEX}
}
$$
