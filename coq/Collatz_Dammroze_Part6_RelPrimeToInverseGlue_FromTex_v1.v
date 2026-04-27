(*
  Part 6 / RelPrime-to-inverse glue.

  Local number-theoretic glue:

    rel_prime a m
    --------------------------
    exists inv, a*inv ≡ 1 mod m

  This closes only the conversion from coprimality to modular inverse.
  It does NOT prove that 3^(i+1) is coprime to 2^m.
  It does NOT prove the full dyadic pullback.
  It does NOT prove fixed-K level-wise endpoint estimate.
  It does NOT close Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import ZArith.ZArith.
From Coq Require Import ZArith.Znumtheory.
From Coq Require Import micromega.Lia.
From Coq Require Import setoid_ring.Ring.

Open Scope Z_scope.

Module CollatzDammroze_Part6_RelPrimeToInverseGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem rel_prime_to_inverse_TEX :
  forall a m : Z,
    rel_prime a m ->
    exists inv : Z, zcong m (a * inv) 1.
Proof.
  intros a m Hrp.
  pose proof (rel_prime_bezout a m Hrp) as Hbez.
  destruct Hbez as [u v Huv].
  exists u.
  unfold zcong.
  exists (-v).
  rewrite <- Huv.
  ring.
Qed.

Theorem rel_prime_to_inverse_commuted_TEX :
  forall a m : Z,
    rel_prime a m ->
    exists inv : Z, zcong m (inv * a) 1.
Proof.
  intros a m Hrp.
  destruct (rel_prime_to_inverse_TEX a m Hrp) as [inv Hinv].
  exists inv.
  unfold zcong in *.
  destruct Hinv as [q Hq].
  exists q.
  replace (inv * a - 1) with (a * inv - 1) by ring.
  exact Hq.
Qed.

End CollatzDammroze_Part6_RelPrimeToInverseGlue_FromTex_v1.
