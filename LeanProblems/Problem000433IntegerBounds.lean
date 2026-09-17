import LeanProblems.Problem000433IntegerDefs

namespace JSP.Problem000433

abbrev IntegerCertificateAt (q : ℕ) : Prop :=
  commonDenominator * 1000000 ≤ integerCertificate q ∧
    30 * (integerCertificate q + q) < 31 * commonDenominator * 1000000

theorem nat_div_rat_bounds (a k : ℕ) (hk : 0 < k) :
    (a/k : ℕ) ≤ (a : ℚ)/k ∧ (a : ℚ)/k < (a/k : ℕ)+1 := by
  have hkQ : (0 : ℚ) < k := by exact_mod_cast hk
  constructor
  · apply (le_div_iff₀ hkQ).mpr
    exact_mod_cast Nat.div_mul_le_self a k
  · apply (div_lt_iff₀ hkQ).mpr
    exact_mod_cast ((Nat.div_lt_iff_lt_mul hk).mp (Nat.lt_succ_self (a/k)))

theorem integerCertificate_bounds (q : ℕ) :
    (integerCertificate q : ℚ) ≤ harmonicCertificate coefficient q * (commonDenominator * 1000000) ∧
    harmonicCertificate coefficient q * (commonDenominator * 1000000) ≤ (integerCertificate q : ℚ) + q := by
  have hD : (commonDenominator : ℚ) ≠ 0 := by norm_num [commonDenominator]
  have heq : harmonicCertificate coefficient q * (commonDenominator * 1000000) =
      ∑ k ∈ Finset.Icc 1 q, ((scaledCoefficient (q/k) * 1000000 : ℕ) : ℚ) / k := by
    unfold harmonicCertificate
    rw [Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro k hk
    rw [coefficient_scaled]
    push_cast
    field_simp
  rw [heq]
  constructor
  · simp only [integerCertificate, Nat.cast_sum]
    apply Finset.sum_le_sum
    intro k hk
    exact (nat_div_rat_bounds _ k (Finset.mem_Icc.mp hk).1).1
  · calc
      (∑ k ∈ Finset.Icc 1 q, ((scaledCoefficient (q/k) * 1000000 : ℕ) : ℚ) / k) ≤
          ∑ k ∈ Finset.Icc 1 q, (((scaledCoefficient (q/k)*1000000/k : ℕ) : ℚ)+1) := by
        apply Finset.sum_le_sum
        intro k hk
        exact (nat_div_rat_bounds _ k (Finset.mem_Icc.mp hk).1).2.le
      _ = (integerCertificate q : ℚ) + q := by
        simp [integerCertificate, Finset.sum_add_distrib]

theorem certificate_of_integer (q : ℕ) (hc : IntegerCertificateAt q) :
    1 ≤ harmonicCertificate coefficient q ∧ harmonicCertificate coefficient q < 31/30 := by
  have hD : (0 : ℚ) < commonDenominator * 1000000 := by norm_num [commonDenominator]
  have hb := integerCertificate_bounds q
  have hlo : (commonDenominator * 1000000 : ℚ) ≤ integerCertificate q := by exact_mod_cast hc.1
  have hhi : (30 : ℚ) * ((integerCertificate q : ℚ)+q) < 31*commonDenominator*1000000 := by exact_mod_cast hc.2
  constructor
  · apply (le_mul_iff_one_le_left hD).mp
    exact hlo.trans hb.1
  · apply (mul_lt_mul_iff_left₀ hD).mp
    nlinarith [hb.2]

end JSP.Problem000433
