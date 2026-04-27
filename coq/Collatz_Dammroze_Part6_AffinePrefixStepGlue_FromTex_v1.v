(*
  Part 6 / Affine-prefix step glue.

  Local algebraic step:

    pow2S * Xi = pow3i * n + A
    pow2k * Xnext = 3 * Xi + 1
    pow2Sk = pow2S * pow2k
    pow3next = 3 * pow3i
    --------------------------------
    pow2Sk * Xnext = pow3next * n + (3*A + pow2S)

  This closes only the affine-prefix algebraic transition.
  It does NOT prove the full predecessor-admissible pullback.
  It does NOT prove finite union of dyadic residue classes.
  It does NOT prove fixed-K level-wise endpoint estimate.
  It does NOT close Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import ZArith.ZArith.
From Coq Require Import micromega.Lia.
From Coq Require Import setoid_ring.Ring.

Open Scope Z_scope.

Module CollatzDammroze_Part6_AffinePrefixStepGlue_FromTex_v1.

Theorem affine_prefix_step_crossmul_TEX :
  forall n A Xi Xnext pow2S pow2k pow2Sk pow3i pow3next : Z,
    pow2Sk = pow2S * pow2k ->
    pow3next = 3 * pow3i ->
    pow2S * Xi = pow3i * n + A ->
    pow2k * Xnext = 3 * Xi + 1 ->
    pow2Sk * Xnext = pow3next * n + (3 * A + pow2S).
Proof.
  intros n A Xi Xnext pow2S pow2k pow2Sk pow3i pow3next
    Hpow2 Hpow3 Hprefix Hnext.
  subst pow2Sk.
  subst pow3next.
  replace ((pow2S * pow2k) * Xnext)
    with (pow2S * (pow2k * Xnext)) by ring.
  rewrite Hnext.
  replace (pow2S * (3 * Xi + 1))
    with (3 * (pow2S * Xi) + pow2S) by ring.
  rewrite Hprefix.
  ring.
Qed.

Theorem affine_prefix_step_crossmul_scaled_TEX :
  forall n A Xi Xnext pow2S pow2k pow2Sk pow3i pow3next scale : Z,
    pow2Sk = pow2S * pow2k ->
    pow3next = 3 * pow3i ->
    pow2S * Xi = pow3i * n + A ->
    pow2k * Xnext = 3 * Xi + 1 ->
    scale * (pow2Sk * Xnext)
    = scale * (pow3next * n + (3 * A + pow2S)).
Proof.
  intros n A Xi Xnext pow2S pow2k pow2Sk pow3i pow3next scale
    Hpow2 Hpow3 Hprefix Hnext.
  rewrite (affine_prefix_step_crossmul_TEX
    n A Xi Xnext pow2S pow2k pow2Sk pow3i pow3next
    Hpow2 Hpow3 Hprefix Hnext).
  reflexivity.
Qed.

End CollatzDammroze_Part6_AffinePrefixStepGlue_FromTex_v1.
