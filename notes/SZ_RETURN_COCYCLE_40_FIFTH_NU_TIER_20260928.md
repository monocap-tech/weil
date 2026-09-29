# SZ-RETURN-COCYCLE-40 — Fifth Nu Tier Seam

**Date:** 2026-09-28  
**Branch:** research/sz-return-cocycle-0  
**Standing:** PARALLEL RECONNAISSANCE / EXACT SOURCE-LEVEL SEAM TYPING  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains SZ-CROSS-COLLAR-3.

Primary verifier:

experiments/sz_return_cocycle_40_fifth_nu_tier_discover.py

Fast direct-orbit probe:

experiments/sz_return_cocycle_40_orbit_probe.py

Repository-side runs:

- direct-orbit probe 36519710278: SUCCESS;
- full topology certificate 36519795355: SUCCESS.

---

## 0. Result

The fifth nu-tier seam occurs at

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
4\nu.
~~~

At this seam every surviving N2 center from the fourth nu chamber has collapsed.

The generic seam atlas contains

~~~math
\boxed{
7920\text{ copies of }N_3/509886
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
4\nu
+
\delta,
\qquad
0<\delta<\nu.
~~~

A new graph species N4 appears.

Its full two-orientation size is

~~~math
\boxed{615664}.
~~~

The exact generic atlas is

~~~math
\boxed{
9563\times615664
+
7920\times509886
+
1643\times105768,
}
~~~

for exactly

~~~math
\boxed{19126}
~~~

generic open seed bands.

No invertibility claim for N4 / 615664 is made in this seam pass.

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
\mathcal N_4
=
\mathcal N_3
\sqcup
(4\nu+\mathcal U).
}
~~~

Equivalently,

~~~math
\boxed{
\mathcal N_4
=
\mathcal N_3
\cup
(\nu+\mathcal N_3).
}
~~~

The new increment has exactly

~~~math
\boxed{52889}
~~~

sites per orientation.

Back-shifting that increment by (4\nu) recovers U exactly.

Thus the tier-indexed recurrence has now been source-level verified through

~~~math
\nu+\mathcal U,
\qquad
2\nu+\mathcal U,
\qquad
3\nu+\mathcal U,
\qquad
4\nu+\mathcal U.
~~~

No bulk extrapolation to the remaining nu tiers is made automatically.

---

## 2. N4 size and row census

Since

~~~math
|\mathcal N_3|=254943
~~~

and

~~~math
|\mathcal U|=52889,
~~~

we obtain

~~~math
|\mathcal N_4|
=
254943+52889
=
\boxed{307832}
~~~

per orientation.

Hence the full system has

~~~math
\boxed{
2\cdot307832
=
615664
}
~~~

variables.

The exact per-orientation row census is

~~~math
\boxed{
A:59641,
\qquad
B:59641,
\qquad
D:59642,
\qquad
T:128908.
}
~~~

Relative to N3 the increment is again

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

The representative N4 orbit satisfies

~~~math
\boxed{
\mathcal N_4^+
=
\mathcal N_4^-.
}
~~~

Each orientation has exactly

~~~math
307832
~~~

constant sites.

Thus the next invertibility pass admits reflection-sector reduction

~~~math
\boxed{
615664
\longrightarrow
307832+307832.
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
4\nu+\mathcal A_{O_0}
~~~

has exactly the same normalized source graph as the canonical band.

Therefore the

~~~math
\boxed{9563}
~~~

new bands form one N4 graph species.

---

## 5. Inherited species

The surviving N3 / 509886 centers are exact relabelings of the certified N3 graph, with the reflected orientation receiving the next nu translation.

The surviving O0 / 105768 centers are exact relabelings of the certified O0 graph, with the positive orientation receiving the next nu translation.

Both graph identities are checked by the full repository-side verifier.

Thus inherited N3 remains covered by SZ-RETURN-COCYCLE-39 and inherited O0 remains covered by SZ-RETURN-COCYCLE-31.

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
\omega-5\nu
=
\boxed{
13\nu+\lambda.
}
~~~

Lambda is still not active.

---

## 7. Standing

The fifth nu chamber

~~~math
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+4\nu
<
e
<
5\kappa+2\chi+\rho+\sigma+4\tau+\omega+5\nu
~~~

is classified into:

- N4 / 615664: new, invertibility open;
- N3 / 509886: certified;
- O0 / 105768: certified.

The chamber is not yet declared source-level closed solely because N4 remains uncertified.

---

## 8. Determination

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-40:}
}
~~~

~~~math
\boxed{
\texttt{FIFTH NU TIER TYPED /}
}
~~~

~~~math
\boxed{
\texttt{4NU+U RECURRENCE CERTIFIED /}
}
~~~

~~~math
\boxed{
\texttt{N4 / 615664 SPECIES EXTRACTED}
}
~~~

No canonical SZ theorem cursor moves automatically.

---

## 9. Next cursor

The next bounded task is

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-41 / N4 REFLECTION-SECTOR INVERTIBILITY}.
}
~~~

Priority:

1. diagonalize N4 into two 307832 reflection sectors;
2. run independent non-assumptive sector certificates;
3. measure rather than hard-code the sharp inverse envelope;
4. close the fifth nu chamber if both sectors certify;
5. only then type the sixth nu-tier seam.

**Stop rule:** the tier-indexed U recurrence is now verified through (4\nu+U), but later nu tiers remain separate source-level obligations.
