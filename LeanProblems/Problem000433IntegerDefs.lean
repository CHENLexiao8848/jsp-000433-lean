import LeanProblems.Problem000433Coefficients

namespace JSP.Problem000433

def commonDenominator : ℕ := 13687446560419818786600

def scaledCoefficient : ℕ → ℕ
  | 1 => 13687446560419818786600
  | 2 => 6843723280209909393300
  | 3 => 2281241093403303131100
  | 4 => 2281241093403303131100
  | 6 => 1824992874722642504880
  | 10 => 1010263912792891386630
  | 15 => 614104328973436647080
  | 16 => 614104328973436647080
  | 22 => 419292460573928562355
  | 28 => 303246717996456185686
  | 35 => 161012018539650840296
  | 36 => 237053388319760944666
  | 58 => 77337724377074022791
  | _ => 0

theorem coefficient_scaled (j : ℕ) : coefficient j = (scaledCoefficient j : ℚ) / commonDenominator := by
  unfold coefficient scaledCoefficient
  split <;> norm_num [commonDenominator]
  split <;> simp_all

def integerCertificate (q : ℕ) : ℕ :=
  ∑ k ∈ Finset.Icc 1 q, scaledCoefficient (q/k) * 1000000 / k

end JSP.Problem000433
