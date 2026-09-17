import LeanProblems.Problem000433Integer366
import LeanProblems.Problem000433Integer466
import LeanProblems.Problem000433Integer566
import LeanProblems.Problem000433Integer666
import LeanProblems.Problem000433Integer766
import LeanProblems.Problem000433Integer866
import LeanProblems.Problem000433Integer966
import LeanProblems.Problem000433Integer1066
import LeanProblems.Problem000433Integer1166
import LeanProblems.Problem000433Integer1266
import LeanProblems.Problem000433Integer1366

namespace JSP.Problem000433

theorem coefficient_bounds_middle (q : ℕ) (hlo : 365 < q) (hhi : q < 1400) :
    1 ≤ harmonicCertificate coefficient q ∧ harmonicCertificate coefficient q < 31/30 := by
  apply certificate_of_integer
  by_cases h : q ≤ 465
  · exact integer_range_366 q (by omega) h
  by_cases h' : q ≤ 565
  · exact integer_range_466 q (by omega) h'
  by_cases h'' : q ≤ 665
  · exact integer_range_566 q (by omega) h''
  by_cases h3 : q ≤ 765
  · exact integer_range_666 q (by omega) h3
  by_cases h4 : q ≤ 865
  · exact integer_range_766 q (by omega) h4
  by_cases h5 : q ≤ 965
  · exact integer_range_866 q (by omega) h5
  by_cases h6 : q ≤ 1065
  · exact integer_range_966 q (by omega) h6
  by_cases h7 : q ≤ 1165
  · exact integer_range_1066 q (by omega) h7
  by_cases h8 : q ≤ 1265
  · exact integer_range_1166 q (by omega) h8
  by_cases h9 : q ≤ 1365
  · exact integer_range_1266 q (by omega) h9
  exact integer_range_1366 q (by omega) (by omega)

end JSP.Problem000433
