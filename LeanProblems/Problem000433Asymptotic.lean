import LeanProblems.Problem000433Certificate
import Mathlib.NumberTheory.Harmonic.Bounds
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.Algebra.Order.Floor.Semifield

/-!
# Quantitative harmonic estimates for the sharp certificate

These generic estimates are separate from the finite arithmetic certificates.
-/

namespace JSP.Problem000433

theorem harmonic_log_error (m : ℕ) (hm : 0 < m) :
    |(harmonic m : ℝ) - Real.log m - Real.eulerMascheroniConstant| ≤ 1 / m := by
  have hlo := Real.eulerMascheroniConstant_lt_eulerMascheroniSeq' m
  have hhi := Real.eulerMascheroniSeq_lt_eulerMascheroniConstant m
  simp only [Real.eulerMascheroniSeq', hm.ne', ite_false] at hlo
  unfold Real.eulerMascheroniSeq at hhi
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  have hlog : Real.log ((m : ℝ) + 1) - Real.log m ≤ 1 / m := by
    rw [← Real.log_div (by positivity) (ne_of_gt hmR)]
    calc
      Real.log (((m : ℝ) + 1) / m) ≤ ((m : ℝ) + 1) / m - 1 :=
        Real.log_le_sub_one_of_pos (by positivity)
      _ = 1 / m := by field_simp; ring
  rw [abs_of_nonneg (by linarith)]
  linarith

end JSP.Problem000433

namespace JSP.Problem000433

/-- An explicit bound after flooring a positive rational argument. -/
theorem harmonic_floor_log_error (q d : ℕ) (hd : 0 < d) (hqd : d < q) :
    |(harmonic (q/d) : ℝ) - Real.log ((q : ℝ) / d) - Real.eulerMascheroniConstant| ≤
      (d : ℝ) / ((q : ℝ) - d) := by
  let m : ℕ := q/d
  have hm : 0 < m := Nat.div_pos (by omega) hd
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hqdR : (d : ℝ) < q := by exact_mod_cast hqd
  have hqR : (0 : ℝ) < q := by linarith
  have hloNat : m*d ≤ q := Nat.div_mul_le_self q d
  have hhiNat : q < (m+1)*d := (Nat.div_lt_iff_lt_mul hd).mp (by dsimp [m]; omega)
  have hloR : (m : ℝ) ≤ (q : ℝ)/d := by
    apply (le_div_iff₀ hdR).mpr
    exact_mod_cast hloNat
  have hhiR : (q : ℝ)/d < (m : ℝ)+1 := by
    apply (div_lt_iff₀ hdR).mpr
    exact_mod_cast hhiNat
  have helo := Real.eulerMascheroniConstant_lt_eulerMascheroniSeq' m
  have hehi := Real.eulerMascheroniSeq_lt_eulerMascheroniConstant m
  simp only [Real.eulerMascheroniSeq', hm.ne', ite_false] at helo
  unfold Real.eulerMascheroniSeq at hehi
  have hloglo : Real.log (m : ℝ) ≤ Real.log ((q : ℝ)/d) :=
    Real.log_le_log hmR hloR
  have hloghi : Real.log ((q : ℝ)/d) ≤ Real.log ((m : ℝ)+1) :=
    Real.log_le_log (by positivity) hhiR.le
  have hstep : Real.log ((m : ℝ)+1) - Real.log m ≤ (1 : ℝ)/m := by
    rw [← Real.log_div (by positivity) (ne_of_gt hmR)]
    calc
      Real.log (((m : ℝ)+1)/m) ≤ ((m : ℝ)+1)/m - 1 := Real.log_le_sub_one_of_pos (by positivity)
      _ = 1/m := by field_simp; ring
  have herr : |(harmonic m : ℝ) - Real.log ((q : ℝ)/d) - Real.eulerMascheroniConstant| ≤ 1/m := by
    rw [abs_le]
    constructor <;> linarith
  apply herr.trans
  apply (div_le_div_iff₀ hmR (by linarith : (0 : ℝ) < q-d)).mpr
  have hhiCast : (q : ℝ) < ((m : ℝ)+1)*d := by exact_mod_cast hhiNat
  nlinarith

theorem harmonic_block_log_error (q j J : ℕ) (hj : 0 < j) (hjJ : j+1 ≤ J) (hJq : J < q) :
    |((harmonic (q/j) - harmonic (q/(j+1)) : ℚ) : ℝ) - Real.log (((j : ℝ)+1)/j)| ≤
      (2*(j : ℝ)+1)/((q : ℝ)-J) := by
  have hjR : (0 : ℝ) < j := by exact_mod_cast hj
  have hqR : (0 : ℝ) < q := by exact_mod_cast (show 0 < q by omega)
  have hJqR : (J : ℝ) < q := by exact_mod_cast hJq
  have hjJR : (j : ℝ)+1 ≤ J := by exact_mod_cast hjJ
  have h₁ := harmonic_floor_log_error q j hj (by omega)
  have h₂ := harmonic_floor_log_error q (j+1) (by omega) (by omega)
  have hid : Real.log ((q : ℝ)/j) - Real.log ((q : ℝ)/(j+1)) = Real.log (((j : ℝ)+1)/j) := by
    rw [Real.log_div (ne_of_gt hqR) (ne_of_gt hjR),
      Real.log_div (ne_of_gt hqR) (by positivity), Real.log_div (by positivity) (ne_of_gt hjR)]
    ring
  have htri := abs_sub ((harmonic (q/j) : ℝ) - Real.log ((q : ℝ)/j) - Real.eulerMascheroniConstant)
    ((harmonic (q/(j+1)) : ℝ) - Real.log ((q : ℝ)/(j+1)) - Real.eulerMascheroniConstant)
  have hident : ((harmonic (q/j) : ℝ) - Real.log ((q : ℝ)/j) - Real.eulerMascheroniConstant) -
      ((harmonic (q/(j+1)) : ℝ) - Real.log ((q : ℝ)/(j+1)) - Real.eulerMascheroniConstant) =
      ((harmonic (q/j) - harmonic (q/(j+1)) : ℚ) : ℝ) - Real.log (((j : ℝ)+1)/j) := by
    push_cast
    rw [← hid]
    ring
  rw [hident] at htri
  have hden₁ : (j : ℝ)/((q : ℝ)-j) ≤ (j : ℝ)/((q : ℝ)-J) := by
    apply div_le_div_of_nonneg_left (le_of_lt hjR) (by linarith) (by linarith)
  have hden₂ : ((j+1 : ℕ) : ℝ)/((q : ℝ)-(j+1 : ℕ)) ≤ ((j : ℝ)+1)/((q : ℝ)-J) := by
    push_cast
    apply div_le_div_of_nonneg_left (by positivity) (by linarith) (by linarith)
  have hsum := add_le_add (h₁.trans hden₁) (h₂.trans hden₂)
  push_cast at hsum
  have hadd : (j : ℝ)/((q : ℝ)-J) + ((j : ℝ)+1)/((q : ℝ)-J) =
      (2*(j : ℝ)+1)/((q : ℝ)-J) := by ring
  rw [hadd] at hsum
  exact htri.trans hsum

end JSP.Problem000433
