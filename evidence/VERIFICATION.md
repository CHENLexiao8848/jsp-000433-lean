# Verification of this release

Date: 2026-09-17. Platform: Windows x86-64. Lean 4.34.0, Mathlib v4.34.0.

## Scope and source integrity

The 28 modules in this repository are the complete local import closure of
LeanProblems.Problem000433Complete. Each is byte-identical to the successfully
verified development source. The exact toolchain and dependency lock were
retained. The focused library root imports that theorem, and the Lake package
configuration removes only libraries for other unfinished problems.

SOURCE-SHA256.json fixes all 28 proof modules, the root, Audit.lean, toolchain,
Lake configuration and dependency lock (33 inputs). All imports resolve to
these files or pinned Mathlib dependencies.

## Commands actually run

| Command | Exit | Evidence |
| --- | --- | --- |
| Original development: lake build | 0 | original-build.log |
| Original recursive axiom audit | 0 | original-axiom-audit.log |
| Release: lake --rehash build | 0 | release-build.log |
| Release: python scripts/verify.py | 0 | release-verification.log |

The release build rehashed and reused the already checked proof-module build
artifacts, and built the focused root. This was not a clean or fresh proof
recompilation. The local cache used for that check is excluded from publication.
The normal commands in README restore dependencies without that cache.

The release verification script rechecks all 33 input hashes, scans the proof
sources for placeholders/custom axioms/native decisions, and executes:

~~~sh
lake env lean -j1 Audit.lean
~~~

The 32 named recursive axiom reports all contain only propext,
Classical.choice and Quot.sound, including jsp_000433, jsp_000433_real and
optimal_constant. The audit reports the transitive axioms of the final theorems,
so finite kernel-evaluated declarations and analytic dependencies are covered.

## Mathematical correspondence

The final statement covers every n, every finite A, positivity and a<=n,
and all distinct pairs' lcm condition. It proves <=31/30 and the attaining
example. The certificate lower and upper bounds are fully discharged for
q<=365, 366<=q<=1399 and q>=1400; all eight exceptional endpoints are proved.
Neither a finite cutoff, a weaker <2 bound, nor an unproved certificate input
is substituted for the final theorem.

Automated proof checking and AI-assisted scope review are reported as such.
There is no claim of independent human verification or organizer approval.
