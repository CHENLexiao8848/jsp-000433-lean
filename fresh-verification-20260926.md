# Fresh verification of JSP-000433 on 2026-09-26

**Result: completed successfully after a disclosed Lean runtime failure and retry.** This is not a first-attempt error-free build.

Selected proof: [4c13444405613792d0ee87e89ca246b104b3b166](https://github.com/CHENLexiao8848/jsp-000433-lean/commit/4c13444405613792d0ee87e89ca246b104b3b166), repository `CHENLexiao8848/jsp-000433-lean`, branch `codex/jsp-000433-proof`. This later report describes that unchanged proof version, not a new proof commit or a maintainer acceptance decision.

## Execution and exact scope

A separate checkout on Darwin arm64 started with no project `.lake/build` directory and zero local project `.olean` files. Lean 4.34.0 was obtained from the [official release](https://github.com/leanprover/lean4/releases/download/v4.34.0/lean-4.34.0-darwin_aarch64.tar.zst); the toolchain archive SHA-256 was `69f263fa6e21bbc2466bbfb1affcd92479ee2714c883a07de548e099a5922932`. All nine dependency source revisions matched the fixed [manifest](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/lake-manifest.json), and tracked dependency sources were clean before and after. `lakefile.toml` names the Mathlib tag `v4.34.0`; the checked-in manifest fixes its exact SHA. Existing artifacts for these hash-pinned dependencies were reused, and missing Mathlib artifacts were retrieved through the official content-addressed cache client's direct Azure backend. No JSP-000433 proof artifacts were copied from the historical release.

The first `lake --no-cache build` exited **1** because the Lean process compiling `Problem000433Endpoint62` terminated with runtime exit **134**, `lean::unreachable_reached`. Its cause was not established. Compiling that unchanged module in isolation then exited **0**. Completing `lake --no-cache build` exited **0** (2825 jobs), followed by a separate three-terminal audit with exit **0**. Previously completed modules from the first fresh attempt were retained during recovery. Across those attempts, the build log records fresh compilation of all **28 proof modules required by the default target**, plus the `LeanProblems` aggregate root.

This run checked `JSP.Problem000433.jsp_000433`, `JSP.Problem000433.jsp_000433_real` and `JSP.Problem000433.optimal_constant`. Their signatures and transitive axioms appear below. The full historical 32-declaration audit was not rerun, and no new kernel replay was performed. Dependencies were not all rebuilt from source. No independent human review, second checker implementation, authorship determination or award eligibility is asserted.

All 33 entries in the selected proof's [release manifest](https://github.com/CHENLexiao8848/jsp-000433-lean/blob/4c13444405613792d0ee87e89ca246b104b3b166/evidence/SOURCE-SHA256.json) matched. Before/after hashes of the proof sources, audit source, toolchain and lock/configuration were identical, and tracked project Git state remained clean. The source scan found no local `sorry`, `admit`, `native_decide`, `axiom` or `unsafe` declaration matches; this supplementary scan does not replace the executed axiom checks or semantic review.

## Recorded execution sequence

The external `TerminalAudit.lean` file below was placed outside the selected proof tree.

```sh
lake --no-cache build                                      # exit 1; Endpoint62 Lean process exited 134
lake --no-cache build LeanProblems.Problem000433Endpoint62  # unchanged module; exit 0
lake --no-cache build                                      # completed project; exit 0
lake env lean ../build-evidence/TerminalAudit.lean          # three terminal checks; exit 0
```

The retry is a disclosed recovery from the observed failure, not a requirement that every reproduction should fail first. The combined transcript retains every build attempt and the terminal audit. Its only redaction replaces the local absolute workspace prefix with `$WORKSPACE`; diagnostics, commands and exit statuses are retained.

## Verification summary (selected fields)

```json
{
  "problem": "JSP-000433",
  "repository": "https://github.com/CHENLexiao8848/jsp-000433-lean",
  "proof_sha": "4c13444405613792d0ee87e89ca246b104b3b166",
  "verified_at": "2026-09-26T05:30:08.517439+00:00",
  "status": "passed_after_disclosed_runtime_retry",
  "platform": "Darwin arm64",
  "lean": "Lean (version 4.34.0, arm64-apple-darwin24.6.0, commit 293d5d0c0c3f3dded4688b3ccd6a33939ac5102b, Release)",
  "mathlib_sha": "5ed2965256430c3649e86755f9576b54eca72435",
  "publication_manifest_matches": "33/33",
  "project_oleans_before_first_build": 0,
  "clean_project_build_directory_initially_absent": true,
  "first_full_build_exit_code": 1,
  "runtime_failure": "Lean runtime exit 134 (lean::unreachable_reached) in Problem000433Endpoint62; all remaining required source and lock inputs were unchanged.",
  "isolated_unchanged_endpoint62_build_exit_code": 0,
  "completed_full_build_exit_code": 0,
  "completed_full_build_jobs": 2825,
  "terminal_audit_exit_code": 0,
  "terminal_axioms": {
    "JSP.Problem000433.jsp_000433": [
      "propext",
      "Classical.choice",
      "Quot.sound"
    ],
    "JSP.Problem000433.jsp_000433_real": [
      "propext",
      "Classical.choice",
      "Quot.sound"
    ],
    "JSP.Problem000433.optimal_constant": [
      "propext",
      "Classical.choice",
      "Quot.sound"
    ]
  },
  "source_and_lock_hashes_unchanged": true,
  "tracked_worktree_clean": true,
  "fresh_scope": {
    "default_target_proof_modules_compiled_across_attempts": 28,
    "aggregate_root_compiled": true,
    "new_terminal_checks": 3,
    "full_32_declaration_audit_rerun": false,
    "new_kernel_replay": false,
    "dependencies_built_entirely_from_source": false
  }
}
```

## build-and-audit.log

SHA-256 of the embedded artifact: `22c1c1730ed9f7a8879fa5a9e5669b9b5edfd05d6bd67c16eb200ef05937bda8`.

```text
## clean-project-build
Command: lake --no-cache build
Exit code: 1
✔ [2796/2825] Built LeanProblems.Problem000433 (8.7s)
✔ [2797/2825] Built LeanProblems.Problem000433Certificate (1.9s)
✔ [2798/2825] Built LeanProblems.Problem000433SmallCases (2.0s)
✔ [2799/2825] Built LeanProblems.Problem000433Coefficients (2.7s)
✔ [2800/2825] Built LeanProblems.Problem000433Finite (2.8s)
✔ [2801/2825] Built LeanProblems.Problem000433EndpointSplit (1.7s)
✔ [2802/2825] Built LeanProblems.Problem000433IntegerDefs (2.4s)
✔ [2803/2825] Built LeanProblems.Problem000433IntegerBounds (2.1s)
✖ [2804/2825] Building LeanProblems.Problem000433Endpoint62 (9.0s)
trace: .> LEAN_PATH=$WORKSPACE/work/715/build/.lake/packages/Cli/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/batteries/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/Qq/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/aesop/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/proofwidgets/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/importGraph/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/LeanSearchClient/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/plausible/.lake/build/lib/lean:$WORKSPACE/work/715/build/.lake/packages/mathlib/.lake/build/lib/lean:$WORKSPACE/work/433/build/.lake/build/lib/lean $WORKSPACE/work/lean-runtime/lean-4.34.0-darwin_aarch64/bin/lean $WORKSPACE/work/433/build/LeanProblems/Problem000433Endpoint62.lean -o $WORKSPACE/work/433/build/.lake/build/lib/lean/LeanProblems/Problem000433Endpoint62.olean -i $WORKSPACE/work/433/build/.lake/build/lib/lean/LeanProblems/Problem000433Endpoint62.ilean -c $WORKSPACE/work/433/build/.lake/build/ir/LeanProblems/Problem000433Endpoint62.c --setup $WORKSPACE/work/433/build/.lake/build/ir/LeanProblems/Problem000433Endpoint62.setup.json --json
info: stderr:
libc++abi: terminating due to uncaught exception of type lean::unreachable_reached: 'unreachable' code was reached
error: Lean exited with code 134
✔ [2805/2825] Built LeanProblems.Problem000433Numeric (13s)
✔ [2806/2825] Built LeanProblems.Problem000433Grouping (20s)
✔ [2807/2825] Built LeanProblems.Problem000433Asymptotic (23s)
✔ [2808/2825] Built LeanProblems.Problem000433Integer1366 (16s)
✔ [2809/2825] Built LeanProblems.Problem000433Integer666 (19s)
✔ [2810/2825] Built LeanProblems.Problem000433Integer766 (21s)
✔ [2811/2825] Built LeanProblems.Problem000433Integer466 (13s)
✔ [2812/2825] Built LeanProblems.Problem000433Integer866 (24s)
✔ [2813/2825] Built LeanProblems.Problem000433Integer566 (18s)
✔ [2814/2825] Built LeanProblems.Problem000433Large (9.7s)
✔ [2815/2825] Built LeanProblems.Problem000433Integer966 (25s)
✔ [2816/2825] Built LeanProblems.Problem000433Integer366 (12s)
✔ [2817/2825] Built LeanProblems.Problem000433Integer1066 (28s)
✔ [2818/2825] Built LeanProblems.Problem000433Integer1166 (30s)
✔ [2819/2825] Built LeanProblems.Problem000433Integer1266 (31s)
✔ [2820/2825] Built LeanProblems.Problem000433Middle (1.8s)
✔ [2821/2825] Built LeanProblems.Problem000433FiniteCertificate (46s)
✔ [2822/2825] Built LeanProblems.Problem000433Endpoint61 (50s)
Some required targets logged failures:
- LeanProblems.Problem000433Endpoint62
error: build failed


## endpoint62-isolated-retry
Command: lake --no-cache build LeanProblems.Problem000433Endpoint62
Exit code: 0
✔ [1111/1111] Built LeanProblems.Problem000433Endpoint62 (49s)
Build completed successfully (1111 jobs).


## project-build-after-runtime-retry
Command: lake --no-cache build
Exit code: 0
✔ [2823/2825] Built LeanProblems.Problem000433Complete (13s)
✔ [2824/2825] Built LeanProblems (2.9s)
Build completed successfully (2825 jobs).


## terminal-audit
Command: lake env lean ../build-evidence/TerminalAudit.lean
Exit code: 0
JSP.Problem000433.jsp_000433 (n : ℕ) (A : Finset ℕ) (hA : JSP.Problem000433.Admissible n A) :
  JSP.Problem000433.reciprocalSum A ≤ 31 / 30
JSP.Problem000433.jsp_000433_real (n : ℕ) (A : Finset ℕ) (hpos : ∀ a ∈ A, 0 < a) (hle : ∀ a ∈ A, a ≤ n)
  (hlcm : ∀ a ∈ A, ∀ b ∈ A, a ≠ b → n < a.lcm b) : ∑ a ∈ A, 1 / ↑a ≤ 31 / 30
JSP.Problem000433.optimal_constant :
  JSP.Problem000433.SharpBound ∧
    ∀ (C : ℚ),
      (∀ (n : ℕ) (A : Finset ℕ), JSP.Problem000433.Admissible n A → JSP.Problem000433.reciprocalSum A ≤ C) → 31 / 30 ≤ C
'JSP.Problem000433.jsp_000433' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.jsp_000433_real' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.optimal_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## TerminalAudit.lean

SHA-256 of the embedded artifact: `19db5db3169940b16ba1bf12dc5ed4829922b80eb5647a0726dca5565185e38b`.

```lean
import LeanProblems.Problem000433Complete

#check JSP.Problem000433.jsp_000433
#check JSP.Problem000433.jsp_000433_real
#check JSP.Problem000433.optimal_constant
#print axioms JSP.Problem000433.jsp_000433
#print axioms JSP.Problem000433.jsp_000433_real
#print axioms JSP.Problem000433.optimal_constant
```

## terminal-audit.log

SHA-256 of the embedded artifact: `4f7c050e0819edaf798b3957f320cecf45e02cc079bddca2d8ca999cb04f9a75`.

```text
JSP.Problem000433.jsp_000433 (n : ℕ) (A : Finset ℕ) (hA : JSP.Problem000433.Admissible n A) :
  JSP.Problem000433.reciprocalSum A ≤ 31 / 30
JSP.Problem000433.jsp_000433_real (n : ℕ) (A : Finset ℕ) (hpos : ∀ a ∈ A, 0 < a) (hle : ∀ a ∈ A, a ≤ n)
  (hlcm : ∀ a ∈ A, ∀ b ∈ A, a ≠ b → n < a.lcm b) : ∑ a ∈ A, 1 / ↑a ≤ 31 / 30
JSP.Problem000433.optimal_constant :
  JSP.Problem000433.SharpBound ∧
    ∀ (C : ℚ),
      (∀ (n : ℕ) (A : Finset ℕ), JSP.Problem000433.Admissible n A → JSP.Problem000433.reciprocalSum A ≤ C) → 31 / 30 ≤ C
'JSP.Problem000433.jsp_000433' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.jsp_000433_real' depends on axioms: [propext, Classical.choice, Quot.sound]
'JSP.Problem000433.optimal_constant' depends on axioms: [propext, Classical.choice, Quot.sound]
```

## Dependency revisions

These exact revisions matched the locked and actual checkouts before and after execution; tracked sources were clean in both checks.

| Package | Revision |
| --- | --- |
| `mathlib` | `5ed2965256430c3649e86755f9576b54eca72435` |
| `plausible` | `118aa17ee84656b8bd727fef7c458ee8c833385c` |
| `LeanSearchClient` | `ddf04cf3949fa556442341e87d47f9f6e6074707` |
| `importGraph` | `e928b72544873815af278d38681b31c0293588e3` |
| `proofwidgets` | `106ff4fafc74ef4ac99d81dbf3ab399118f497a5` |
| `aesop` | `355695d523e41d0554926416cba2a2b3544fbbc9` |
| `Qq` | `6a489d9af5d0c47e5b259e2e8bcdfc1811b5a259` |
| `batteries` | `f2effa3d803fda822b1f97b806c47cf2adfbcbc2` |
| `Cli` | `e92c9f15fdfacc8536f31cfb3b7ad26c3c8cd204` |

## Proof-source identity before and after

The following 33-entry map was identical before and after execution. Both JSON evidence files have SHA-256 `667f12674c422540954900273afd5325f636a87c938a1c64d44a61cfb2bf310b`. The independent comparison with the published release manifest also matched all 33 entries. Documentation and this later report are not represented as being part of the selected proof version.

```json
{
  "Audit.lean": "a815eb939a508ac9801fc01b80563451c8a55f7f70d151f88fc0051efb08d106",
  "LeanProblems/Problem000433.lean": "b20060b27faabd6825eec7bc2cd1dfdbfe8db3cca9b7860499614b2a140e5f43",
  "LeanProblems/Problem000433Asymptotic.lean": "3b380685a572355fd18c09e07845f48a8cca7b9a16e167b1bb6ce0214326dfc0",
  "LeanProblems/Problem000433Certificate.lean": "f13782166e0a5927feb6ab161e914f97de6d24663c468f35592737f16cd1335b",
  "LeanProblems/Problem000433Coefficients.lean": "ffb68eb8afef066ce5732a75f9108ca9481a11d8ac9511407a631f93f2dbb637",
  "LeanProblems/Problem000433Complete.lean": "f13fc1f0d92cf5092cc8715d66991bfa908a8382c02c6b9fdabf3e74259dd836",
  "LeanProblems/Problem000433Endpoint61.lean": "610d5a0e5640f727a4877ec23b5c08f75b9c2c4c3f1ecec89fff651a8d77fe7f",
  "LeanProblems/Problem000433Endpoint62.lean": "755fd502602c7c66b77ca465468ed139f8f5ab6d437a10590f97e81e7bde2d35",
  "LeanProblems/Problem000433EndpointSplit.lean": "a89672897ff7dc637698e8d18d4b63a47c3f7a249c5dde19bb951afc5cddb236",
  "LeanProblems/Problem000433Finite.lean": "b049176e1206bfe227492d65fb1dc4c9ebea0e7dbdbc9078ba87439ebf504276",
  "LeanProblems/Problem000433FiniteCertificate.lean": "6c03bce92f4d158383b55b9032f9eaed105d13c501d8cdd2da5cdf1283de9442",
  "LeanProblems/Problem000433Grouping.lean": "ea836c16dc80fa03a4690a02eff5012623bf2e80ebd698cf3723b7c9227b6c9b",
  "LeanProblems/Problem000433Integer1066.lean": "0daec90de1b3cf39456792afbb93b6446b2f087dcbd788d11d0475783a62e1c1",
  "LeanProblems/Problem000433Integer1166.lean": "28407ae090047dc1282323e0ed0b623e6de36b9831b646efdfe07f7b6cd54979",
  "LeanProblems/Problem000433Integer1266.lean": "5bb9231f54c7b480741b555e037d6c78a1fcce068fabe3daf6a46dc4d00e2382",
  "LeanProblems/Problem000433Integer1366.lean": "d637e55c8e3dae857ca89dc3a1dface82a10aa99eafec17c0e40b92edf313941",
  "LeanProblems/Problem000433Integer366.lean": "94cad723b585fd2254af1331a9f5a9556194f787205be132e3e373393fa11058",
  "LeanProblems/Problem000433Integer466.lean": "107a61feb82a9cfd92cc1350eecb9a7f490ec5deacd215ddb94a4f77e0697bfd",
  "LeanProblems/Problem000433Integer566.lean": "18494de985506cfd641918a7e48d3f28979513277529658f8d48964e30011671",
  "LeanProblems/Problem000433Integer666.lean": "1d53c26ee7de33f68620f93977acedd91bc0faeb296e71dfc6748669c00e3df3",
  "LeanProblems/Problem000433Integer766.lean": "a0b2102eeb45e283f711e4957ff83f6f00545fc11f1bb4ad73ca3b58f1107a8e",
  "LeanProblems/Problem000433Integer866.lean": "1073cbec50a5dcdf7b66a5d749a0d502b70c7c156589b6d722140056009fd217",
  "LeanProblems/Problem000433Integer966.lean": "31fd7ddfa173be9e1206ae32e968e054176299ce085a8b3166bb38c960a89478",
  "LeanProblems/Problem000433IntegerBounds.lean": "63b0dc918785edca1bc89020d6ecafdb8df6a0ecd971694f6b0546858a69bfed",
  "LeanProblems/Problem000433IntegerDefs.lean": "115a14564c906d0d9ffe52f6f60d55856f09982528152ffaaaa782100c3830dc",
  "LeanProblems/Problem000433Large.lean": "a6f6c2ce241c623b8a382b44610ed3ab20e4029c092b727a9a08223b05f0f91a",
  "LeanProblems/Problem000433Middle.lean": "46e48fa86af69f12fdf9b9f9fcf01c80616ac73f207fc5cf959ea24290bfed2a",
  "LeanProblems/Problem000433Numeric.lean": "75b49c017bc6bf7cc435b783b6f31fc3d3919bf08fd63e953211c87797df3999",
  "LeanProblems/Problem000433SmallCases.lean": "0955e5a9249f7cd511f269d47ec78c4f2a7685976133987a65d4fa2337dc0928",
  "LeanProblems.lean": "6dbae43c09cce0d8b37c3021636edb17ae947f2f90c9159c590af75f9ee2166d",
  "lake-manifest.json": "c811982cc01324a974e48d77c1dbe4fdec2b6dce1cb27f96cfa3cfbde4890b44",
  "lakefile.toml": "4874666f3aaa99ee104f14f515df6fae39a575216e90daf2cdc0a6d211c578ee",
  "lean-toolchain": "8733782dc070a99b312039cda424f601b80f3be6f6f512627da5ba25adc27632"
}
```
