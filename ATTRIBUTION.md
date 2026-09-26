# Attribution and source disclosure

## Mathematics

A. Schinzel and G. Szekeres proved the sharp universal bound 31/30 in Theorem 1
of *Sur un problème de M. Paul Erdős*, Acta Sci. Math. (Szeged) 20 (1959),
221–229. Paul Erdős posed the problem. Mathematical priority is unchanged.

- [Problem and references](https://www.erdosproblems.com/542)
- [Bibliographic record](https://www.erdosproblems.com/bibs/ScSz59)
- [Publisher scan](https://www.acta.hu/download.phtml?id=617)

## Formalization and release

- OpenAI Codex, including cooperating AI agents, generated and iteratively
  developed the Lean proofs, supporting lemmas, and exact finite certificate
  declarations in this project. This is AI-assisted formalization.
- [CHENLexiao8848](https://github.com/CHENLexiao8848) initiated and directed
  the project and authorized the public release and catalog submission. The
  account is the project/release maintainer and submitter, not the mathematical
  solver or the sole human author of every proof line.
- The release extracts the complete theorem's import closure and supplies
  reproducible validation. No independent human verifier is claimed.

Non-library Lean code for this result was developed in this task, rather than
copied from another public Lean proof. External Lean dependencies are Mathlib
and its pinned dependencies; their authorship and licenses are retained by the
upstream projects. Mathlib is Apache-2.0 and is downloaded by Lake, not vendored.
This repository's license does not relicense dependencies or the paper.

## Related work

[Issue 472](https://github.com/TheJustinSunPrize/awards/issues/472) concerns the
weaker classical bound <2; [PR 705](https://github.com/TheJustinSunPrize/awards/pull/705)
concerns finite sharpness examples. Both were inspected for scope; their proof
source was not copied. This release proves the unrestricted upper bound <=31/30
and optimality. No first-formalization, award or eligibility claim is made.

## Coefficients

The paper's recurrence was used to choose rational coefficients. Its printed c28
appears to differ from the recurrence by 1/2230928700. All properties of the
actual constants in Problem000433Coefficients.lean needed by the final theorem
are independently proved in Lean. Neither printed arithmetic, Python output,
nor a floating-point approximation is a proof premise.

## Complete prior-formalization disclosure added 2026-09-26

The original release at `4c13444405613792d0ee87e89ca246b104b3b166` compared with
partial submissions but omitted a complete comparator. The pinned
[plby Erdos542 source](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos542.lean),
commit `8822f7ddef30fadbd92e1c6ab4ed897af356af5e`, already proves the universal
`31/30` upper bound (`erdos542_reciprocal_bound`, line 1136) and the attaining
example (`erdos542_sharp_example`, line 1152); its `erdos_542` at line 2114
also includes results about the separate uncovered-divisor question. Its header
credits Schinzel/Szekeres for the informal result and Codex/GPT-5.6 Sol for
formalization. This disclosure supplements the historical release; it does not
claim its immutable attribution file already included this comparison.

Both implementations use the published Schinzel–Szekeres harmonic-certificate
method. This repository's selected implementation includes local rational
certificate lemmas, analytic estimates, a sound finite admissible-subset
verifier, generated split certificates for endpoints 61 and 62, and rational
and real terminal interfaces. The inspected plby proof handles the exceptional
upper bounds using designated pairs which cannot both be covered and missing
weight. These are implementation differences for reviewers to assess, not a
claim of mathematical novelty, independently established provenance, first
formalization or award priority. The earlier local-development statement is a
recorded provenance statement, not an independent historical audit.

The precise mathematical source is A. Schinzel and G. Szekeres, *Sur un problème
de M. Paul Erdős*, Acta Sci. Math. (Szeged) 20 (1959), 221–229, Theorem 1 p.222,
proof pp.227–228, supported by Lemmas 1–2 pp.222–227
([primary-source scan](https://acta.bibl.u-szeged.hu/13886/1/math_020_221-229.pdf)).
The submitted reciprocal-sum theorem does not claim the paper's equality-case
uniqueness or the additional uncovered-divisor question. Mathematical credit
and the original AI/human role disclosures remain as stated above.
