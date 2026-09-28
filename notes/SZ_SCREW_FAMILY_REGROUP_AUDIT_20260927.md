# SZ Screw-Family / Cross-Collar Regroup Audit

**Date:** 2026-09-27  
**Branch audited:** `research/sz-screw-family-0`  
**Canonical effect:** NONE  
**Canonical theorem cursor:** remains `SZ-CROSS-COLLAR-3`  
**Purpose:** separate durable mathematics, corrected residue, stopped routes, and lawful next reconnaissance after the screw-family investigation.

---

## 1. Governance determination

The screw-family investigation remains a parallel reconnaissance branch.

It is not a promotion branch and does not modify the canonical SZ theorem cursor.

Current Git comparison at audit entry:

- branch is seven commits ahead of `main`;
- branch is zero commits behind `main`;
- changed surfaces are one provisional terminology addition and six screw-family research notes plus the terminal stop note.

No result from this branch is authorized to re-enter `SZ-CROSS-COLLAR-3` without a separate ratification pass.

---

## 2. External-source audit

### EXT-SF1 — Matsumoto–Suzuki

The source is genuine and current bibliographic metadata are:

Kohji Matsumoto and Masatoshi Suzuki, *M-functions and screw functions originating from Goldbach's problem and zeros of the Riemann zeta function*, Journal of Number Theory **280** (2026), 918–946, arXiv:2409.00888.

The current arXiv abstract page identifies the latest deposited arXiv version as v2, revised 2025-10-20. The experimental HTML carries an internal manuscript date “Version of March 22, 2026.” These are distinct metadata fields and must not be conflated.

**Additive correction to the initial source-pin note:** its shortened title “applications to Goldbach's problem...” is not the exact published/arXiv title. The formulas pinned there remain the intended source objects; future citations should use the exact title above.

The source explicitly defines

~~~math
H_\ell(X)
=
\sum_\rho
\frac{X^{\rho-1/2}}
{(\rho-\ell)((1-\rho)-\ell)}
~~~

and identifies the `ell=1/2` difference with Suzuki's zeta screw.

**Standing:** SOURCE FAMILY VERIFIED. Exact theorem/equation numbering used by downstream branch notes remains subject to source-location readback before canonical promotion.

### EXT-SF2 — Suzuki

Masatoshi Suzuki, *Weil's quadratic form via the screw function*, arXiv:2606.09096.

Current arXiv version is v3, revised 2026-09-23.

The paper explicitly develops the continuous screw-function realization of the Weil quadratic form and finite-interval nonlocal operators.

**Standing:** SOURCE VERIFIED / CONTEXTUAL for the parallel branch.

---

## 3. Screw-family result audit

### SF-0 — existence of a family

There is a real one-parameter family `H_ell` containing the familiar `ell=1/2` zeta screw.

**Standing:** IMPORTED / VERIFIED.

### SF-1 — ambient spectral rank

On RH, with

~~~math
a=\ell-1/2,
~~~

the critical-line denominator becomes

~~~math
\gamma^2+a^2.
~~~

The functions

~~~math
x\mapsto\frac1{x+a_j^2}
~~~

for distinct `a_j^2` form a Cauchy family. On distinct spectral squares, every finite square evaluation matrix has nonzero Cauchy determinant.

Thus the family has unbounded finite **ambient spectral** algebraic rank.

**Standing:** DERIVED / VALID.

**Guard:** this is rank before finite-window carrier projection. It is not an independent-Weil-equation theorem.

### SF-2 — Green reconstruction

Write

~~~math
\lambda_\rho=\rho-1/2,
\qquad
a=\ell-1/2.
~~~

Then

~~~math
(\rho-\ell)((1-\rho)-\ell)
=
a^2-\lambda_\rho^2.
~~~

For

~~~math
g_a(t)
=
\sum_\rho
\frac{e^{\lambda_\rho t}-1}
{a^2-\lambda_\rho^2},
~~~

the formal/distributional identity

~~~math
(-\partial_t^2+a^2)g_a
=
k-C_a
~~~

is exact on the common admissible core, with `k` the unweighted zero-distribution kernel and `C_a` a constant.

**Standing:** DERIVED / VALID ON THE COMMON CORE.

### SF-3 — multi-Green factorization

On compactly supported test functions for which the integrations by parts are licensed,

~~~math
Q_W(f)
=
\langle G_af',f'\rangle
+
a^2\langle G_af,f\rangle
+
C_a\left|\int f\right|^2,
~~~

up to the fixed normalization convention.

Thus varying `a` gives alternative Green factorizations of the **same** Weil form.

