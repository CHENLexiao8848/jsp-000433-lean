import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.Field.Rat
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-!
# JSP 000433: reciprocal sums under an lcm constraint

The target is the sharp bound 31/30, not the weaker bound 2.
No assertion of the sharp bound is made until its proof is complete.
-/

namespace JSP.Problem000433

/-- Positive integers at most `n` with pairwise lcm greater than `n`. -/
def Admissible (n : ℕ) (A : Finset ℕ) : Prop :=
  (∀ a ∈ A, 0 < a ∧ a ≤ n) ∧
    (∀ a ∈ A, ∀ b ∈ A, a ≠ b → n < Nat.lcm a b)

/-- The reciprocal sum, taken in the rationals. -/
def reciprocalSum (A : Finset ℕ) : ℚ :=
  ∑ a ∈ A, (1 : ℚ) / a

/-- The full statement; this definition is a target, not a proved theorem. -/
def SharpBound : Prop :=
  ∀ (n : ℕ) (A : Finset ℕ), Admissible n A → reciprocalSum A ≤ 31 / 30

/-- The sharpness example given in the original problem. -/
theorem extremal_admissible : Admissible 5 {2, 3, 5} := by
  norm_num [Admissible, Finset.mem_insert, Finset.mem_singleton]
  decide

theorem extremal_sum : reciprocalSum {2, 3, 5} = 31 / 30 := by
  norm_num [reciprocalSum]

/-- Any universal upper bound must be at least 31/30. -/
theorem sharp_lower_bound (C : ℚ)
    (hC : ∀ (n : ℕ) (A : Finset ℕ), Admissible n A → reciprocalSum A ≤ C) :
    31 / 30 ≤ C := by
  simpa [extremal_sum] using hC 5 {2, 3, 5} extremal_admissible

theorem eq_singleton_of_one_mem {n : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (h1 : 1 ∈ A) : A = {1} := by
  apply Finset.Subset.antisymm
  · intro a ha
    simp only [Finset.mem_singleton]
    by_contra hne
    have hlcm := hA.2 1 h1 a ha (Ne.symm hne)
    simp only [Nat.lcm_one_left] at hlcm
    exact (not_lt_of_ge (hA.1 a ha).2) hlcm
  · simpa using h1

theorem sharp_bound_of_one_mem {n : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (h1 : 1 ∈ A) : reciprocalSum A ≤ 31 / 30 := by
  rw [eq_singleton_of_one_mem hA h1]
  norm_num [reciprocalSum]

/-- Multiples of distinct admissible elements cannot collide below `n`. -/
theorem eq_of_common_multiple {n m a b : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (ha : a ∈ A) (hb : b ∈ A)
    (hm : 0 < m) (hmn : m ≤ n) (ham : a ∣ m) (hbm : b ∣ m) : a = b := by
  by_contra hab
  have hlcm := hA.2 a ha b hb hab
  have hle : Nat.lcm a b ≤ m := Nat.le_of_dvd hm (Nat.lcm_dvd ham hbm)
  omega

/-- Disjointness of positive multiples gives the exact floor-sum constraint. -/
theorem sum_div_le {n : ℕ} {A : Finset ℕ} (hA : Admissible n A) :
    (∑ a ∈ A, n / a) ≤ n := by
  calc
    (∑ a ∈ A, n / a) =
        ∑ a ∈ A, ∑ k ∈ Finset.range n, if a ∣ k + 1 then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro a ha
      rw [← Nat.card_multiples n a]
      simp
    _ = ∑ k ∈ Finset.range n, ∑ a ∈ A, if a ∣ k + 1 then 1 else 0 := by
      rw [Finset.sum_comm]
    _ ≤ ∑ k ∈ Finset.range n, 1 := by
      apply Finset.sum_le_sum
      intro k hk
      have hsub : (A.filter (fun a => a ∣ k + 1)).card ≤ 1 := by
        rw [Finset.card_le_one]
        intro a ha b hb
        simp only [Finset.mem_filter] at ha hb
        exact eq_of_common_multiple hA ha.1 hb.1 (by omega)
          (by simpa using hk) ha.2 hb.2
      simpa using hsub
    _ = n := by simp

/-- A convenient rational estimate relating a reciprocal to its multiple count. -/
theorem reciprocal_lt_floor_term {n a : ℕ} (ha : 0 < a) (han : a ≤ n) :
    (1 : ℚ) / a < 2 * (n / a : ℕ) / n := by
  have hn : 0 < n := lt_of_lt_of_le ha han
  have hq : 0 < n / a := Nat.div_pos han ha
  have hrem := Nat.mod_lt n ha
  have hsplit := Nat.mod_add_div n a
  have hnat : n < 2 * (n / a) * a := by nlinarith
  have haq : (0 : ℚ) < a := by exact_mod_cast ha
  have hnq : (0 : ℚ) < n := by exact_mod_cast hn
  have hcast : (n : ℚ) < 2 * (n / a : ℕ) * a := by exact_mod_cast hnat
  apply (div_lt_iff₀ haq).2
  calc
    (1 : ℚ) < (2 * (n / a : ℕ) * a) / n := (lt_div_iff₀ hnq).2 (by simpa using hcast)
    _ = (2 * (n / a : ℕ) / n) * a := by ring

/-- The classical weaker bound. This does not establish `SharpBound`. -/
theorem reciprocalSum_lt_two {n : ℕ} {A : Finset ℕ} (hA : Admissible n A) :
    reciprocalSum A < 2 := by
  rcases A.eq_empty_or_nonempty with rfl | hne
  · norm_num [reciprocalSum]
  obtain ⟨a, ha⟩ := hne
  have hn : 0 < n := lt_of_lt_of_le (hA.1 a ha).1 (hA.1 a ha).2
  have hnq : (0 : ℚ) < n := by exact_mod_cast hn
  calc
    reciprocalSum A < ∑ a ∈ A, 2 * (n / a : ℕ) / (n : ℚ) := by
      apply Finset.sum_lt_sum_of_nonempty ⟨a, ha⟩
      intro b hb
      exact reciprocal_lt_floor_term (hA.1 b hb).1 (hA.1 b hb).2
    _ = 2 * (∑ a ∈ A, (n / a : ℕ) : ℕ) / (n : ℚ) := by
      simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Finset.mul_sum, Nat.cast_sum]
    _ ≤ 2 * (n : ℚ) / n := by
      apply div_le_div_of_nonneg_right _ (le_of_lt hnq)
      exact mul_le_mul_of_nonneg_left (by exact_mod_cast sum_div_le hA) (by norm_num)
    _ = 2 := by field_simp

end JSP.Problem000433
