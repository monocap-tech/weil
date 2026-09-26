# Public Dependency Map

## H1-P5.3 — Proof DAG and source/interface boundary

This document is the public dependency view of Horizon 1.

It is a compressed rendering of the canonical
[Dependency Audit](DEPENDENCY_AUDIT.md). It does not add theorem edges,
weaken hypotheses, or turn open interfaces into premises.

---

## 1. Layered architecture

The public graph is organized into five layers.

~~~text
Layer A — Abstract operator/signature calculus
  WD-T01 ... WD-T06

Layer B — Selected/background transfer and support filtration
  WD-T07 ... WD-T19

Layer C — Zeta-Weil specialization and explicit-formula arithmetic
  WD-T20 ... WD-T36

Layer D — Composite morphology
  WD-T37, WD-T38, WD-T39

Layer E — Open actual-zeta interfaces
  AZ-NEXTJET-LOC
  C-ACTUAL-KPH-FLOOR
  AZ-FIN-WEIL-NULL-EXTENSION
~~~

Direct external-source entry points are shown explicitly. Downstream theorem
nodes inherit any transitive imported ancestry along the displayed theorem
edges. Examples and scope rules attach laterally and do not create
proof-producing edges.

---

## 2. Abstract screening spine

~~~text
WD-T01
  │
  ▼
WD-T02  ← EXT-1 Douglas
  ├────────► WD-T03 ─────► WD-T11
  ├────────► WD-T04
  └────────► WD-T05

WD-T06   (separate monotone-positive restoration branch)
~~~

Interpretation:

- WD-T01 identifies physical and coefficient sign geometry.
- WD-T02 converts nonnegativity into contractive screening.
- WD-T03–T05 are reduced-solution consequences.
- WD-T11 uses the graph/spectral form of WD-T03.
- WD-T06 describes what happens when positive channels are restored
  monotonically.

Sharpness attachments:

~~~text
WD-T04 ← WD-X02
WD-T06 ← WD-X01
~~~

---

## 3. Selected/background transfer spine

~~~text
WD-T07
  ├────────► WD-T08
  └────────► WD-T09

WD-T02 + WD-T09
        │
        ▼
      WD-T10
        │
        ▼
      WD-T12

WD-T13   (Schur/shorted covariance branch)
WD-T14   (finite positive-shadow branch)
~~~

The main custody rule is one-way:

~~~math
\boxed{
\text{selected negativity}
\Longrightarrow
\text{full negativity},
}
~~~

while aggregate negativity alone does not recover selected-sector ownership.

Sharpness attachments:

~~~text
WD-T09 ← WD-X03
WD-T13 ← WD-X04
~~~

---

## 4. Support-filtration spine

~~~text
WD-T15
  ├────────► WD-T16
  ├────────► WD-T17
  └────────► WD-T18

new endpoint vector
+ common bounded physical realization/right continuity
  │
  ▼
WD-T19
~~~

WD-T19 is not theorem-level downstream of WD-T16; a morphology application may
use WD-T16 to provide the required endpoint vector, but the boundary-amplification
theorem has its own hypotheses.

Sharpness attachments:

~~~text
WD-T16 ← WD-X05
WD-T17 ← WD-X05, WD-X06
~~~

---

## 5. Zeta-Weil zero-side spine

~~~text
WD-T20 ─────► WD-T21

EXT-2A Bombieri finite inertia ─────► WD-T22
EXT-2B Bombieri multiplicity/nullity ─► WD-T23

WD-T24 ─────► WD-T25

WD-T20 ─────► WD-T26 ─────► WD-T27

EXT-3 zero counting
       │
       ▼
     WD-T28 ─────► WD-T29
~~~

The selected residue chain is the bridge from pair geometry to arithmetic
far-field cancellation:

~~~math
\boxed{
\text{pair geometry}
\Longrightarrow
\mathbf 1^Tv=0
\Longrightarrow
R_v(z)=O(|z|^{-2}).
}
~~~

Sharpness attachment:

~~~text
WD-T27 ← WD-X07
~~~

---

## 6. Explicit-formula spine

~~~text
WD-T30
  selected-preserving finite multiplier tool

WD-T27 + EXT-3 zero counting + bounded multiplier
  │
  ▼
WD-T31

WD-T32
  weighted completed-Ξ near-field representation

