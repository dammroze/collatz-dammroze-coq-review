(*
  Part 6 / Dyadic power divisibility glue.

  Local dyadic fact:
    d <= M
    ----------------
    2^d divides 2^M.

  This closes only the dyadic divisibility needed to lift all constraints
  of depth <= K+L to the common modulus 2^(K+L).

  It does NOT prove the full finite-union pullback.
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
From Coq Require Import micromega.Lia.
From Coq Require Import setoid_ring.Ring.

Module CollatzDammroze_Part6_DyadicPowerDivisibilityGlue_FromTex_v1.

Theorem pow2_divides_monotone_nat_TEX :
  forall d M : nat,
    d <= M ->
    exists cN : nat, Nat.pow 2 M = cN * Nat.pow 2 d.
Proof.
  intros d M Hle.
  exists (Nat.pow 2 (M - d)).
  assert (Hsplit : M = (M - d) + d) by lia.
  rewrite Hsplit at 1.
  rewrite Nat.pow_add_r.
  reflexivity.
Qed.

Theorem pow2_divides_monotone_Z_of_nat_TEX :
  forall d M : nat,
    d <= M ->
    exists cZ : Z,
      Z.of_nat (Nat.pow 2 M) =
      (cZ * Z.of_nat (Nat.pow 2 d))%Z.
Proof.
  intros d M Hle.
  destruct (pow2_divides_monotone_nat_TEX d M Hle) as [cN HcN].
  exists (Z.of_nat cN).
  rewrite HcN.
  rewrite Nat2Z.inj_mul.
  reflexivity.
Qed.

Theorem pow2_common_modulus_for_depth_TEX :
  forall depth K L : nat,
    depth <= K + L ->
    exists cN : nat, Nat.pow 2 (K + L) = cN * Nat.pow 2 depth.
Proof.
  intros depth K L Hdepth.
  apply pow2_divides_monotone_nat_TEX.
  exact Hdepth.
Qed.

End CollatzDammroze_Part6_DyadicPowerDivisibilityGlue_FromTex_v1.
