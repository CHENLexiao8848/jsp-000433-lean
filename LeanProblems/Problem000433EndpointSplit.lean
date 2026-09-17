import LeanProblems.Problem000433Finite

namespace JSP.Problem000433

/-- A bound on all admissible subsets of a specified finite candidate set. -/
def SubsetBound (n : ℕ) (S : Finset ℕ) (budget : ℚ) : Prop :=
  ∀ A : Finset ℕ, Admissible n A → A ⊆ S → reciprocalSum A ≤ budget

/-- Splitting on membership gives a small proof node with two independent children. -/
theorem subsetBound_split (n a : ℕ) (S S₀ S₁ : Finset ℕ) (budget budget₁ : ℚ)
    (hS₀ : S₀ = S.erase a)
    (hS₁ : S₁ = (S.erase a).filter (fun b => n < Nat.lcm a b))
    (hbudget : budget₁ = budget - (1 : ℚ) / a)
    (h₀ : SubsetBound n S₀ budget) (h₁ : SubsetBound n S₁ budget₁) :
    SubsetBound n S budget := by
  intro A hA hsub
  subst S₀ S₁ budget₁
  by_cases ha : a ∈ A
  · have hadm : Admissible n (A.erase a) := by
      exact ⟨fun b hb => hA.1 b (Finset.mem_erase.mp hb).2,
        fun b hb c hc hne => hA.2 b (Finset.mem_erase.mp hb).2 c (Finset.mem_erase.mp hc).2 hne⟩
    have hsub₁ : A.erase a ⊆ (S.erase a).filter (fun b => n < Nat.lcm a b) := by
      intro b hb
      rcases Finset.mem_erase.mp hb with ⟨hne, hb⟩
      exact Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨hne, hsub hb⟩, hA.2 a ha b hb (Ne.symm hne)⟩
    have hv := h₁ (A.erase a) hadm hsub₁
    have hs : reciprocalSum A = reciprocalSum (A.erase a) + (1 : ℚ) / a :=
      (Finset.sum_erase_add A (fun a => (1 : ℚ) / a) ha).symm
    rw [hs]
    linarith
  · apply h₀ A hA
    intro b hb
    exact Finset.mem_erase.mpr ⟨by intro hba; exact ha (hba ▸ hb), hsub hb⟩

theorem subsetBound_of_check (n fuel : ℕ) (S : Finset ℕ) (budget : ℚ)
    (hcheck : finiteBoundVerifier n fuel S budget = true) : SubsetBound n S budget := by
  intro A hA hsub
  exact finiteBoundVerifier_sound n fuel S budget hcheck A hA hsub

end JSP.Problem000433