WD-T33
  adaptive cocancellation guard

EXT-4 compact-window formula
  │
  ▼
WD-T34 ─────► WD-T35 ─────► WD-T36
                ▲
                │
        EXT-5 digamma asymptotic
~~~

WD-T31 and WD-T32 are complementary: the former controls the far field; the
latter identifies the finite/intermediate field that remains.

---

## 7. Negative morphology

The generic fixed-packet negative chain is:

~~~text
WD-T16  fixed selected negative persistence
  │
  ▼
WD-T07  selected-to-full sign transfer
  │
  ▼
WD-T26 ─► WD-T27
             │
             ▼
           WD-T31
             │
             ▼
           WD-T32
             │
             ▼
           WD-T33
             │
             ▼
           WD-T37
             │
             ▼
     AZ-NEXTJET-LOC   [OPEN]
~~~

WD-T30 may supply a selected-preserving multiplier where its two-mode
hypotheses apply; it is not a premise of the far-tail estimate itself.

A stronger special-packet route is tracked separately:

~~~text
WD-T37
  │
  └────► C-ACTUAL-KPH-FLOOR   [OPEN stronger refinement]
~~~

Neither open interface is a premise of WD-T37; both occur strictly downstream
of the completed morphology theorem.

---

## 8. Neutral morphology

~~~text
WD-T17
+ attained finite-exception unit-gain / physical-realization hypotheses
  │
  ▼
physical compact-window null mode
  │
  ├──── WD-T34
  │       │
  │       ▼
  └──── WD-T35 ─────► WD-T36
          │
          ▼
        WD-T38
          │
          ▼
AZ-FIN-WEIL-NULL-EXTENSION   [OPEN]
~~~

No later support-rigidity or unique-continuation theorem is consumed above
the stop line.

---

## 9. Noncompact morphology

WD-T39 classifies compactness failure rather than introducing a new
actual-zeta interface.

~~~text
moving selected-sector analysis:
  WD-T15, WD-T16, WD-T17
  + WD-X05 sharpness witness

unselected-background analysis:
  WD-T07 + WD-T14
  + fixed selected-ray hypotheses where invoked
        │
        ▼
      WD-T39
~~~

The key separation is between two different custody failures:

~~~math
\boxed{
\text{moving selected-sector escape}
\neq
\text{unselected-background escape}.
}
~~~

The first can prevent a nonzero selected limit from forming. The second is
analyzed after a fixed selected negative ray has already been anchored; in that
regime it may destroy strong full-coefficient compactness but does not erase
the selected ray.

---

## 10. Imported-source entry points

| External pin | Direct theorem consumers | Public role |
| --- | --- | --- |
| EXT-1 — Douglas factorization | WD-T02 | Screening factorization and reduced solution |
| EXT-2A — Bombieri finite inertia | WD-T22 | Finite Weil negative-index count |
| EXT-2B — Bombieri multiplicity/nullity | WD-T23 | Quotienting repeated-ordinate null directions |
| EXT-3 — Unit-height zeta zero count | WD-T28, WD-T31 | Native compactness and far-shell summation |
| EXT-4 — Compact-window formula | WD-T34, WD-T35; arithmetic input to WD-T38 | Finite prime translations and compact-window form |
| EXT-5 — Digamma asymptotic | WD-T35 | Logarithmic principal order |

Transitive source dependence is inherited through theorem edges. Calling a
proof body internal describes where the deduction is carried out; it does not
erase an imported premise in the theorem's ancestry.

---

## 11. Scope guards

The following are lateral guards, not theorem-producing edges.

~~~text
WD-S01  metric transfer guard
WD-S02  explicit-formula double-counting guard
WD-S03  global-neutrality / termwise-vanishing guard
WD-S04  next-jet lower-bound guard
WD-S05  background-custody guard
~~~

---

## 12. Acyclicity and stop boundary

The Horizon-1 proof graph is acyclic.

The primary exits are strictly downstream:

~~~text
WD-T37 ─────► AZ-NEXTJET-LOC
WD-T38 ─────► AZ-FIN-WEIL-NULL-EXTENSION
~~~

and the stronger packetwise refinement

~~~text
WD-T37 ─────► C-ACTUAL-KPH-FLOOR
~~~

is also downstream only. No open interface is a premise of the morphology
theorem from which its arrow originates.
