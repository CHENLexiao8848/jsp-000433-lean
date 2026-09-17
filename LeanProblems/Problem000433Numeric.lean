import LeanProblems.Problem000433Coefficients
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Data.Rat.Cast.Order

namespace JSP.Problem000433

/-- A six-term rational lower bound for log((j+1)/j). -/
def logLower (j : ℕ) : ℚ :=
  2 * ∑ i ∈ Finset.range 6, ((1 : ℚ) / (2 * j + 1)) ^ (2 * i + 1) / (2 * i + 1)

def logUpper (j : ℕ) : ℚ :=
  logLower j + 2 * ((1 : ℚ) / (2 * j + 1)) ^ 13 /
    (1 - ((1 : ℚ) / (2 * j + 1)) ^ 2)

theorem logRatio_bounds (j : ℕ) (hj : 0 < j) :
    (logLower j : ℝ) ≤ Real.log (((j : ℝ) + 1) / j) ∧
      Real.log (((j : ℝ) + 1) / j) ≤ (logUpper j : ℝ) := by
  let x : ℝ := 1 / (2 * j + 1)
  have hjR : (0 : ℝ) < j := by exact_mod_cast hj
  have hx0 : 0 ≤ x := by dsimp [x]; positivity
  have hx1 : x < 1 := by
    dsimp [x]
    apply (div_lt_one (by positivity)).2
    linarith
  have hlo := Real.sum_range_le_log_div hx0 hx1 6
  have hhi := Real.log_div_le_sum_range_add hx0 hx1 6
  have hid : (1 + x) / (1 - x) = ((j : ℝ) + 1) / j := by
    dsimp [x]
    field_simp
    ring
  rw [hid] at hlo hhi
  norm_num only at hhi
  have hcast : (logLower j : ℝ) =
      2 * ∑ i ∈ Finset.range 6, x ^ (2 * i + 1) / (2 * i + 1) := by
    simp [logLower, x]
  have hcastU : (logUpper j : ℝ) = (logLower j : ℝ) +
      2 * x ^ 13 / (1 - x ^ 2) := by simp [logUpper, x]
  rw [hcastU, hcast]
  constructor
  · linarith
  · have ht : 2 * (x ^ 13 / (1 - x ^ 2)) = 2 * x ^ 13 / (1 - x ^ 2) := by ring
    linarith

noncomputable def coefficientLimit : ℝ :=
  ∑ j ∈ Finset.Icc 1 58, (coefficient j : ℝ) * Real.log (((j : ℝ) + 1) / j)

theorem coefficientLimit_bounds :
    (10172 : ℝ) / 10000 < coefficientLimit ∧ coefficientLimit < 10173 / 10000 := by
  have hlo : (10172 : ℚ) / 10000 <
      ∑ j ∈ Finset.Icc 1 58, coefficient j * logLower j := by
    decide +kernel
  have hhi : (∑ j ∈ Finset.Icc 1 58, coefficient j * logUpper j : ℚ) < 10173 / 10000 := by
    decide +kernel
  have hloR : (10172 : ℝ) / 10000 <
      ∑ j ∈ Finset.Icc 1 58, (coefficient j : ℝ) * (logLower j : ℝ) := by
    simpa only [Rat.cast_div, Rat.cast_ofNat, Rat.cast_sum, Rat.cast_mul] using
      (Rat.cast_lt (K := ℝ)).2 hlo
  have hhiR : (∑ j ∈ Finset.Icc 1 58, (coefficient j : ℝ) * (logUpper j : ℝ)) <
      10173 / 10000 := by
    simpa only [Rat.cast_div, Rat.cast_ofNat, Rat.cast_sum, Rat.cast_mul] using
      (Rat.cast_lt (K := ℝ)).2 hhi
  constructor
  · apply hloR.trans_le
    apply Finset.sum_le_sum
    intro j hj
    apply mul_le_mul_of_nonneg_left (logRatio_bounds j (Finset.mem_Icc.mp hj).1).1
    exact_mod_cast coefficient_nonneg j
  · apply lt_of_le_of_lt _ hhiR
    apply Finset.sum_le_sum
    intro j hj
    apply mul_le_mul_of_nonneg_left (logRatio_bounds j (Finset.mem_Icc.mp hj).1).2
    exact_mod_cast coefficient_nonneg j

end JSP.Problem000433
