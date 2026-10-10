# DNE27 physical-gap arithmetic: first kernel-checked numerical slice

Status: **REMOTE CI VERIFIED AT THE NUMERICAL-SLICE HEAD**. The preceding ten supporting lemmas passed remote CI at `906df24396b75c1a8a628ea09f91faabb75e7a3a`.

## Exact input custody and generated definitions

[The input manifest](numeric-inputs/MANIFEST.json) records immutable commit, Git path, SHA256 and byte count for six unmodified JSON files, five used by this initial numerical slice at DNE27 `3b5c5cb3a6db62c0fc7745820dc42a0d3d195c16`: the primary DNE27 certificate, the DNE22 probe-plane certificate, the DNE18 low input, and the even/odd NF32 inputs. The sixth DNE23 input supplies the subsequent [mixed-energy slice](DNE27_MIXED_ENERGY_PORT.md). These bytes are vendored for portable replay. The generator verifies their hashes before rendering values; it supplies no Lean proof premise.

[generate.py](numeric-inputs/generate.py) extracts exact rational literals into [DNE27Numerics.lean](../../../../WeilDefect/RPB108/DNE27Numerics.lean). Both `DNE27Even` and `DNE27Odd` define the four scales, native mass upper values, source-square upper values, completed mass upper values, low/three-coordinate lower weights, `highFloor=11/25`, and `gap=4/(10^36)`.

For the scaled physical columns, the definitions are exactly:

- `nativeMass i = scales i * rawNativeMass i`;
- `sourceSquare i = (scales i)^2 * rawSourceSquare i`;
- `completedMass i = scales i * rawCompletedMass i`;
- `lower = ![lowLower, threeLower, threeLower, threeLower]`.

The five JSON files retain their upstream metadata and status flags verbatim. This slice checks selected scalar values; it does not promote every assertion in those files.

## Added theorem inventory

The following five declarations exist in each namespace `WeilDefect.RPB108.DNE27Even` and `WeilDefect.RPB108.DNE27Odd`:

| Declaration | Exact conclusion |
| --- | --- |
| `lower_pos` | Every one of the four diagonal lower weights is strictly positive. |
| `native_le_completed` | Each native mass upper value is at most its completed mass upper value. |
| `source_square_certificate` | Every scaled source-square value is at most `(highFloor*(completedMass-nativeMass))²`. |
| `denominator_guard` | `gap*(sum completedMass²/lower + 1/highFloor) ≤ 1`. |
| `physical_gap_of_native_source_bounds` | Under explicit actual native/source norm bounds, a high-inverse operator bound, and the completed-square energy lower bound, prove the physical norm gap `4e-36` for every coefficient vector and unrestricted high vector. |

The first four in each parity are closed numerical theorems proved with `norm_num` and finite case analysis. There is no Python-result hypothesis, `native_decide`, project axiom, or admission. All ten added declarations audit to only `propext`, `Classical.choice`, and `Quot.sound`.

The final theorem in each parity applies `source_completed_columns_physical_gap` with the actual imported numerical definitions. It discharges the numerical hypotheses using the four closed theorems. Its remaining hypotheses are mathematical attachment obligations, not assertions that the original form has already been identified.

## Remaining boundary

To obtain RPB-P03 on the original carrier, construct the actual completed-column decomposition and prove:

1. The native columns obey the imported `nativeMass` bounds and their **complete** projected signed source columns obey the imported `sourceSquare` bounds.
2. The actual restricted high inverse realizes the continuous linear map `T`, with operator norm at most `1/(11/25)`.
3. The original form value obeys the completed-square energy lower bound with these exact `lower` weights and the entire high norm.

The preceding squared and denominator arithmetic is now discharged in Lean for this slice. Original source enclosure construction, analytic domain/operator attachment, remaining source-domination and mixed-energy arithmetic, and any carrier adapter still need their own proofs. In particular, importing positive scalar weights does not establish their energy interpretation.

RPB-P01–RPB-P05 retain their original unported full-theorem status. Full 1.06 positivity, the 104-dimensional response sign, continuation and RH remain open.

## Reproduction and validation

From the repository root:

```sh
python3 docs/post-h1/rpb108/numeric-inputs/generate.py
lake build WeilDefect.RPB108
lake env lean WeilDefect/RPB108/DNE27Numerics.lean
lake build WeilDefect.Examples.WeakCriticalFallthrough
```

The source generator is deterministic. Exact data authenticity is checked by SHA256; mathematical inequalities are checked by the Lean kernel. Two isolated negative controls changed the even guard to `1/3` or changed a positive diagonal weight to zero; Lean rejected both. The controls are not part of the trusted module.

The [verification record](DNE27_NUMERIC_VERIFICATION.json) records input and generated-source hashes, local build and axiom-audit outcomes, negative controls and the remaining scope. Existing CI already builds the RPB108 entry point, which now imports this numerical module.
