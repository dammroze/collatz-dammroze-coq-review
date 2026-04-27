(*
  Part 6 / Regime A conditional glue.

  TEX target:
    Regime A aggregated endpoint budget conditional on the level-wise estimate.

  This closes only the algebraic reduction:
    regimeA_endpoint <= coeff * restricted_ideal
    restricted_ideal <= full_product_majorant
    ------------------------------------------------
    regimeA_endpoint <= coeff * full_product_majorant

  It does NOT prove the level-wise estimate.
  It does NOT prove Regime A unconditionally.
  It does NOT prove Regime B.
  It does NOT close Axiom V.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
  No word-by-word summation of bare endpoint errors.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_RegimeAConditionalGlue_FromTex_v1.

Theorem regimeA_conditional_glue_TEX :
  forall regimeA_endpoint coeff restricted_ideal full_product_majorant : nat,
    regimeA_endpoint <= coeff * restricted_ideal ->
    restricted_ideal <= full_product_majorant ->
    regimeA_endpoint <= coeff * full_product_majorant.
Proof.
  intros regimeA_endpoint coeff restricted_ideal full_product_majorant
    Hlevelwise Hrestricted.
  eapply Nat.le_trans.
  - exact Hlevelwise.
  - apply Nat.mul_le_mono_l.
    exact Hrestricted.
Qed.

Theorem regimeA_conditional_glue_with_scaled_coeff_TEX :
  forall regimeA_endpoint coeff_num coeff_den restricted_ideal full_product_majorant : nat,
    0 < coeff_den ->
    regimeA_endpoint * coeff_den <= coeff_num * restricted_ideal ->
    restricted_ideal <= full_product_majorant ->
    regimeA_endpoint * coeff_den <= coeff_num * full_product_majorant.
Proof.
  intros regimeA_endpoint coeff_num coeff_den restricted_ideal full_product_majorant
    Hden Hlevelwise Hrestricted.
  eapply Nat.le_trans.
  - exact Hlevelwise.
  - apply Nat.mul_le_mono_l.
    exact Hrestricted.
Qed.

End CollatzDammroze_Part6_RegimeAConditionalGlue_FromTex_v1.
