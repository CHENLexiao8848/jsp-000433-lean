import LeanProblems.Problem000433Certificate
import Mathlib.Tactic.IntervalCases

namespace JSP.Problem000433

/-- Exact rational coefficients reconstructed from the recurrence in the paper. -/
def coefficient : ℕ → ℚ
  | 1 => 1
  | 2 => 1 / 2
  | 3 => 1 / 6
  | 4 => 1 / 6
  | 6 => 2 / 15
  | 10 => 31 / 420
  | 15 => 2021 / 45045
  | 16 => 2021 / 45045
  | 22 => 3565609 / 116396280
  | 28 => 148279331 / 6692786100
  | 35 => 17694671471 / 1504203675975
  | 36 => 104205434239 / 6016814703900
  | 58 => 77337724377074022791 / 13687446560419818786600
  | _ => 0

theorem coefficient_nonneg (j : ℕ) : 0 ≤ coefficient j := by
  unfold coefficient
  split <;> norm_num

/-- Initial exact coverage check, kernel evaluated. -/
theorem coverage_through_fifty_eight :
    ∀ q ∈ Finset.Icc 1 58, 1 ≤ harmonicCertificate coefficient q := by
  set_option maxRecDepth 100000 in
  set_option maxHeartbeats 0 in
  decide +kernel


end JSP.Problem000433
