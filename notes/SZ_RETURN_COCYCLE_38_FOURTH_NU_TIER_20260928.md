# SZ-RETURN-COCYCLE-38 — Fourth Nu Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Primary verifier:

experiments/sz_return_cocycle_38_fourth_nu_tier_discover.py

Fast direct-orbit probe:

experiments/sz_return_cocycle_38_orbit_probe.py

Repository-side runs:

- direct-orbit probe 36506373356: SUCCESS;
- full topology certificate 36506465160: SUCCESS.

---

## 0. Result

The fourth nu-tier seam occurs at

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
3\nu.
~~~

At this seam every surviving N1 center from the third nu chamber has collapsed.

The generic seam atlas contains

~~~math
\boxed{
6277\text{ copies of }N_2/404108
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
3\nu
+
\delta,
\qquad
0<\delta<\nu.
~~~

A new graph species N3 appears.

Its full two-orientation size is

~~~math
\boxed{509886}.
~~~

The exact generic atlas is

~~~math
\boxed{
7920\times509886
+
6277\times404108
+
1643\times105768,
}
~~~

for exactly

~~~math
\boxed{15840}
~~~

generic open seed bands.

No invertibility claim for N3 / 509886 is made in this seam pass.

---

## 1. Tier-indexed fixed-body recurrence

The stabilized return body remains

~~~math
\boxed{
\mathcal U
=
\mathcal O_0
\sqcup
\mathcal T_{\nu,2},
\qquad
|\mathcal U|=52889.
}
~~~

The direct source orbit gives

~~~math
\boxed{
\mathcal N_3
=
\mathcal N_2
\sqcup
(3\nu+\mathcal U).
}
~~~

Thus the fourth nu tier contributes exactly one new translated copy of the same U-body.

Equivalently,

~~~math
\boxed{
\mathcal N_3
=
\mathcal N_2
\cup
(\nu+\mathcal N_2).
}
~~~

The new increment has exactly

~~~math
\boxed{52889}
~~~

sites per orientation.

Back-shifting that increment by (3\nu) recovers U exactly.

Therefore the tier-indexed recurrence has now been source-level verified through the copies

~~~math
\nu+\mathcal U,
\qquad
2\nu+\mathcal U,
\qquad
3\nu+\mathcal U.
~~~

No bulk extrapolation to the remaining nu tiers is made automatically.

---

## 2. N3 size and row census

Since

~~~math
|\mathcal N_2|=202054
~~~

and

~~~math
|\mathcal U|=52889,
~~~

we obtain

~~~math
|\mathcal N_3|
=
202054+52889
=
\boxed{254943}
~~~

per orientation.

Hence the full system has

~~~math
\boxed{
2\cdot254943
=
509886
}
~~~

variables.

The exact per-orientation row census is

~~~math
\boxed{
A:49394,
\qquad
B:49394,
\qquad
D:49395,
\qquad
T:106760.
}
~~~

Relative to N2 the increment is again

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

exactly the census of U.

---

## 3. Orientation equality

The representative N3 orbit satisfies

~~~math
\boxed{
\mathcal N_3^+
=
\mathcal N_3^-.
}
~~~

Each orientation has exactly

~~~math
254943
~~~

constant sites.

Thus the next invertibility pass admits reflection-sector reduction

~~~math
\boxed{
509886
\longrightarrow
254943+254943.
}
~~~

---

## 4. New-band graph uniqueness

The full topology verifier checks the canonical new band over

~~~math
0\le\zeta\le\delta\le\nu.
~~~

A representative from the new anchor family

~~~math
3\nu+\mathcal A_{O_0}
~~~

has exactly the same normalized source graph as the canonical band.

Therefore the

~~~math
\boxed{7920}
~~~

new bands form one N3 graph species.

---

## 5. Inherited species

The surviving N2 / 404108 centers are exact relabelings of the certified N2 graph, with the reflected orientation receiving the next nu translation.

The surviving O0 / 105768 centers are exact relabelings of the certified O0 graph, with the positive orientation receiving the next nu translation.

Both graph identities are checked by the full repository-side verifier.

Thus inherited N2 remains covered by SZ-RETURN-COCYCLE-37 and inherited O0 remains covered by SZ-RETURN-COCYCLE-31.

---

## 6. Quotient-eighteen arithmetic

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

At the next seam the surviving O0 width becomes

~~~math
\omega-4\nu
=
\boxed{
14\nu+\lambda.
}
~~~

Lambda is still not active.

---

## 7. Standing

The fourth nu chamber

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+3\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu
~~~

is classified into:

- N3 / 509886: new, invertibility open;
- N2 / 404108: certified;
- O0 / 105768: certified.

The chamber is not yet declared source-level closed solely because N3 remains uncertified.

---

## 8. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-38:}
}
~~~

~~~math
\boxed{
\texttt{FOURTH NU TIER TYPED /}
}
~~~

~~~math
\boxed{
\texttt{3NU+U RECURRENCE CERTIFIED /}
}
~~~

~~~math
\boxed{
\texttt{N3 / 509886 SPECIES EXTRACTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 9. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-39 / N3 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize N3 into two 254943 reflection sectors;
2. run independent non-assumptive sector certificates;
3. measure rather than hard-code the sharp inverse envelope;
4. close the fourth nu chamber if both sectors certify;
5. only then type the fifth nu-tier seam.

**Stop rule:** the tier-indexed U recurrence is now verified through (3\nu+U), but later nu tiers remain separate source-level obligations.