**Standing:** DERIVED / VALID AS A REPRESENTATION IDENTITY ON THE STATED CORE.

**Correction:** the phrase “uniquely minimal screw” is too global. The lawful statement is narrower:

> within this derived Green-family representation, `a=0` is the unique parameter for which the explicit mass channel `a^2 G_a` vanishes identically.

No uniqueness among all possible Weil factorizations is claimed.

### SF-4 — raw boundary rank

For the raw Green kernels,

~~~math
K_0(d)=d,
\qquad
K_1(d)=d^3/6,
~~~

the value/derivative vectors have determinant

~~~math
\det
\begin{pmatrix}
d&d^3/6\\
1&d^2/2
\end{pmatrix}
=
d^3/3.
~~~

This is exact for `d>0`.

**Standing:** DERIVED / VALID KERNEL ALGEBRA.

**Demotion:** this is not a trace theorem for the neutral mode.

### SF-5 — Cauchy-to-GERM intertwiner

No lawful identification was found between the Green-kernel Cauchy jet `(K,K')` and the GERM relay state `(X,S)`.

The physical neutral carrier has logarithmic/Stieltjes boundary regularity, not a classical `C^1` boundary jet.

Therefore the proposed determinant transfer

~~~math
\text{Green boundary rank}
\Longrightarrow
\text{GERM tap rank}
~~~

is unlicensed.

**Standing:** STOP / CORRECTLY REJECTED.

---

## 4. Net screw-family disposition

The branch answers its opening question.

### True

- more than one zeta-adjacent screw function exists;
- the family has genuine ambient spectral diversity;
- distinct members provide useful alternative Green coordinates;
- raw kernel boundary data vary nontrivially with the family parameter.

### False or unproved

- a second screw supplies a second independent Weil constraint;
- a second screw supplies a second lawful GERM boundary trace;
- replacing the linear tent by the hyperbolic kernel alone gives the correct general-`a` GERM system;
- the nonzero-`a` carrier has been shown to reduce state or return complexity.

### Terminal determination

~~~math
\boxed{
\text{SCREW-FAMILY SHORTCUT: NEGATIVE RECONNAISSANCE}
}
~~~

The branch should be retained as residue, not promoted as a closure mechanism.

---

## 5. Canonical GERM regroup

The current canonical theorem cursor remains

~~~math
\boxed{\texttt{SZ-CROSS-COLLAR-3}.}
~~~

The GERM line is experimental evidence beneath that theorem cursor, not a replacement cursor.

The important later correction is that a previously hoped-for finite global matrix/monodromy closure was withdrawn: the relevant arithmetic delays include a rationally independent family, and the sliding-window return problem is genuinely infinite rather than one finite periodic atlas.

Conversation-level current residue reports:

- `GERM-62` closed the regime `0<e<=kappa` using certified finite parity matrices;
- the next working gate `GERM-63` partitions `kappa<e<=h` by moving `kappa`-return counts;
- beyond `e>h`, the return structure enters the genuinely irrational cocycle regime.

These statements remain **conversation/residue status** in this audit and are not promoted here as repository-canonical facts.

---

## 6. Audit of the proposed “something else”

### Candidate A — determinant-one symplectic/Wronskian flux

For every real or complex `2x2` matrix `M`,

~~~math
M^TJM=(\det M)J,
\qquad
J=
\begin{pmatrix}
0&1\\
-1&0
\end{pmatrix}.
~~~

Hence if the homogeneous bulk transfer satisfies

~~~math
\det M=1,
~~~

then the bilinear form

~~~math
\omega(U,V)=U^TJV
~~~

is conserved along that bulk transfer.

For an affine forced step

~~~math
V_{n+1}=M_nV_n+b_n
~~~

and a dual homogeneous solution

~~~math
W_{n+1}=M_nW_n,
~~~

provided each relevant `M_n\in SL_2`,

~~~math
\boxed{
\omega(V_{n+1},W_{n+1})
-
\omega(V_n,W_n)
=
\omega(b_n,W_{n+1}).
}
~~~

Summation telescopes.

**Standing:** EXACT ALGEBRA on every segment whose transfer matrix is actually determinant one.

**Audit limitation:** the complete GERM return machinery contains local atom/constraint maps whose status as `SL_2` state-transfer matrices has not been established. Therefore there is not yet a global conserved flux across the whole post-`p` cocycle.

**Usefulness limitation:** the post-`p` tap space is two-dimensional. A single scalar flux cannot eliminate two independent taps without additional structure. A flux route becomes useful only if:

