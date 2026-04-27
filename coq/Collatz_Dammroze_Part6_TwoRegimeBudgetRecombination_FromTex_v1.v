(*
  Part 6 / Two-regime endpoint-budget recombination.

  TEX target:
    Regime A budget + Regime B budget
    => total weighted endpoint budget.

  This closes only the algebraic recombination glue.
  It does NOT prove Regime A.
  It does NOT prove Regime B.
  It does NOT close Axiom V.

  No probability.
  No ergodicity.
  No time averaging.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_TwoRegimeBudgetRecombination_FromTex_v1.

Theorem two_regime_budget_recombination_TEX :
  forall regimeA regimeB boundA boundB totalBound totalBudget : nat,
    regimeA <= boundA ->
    regimeB <= boundB ->
    boundA + boundB <= totalBound ->
    totalBudget = regimeA + regimeB ->
    totalBudget <= totalBound.
Proof.
  intros regimeA regimeB boundA boundB totalBound totalBudget
    HA HB Hbounds Htotal.
  subst totalBudget.
  lia.
Qed.

Theorem two_regime_budget_recombination_with_common_majorant_TEX :
  forall regimeA regimeB coeffA coeffB coeffTotal common totalBudget : nat,
    regimeA <= coeffA * common ->
    regimeB <= coeffB * common ->
    coeffA + coeffB <= coeffTotal ->
    totalBudget = regimeA + regimeB ->
    totalBudget <= coeffTotal * common.
Proof.
  intros regimeA regimeB coeffA coeffB coeffTotal common totalBudget
    HA HB Hcoeff Htotal.
  subst totalBudget.
  assert (Hsum : regimeA + regimeB <= (coeffA + coeffB) * common) by nia.
  assert (Hmono : (coeffA + coeffB) * common <= coeffTotal * common).
  {
    apply Nat.mul_le_mono_r.
    exact Hcoeff.
  }
  lia.
Qed.

End CollatzDammroze_Part6_TwoRegimeBudgetRecombination_FromTex_v1.
