import LeanProblems.Problem000433
import Mathlib.Algebra.BigOperators.Field

/-!
# A finite weighted-multiples certificate for JSP 000433

This proves the abstract inequality behind the sharp-bound argument. It does
not assert that a particular coefficient sequence has been verified.
-/

namespace JSP.Problem000433

/-- Nonnegative weights on positive integers up to `n`. -/
def totalWeight (w : ℕ → ℚ) (n : ℕ) : ℚ :=
  ∑ k ∈ Finset.Icc 1 n, w k

/-- Disjoint sets of multiples convert local coverage into a global bound. -/
theorem reciprocalSum_le_totalWeight {n : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (w : ℕ → ℚ)
    (hw : ∀ k ∈ Finset.Icc 1 n, 0 ≤ w k)
    (hcover : ∀ a ∈ A, (1 : ℚ) / a ≤
      ∑ k ∈ Finset.Icc 1 n, if a ∣ k then w k else 0) :
    reciprocalSum A ≤ totalWeight w n := by
  calc
    reciprocalSum A ≤
        ∑ a ∈ A, ∑ k ∈ Finset.Icc 1 n, if a ∣ k then w k else 0 := by
      exact Finset.sum_le_sum hcover
    _ = ∑ k ∈ Finset.Icc 1 n, ∑ a ∈ A, if a ∣ k then w k else 0 := by
      rw [Finset.sum_comm]
    _ ≤ totalWeight w n := by
      apply Finset.sum_le_sum
      intro k hk
      have hcard : (A.filter (fun a => a ∣ k)).card ≤ 1 := by
        rw [Finset.card_le_one]
        intro a ha b hb
        simp only [Finset.mem_filter] at ha hb
        exact eq_of_common_multiple hA ha.1 hb.1
          (Finset.mem_Icc.mp hk).1 (Finset.mem_Icc.mp hk).2 ha.2 hb.2
      have hcardq : ((A.filter (fun a => a ∣ k)).card : ℚ) ≤ 1 := by
        exact_mod_cast hcard
      calc
        (∑ a ∈ A, if a ∣ k then w k else 0) =
            ((A.filter (fun a => a ∣ k)).card : ℚ) * w k := by
          rw [← Finset.sum_filter]
          simp
        _ ≤ 1 * w k := mul_le_mul_of_nonneg_right hcardq (hw k hk)
        _ = w k := one_mul _

/-- The discrete harmonic certificate associated with the coefficients `c`. -/
def harmonicCertificate (c : ℕ → ℚ) (n : ℕ) : ℚ :=
  ∑ k ∈ Finset.Icc 1 n, c (n / k) / k

/-- Rescaling the positive multiples of `a` preserves the quotient certificate. -/
theorem harmonicCertificate_multiples (c : ℕ → ℚ) (n a : ℕ) (ha : 0 < a) :
    (∑ k ∈ Finset.Icc 1 n, if a ∣ k then c (n / k) / k else 0) =
      harmonicCertificate c (n / a) / a := by
  rw [← Finset.sum_filter]
  calc
    (∑ k ∈ (Finset.Icc 1 n).filter (fun k => a ∣ k), c (n / k) / k) =
        ∑ j ∈ Finset.Icc 1 (n / a), c (n / (a * j)) / (a * j : ℕ) := by
      symm
      apply Finset.sum_bij (fun j _ => a * j)
      · intro j hj
        rcases Finset.mem_Icc.mp hj with ⟨hj, hjn⟩
        apply Finset.mem_filter.mpr
        refine ⟨Finset.mem_Icc.mpr ⟨by nlinarith, ?_⟩, dvd_mul_right _ _⟩
        have := (Nat.le_div_iff_mul_le ha).mp hjn
        simpa [Nat.mul_comm] using this
      · intro j hj k hk heq
        exact Nat.eq_of_mul_eq_mul_left ha heq
      · intro k hk
        rcases Finset.mem_filter.mp hk with ⟨hk, hak⟩
        rcases Finset.mem_Icc.mp hk with ⟨hkpos, hkn⟩
        refine ⟨k / a, Finset.mem_Icc.mpr ⟨?_, Nat.div_le_div_right hkn⟩, ?_⟩
        · exact Nat.div_pos (Nat.le_of_dvd hkpos hak) ha
        · exact Nat.mul_div_cancel' hak
      · intro j hj
        rfl
    _ = harmonicCertificate c (n / a) / a := by
      unfold harmonicCertificate
      rw [Finset.sum_div]
      apply Finset.sum_congr rfl
      intro j hj
      rw [← Nat.div_div_eq_div_mul, Nat.cast_mul]
      ring

/-- A certificate lower bound for smaller quotients gives the desired upper bound. -/
theorem reciprocalSum_le_harmonicCertificate {n : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (c : ℕ → ℚ) (hc : ∀ j, 0 ≤ c j)
    (hlower : ∀ q, 0 < q → q ≤ n → 1 ≤ harmonicCertificate c q) :
    reciprocalSum A ≤ harmonicCertificate c n := by
  apply reciprocalSum_le_totalWeight hA (fun k => c (n / k) / k)
  · intro k hk
    exact div_nonneg (hc _) (Nat.cast_nonneg _)
  · intro a ha
    rw [harmonicCertificate_multiples c n a (hA.1 a ha).1]
    exact div_le_div_of_nonneg_right
      (hlower (n / a) (Nat.div_pos (hA.1 a ha).2 (hA.1 a ha).1)
        (Nat.div_le_self _ _)) (Nat.cast_nonneg _)

/-- The exact finite set left for direct verification in the published certificate. -/
def certificateExceptions : Finset ℕ := {5, 13, 19, 20, 31, 32, 61, 62}

/-- Reduction of the unrestricted problem to arithmetic and eight finite cases.

The hypotheses below are the remaining work, not facts established by this theorem.
-/
theorem sharpBound_of_harmonicCertificate (c : ℕ → ℚ) (hc : ∀ j, 0 ≤ c j)
    (hlower : ∀ q, 0 < q → 1 ≤ harmonicCertificate c q)
    (hupper : ∀ n, n ∉ certificateExceptions → harmonicCertificate c n ≤ 31 / 30)
    (hexceptions : ∀ n ∈ certificateExceptions, ∀ A,
      Admissible n A → reciprocalSum A ≤ 31 / 30) : SharpBound := by
  intro n A hA
  by_cases hn : n ∈ certificateExceptions
  · exact hexceptions n hn A hA
  · exact (reciprocalSum_le_harmonicCertificate hA c hc
      (fun q hq _ => hlower q hq)).trans (hupper n hn)

end JSP.Problem000433
