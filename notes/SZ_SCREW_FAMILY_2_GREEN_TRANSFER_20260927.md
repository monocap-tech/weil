# SZ Screw-Family Parallel Investigation — Green/Resolvent Transfer

**Date:** 2026-09-27  
**Branch:** `research/sz-screw-family-0`  
**Standing:** DERIVED / RECONNAISSANCE  
**Canonical effect:** NONE. No movement of `SZ-CROSS-COLLAR-3`.

## 1. New source pin: the general arithmetic kernel is hyperbolic

Matsumoto–Suzuki Proposition 6.2 gives, for admissible real `ell != 1/2` and `X>1`,

~~~math
H_\ell(X)
=
\cdots
-
\sum_{n\le X}\frac{\Lambda(n)}{\sqrt n}\,
\frac{
(X/n)^{\ell-1/2}-(X/n)^{-(\ell-1/2)}
}{
1-2\ell
}
+
\cdots.
~~~

Put

~~~math
a=\ell-\frac12,
\qquad
X=e^t,
\qquad
r=\log n.
~~~

Then `1-2ell=-2a`, so the prime-power contribution becomes

~~~math
\boxed{
\sum_{r\le t}
\frac{\Lambda(n)}{\sqrt n}\,
\frac{\sinh(a(t-r))}{a}.
}
~~~

The limit as `a -> 0` is

~~~math
\frac{\sinh(a(t-r))}{a}\to t-r,
~~~

which is exactly the linear prime tent in the `ell=1/2` screw.

Matsumoto–Suzuki Proposition 6.1 gives the separately valid `ell=1` case:

~~~math
\sqrt{X/n}-\sqrt{n/X}
=
2\sinh((t-r)/2).
~~~

Thus the first nonzero parameter `ell=1` corresponds to `a=1/2`.

**Source standing:** SOURCE-PINNED.

---

## 2. Causal Green kernel

Define for `a != 0`

~~~math
K_a(s)
=
\mathbf 1_{s\ge0}\frac{\sinh(as)}{a},
~~~

with the continuous limit

~~~math
K_0(s)=\mathbf 1_{s\ge0}s.
~~~

For `s>0`,

~~~math
K_a''(s)-a^2K_a(s)=0.
~~~

At `s=0`, `K_a` is continuous and its first derivative jumps from `0` to `1`. Hence, distributionally,

~~~math
\boxed{
(\partial_s^2-a^2)K_a=\delta_0.
}
~~~

For the even two-sided prime profile

~~~math
K_a(|t|-r)\mathbf 1_{|t|\ge r},
~~~

the same calculation gives

~~~math
\boxed{
(\partial_t^2-a^2)
\left[
\mathbf 1_{|t|\ge r}
\frac{\sinh(a(|t|-r))}{a}
\right]
=
\delta_r+\delta_{-r}.
}
~~~

Therefore every member of the screw family reconstructs the same prime-power atomic train after application of its corresponding Helmholtz operator.

**Standing:** DERIVED / exact distribution identity.

---

## 3. Spectral resolvent identity

For the full symmetric zeta-frequency set, Matsumoto–Suzuki's coefficient becomes

~~~math
\frac{m_\omega}{\omega^2+a^2},
\qquad a=\ell-1/2,
~~~

after passing from the positive-frequency coefficient to the symmetric screw representation.

Thus

~~~math
g_a(t)
=
\sum_\omega
\frac{m_\omega}{\omega^2+a^2}
(e^{-it\omega}-1).
~~~

Applying

~~~math
L_a=-\partial_t^2+a^2
~~~

termwise gives

~~~math
L_ag_a(t)
=
\sum_\omega m_\omega e^{-it\omega}
-
a^2\sum_\omega\frac{m_\omega}{\omega^2+a^2}.
~~~

Hence

~~~math
\boxed{
L_ag_a=k-C_a,
}
~~~

where `k` is the unweighted zeta-zero distributional kernel and `C_a` is a constant.

At `a=0` this reduces to Suzuki's familiar statement that twice differentiating the linear screw recovers the distribution kernel.

The constant is invisible against zero-mean test functions.

**Standing:** DERIVED from the pinned spectral formula; no RH assumption.

---

## 4. Consequence: ambient rank does not mean independent Weil data

The prior pass proved that the family of spectral weights

~~~math
(\omega^2+a^2)^{-1}
~~~

has unbounded algebraic rank as functions of `omega`.

The present pass shows that, after applying the natural reconstruction operator `L_a`, every member maps back to the same underlying distribution `k`, modulo a constant.

Therefore:

~~~math
\boxed{
\text{ambient screw-family rank}>1
\not\Rightarrow
\text{independent bulk Weil constraints}.
}
~~~

More strongly, at the reconstructed bulk-distribution level the family is a resolvent family of one object.

