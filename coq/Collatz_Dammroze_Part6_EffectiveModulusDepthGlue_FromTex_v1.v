(*
  Part 6 / Effective modulus depth glue.

  TEX target:
    S_i + k_i <= K
    1 <= L
    -------------------------
    S_i + k_i + 1 <= K + L

  This closes only the local dyadic-depth arithmetic.
  It does NOT prove the full predecessor pullback.
  It does NOT prove absence of odd-modulus conditions.
  It does NOT close the effective modulus lemma.
  It does NOT prove fixed-K level-wise endpoint estimate.
  It does NOT close Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part6_EffectiveModulusDepthGlue_FromTex_v1.

Theorem effective_modulus_depth_plus_one_TEX :
  forall S_i k_i K L : nat,
    S_i + k_i <= K ->
    1 <= L ->
    S_i + k_i + 1 <= K + L.
Proof.
  intros S_i k_i K L Hdepth HL.
  lia.
Qed.

Theorem effective_modulus_depth_bound_TEX :
  forall depth K L : nat,
    depth <= K ->
    1 <= L ->
    depth + 1 <= K + L.
Proof.
  intros depth K L Hdepth HL.
  lia.
Qed.

End CollatzDammroze_Part6_EffectiveModulusDepthGlue_FromTex_v1.
