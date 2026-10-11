import WeilDefect.RPB108.SourceNormBounds

namespace WeilDefect.RPB108

/-- The paid mixed-energy split is an exact completed-square identity. -/
theorem paid_young_completed_square (A M theta x y : ℝ) (ht : theta < 1) :
    A*x^2-2*M*x*y+y^2-((A-M^2/(1-theta))*x^2+theta*y^2) =
      (M*x-(1-theta)*y)^2/(1-theta) := by
  have hn : 1-theta ≠ 0 := ne_of_gt (sub_pos.mpr ht)
  field_simp
  ring

/-- Universal mixed-energy bound, including the absolute worst-case cross. -/
theorem paid_young_lower (A M theta x y : ℝ) (ht : theta < 1) :
    (A-M^2/(1-theta))*x^2+theta*y^2 ≤ A*x^2-2*M*|x*y|+y^2 := by
  have hid := paid_young_completed_square A M theta |x| |y| ht
  have hp : 0 ≤ (M*|x|-(1-theta)*|y|)^2/(1-theta) :=
    div_nonneg (sq_nonneg _) (sub_pos.mpr ht).le
  simp only [sq_abs] at hid
  rw [abs_mul]
  nlinarith only [hid, hp]

#print axioms paid_young_completed_square
#print axioms paid_young_lower
end WeilDefect.RPB108
