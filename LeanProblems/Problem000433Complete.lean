import LeanProblems.Problem000433Large
import LeanProblems.Problem000433Middle
import LeanProblems.Problem000433FiniteCertificate
import LeanProblems.Problem000433Endpoint61
import LeanProblems.Problem000433Endpoint62

namespace JSP.Problem000433

/-- The numerical certificate covers all positive quotients. -/
theorem coefficient_lower (q : ℕ) (hq : 0 < q) : 1 ≤ harmonicCertificate coefficient q := by
  by_cases hsmall : q ≤ 365
  · exact (certificate_through_365 q hq hsmall).1
  by_cases hlarge : 1400 ≤ q
  · exact (coefficient_bounds_large q hlarge).1
  exact (coefficient_bounds_middle q (by omega) (by omega)).1

theorem coefficient_upper (q : ℕ) (hq : q ∉ certificateExceptions) :
    harmonicCertificate coefficient q ≤ 31/30 := by
  by_cases hzero : q = 0
  · subst q
    norm_num [harmonicCertificate]
  by_cases hsmall : q ≤ 365
  · exact ((certificate_through_365 q (by omega) hsmall).2 hq).le
  by_cases hlarge : 1400 ≤ q
  · exact (coefficient_bounds_large q hlarge).2.le
  exact (coefficient_bounds_middle q (by omega) (by omega)).2.le

theorem sharp_bound_at_exceptions (q : ℕ) (hq : q ∈ certificateExceptions)
    (A : Finset ℕ) (hA : Admissible q A) : reciprocalSum A ≤ 31/30 := by
  by_cases h61 : q = 61
  · subst q
    exact sharp_bound_endpoint61 A hA
  by_cases h62 : q = 62
  · subst q
    exact sharp_bound_endpoint62 A hA
  exact sharp_bound_at_small_exceptions q hq h61 h62 A hA

/-- Schinzel--Szekeres' sharp bound, with all hypotheses discharged. -/
theorem sharpBound : SharpBound :=
  sharpBound_of_harmonicCertificate coefficient coefficient_nonneg
    coefficient_lower coefficient_upper sharp_bound_at_exceptions

/-- JSP 000433 / Erdős 542, the unrestricted reciprocal-sum theorem. -/
theorem jsp_000433 (n : ℕ) (A : Finset ℕ) (hA : Admissible n A) :
    reciprocalSum A ≤ 31/30 := sharpBound n A hA

/-- The usual real-valued statement with the hypotheses written explicitly. -/
theorem jsp_000433_real (n : ℕ) (A : Finset ℕ)
    (hpos : ∀ a ∈ A, 0 < a) (hle : ∀ a ∈ A, a ≤ n)
    (hlcm : ∀ a ∈ A, ∀ b ∈ A, a ≠ b → n < Nat.lcm a b) :
    (∑ a ∈ A, (1 : ℝ) / a) ≤ 31/30 := by
  have hA : Admissible n A := ⟨fun a ha => ⟨hpos a ha, hle a ha⟩, hlcm⟩
  have h := (Rat.cast_le (K := ℝ)).2 (jsp_000433 n A hA)
  simpa [reciprocalSum] using h

/-- The constant is optimal, not merely a valid upper bound. -/
theorem optimal_constant :
    SharpBound ∧ ∀ C : ℚ,
      (∀ (n : ℕ) (A : Finset ℕ), Admissible n A → reciprocalSum A ≤ C) → 31/30 ≤ C :=
  ⟨sharpBound, sharp_lower_bound⟩

end JSP.Problem000433
