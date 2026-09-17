import LeanProblems.Problem000433Grouping
import LeanProblems.Problem000433Numeric
import LeanProblems.Problem000433Asymptotic

namespace JSP.Problem000433

theorem coefficient_error_moment :
    (∑ j ∈ Finset.Icc 1 58, coefficient j * (2*j+1) : ℚ) < 20 := by
  decide +kernel

theorem coefficient_global_error (q : ℕ) (hq : 59 < q) :
    |(harmonicCertificate coefficient q : ℝ) - coefficientLimit| < 20 / ((q : ℝ)-59) := by
  have hqR : (59 : ℝ) < q := by exact_mod_cast hq
  rw [coefficient_grouped]
  simp only [Rat.cast_sum, Rat.cast_mul]
  unfold coefficientLimit
  rw [← Finset.sum_sub_distrib]
  calc
    |∑ j ∈ Finset.Icc 1 58, ((coefficient j : ℝ) * ↑(harmonic (q/j) - harmonic (q/(j+1))) -
        (coefficient j : ℝ) * Real.log (((j : ℝ)+1)/j))| ≤
        ∑ j ∈ Finset.Icc 1 58, |(coefficient j : ℝ) * ↑(harmonic (q/j) - harmonic (q/(j+1))) -
        (coefficient j : ℝ) * Real.log (((j : ℝ)+1)/j)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ j ∈ Finset.Icc 1 58, (coefficient j : ℝ) * ((2*(j : ℝ)+1)/((q : ℝ)-59)) := by
      apply Finset.sum_le_sum
      intro j hj
      have hc : (0 : ℝ) ≤ coefficient j := by exact_mod_cast coefficient_nonneg j
      rw [← mul_sub, abs_mul, abs_of_nonneg hc]
      apply mul_le_mul_of_nonneg_left _ hc
      exact harmonic_block_log_error q j 59 (Finset.mem_Icc.mp hj).1
        (by have := (Finset.mem_Icc.mp hj).2; omega) hq
    _ = (∑ j ∈ Finset.Icc 1 58, (coefficient j : ℝ) * (2*(j : ℝ)+1)) / ((q : ℝ)-59) := by
      simp only [mul_div_assoc, Finset.sum_div]
    _ < 20 / ((q : ℝ)-59) := by
      apply (div_lt_div_iff_of_pos_right (by linarith)).mpr
      have hm := (Rat.cast_lt (K := ℝ)).2 coefficient_error_moment
      simpa using hm

/-- The infinite tail of the numerical certificate. -/
theorem coefficient_bounds_large (q : ℕ) (hq : 1400 ≤ q) :
    1 ≤ harmonicCertificate coefficient q ∧ harmonicCertificate coefficient q < 31/30 := by
  have hqR : (1400 : ℝ) ≤ q := by exact_mod_cast hq
  have herr := coefficient_global_error q (by omega)
  have hsmall : (20 : ℝ)/((q : ℝ)-59) < 3/200 := by
    apply (div_lt_iff₀ (by linarith)).mpr
    linarith
  have hb := coefficientLimit_bounds
  have hlowR : (1 : ℝ) ≤ harmonicCertificate coefficient q := by
    have := (abs_lt.mp (herr.trans hsmall)).1
    linarith [hb.1]
  have huppR : (harmonicCertificate coefficient q : ℝ) < 31/30 := by
    have := (abs_lt.mp (herr.trans hsmall)).2
    linarith [hb.2]
  constructor
  · exact_mod_cast hlowR
  · apply (Rat.cast_lt (K := ℝ)).mp
    simpa using huppR

end JSP.Problem000433
