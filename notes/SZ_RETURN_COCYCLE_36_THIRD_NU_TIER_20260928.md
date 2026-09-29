# SZ-RETURN-COCYCLE-36 — Third Nu Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Primary verifier:

experiments/sz_return_cocycle_36_third_nu_tier_discover.py

Supporting recovery probes:

- experiments/sz_return_cocycle_36_overlap_probe.py
- experiments/sz_return_cocycle_36_orbit_probe.py

Authoritative repository-side ratification:

GitHub Actions run 36502958190, conclusion SUCCESS.

Recovery provenance:

- run 36502313535: FAILED, correctly falsifying the naive disjoint recurrence
  `N2 = N1 disjoint-union (nu+U)`;
- run 36502733050: SUCCESS, proving `nu+U` is already wholly contained in N1;
- run 36502836487: SUCCESS, direct-orbit recovery of the correct third-tier species;
- run 36502958190: SUCCESS, full corrected topology and relabeling certificate.

---

## 0. Result

The third nu-tier seam occurs at

~~~math
e
=
5\kappa
+
2\chi
+
\rho
+
\sigma
+
4\tau
+
\omega
+
2\nu.
~~~

At this seam every surviving N0 center from the second nu chamber has collapsed.

The generic seam atlas contains

~~~math
\boxed{
4634\text{ copies of }N_1/298330
}
~~~

and

~~~math
\boxed{
1643\text{ copies of }O_0/105768.
}
~~~

Immediately above the seam, write

~~~math
e
=
5\kappa
+
2\chi
+
\rho
+
\sigma
+
4\tau
+
\omega
+
2\nu
+
\delta,
\qquad
0<\delta<\nu.
~~~

A new graph species N2 appears.

Its full two-orientation size is

~~~math
\boxed{404108}.
~~~

The exact generic atlas is

~~~math
\boxed{
6277\times404108
+
4634\times298330
+
1643\times105768,
}
~~~

for exactly

~~~math
\boxed{12554}
~~~

generic open seed bands.

No invertibility claim for N2 / 404108 is made in this seam pass.

---

## 1. The failed stabilization guess

SZ-RETURN-COCYCLE-34 found the second-tier return body

~~~math
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2},
\qquad
|\mathcal U|=52889,
~~~

and

~~~math
\mathcal N_1
=
\mathcal N_0
\sqcup
(\nu+\mathcal U).
~~~

The first third-tier guess was therefore

~~~math
\mathcal N_2
\stackrel{?}{=}
\mathcal N_1
\sqcup
(\nu+\mathcal U).
~~~

This is false.

The fast overlap certificate gives

~~~math
\boxed{
\nu+\mathcal U
\subset
\mathcal N_1
}
~~~

with the full overlap size

~~~math
\boxed{52889}.
~~~

Thus a second copy placed again at `nu+U` contributes no new sites.

This failure is retained as provenance because it distinguishes a genuinely stabilized module from an incorrectly indexed recurrence.

---

## 2. Correct fixed-module recurrence

The direct source orbit gives

~~~math
\boxed{
\mathcal N_2
=
\mathcal N_1
\sqcup
(2\nu+\mathcal U).
}
~~~

The new increment has exactly

~~~math
\boxed{52889}
~~~

sites per orientation.

Back-shifting the increment by `2 nu` recovers exactly

~~~math
\boxed{
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2}.
}
~~~

Hence the return body itself has stabilized.

Equivalently,

~~~math
\boxed{
\mathcal N_2
=
\mathcal N_1
\cup
(\nu+\mathcal N_1).
}
~~~

The correct interpretation is therefore not repeated insertion at one fixed absolute location. The stable body is inserted at tier-indexed translates

~~~math
j\nu+\mathcal U.
~~~

The first two observed copies are

~~~math
\nu+\mathcal U,
\qquad
2\nu+\mathcal U.
~~~

No extrapolation through the remaining quotient-eighteen run is made automatically.

---

## 3. N2 size and row census

Since

~~~math
|\mathcal N_1|=149165
~~~

