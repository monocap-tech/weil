# LEAN WD-T13 certificate — 2026-09-24

Stable ID: **WD-T13 / WD-B7**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Formal target

Module:

`WeilDefect.Screening.ShortedCovariance`

Source:

`WeilDefect/Screening/ShortedCovariance.lean`

Certified source blob:

`a0c3ee14272f34dff041601b5abdfaeca7841e8b`

## Corrected audited hypothesis

The certificate uses the corrected Horizon-1 hypothesis, not the earlier
ambiguous phrase “strictly positive.”

For the self-adjoint block operator

$$
K=
\begin{pmatrix}
A&B\\
B^*&C
\end{pmatrix}
$$

on the Hilbert direct sum $W\oplus V$, Lean assumes the explicit uniform
quadratic lower bound

$$
m(\|w\|^2+\|v\|^2)
\le
\operatorname{Re}\left(
\langle Aw+Bv,w\rangle+
\langle B^*w+Cv,v\rangle
\right)
$$

for every $w,v$, with $m>0$, together with the self-adjoint block
hypotheses.

This is the formal version of

$$
K\succeq mI.
$$

The product Hilbert norm is written explicitly as
$\|w\|^2+\|v\|^2$; Lean's generic product Banach norm is not substituted.

## Complementary block

By setting $w=0$, Lean derives

$$
m\|v\|^2
\le
\operatorname{Re}\langle Cv,v\rangle.
$$

Using mathlib's bounded-operator coercivity criterion, Lean then proves
`IsUnit C` in the continuous-linear endomorphism algebra. Thus bounded
invertibility of the complementary block is derived from uniform positivity;
it is not assumed as an auxiliary premise.

The canonical inverse is represented by

`Ring.inverse C`.

Lean verifies both inverse identities and proves that $C^{-1}$ is
nonnegative in the Loewner order.

## Schur-shortened covariance

The formal Schur correction is

$$
BC^{-1}B^*,
$$

and the shortened covariance is

$$
H_W=A-BC^{-1}B^*.
$$

Lean proves that the correction is positive and therefore

$$
\boxed{H_W\preceq A}.
$$

It further performs the minimizing-complement calculation with

$$
z=C^{-1}B^*w
$$

and obtains

$$
m\|w\|^2
\le
\operatorname{Re}\langle H_Ww,w\rangle.
$$

Hence $H_W$ is itself a unit, again derived natively from the same
uniform lower bound.

## Inverse-compression identity

Rather than introducing a second bespoke block-matrix representation, the
formal certificate encodes

$$
P_WK^{-1}|_W=H_W^{-1}
$$

through the equivalent block-solution characterization.

For every $w$, Lean constructs $x\in W$ and $y\in V$ satisfying

$$
Ax+By=w,
\qquad
B^*x+Cy=0,
$$

with

$$
x=H_W^{-1}w.
$$

Conversely, Lean proves that **any** solution of those two block equations has
first component

$$
x=H_W^{-1}w.
$$

Thus the first coordinate of the inverse block problem is exactly the inverse
Schur complement.

## Formal declarations

The certificate includes:

- `WeilDefect.WDT13.BlockUniformlyPositive`;
- `WeilDefect.WDT13.operatorInverse`;
- `WeilDefect.WDT13.schurCorrection`;
- `WeilDefect.WDT13.schurShort`;
- `WeilDefect.WDT13.wd_t13_complement_lower_bound`;
- `WeilDefect.WDT13.wd_t13_complement_isUnit`;
- `WeilDefect.WDT13.wd_t13_complement_inverse_nonnegative`;
- `WeilDefect.WDT13.wd_t13_schur_correction_positive`;
- `WeilDefect.WDT13.wd_t13_schur_le_compression`;
- `WeilDefect.WDT13.wd_t13_schur_lower_bound`;
- `WeilDefect.WDT13.wd_t13_schur_isUnit`;
- `WeilDefect.WDT13.wd_t13_block_solution_exists`;
- `WeilDefect.WDT13.wd_t13_block_solution_first_component`;
- `WeilDefect.WDT13.wd_t13_direct_compression_versus_shorted_covariance`.

## Imported-premise boundary

No imported project theorem premise is consumed by WD-T13.

The coercivity-to-unit step, positivity of the inverse, and the operator-order
facts are ordinary pinned mathlib results checked by the Lean kernel.
The certificate does not assume an inverse for $C$, an inverse for
$H_W$, a Douglas interface, or an Anderson–Trapp theorem.

Therefore the correct status is native:

$$
\boxed{
\text{LEAN-CERTIFIED}
}
$$

## Repair-pass result

The first direct build exposed only additive normal-form mismatches
(`a + -b` versus `a - b`, and one `+ 0` orientation) after the initial
vector-equation tactic was corrected.

No theorem statement or mathematical hypothesis was weakened. In particular,
the corrected uniformly positive hypothesis $K\succeq mI$ was preserved
through certification.

## CI evidence

Successful certificate run:

`36059475701`

Workflow run number:

`110`

Repository head checked:

`b2af38e06332be4d68a57a159fdf4ca547e372cd`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.ShortedCovariance`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T14 / WD-B8 — FINITE POSITIVE SHADOWS PRESERVE SIGNATURE BUT NOT ADMISSIBILITY}
}
$$
