(*
  Part 6 / Odd coefficient inverse modulo powers of 2.

  Local number-theoretic glue:
    a odd
    m = 2^q
    --------------------------
    rel_prime a m
    and exists inv, a*inv ≡ 1 mod m.

  Applied to:
    a = 3^(i+1).

  This closes only the odd-coefficient inverse modulo a dyadic power.
  It does NOT prove the full dyadic pullback.
  It does NOT prove fixed-K level-wise endpoint estimate.
  It does NOT close Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import ZArith.ZArith.
From Coq Require Import ZArith.Znumtheory.
From Coq Require Import micromega.Lia.
From Coq Require Import setoid_ring.Ring.

Require Import Collatz_Dammroze_Part6_OddPowerCoefficientGlue_FromTex_v1.
Require Import Collatz_Dammroze_Part6_RelPrimeToInverseGlue_FromTex_v1.

Open Scope Z_scope.

Module CollatzDammroze_Part6_OddCoeffInversePow2Glue_FromTex_v1.

Module OP := CollatzDammroze_Part6_OddPowerCoefficientGlue_FromTex_v1.
Module RI := CollatzDammroze_Part6_RelPrimeToInverseGlue_FromTex_v1.

Theorem Z_of_nat_pow2_succ_TEX :
  forall m : nat,
    Z.of_nat (Nat.pow 2 (S m)) =
    (2 * Z.of_nat (Nat.pow 2 m))%Z.
Proof.
  intro m.
  assert (Hn : Nat.pow 2 (S m) = (2 * Nat.pow 2 m)%nat) by reflexivity.
  rewrite Hn.
  rewrite Nat2Z.inj_mul.
  simpl.
  ring.
Qed.

Theorem odd_rel_prime_two_TEX :
  forall a q : Z,
    a = 2 * q + 1 ->
    rel_prime a 2.
Proof.
  intros a q Ha.
  apply bezout_rel_prime.
  constructor 1 with (u := 1) (v := - q).
  rewrite Ha.
  ring.
Qed.

Theorem odd_rel_prime_pow2_TEX :
  forall a q : Z,
  forall m : nat,
    a = 2 * q + 1 ->
    rel_prime a (Z.of_nat (Nat.pow 2 m)).
Proof.
  intros a q m Ha.
  induction m as [|m IH].
  - simpl.
    apply rel_prime_sym.
    apply rel_prime_1.
  - rewrite Z_of_nat_pow2_succ_TEX.
    exact
      (rel_prime_mult
        a
        2
        (Z.of_nat (Nat.pow 2 m))
        (odd_rel_prime_two_TEX a q Ha)
        IH).
Qed.

Theorem pow3_succ_rel_prime_pow2_TEX :
  forall i m : nat,
    rel_prime
      (Z.of_nat (Nat.pow 3 (S i)))
      (Z.of_nat (Nat.pow 2 m)).
Proof.
  intros i m.
  destruct (OP.pow3_succ_odd_nat_TEX i) as [q Hq].
  apply odd_rel_prime_pow2_TEX with (q := Z.of_nat q).
  rewrite Hq.
  lia.
Qed.

Theorem pow3_succ_inverse_mod_pow2_TEX :
  forall i m : nat,
    exists inv : Z,
      RI.zcong
        (Z.of_nat (Nat.pow 2 m))
        (Z.of_nat (Nat.pow 3 (S i)) * inv)
        1.
Proof.
  intros i m.
  apply RI.rel_prime_to_inverse_TEX.
  apply pow3_succ_rel_prime_pow2_TEX.
Qed.

End CollatzDammroze_Part6_OddCoeffInversePow2Glue_FromTex_v1.
