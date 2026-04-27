(*
  Part 6 / Multiplicative endpoint budget glue.

  Formal finite-count glue:
    endpointBudget <= multiplier * theta0Pow
    multiplier * theta0Pow <= thetaPow - theta0Pow
    ------------------------------------------------
    endpointBudget <= thetaPow - theta0Pow

  No probability.
  No ergodicity.
  No time averaging.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_MultiplicativeEndpointBudgetGlue_FromTex_v1.

Theorem multiplicative_endpoint_budget_to_gap_TEX :
  forall endpointBudget multiplier theta0Pow thetaPow : nat,
    theta0Pow <= thetaPow ->
    endpointBudget <= multiplier * theta0Pow ->
    multiplier * theta0Pow <= thetaPow - theta0Pow ->
    endpointBudget <= thetaPow - theta0Pow.
Proof.
  intros endpointBudget multiplier theta0Pow thetaPow Hmono Hbudget Hgap.
  lia.
Qed.

Theorem multiplicative_endpoint_budget_absorbs_tail_TEX :
  forall D endpointBudget multiplier theta0Pow thetaPow : nat,
    theta0Pow <= thetaPow ->
    D <= theta0Pow + endpointBudget ->
    endpointBudget <= multiplier * theta0Pow ->
    multiplier * theta0Pow <= thetaPow - theta0Pow ->
    D <= thetaPow.
Proof.
  intros D endpointBudget multiplier theta0Pow thetaPow
    Hmono HD Hbudget Hgap.
  assert (Hegap : endpointBudget <= thetaPow - theta0Pow).
  {
    eapply multiplicative_endpoint_budget_to_gap_TEX.
    - exact Hmono.
    - exact Hbudget.
    - exact Hgap.
  }
  nia.
Qed.

End CollatzDammroze_Part6_MultiplicativeEndpointBudgetGlue_FromTex_v1.
