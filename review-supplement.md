# JSP-000433: mathematical correspondence, prior work and verification supplement

Prepared 2026-09-26 for [awards PR #780](https://github.com/TheJustinSunPrize/awards/pull/780).

This document reviews the unchanged proof at commit **`4c13444405613792d0ee87e89ca246b104b3b166`** (version A) in [CHENLexiao8848/jsp-000433-lean](https://github.com/CHENLexiao8848/jsp-000433-lean), branch `codex/jsp-000433-proof`. A later documentation commit containing this report is not a new proof version. Its statements about source and old logs describe A; fresh executions, if subsequently supplied, must identify their checked source and commands separately.

## Mathematical source and submitted scope

A. Schinzel and G. Szekeres, *Sur un problème de M. Paul Erdős*, Acta Scientiarum Mathematicarum (Szeged) **20** (1959), 221–229:

- [University archive record](https://acta.bibl.u-szeged.hu/13886/) and [complete primary-source scan](https://acta.bibl.u-szeged.hu/13886/1/math_020_221-229.pdf).
- Condition (1), p.221, gives positive distinct integers no larger than `n`, with each distinct pair's least common multiple greater than `n`.
- **Theorem 1, p.222**, gives the sharp reciprocal-sum bound `31/30`.
- Lemma 1, pp.222–224, supplies the weighted-multiples inequality. Lemma 2, pp.224–227, supplies the coefficient construction and bounds.
- The proof of Theorem 1 starts on p.227 and concludes on p.228, including the exceptional endpoints `5,13,19,20,31,32,61,62`.

These are printed page numbers, not zero-based PDF indices. The mathematical solution is attributed to Schinzel and Szekeres; Paul Erdős posed the problem. Source identification is not a report of prize mathematical approval or independent human referee review.

The current [Erdős Problem 542 page](https://www.erdosproblems.com/542) presents a further uncovered-divisor question. The JSP-000433 catalog statement is the reciprocal-sum question. Version A proves its upper bound and optimality. It does not claim to formalize the extra uncovered-divisor question, Theorem 1's additional uniqueness of its equality case, or the paper's other theorems.

## Exact statement correspondence

The definitions in [`Problem000433.lean`](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/LeanProblems/Problem000433.lean) are:

```lean
def Admissible (n : ℕ) (A : Finset ℕ) : Prop :=
  (∀ a ∈ A, 0 < a ∧ a ≤ n) ∧
    (∀ a ∈ A, ∀ b ∈ A, a ≠ b → n < Nat.lcm a b)

def reciprocalSum (A : Finset ℕ) : ℚ :=
  ∑ a ∈ A, (1 : ℚ) / a
```

`Finset` expresses distinct elements, so no multiplicity is hidden. Both quantifiers in the lcm hypothesis range over all members of `A`, and the inequality is required only when the two are distinct. Positivity excludes zero denominators. If `n=0`, the membership conditions force `A` to be empty. Empty `A` is otherwise allowed and has sum zero.

| Declaration in [`Problem000433Complete.lean`](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/LeanProblems/Problem000433Complete.lean) | Mathematical meaning |
| --- | --- |
| `JSP.Problem000433.jsp_000433`, line 44 | Universal rational reciprocal-sum upper bound for every `n` and every admissible finite set. |
| `JSP.Problem000433.jsp_000433_real`, line 48 | Universal real reciprocal-sum bound, with positivity, membership bound and lcm hypotheses explicit; proved by exact casting from the rational theorem. |
| `JSP.Problem000433.optimal_constant`, line 57 | The upper bound and the statement that every universal rational upper bound is at least `31/30`. |

`extremal_admissible` and `extremal_sum` prove admissibility and exact sum for `n=5, A={2,3,5}`. Casting this rational identity gives the real sharpness example too. The named optimality theorem does not assert uniqueness of that example.

The terminal targets have only the original mathematical hypotheses. Certificate bounds, finite computations and analytic estimates are proved dependencies, not assumptions added to the final theorem.

## Mathematical argument implemented at A

Write

`H_c(q) = ∑_{k=1}^q c(floor(q/k))/k`,

where `c` is the nonnegative rational function in [`Problem000433Coefficients.lean`](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/LeanProblems/Problem000433Coefficients.lean). Its support is contained in

`{1,2,3,4,6,10,15,16,22,28,35,36,58}`.

For example, `c(1)=1`, `c(2)=1/2`, `c(3)=c(4)=1/6`, and every other coefficient is an explicit rational in that file. The proof checks the actual constants it uses. It does not assume that a printed coefficient, an external search program or floating-point calculation is correct. The original release's note about a possible printed `c(28)` discrepancy is not promoted here to a new mathematical result.

For an admissible `A`, positive multiples of distinct elements cannot coincide at an integer at most `n`: a common multiple would be at least their lcm, which is greater than `n`. Put weight `c(floor(n/k))/k` on each integer `k` in `1…n`. The sum of these weights over the multiples of an element `a` is exactly

`H_c(floor(n/a))/a`.

The change of variables `k=a j` and the nested natural-division identity are proved in `harmonicCertificate_multiples`. If `H_c(q)≥1` for every positive quotient, the multiples of `a` therefore carry total weight at least `1/a`. The disjointness of all such sets of multiples gives

`∑_{a∈A} 1/a ≤ H_c(n)`.

This is `reciprocalSum_le_harmonicCertificate` in [`Problem000433Certificate.lean`](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/LeanProblems/Problem000433Certificate.lean). The proof then establishes `H_c(n)≤31/30` whenever `n` is outside the eight-point exceptional set. At an exceptional endpoint it instead proves the desired bound directly for every admissible `A`.

The certificate's exhaustive arithmetic coverage is:

| Range or obligation | Source and verification mechanism |
| --- | --- |
| `1≤q≤365` | `Problem000433FiniteCertificate.lean`: exact rational comparisons, checked by Lean's kernel evaluation. |
| `366≤q≤1399` | `Problem000433IntegerBounds.lean`, the eleven `Problem000433Integer366.lean` through `Problem000433Integer1366.lean` range modules, and `Problem000433Middle.lean`: integer certificates with proved soundness and conversion back to the rational certificate. |
| `q≥1400` | `Problem000433Numeric.lean`, `Problem000433Asymptotic.lean`, `Problem000433Large.lean`: rational bounds for logarithms and a proved global error bound. |
| Exceptions `5,13,19,20,31,32` | Basic small-case argument and the sound finite admissible-subset verifier in `Problem000433Finite.lean`. |
| Exceptions `61,62` | `Problem000433Endpoint61.lean` and `Problem000433Endpoint62.lean`: generated split certificates whose finite checks and splitting rules have Lean proofs. |
| Final integration | `coefficient_lower`, `coefficient_upper`, `sharp_bound_at_exceptions` and `sharpBound` in `Problem000433Complete.lean`. |

For the infinite range, the code defines

`L = ∑_{j=1}^{58} c(j) log((j+1)/j)`

and proves `1.0172 < L < 1.0173` using exact rational estimates. It also proves the weighted moment is below `20` and, for `q>59`,

`|H_c(q) - L| < 20/(q-59)`.

For `q≥1400` this error is less than `3/200`, which gives `1≤H_c(q)<31/30`. Thus no finite cutoff replaces the universal theorem. Uses of `decide +kernel` in the finite certificates are Lean-kernel reductions. They are not `native_decide` or imported numerical answers. The source audit reports no `sorry`, `admit`, custom proof axioms or `native_decide` in the 28 proof modules.

## Full prior proof and comparison

The complete prior comparator is [plby/lean-proofs, `Erdos542.lean`](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos542.lean), fixed commit **`8822f7ddef30fadbd92e1c6ab4ed897af356af5e`**, path `src/latest/ErdosProblems/Erdos542.lean`.

| Conclusion | Prior plby source | Submitted A |
| --- | --- | --- |
| Universal sharp `31/30` upper bound | `erdos542_reciprocal_bound`, line 1136 | `jsp_000433` / `jsp_000433_real` |
| Attaining example `{2,3,5}` at `n=5` | `erdos542_sharp_example`, line 1152 | `extremal_admissible`, `extremal_sum`, `optimal_constant` |
| Additional uncovered-divisor results | Included in `erdos_542`, line 2114 and supporting theorems | Outside A's claim |
| Main mathematical method | Schinzel–Szekeres harmonic certificate | Same published method |
| Exceptional upper bounds | `exceptionPair` and `exception_pair_not_both_covered` support subtraction of missing weight | Direct finite admissible-subset bounds, including generated split certificates for endpoints 61 and 62 |

The prior source's header credits Schinzel/Szekeres for the informal proof and Codex/GPT-5.6 Sol for formalization. It is already a complete sharp proof, so comparison only against [issue #472](https://github.com/TheJustinSunPrize/awards/issues/472) or the finite [PR #705](https://github.com/TheJustinSunPrize/awards/pull/705) would be incomplete. The original `ATTRIBUTION.md` at A omitted this comparator. This supplement corrects that omission without changing the historical file at A.

The concrete implementation distinction identified above is a subject for contribution review. It is not evidence of a new mathematical constant, first complete formalization, stronger scope, independent discovery of the route or independently established code provenance. No priority finding is inferred solely from PR numbers or Git timestamps. Other catalog submissions such as [#1432](https://github.com/TheJustinSunPrize/awards/pull/1432) and [#3981](https://github.com/TheJustinSunPrize/awards/pull/3981) point to the plby work; catalog registration is distinct from original authorship and official acceptance.

## Authorship and evidence limits

The [original attribution](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/ATTRIBUTION.md) records that OpenAI Codex and cooperating AI agents developed the Lean proof and certificates under the direction of `CHENLexiao8848`, who initiated the project and maintained/submitted its public release. The account holder is not presented as mathematical solver or sole unaided human author of every proof term. The original attribution states that nonlibrary Lean code was developed locally rather than copied from another public proof; this report records that provenance statement rather than claiming independent validation of the development history. No independent human verifier is claimed.

Mathlib and its dependencies retain their own authorship and licenses. The local repository's license does not relicense the paper or dependencies. Mathematical credit remains with the cited authors.

The contribution offered for assessment is the attributable local formalization work, finite and analytic proof integration, interfaces and reproducible evidence. Whether it satisfies the prize's originality, priority and award requirements is unresolved and must be determined by the maintainers. Successful compilation alone does not decide those questions.

## Existing verification and the 2026-09-26 consistency check

Version A fixes Lean `4.34.0` and Mathlib `5ed2965256430c3649e86755f9576b54eca72435` in `lake-manifest.json`. Retain that lock: `lakefile.toml` names release tag `v4.34.0`, while the lock is the exact dependency selection.

The fixed [verification report](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/evidence/VERIFICATION.md) records Windows x86-64 executions on 2026-09-17. The development build and audit returned exit 0. The release rehash build reused compiled proof modules and built the aggregate root, and the release verification script returned exit 0. **This is explicitly not a clean or fresh release compilation.** Neither the brief historical `original-build.log` nor the release-root compilation demonstrates a clean build of every proof module.

A new source/evidence consistency inspection on 2026-09-26 found:

- All **33/33 hashes** in `evidence/SOURCE-SHA256.json` match the selected GitHub archive: 28 local proof modules, the aggregate root, `Audit.lean`, toolchain, Lake configuration and dependency lock.
- The manifest does not cover `scripts/verify.py`; its role and source were inspected separately.
- `Audit.lean` names 32 declarations, and the existing `release-verification.log` contains all 32 corresponding recursive axiom outputs.
- Each of the three terminal targets reports exactly `[propext, Classical.choice, Quot.sound]`.
- The named proof branch contained A and was at A on inspection. No proof-repository GitHub Actions runs were returned by the public API at that time.

This inspection did not execute Lean. It checks the consistency of available evidence, rather than converting historical logs into a new clean-build result. A later fresh-build report must state its own commands, exit statuses, source identity and logs, and must distinguish a three-target audit from rerunning all 32 named declarations.

## Reproduction

In an isolated checkout:

```sh
git clone --branch codex/jsp-000433-proof https://github.com/CHENLexiao8848/jsp-000433-lean.git
cd jsp-000433-lean
git checkout --detach 4c13444405613792d0ee87e89ca246b104b3b166
lake exe cache get
lake clean
lake build
lake env lean -j1 Audit.lean
python3 scripts/verify.py
```

These are instructions, not an assertion that this report ran them. Pinned dependency caches may be used; local project proof artifacts must be removed before calling a run a fresh local-project build. A dependency-cache download is not a local proof build. `scripts/verify.py` rehashes inputs and runs the full audit but does not clean or build. A successful run should retain the command output and source/dependency identity alongside the report.

The three target outputs expected from `Audit.lean`, and present in the original log, are:

```text
'JSP.Problem000433.jsp_000433' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.jsp_000433_real' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.optimal_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Separately executed fresh verification

The [fresh verification report](fresh-verification-20260926.md) records the subsequent actual run on the unchanged version A: a project build beginning with no local project artifacts, one disclosed Lean runtime interruption in Endpoint62, an unchanged isolated retry, successful completion of the full project build, and a new audit of the three terminal targets. That report gives exact commands, outcomes, source identity and logs. It does not turn the source-consistency checks above into Lean executions or claim a new full 32-declaration audit.
