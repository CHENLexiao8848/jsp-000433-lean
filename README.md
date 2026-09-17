# JSP-000433: the sharp lcm reciprocal-sum bound

Complete Lean 4 proof of the reciprocal-sum problem in
[JSP-000433](https://github.com/TheJustinSunPrize/awards/blob/main/problems/catalog-0401-0500.md#JSP-000433),
corresponding to the first question of [Erdős problem 542](https://www.erdosproblems.com/542).

For every natural n and finite set A of positive natural numbers at most n,
if lcm(a,b)>n for all distinct a,b in A, then the sum of 1/a over A is at most
31/30. The constant is optimal: n=5 and A={2,3,5} attain equality.

There is no cutoff on n, no cardinality restriction on A, and no remaining
certificate or analytic assumption. Empty sets and n=0 are included.
The separate second question on the Erdős 542 page about uncovered divisors
is not the reciprocal-sum problem in this catalog entry and is not claimed here.

## Public theorems

File: [LeanProblems/Problem000433Complete.lean](LeanProblems/Problem000433Complete.lean).

| Declaration | Scope |
| --- | --- |
| JSP.Problem000433.jsp_000433 | Full rational reciprocal-sum inequality |
| JSP.Problem000433.jsp_000433_real | Real-valued statement, all hypotheses explicit |
| JSP.Problem000433.optimal_constant | Full inequality and optimality |

Admissible, in Problem000433.lean, contains exactly positivity, the bound a<=n,
and the pairwise-lcm condition. The final sharpBound theorem discharges all
premises of the intermediate certificate reduction.

## Reproduce

Install [elan](https://github.com/leanprover/elan), then run in this repository:

~~~sh
lake exe cache get
lake build
lake env lean -j1 Audit.lean
python scripts/verify.py
~~~

Python 3.10+ is used only for source-integrity and audit-output checks. It is not
a mathematical oracle. Lake obtains the pinned dependencies. No sibling project,
local cache, credentials, external proof service, or generator is required.
All generated Lean certificate declarations are included.

- Lean: leanprover/lean4:v4.34.0.
- Mathlib: v4.34.0, commit 5ed2965256430c3649e86755f9576b54eca72435.
- Complete dependency lock: [lake-manifest.json](lake-manifest.json).

## Proof and validation

Disjoint positive-multiple clusters give a weighted-sum bound. Grouping by
integer quotients gives harmonic blocks. Explicit logarithm-series and harmonic
error bounds verify q>=1400. Exact kernel checks cover the remaining finite
ranges and all eight exceptional endpoints. A separate witness proves optimality.

No sorry, admit, custom axioms or native_decide are used. The final recursive
axiom reports contain only propext, Classical.choice and Quot.sound.
See [verification evidence](evidence/VERIFICATION.md) and the
[source-hash manifest](evidence/SOURCE-SHA256.json).
No independent human review, prize eligibility or award approval is asserted.

## Attribution

The sharp bound is due to A. Schinzel and G. Szekeres, Theorem 1 of
*Sur un problème de M. Paul Erdős*, Acta Sci. Math. (Szeged) 20 (1959), 221–229.
[Bibliographic record](https://www.erdosproblems.com/bibs/ScSz59),
[publisher scan](https://www.acta.hu/download.phtml?id=617).

The Lean code was developed with OpenAI Codex assistance in a project initiated
and released by [CHENLexiao8848](https://github.com/CHENLexiao8848).
See [ATTRIBUTION.md](ATTRIBUTION.md) for distinct mathematical, formalization
and release roles, source licenses, and related partial work.
