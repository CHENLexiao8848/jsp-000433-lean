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
