import LeanProblems.Problem000433

/-!
# JSP 000433: small cases

We prove the upper bound for sets of cardinality at most three and for `n ≤ 5`.
These results do not establish the unrestricted upper bound.
-/

namespace JSP.Problem000433

private theorem reciprocalSum_le_card_div {A : Finset ℕ} {k : ℕ}
    (hk : 0 < k) (hA : ∀ a ∈ A, k ≤ a) :
    reciprocalSum A ≤ (A.card : ℚ) / k := by
  calc
    reciprocalSum A ≤ ∑ _a ∈ A, (1 : ℚ) / k := by
      apply Finset.sum_le_sum
      intro a ha
      exact one_div_le_one_div_of_le (by exact_mod_cast hk) (by exact_mod_cast hA a ha)
    _ = (A.card : ℚ) / k := by simp [div_eq_mul_inv]

private theorem reciprocalSum_erase {A : Finset ℕ} {a : ℕ} (ha : a ∈ A) :
    reciprocalSum A = reciprocalSum (A.erase a) + (1 : ℚ) / a := by
  exact (Finset.sum_erase_add A (fun a => (1 : ℚ) / a) ha).symm

/-- The full sharp bound for admissible sets with at most three elements. -/
theorem sharp_bound_of_card_le_three {n : ℕ} {A : Finset ℕ}
    (hA : Admissible n A) (hcard : A.card ≤ 3) :
    reciprocalSum A ≤ 31 / 30 := by
  by_cases h1 : 1 ∈ A
  · exact sharp_bound_of_one_mem hA h1
  by_cases h2 : 2 ∈ A
  · have h4 : 4 ∉ A := by
      intro h4
      have hc := hA.2 2 h2 4 h4 (by decide)
      have hlcm : Nat.lcm 2 4 = 4 := by decide
      rw [hlcm] at hc
      exact (not_lt_of_ge (hA.1 4 h4).2) hc
    have hcard2 : (A.erase 2).card ≤ 2 := by
      have := Finset.card_erase_add_one h2
      omega
    by_cases h3 : 3 ∈ A
    · have h3' : 3 ∈ A.erase 2 := by simp [h3]
      have hcard3 : ((A.erase 2).erase 3).card ≤ 1 := by
        have := Finset.card_erase_add_one h3'
        omega
      have hsum := reciprocalSum_le_card_div (A := (A.erase 2).erase 3)
        (k := 5) (by decide) (by
          intro a ha
          have hmem := (Finset.mem_erase.mp (Finset.mem_erase.mp ha).2).2
          have hne2 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha).2).1
          have hne3 := (Finset.mem_erase.mp ha).1
          have hpos := (hA.1 a hmem).1
          have hne1 : a ≠ 1 := fun heq => h1 (heq ▸ hmem)
          have hne4 : a ≠ 4 := fun heq => h4 (heq ▸ hmem)
          omega)
      have hcardq : (((A.erase 2).erase 3).card : ℚ) ≤ 1 := by
        exact_mod_cast hcard3
      rw [reciprocalSum_erase h2, reciprocalSum_erase h3']
      linarith
    · have hsum := reciprocalSum_le_card_div (A := A.erase 2)
        (k := 5) (by decide) (by
          intro a ha
          have hmem := (Finset.mem_erase.mp ha).2
          have hne2 := (Finset.mem_erase.mp ha).1
          have hpos := (hA.1 a hmem).1
          have hne1 : a ≠ 1 := fun heq => h1 (heq ▸ hmem)
          have hne3 : a ≠ 3 := fun heq => h3 (heq ▸ hmem)
          have hne4 : a ≠ 4 := fun heq => h4 (heq ▸ hmem)
          omega)
      have hcardq : ((A.erase 2).card : ℚ) ≤ 2 := by exact_mod_cast hcard2
      rw [reciprocalSum_erase h2]
      linarith
  · have hsum := reciprocalSum_le_card_div (A := A) (k := 3) (by decide) (by
      intro a ha
      have hpos := (hA.1 a ha).1
      have hne1 : a ≠ 1 := fun heq => h1 (heq ▸ ha)
      have hne2 : a ≠ 2 := fun heq => h2 (heq ▸ ha)
      omega)
    have hcardq : (A.card : ℚ) ≤ 3 := by exact_mod_cast hcard
    linarith

/-- The sharp upper bound for every admissible set with `n ≤ 5`. -/
theorem sharp_bound_of_le_five {n : ℕ} {A : Finset ℕ}
    (hn : n ≤ 5) (hA : Admissible n A) : reciprocalSum A ≤ 31 / 30 := by
  by_cases h1 : 1 ∈ A
  · exact sharp_bound_of_one_mem hA h1
  apply sharp_bound_of_card_le_three hA
  by_cases h2 : 2 ∈ A
  · have h4 : 4 ∉ A := by
      intro h4
      have hc := hA.2 2 h2 4 h4 (by decide)
      have hlcm : Nat.lcm 2 4 = 4 := by decide
      rw [hlcm] at hc
      exact (not_lt_of_ge (hA.1 4 h4).2) hc
    have hsub : A ⊆ {2, 3, 5} := by
      intro a ha
      have hpos := (hA.1 a ha).1
      have hle := (hA.1 a ha).2.trans hn
      have hne1 : a ≠ 1 := fun heq => h1 (heq ▸ ha)
      have hne4 : a ≠ 4 := fun heq => h4 (heq ▸ ha)
      simp only [Finset.mem_insert, Finset.mem_singleton]
      omega
    exact (Finset.card_le_card hsub).trans (by norm_num)
  · have hsub : A ⊆ {3, 4, 5} := by
      intro a ha
      have hpos := (hA.1 a ha).1
      have hle := (hA.1 a ha).2.trans hn
      have hne1 : a ≠ 1 := fun heq => h1 (heq ▸ ha)
      have hne2 : a ≠ 2 := fun heq => h2 (heq ▸ ha)
      simp only [Finset.mem_insert, Finset.mem_singleton]
      omega
    exact (Finset.card_le_card hsub).trans (by norm_num)

end JSP.Problem000433