and the new translated copy contributes

~~~math
|\mathcal U|=52889,
~~~

we obtain

~~~math
|\mathcal N_2|
=
149165+52889
=
\boxed{202054}
~~~

per orientation.

Therefore the full system has

~~~math
\boxed{
2\cdot202054
=
404108
}
~~~

variables.

The exact per-orientation source-row census is

~~~math
\boxed{
A:39147,
\qquad
B:39147,
\qquad
D:39148,
\qquad
T:84612.
}
~~~

Relative to N1, the increment is again exactly

~~~math
\boxed{
A:10247,
\quad
B:10247,
\quad
D:10247,
\quad
T:22148,
}
~~~

which is the census of U.

---

## 4. Orientation equality

The representative N2 source orbit satisfies

~~~math
\boxed{
\mathcal N_2^+
=
\mathcal N_2^-.
}
~~~

Each orientation contains exactly

~~~math
202054
~~~

constant sites.

Thus the eventual N2 invertibility pass again admits reflection-sector reduction

~~~math
\boxed{
404108
\longrightarrow
202054+202054.
}
~~~

This pass stops before that certificate.

---

## 5. New-band graph uniqueness

The canonical third-tier band is certified over

~~~math
0\le\zeta\le\delta\le\nu.
~~~

A representative from the newly shifted O0-anchor family

~~~math
2\nu+\mathcal A_{O_0}
~~~

has exactly the same normalized source graph as the canonical band.

Together with the established translations inside the inherited N1 anchor family, this identifies one N2 graph species across all

~~~math
\boxed{6277}
~~~

new bands.

---

## 6. Inherited N1 species

The surviving N1 / 298330 centers are exact relabelings of the certified N1 graph.

Relative to SZ-RETURN-COCYCLE-34, the reflected orientation receives the additional nu translation.

The full corrected verifier checks the graph equality.

Thus every inherited N1 center remains certified by SZ-RETURN-COCYCLE-35.

---

## 7. Inherited O0 species

The surviving O0 / 105768 centers are exact relabelings of the certified O0 graph.

Relative to the second nu chamber, the positive orientation receives the additional nu translation.

The full corrected verifier checks the graph equality.

Thus every inherited O0 center remains certified by SZ-RETURN-COCYCLE-31.

---

## 8. Quotient-eighteen arithmetic

The Euclidean relation remains

~~~math
\boxed{
\omega
=
18\nu
+
\lambda,
\qquad
0<\lambda<\nu.
}
~~~

At the next seam the surviving O0 width is

~~~math
\omega-3\nu
=
\boxed{
15\nu+\lambda.
}
~~~

Lambda is therefore still not active.

---

## 9. Standing

The third nu chamber

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+2\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
~~~

is classified into:

- N2 / 404108: new, invertibility open;
- N1 / 298330: certified;
- O0 / 105768: certified.

The chamber is not yet declared source-level closed solely because N2 remains uncertified.

The fixed return body U has now repeated exactly at the next tier, with the necessary tier-indexed translation.

---

## 10. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-36:}
}
~~~

~~~math
\boxed{
\texttt{THIRD NU TIER TYPED /}
}
~~~

~~~math
\boxed{
\texttt{NAIVE ONE-SHIFT RECURRENCE FALSIFIED /}
}
~~~

~~~math
\boxed{
\texttt{TIER-INDEXED U-BODY STABILIZATION CERTIFIED /}
}
~~~

~~~math
\boxed{
\texttt{N2 / 404108 SPECIES EXTRACTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 11. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-37 /}
}
~~~

~~~math
\boxed{
\texttt{N2 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize N2 into two 202054 reflection sectors;
2. use independent parallel sector jobs;
3. retain non-assumptive measurement of the sharp inverse envelope;
4. close the third nu chamber if both sectors certify;
5. only then type the fourth nu-tier seam.

**Stop rule:** the repeated U-body is now demonstrated for the second translated copy, but no bulk jump through the remaining quotient-eighteen nu ladder is permitted without source-level confirmation of subsequent tiers.
