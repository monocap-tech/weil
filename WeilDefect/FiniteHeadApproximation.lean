import WeilDefect.DirichletEnergy

namespace WeilDefect

/--
WD-T29 / ZW1-T10, abstract finite-head approximation inequality.

If an exact target splits as a finite-head contribution plus a tail contribution
whose coefficient vector has norm at most one, then the target lies within the
tail operator norm of the finite-head range.
-/
theorem wd_t29_finite_head_approximation
    {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    (Shead Stail : E →L[ℝ] F)
    (xHead xTail : E)
    (y : F)
    (hy : y = Shead xHead + Stail xTail)
    (hTail : ‖xTail‖ ≤ 1) :
    Metric.infDist y (Set.range Shead) ≤ ‖Stail‖ := by
  calc
    Metric.infDist y (Set.range Shead)
        ≤ dist y (Shead xHead) :=
      Metric.infDist_le_dist_of_mem ⟨xHead, rfl⟩
    _ = ‖Stail xTail‖ := by
      rw [hy, dist_eq_norm]
      simp
    _ ≤ ‖Stail‖ * ‖xTail‖ :=
      Stail.le_opNorm xTail
    _ ≤ ‖Stail‖ * 1 :=
      mul_le_mul_of_nonneg_left hTail (norm_nonneg Stail)
    _ = ‖Stail‖ := by
      simp

/--
Quantitative WD-T29 transfer: any explicit tail-operator estimate immediately
becomes a finite-head approximation estimate at the same rate.
-/
theorem wd_t29_quantitative_finite_head_approximation
    {E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    (Shead Stail : E →L[ℝ] F)
    (xHead xTail : E)
    (y : F)
    (ε : ℝ)
    (hy : y = Shead xHead + Stail xTail)
    (hTail : ‖xTail‖ ≤ 1)
    (hTailOp : ‖Stail‖ ≤ ε) :
    Metric.infDist y (Set.range Shead) ≤ ε :=
  (wd_t29_finite_head_approximation
    Shead Stail xHead xTail y hy hTail).trans hTailOp

end WeilDefect
