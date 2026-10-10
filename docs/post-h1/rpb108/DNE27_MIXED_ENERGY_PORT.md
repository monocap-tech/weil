# DNE27 mixed-energy certificate and paid Young reduction

Status: **REMOTE CI VERIFIED AT THE MIXED-ENERGY HEAD**. The preceding physical-gap numerical slice passed remote CI at `3bba71d37e44e5fcbe40d5a771cf746f243a443c`.

## Exact inventory and dependency path

[PaidYoung.lean](../../../../WeilDefect/RPB108/PaidYoung.lean) adds:

- `paid_young_completed_square`: the exact identity
  `A*x²-2*M*x*y+y² - ((A-M²/(1-theta))*x²+theta*y²) = (M*x-(1-theta)*y)²/(1-theta)` for `theta<1`.
- `paid_young_lower`: the resulting universal bound with the absolute worst-case cross `-2*M*abs(x*y)`.

[DNE27MixedEnergy.lean](../../../../WeilDefect/RPB108/DNE27MixedEnergy.lean) adds the following ten declarations in **each** of `DNE27Even` and `DNE27Odd`:

| Declaration | Exact role |
| --- | --- |
| `theta_bounds` | Closed proof `0<theta<1`. |
| `retainedLower_pos` | Closed proof of the scaled three-coordinate margin's positivity. |
| `lowLower_identity` | Closed proof `lowLower=nativeLow-mixedUpper²/(1-theta)`. |
| `threeLower_identity` | Closed proof `threeLower=theta*retainedLower`. |
| `mixed_root_certificate` | Closed proof of nonnegativity and the exact squared inequalities sufficient to bound the combined roots. |
| `combined_mixed_norm_bound` | Derive `sqrt(nativeDualSquare)+sqrt(highMixedSquare)≤mixedUpper` using the previously proved square-root certificate theorem. |
| `paid_mixed_lower` | Specialize the universal Young bound to the authenticated parity parameters. |
| `retained_energy_nonneg` | The retained coefficient energy is nonnegative for every complex coefficient vector. |
| `mixed_diagonal_lower` | Derive the four diagonal lower weights from the raw mixed-energy expression for every complex coefficient vector. |
| `physical_gap_of_mixed_energy` | Compose that reduction with the preceding quantitative physical-gap theorem, leaving the actual inverse/source and raw mixed-energy inputs explicit. |

The first five in each parity are closed arithmetic proofs using `norm_num`; all other declarations have explicit mathematical arguments and proofs. Every new declaration audits to only `propext`, `Classical.choice`, and `Quot.sound`. No project axiom, admission, Python-result premise, or `native_decide` is used.

## Exact data custody

The [manifest](numeric-inputs/MANIFEST.json) now contains six immutable input JSON files. The added DNE23 certificate supplies `native_low_mixed_V_dual_square_upper`; its SHA256 is checked before generation, like the preceding five inputs. All bytes are pinned at DNE27 `3b5c5cb3a6db62c0fc7745820dc42a0d3d195c16`.

[generate_mixed.py](numeric-inputs/generate_mixed.py) renders exact rational definitions for the combined mixed upper bound, native low diagonal, theta, rho, native dual square, and prior retained positive margin. It defines

`highMixedSquare = rho * rawSourceSquare 0 / highFloor²`.

With `e=mixedUpper²-nativeDualSquare-highMixedSquare`, the kernel checks `e≥0` and `e²≥4*nativeDualSquare*highMixedSquare`, plus nonnegativity of the root inputs and mixed upper bound. The exact root expression, rather than an approximate floating-point value, is therefore bounded. Generation authenticates bytes and produces definitions; it supplies no theorem premise.

## Strongest composed statement and remaining attachment

For complex coefficients `z : Fin 4 → ℂ`, define

`R(z)=retainedLower * sum_{j : Fin 3} norm(z(j.succ))²`.

The new parity-specific physical-gap theorem assumes the explicit raw energy estimate

`nativeLow*norm(z(0))² - 2*mixedUpper*norm(z(0))*sqrt(R(z)) + R(z) + highFloor*norm(h)² ≤ energy`.

It **derives** the paid four-coordinate diagonal energy bound and then proves the physical `4e-36` gap for the completed-column vector with unrestricted high vector `h`. The native/source norm enclosures and high-inverse norm bound remain explicit arguments. The raw energy estimate is not asserted for the original form.

For RPB-P03, the remaining work includes the original signed source/domain realization, the restricted inverse bound, the source-Gram domination and mixed-pairing attachment needed to prove this raw energy estimate, and the complete form decomposition. The original matrix domination arithmetic is not covered by the combined-root arithmetic alone. The new reduction proves no full 1.06 positivity, 104-dimensional response sign, continuation or RH result.

## Reproduction

From the repository root:

```sh
python3 docs/post-h1/rpb108/numeric-inputs/generate.py
python3 docs/post-h1/rpb108/numeric-inputs/generate_mixed.py
lake build WeilDefect.RPB108
lake env lean WeilDefect/RPB108/DNE27MixedEnergy.lean
lake build WeilDefect.Examples.WeakCriticalFallthrough
```

Both generators authenticate inputs and reproduce source bytes exactly. An isolated control replaced the even mixed upper bound with zero; Lean rejected its scalar certificate/identities. The control is excluded from trusted sources. [DNE27_MIXED_VERIFICATION.json](DNE27_MIXED_VERIFICATION.json) records source/input hashes, local validation and scope. Existing CI builds the RPB108 entry point, including both new modules.

The subsequent [complete three-column Gram slice](DNE27_GRAM_PORT.md) closes the selected matrix domination arithmetic for all compatible enclosures and arbitrary complex vectors. Original source/form realization remains open.
