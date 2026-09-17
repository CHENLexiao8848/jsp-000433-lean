import LeanProblems.Problem000433Coefficients
import Mathlib.NumberTheory.Harmonic.Bounds

namespace JSP.Problem000433

theorem quotient_fiber (q j : ℕ) (hj : 0 < j) :
    (Finset.Icc 1 q).filter (fun k => q / k = j) = Finset.Ioc (q / (j+1)) (q / j) := by
  ext k
  simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_Ioc]
  constructor
  · rintro ⟨⟨hk, hkq⟩, hkj⟩
    have hlo : j * k ≤ q := (Nat.le_div_iff_mul_le hk).mp (by omega)
    have hhi : q < (j+1)*k := (Nat.div_lt_iff_lt_mul hk).mp (by omega)
    constructor
    · exact (Nat.div_lt_iff_lt_mul (by omega)).mpr (by simpa [Nat.mul_comm] using hhi)
    · exact (Nat.le_div_iff_mul_le hj).mpr (by simpa [Nat.mul_comm] using hlo)
  · rintro ⟨hlo, hhi⟩
    have hk : 0 < k := lt_of_le_of_lt (Nat.zero_le _) hlo
    have hkj : k*j ≤ q := (Nat.le_div_iff_mul_le hj).mp hhi
    have hqk : q < k*(j+1) := (Nat.div_lt_iff_lt_mul (by omega)).mp hlo
    refine ⟨⟨hk, ?_⟩, ?_⟩
    · nlinarith
    · have hle : j ≤ q/k := (Nat.le_div_iff_mul_le hk).mpr (by simpa [Nat.mul_comm] using hkj)
      have hlt : q/k < j+1 := (Nat.div_lt_iff_lt_mul hk).mpr (by simpa [Nat.mul_comm] using hqk)
      omega

theorem sum_Ioc_reciprocal (a b : ℕ) (hab : a ≤ b) :
    (∑ k ∈ Finset.Ioc a b, (1 : ℚ) / k) = harmonic b - harmonic a := by
  rw [harmonic_eq_sum_Icc, harmonic_eq_sum_Icc]
  have hdis : Disjoint (Finset.Icc 1 a) (Finset.Ioc a b) := by
    apply Finset.disjoint_left.mpr
    intro x hx hx'
    simp only [Finset.mem_Icc, Finset.mem_Ioc] at hx hx'
    omega
  have hunion : Finset.Icc 1 a ∪ Finset.Ioc a b = Finset.Icc 1 b := by
    ext x
    simp only [Finset.mem_union, Finset.mem_Icc, Finset.mem_Ioc]
    omega
  rw [← hunion, Finset.sum_union hdis]
  simp only [add_sub_cancel_left, one_div]

theorem harmonicCertificate_grouped (c : ℕ → ℚ) (q J : ℕ)
    (hsupport : ∀ j, J < j → c j = 0) :
    harmonicCertificate c q = ∑ j ∈ Finset.Icc 1 J,
      c j * (harmonic (q / j) - harmonic (q / (j+1))) := by
  unfold harmonicCertificate
  calc
    (∑ k ∈ Finset.Icc 1 q, c (q/k) / k) =
        ∑ k ∈ Finset.Icc 1 q, ∑ j ∈ Finset.Icc 1 J, if q/k = j then c j / k else 0 := by
      apply Finset.sum_congr rfl
      intro k hk
      have hk1 := (Finset.mem_Icc.mp hk).1
      have hkq := (Finset.mem_Icc.mp hk).2
      have hpos : 0 < q/k := Nat.div_pos hkq hk1
      by_cases hj : q/k ≤ J
      · symm
        exact Finset.sum_eq_single_of_mem (q/k) (Finset.mem_Icc.mpr ⟨hpos,hj⟩)
          (fun b hb hne => by simp [Ne.symm hne]) |>.trans (by simp)
      · have hc : c (q/k) = 0 := hsupport _ (by omega)
        rw [hc, zero_div]
        symm
        apply Finset.sum_eq_zero
        intro j hjmem
        have hne : q/k ≠ j := by have := (Finset.mem_Icc.mp hjmem).2; omega
        simp [hne]
    _ = ∑ j ∈ Finset.Icc 1 J, ∑ k ∈ Finset.Icc 1 q, if q/k = j then c j / k else 0 := by
      rw [Finset.sum_comm]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro j hj
      rw [← Finset.sum_filter, quotient_fiber q j (Finset.mem_Icc.mp hj).1]
      have hle : q/(j+1) ≤ q/j := Nat.div_le_div_left (by omega) (Finset.mem_Icc.mp hj).1
      rw [← sum_Ioc_reciprocal (q/(j+1)) (q/j) hle, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro k hk
      ring

theorem coefficient_support (j : ℕ) (hj : 58 < j) : coefficient j = 0 := by
  unfold coefficient
  split <;> first | rfl | omega

theorem coefficient_grouped (q : ℕ) :
    harmonicCertificate coefficient q = ∑ j ∈ Finset.Icc 1 58,
      coefficient j * (harmonic (q/j) - harmonic (q/(j+1))) :=
  harmonicCertificate_grouped coefficient q 58 coefficient_support

end JSP.Problem000433