1. the complete return cocycle is symplectic/determinant-one in the correct state coordinates; and
2. boundary conditions, tap correlations, or an adjoint choice collapse the cumulative source term.

**Disposition:** LIVE RECONNAISSANCE, not yet a shortcut.

### Candidate B — simple irrational circle rotation / Sturmian coding

The arithmetic delays are incommensurate. However later GERM work reports rational independence of more than one pair (in particular `h,k,p`), so the full scheduler is not presently justified as a one-dimensional irrational circle rotation.

Therefore:

~~~math
\boxed{
\text{simple Sturmian / one-circle model: REJECTED AS TOO SMALL}.
}
~~~

The lawful replacement candidate is a higher-rank translation cocycle / torus or group-algebra model.

Its exact rank and section geometry must be derived from the retained delay set rather than assumed.

**Disposition:** HIGHER-RANK COCYCLE RECONNAISSANCE remains live.

### Candidate C — Stieltjes/second boundary trace

The project has a genuine logarithmic primitive/Stieltjes trace on the **persistent** neutral subspace after the prime-shadow continuity argument.

This is valuable terminal data.

But its existence is obtained using persistence itself. It is therefore a necessary condition available inside a contradiction argument, not an a priori second coordinate on every candidate GERM state.

Using it as though every neutral candidate already carried that trace would be circular.

**Disposition:** LAWFUL TERMINAL CONDITION; NOT A FREE LOCAL COORDINATE.

---

## 7. Structural diagnosis after audit

The present evidence does not support

~~~math
\text{missing second screw}.
~~~

It supports a different diagnosis:

~~~math
\boxed{
\text{missing compression of the forced arithmetic return cocycle}.
}
~~~

The obstruction has three layers:

1. **local state:** a two-dimensional P/J relay state;
2. **forcing:** two independent post-`p` tap directions;
3. **scheduler:** an aperiodic arithmetic return cocycle generated by incommensurate delay lengths.

The recent computational growth occurs primarily in layer 3.

Thus the most plausible missing object is not a new Weil kernel but an invariant/normal form that combines:

~~~math
\text{adjoint or symplectic flux}
+
\text{higher-rank return coding}
+
\text{terminal boundary condition}.
~~~

This is a research hypothesis, not a theorem.

---

## 8. Recommended next reconnaissance gate

Do **not** start another screw-family pass.

Before any more flat return enumeration, test one bounded question:

~~~math
\boxed{
\texttt{SZ-RETURN-COCYCLE-0 / TRANSFER-GROUP AUDIT}
}
~~~

Required outputs:

1. list every actual state-transfer map occurring after `p`;
2. separate state-transfer matrices from constraint/elimination matrices;
3. compute the determinant and preserved bilinear form, if any, for each transfer type;
4. identify the additive delay group generated by the active return lengths;
5. determine the minimal torus/group rank after quotienting one translation scale;
6. write the tap scheduler as a section/return map on that compact group if possible;
7. test whether the forced symplectic flux becomes a coboundary/telescoping sum on that scheduler.

### Success conditions

- **FLUX HIT:** one conserved/adjoint scalar converts all return forcing to endpoint terms.
- **TORUS HIT:** infinitely many return cases reduce to finitely many section types plus one torus rotation.
- **COBOUNDARY HIT:** tap forcing is an exact coboundary, so cumulative forcing telescopes.
- **NO HIT:** the full cocycle retains genuinely independent return data; resume the existing GERM partition with the failed compression documented.

No such pass is executed by this audit.

---

## 9. Final audit determination

~~~math
\boxed{
\begin{array}{ll}
\text{Screw-family existence} & \textbf{VALID}\\
\text{Ambient screw rank} & \textbf{VALID / NON-CANONICAL}\\
\text{Multi-Green Weil factorization} & \textbf{VALID ON COMMON CORE}\\
\text{Raw Green boundary rank} & \textbf{VALID / KERNEL-ONLY}\\
\text{Second independent collar equation} & \textbf{REJECTED}\\
\text{Cauchy-to-GERM intertwiner} & \textbf{STOP}\\
\text{Simple circle/Sturmian scheduler} & \textbf{TOO SMALL / REJECTED}\\
\text{Bulk symplectic flux} & \textbf{VALID LOCALLY}\\
\text{Global flux compression} & \textbf{OPEN}\\
\text{Higher-rank return cocycle compression} & \textbf{OPEN}\\
\text{Canonical SZ cursor} & \textbf{UNCHANGED}
\end{array}
}
~~~

The parallel investigation was useful: it ruled out a seductive wrong explanation and narrowed the missing mechanism to the transport/scheduler layer.