This invalidates the naive model

~~~math
\text{two screws}=\text{two unrelated equations on the same bulk vector}.
~~~

**Standing:** DERIVED.

---

## 5. But finite-window compression breaks the resolvent identity by leakage

Let `A` denote the bulk operator reconstructed above, and write formally

~~~math
R_a=(A+a^2)^{-1}.
~~~

On the full carrier,

~~~math
R_a-R_b
=
(b^2-a^2)R_aR_b.
~~~

Let `P` be a finite-window compression and define

~~~math
R_a^P=PR_aP.
~~~

Then

~~~math
PR_aR_bP
=
PR_aPR_bP
+
PR_a(I-P)R_bP,
~~~

hence

~~~math
\boxed{
R_a^P-R_b^P
-
(b^2-a^2)R_a^PR_b^P
=
(b^2-a^2)
PR_a(I-P)R_bP.
}
~~~

The right side is exactly an **exterior leakage operator**.

Thus the family contains no new bulk source data, but comparing two family members after localization isolates the failure of the window to be invariant under the full resolvent.

That is the correct possible source of extra finite-window information.

**Standing:** DERIVED operator identity, conditional only on the lawful identification of the family member with the corresponding full-carrier resolvent.

---

## 6. Relation to the current traversal

The current difficulty at `SZ-CROSS-COLLAR-3` is a post-threshold overlap/leakage problem: a translated evaluation point begins crossing the moving right-fiber boundary, and the previous single-interval relations no longer hold uniformly.

The identity above says that this is precisely the regime where different resolvent parameters can cease to be redundant after compression.

Therefore the branch target changes from

~~~math
\text{bulk rank of }\{L_\ell\}
~~~

to

~~~math
\boxed{
\text{rank of the finite-window leakage family}
\quad
PR_a(I-P)R_bP.
}
~~~

No claim is made yet that this leakage has rank greater than one on the actual post-p defect space.

---

## 7. Hyperbolic transfer versus the parabolic Suzuki limit

The arithmetic Green kernel obeys the exact addition recurrence

~~~math
K_a(s+h)
=
2\cosh(ah)K_a(s)-K_a(s-h)
~~~

whenever all three arguments lie in the same active component.

Equivalently,

~~~math
\begin{pmatrix}
X_{j+1}\\
X_j
\end{pmatrix}
=
M_a(h)
\begin{pmatrix}
X_j\\
X_{j-1}
\end{pmatrix},
\qquad
M_a(h)
=
\begin{pmatrix}
2\cosh(ah)&-1\\
1&0
\end{pmatrix}.
~~~

The characteristic roots are

~~~math
e^{ah},\qquad e^{-ah}.
~~~

For `a != 0` these are distinct: the transfer is hyperbolic and diagonalizable.

At Suzuki's `a=0` member,

~~~math
M_0(h)
=
\begin{pmatrix}
2&-1\\
1&0
\end{pmatrix},
~~~

with repeated characteristic root `1`.

Thus the usual linear-tent screw is the **parabolic/Jordan limit** of the family.

This suggests a second, potentially more important use of the family:

~~~math
\boxed{
\text{use }a\ne0\text{ as a regularized transfer coordinate,}
}
~~~

rather than treating the extra screw as an independent bulk equation.

The long recurrence/monodromy traversal may be difficult partly because it is being executed directly in the degenerate `a=0` limit.

**Standing:** exact kernel algebra. Its usefulness for the actual GERM variables is OPEN.

---

## 8. Next cursor — SZ-SCREW-FAMILY-2 / BOUNDARY-LEAKAGE RANK

Tasks:

1. identify the exact finite-window projection/compression used by the current post-p carrier;
2. derive the lawful compressed-resolvent relation rather than using the schematic `P`;
3. express the leakage term in the current head/tail split variables;
4. specialize to `a=0` and `a=1/2`;
5. test whether their leakage rows are independent on the post-p ambiguity;
6. separately test whether working at generic `a>0` diagonalizes the existing transfer matrices and shortens the monodromy proof;
7. re-enter `SZ-CROSS-COLLAR-3` only after a custody audit.

### Stop rules

- If compression preserves the full resolvent identity with no leakage on the relevant defect space: **FAMILY REDUNDANCY STOP**.
- If leakage is nonzero but rank one and offers no simpler transfer: **NO-GAIN STOP**.
- If the `a>0` carrier diagonalizes the transfer while preserving custody: **REGULARIZED-TRANSFER HIT**.
- If two parameters give independent leakage traces: **BOUNDARY-RANK HIT**.

## Determination

~~~math
\boxed{
\texttt{SZ-SCREW-FAMILY-1: BULK REDUNDANCY / BOUNDARY APERTURE HIT}
}
~~~

The branch remains live, but the mechanism is now localized precisely at the boundary rather than in the bulk.
