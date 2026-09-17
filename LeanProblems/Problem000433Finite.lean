import LeanProblems.Problem000433SmallCases
import LeanProblems.Problem000433Certificate
import Mathlib.Data.Finset.Max

/-!
# Finite branch certificates for JSP 000433

The verifier branches on membership of the least remaining integer.
A branch closes whenever the sum of all remaining weights is within its budget.
The theorem below proves the verifier sound independently of its computation.
-/

namespace JSP.Problem000433

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- A finite exact upper-bound certificate, with bounded recursion. -/
def finiteBoundVerifier (n : ℕ) : ℕ → Finset ℕ → ℚ → Bool
  | 0, S, budget => decide (reciprocalSum S ≤ budget)
  | fuel + 1, S, budget =>
    if reciprocalSum S ≤ budget then true
    else if h : S.Nonempty then
      let a := S.min' h
      finiteBoundVerifier n fuel ((S.erase a).filter (fun b => n < Nat.lcm a b))
        (budget - (1 : ℚ) / a) &&
      finiteBoundVerifier n fuel (S.erase a) budget
    else false

private theorem admissible_subset {n : ℕ} {A B : Finset ℕ}
    (hA : Admissible n A) (hsub : B ⊆ A) : Admissible n B := by
  exact ⟨fun a ha => hA.1 a (hsub ha),
    fun a ha b hb hne => hA.2 a (hsub ha) b (hsub hb) hne⟩

private theorem reciprocalSum_mono {A S : Finset ℕ} (hsub : A ⊆ S) :
    reciprocalSum A ≤ reciprocalSum S := by
  apply Finset.sum_le_sum_of_subset_of_nonneg hsub
  intro a _ _
  exact div_nonneg (by norm_num) (Nat.cast_nonneg _)

/-- Any successfully checked branch budget bounds every admissible subset. -/
theorem finiteBoundVerifier_sound (n fuel : ℕ) (S : Finset ℕ) (budget : ℚ)
    (hcheck : finiteBoundVerifier n fuel S budget = true)
    (A : Finset ℕ) (hA : Admissible n A) (hsub : A ⊆ S) :
    reciprocalSum A ≤ budget := by
  induction fuel generalizing S budget A with
  | zero =>
    simp only [finiteBoundVerifier, decide_eq_true_eq] at hcheck
    exact (reciprocalSum_mono hsub).trans hcheck
  | succ fuel ih =>
    simp only [finiteBoundVerifier] at hcheck
    split_ifs at hcheck with hsum hnonempty
    · exact (reciprocalSum_mono hsub).trans hsum
    · have hboth := Bool.and_eq_true_iff.mp hcheck
      let a := S.min' hnonempty
      by_cases ha : a ∈ A
      · have hsub' : A.erase a ⊆
            (S.erase a).filter (fun b => n < Nat.lcm a b) := by
          intro b hb
          rcases Finset.mem_erase.mp hb with ⟨hne, hmem⟩
          exact Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨hne, hsub hmem⟩,
            hA.2 a ha b hmem (Ne.symm hne)⟩
        have hbound := ih _ _ hboth.1 (A.erase a)
          (admissible_subset hA (Finset.erase_subset _ _)) hsub'
        have hsplit : reciprocalSum A = reciprocalSum (A.erase a) + (1 : ℚ) / a :=
          (Finset.sum_erase_add A (fun a => (1 : ℚ) / a) ha).symm
        rw [hsplit]
        linarith
      · apply ih _ _ hboth.2 A hA
        intro b hb
        exact Finset.mem_erase.mpr ⟨by intro heq; apply ha; simpa [a, heq] using hb, hsub hb⟩

/-- Applying the verifier to `1,...,n` proves the full bound at that `n`. -/
theorem sharp_bound_of_finite_check (n : ℕ)
    (hcheck : finiteBoundVerifier n n (Finset.Icc 1 n) (31 / 30) = true)
    (A : Finset ℕ) (hA : Admissible n A) : reciprocalSum A ≤ 31 / 30 := by
  apply finiteBoundVerifier_sound n n _ _ hcheck A hA
  intro a ha
  exact Finset.mem_Icc.mpr (hA.1 a ha)

theorem sharp_bound_thirteen (A : Finset ℕ) (hA : Admissible 13 A) :
    reciprocalSum A ≤ 31 / 30 := by
  apply sharp_bound_of_finite_check 13 _ A hA
  decide +kernel

theorem sharp_bound_nineteen (A : Finset ℕ) (hA : Admissible 19 A) :
    reciprocalSum A ≤ 31 / 30 := by
  apply sharp_bound_of_finite_check 19 _ A hA
  decide +kernel

theorem sharp_bound_twenty (A : Finset ℕ) (hA : Admissible 20 A) :
    reciprocalSum A ≤ 31 / 30 := by
  apply sharp_bound_of_finite_check 20 _ A hA
  decide +kernel

theorem sharp_bound_thirty_one (A : Finset ℕ) (hA : Admissible 31 A) :
    reciprocalSum A ≤ 31 / 30 := by
  apply sharp_bound_of_finite_check 31 _ A hA
  decide +kernel

theorem sharp_bound_thirty_two (A : Finset ℕ) (hA : Admissible 32 A) :
    reciprocalSum A ≤ 31 / 30 := by
  apply sharp_bound_of_finite_check 32 _ A hA
  decide +kernel

/-- Six exceptional endpoints are covered; 61 and 62 are still separate goals. -/
theorem sharp_bound_at_small_exceptions (n : ℕ) (hn : n ∈ certificateExceptions)
    (h61 : n ≠ 61) (h62 : n ≠ 62)
    (A : Finset ℕ) (hA : Admissible n A) : reciprocalSum A ≤ 31 / 30 := by
  simp only [certificateExceptions, Finset.mem_insert, Finset.mem_singleton] at hn
  rcases hn with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact sharp_bound_of_le_five (by omega) hA
  · exact sharp_bound_thirteen A hA
  · exact sharp_bound_nineteen A hA
  · exact sharp_bound_twenty A hA
  · exact sharp_bound_thirty_one A hA
  · exact sharp_bound_thirty_two A hA
  · exact (h61 rfl).elim
  · exact (h62 rfl).elim

end JSP.Problem000433
