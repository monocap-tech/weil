# LEAN WD-T04 certificate — 2026-09-23

Stable ID: **WD-T04 / WD-A4**

Result:

$$
\boxed{
\text{LEAN-CERTIFIED-FROM-IMPORTED-PREMISE}
}
$$

## Formal target

Module:

`WeilDefect.Screening.Taxonomy`

Source:

`WeilDefect/Screening/Taxonomy.lean`

Certified source blob:

`f86f72692fb4465827e4ec9f374a5a3c64f3d22a`

## Certified branches

Lean checks the complete reduced-factor morphology:

1. range defect: failure of range inclusion rules out exact screening;
2. over-budget defect: `1 < ‖X‖` produces a strictly negative graph direction;
3. strict screening: `‖X‖ < 1` gives the explicit uniform graph lower bound;
4. attained criticality: norm attainment produces a nonzero neutral graph vector;
5. non-attained criticality: every nonzero graph vector is positive while operator-norm approximation produces arbitrarily small positive defect.

The assembled declaration is:

`WeilDefect.WDT04.wd_t04_complete_reduced_taxonomy`.

## Imported-premise boundary

The implication from range defect to a physical negative direction uses the
explicit proposition-valued Douglas interface already isolated as

`WeilDefect.WDT02.DouglasUnitData`.

It is supplied as a theorem premise, not a project axiom.  Therefore the full
stable theorem is not reported as native LEAN-CERTIFIED.

The B/P/N/AN reduced-factor branches are internal Lean deductions and do not
consume Douglas once the reduced factor is fixed.

## CI evidence

GitHub Actions run:

`35965367830`

Repository head checked:

`fe4ab88bbed7e5a6b1091587569ccb7713522960`

The run passed:

- pinned dependency resolution;
- mathlib cache retrieval;
- `lake build WeilDefect.Screening.Taxonomy`;
- unfinished-proof/project-axiom rejection.

## Next cursor

$$
\boxed{
\texttt{WD-T05 / WD-A5 — RANK-ONE DEFECT SPECIALIZATION}
}
$$
