(*
  Part 6 / Odd power coefficient glue.

  TEX target:
    coefficient 3^(i+1) is odd.

  This closes only the parity fact needed before the dyadic inverse step.
  It does NOT prove existence of the inverse modulo 2^m.
  It does NOT prove the full dyadic pullback.
  It does NOT prove finite union of residue classes.
  It does NOT close fixed-K, Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_OddPowerCoefficientGlue_FromTex_v1.

Theorem pow3_odd_nat_TEX :
  forall i : nat, exists q : nat, 3 ^ i = 2 * q + 1.
Proof.
  induction i as [|i [q Hq]].
  - exists 0. simpl. lia.
  - simpl.
    rewrite Hq.
    exists (3 * q + 1).
    lia.
Qed.

Theorem pow3_succ_odd_nat_TEX :
  forall i : nat, exists q : nat, 3 ^ S i = 2 * q + 1.
Proof.
  intro i.
  apply pow3_odd_nat_TEX.
Qed.

Theorem pow3_succ_not_even_nat_TEX :
  forall i q : nat, 3 ^ S i <> 2 * q.
Proof.
  intros i q Heq.
  destruct (pow3_succ_odd_nat_TEX i) as [r Hr].
  lia.
Qed.

End CollatzDammroze_Part6_OddPowerCoefficientGlue_FromTex_v1.
