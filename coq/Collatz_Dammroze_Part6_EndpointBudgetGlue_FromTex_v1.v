(*
  Collatz_Dammroze_Part6_EndpointBudgetGlue_FromTex_v1.v

  TEX Part 6 / Tail-control endpoint budget.

  Local deterministic budget glue:

    D <= theta0Pow + endpointBudget
    endpointBudget <= thetaPow - theta0Pow
    theta0Pow <= thetaPow
    --------------------------------
    D <= thetaPow

  This formalizes only the finite endpoint-budget absorption step.
  It does not prove the arithmetic endpoint budget itself.

  No probability.
  No ergodicity.
  No time averaging.
  No Cesaro averaging.
  No sliding windows.
  No final Collatz theorem.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_EndpointBudgetGlue_FromTex_v1.

Theorem endpoint_budget_absorbs_tail_TEX :
  forall D theta0Pow thetaPow endpointBudget : nat,
    theta0Pow <= thetaPow ->
    D <= theta0Pow + endpointBudget ->
    endpointBudget <= thetaPow - theta0Pow ->
    D <= thetaPow.
Proof.
  intros D theta0Pow thetaPow endpointBudget Hmono HD Hbudget.
  nia.
Qed.

Theorem endpoint_budget_absorbs_tail_scaled_TEX :
  forall D theta0Pow thetaPow endpointBudget scale : nat,
    0 < scale ->
    theta0Pow <= thetaPow ->
    D * scale <= (theta0Pow + endpointBudget) * scale ->
    endpointBudget <= thetaPow - theta0Pow ->
    D * scale <= thetaPow * scale.
Proof.
  intros D theta0Pow thetaPow endpointBudget scale Hscale Hmono HD Hbudget.
  nia.
Qed.

End CollatzDammroze_Part6_EndpointBudgetGlue_FromTex_v1.
