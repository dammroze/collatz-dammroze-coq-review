(*
  Collatz_Dammroze_Part5_AmplificationDensityGlue_FromTex_v1.v

  TEX Part 5 / Amplification Lemma, lines 1910--1970.

  Local deterministic glue:

    P_{B,m} subset {tau >= L}
    density(P_{B,m}) >= lower
    -------------------------------
    density({tau >= L}) >= lower

  Everything is encoded as finite band-normalized scaled counts.

  No probability.
  No ergodicity.
  No independence.
  No mixing.
  No sliding windows.
  No Cesaro averaging.
  No Axiom V.
  No final Collatz theorem.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part5_AmplificationDensityGlue_FromTex_v1.

Theorem amplification_prefix_subset_density_glue_TEX :
  forall band_size prefix_count tau_count lower_num lower_den : nat,
    0 < lower_den ->

    (* lower_num/lower_den <= prefix_count/band_size *)
    lower_num * band_size <= prefix_count * lower_den ->

    (* P_{B,m} subset {tau >= L} *)
    prefix_count <= tau_count ->

    (* lower_num/lower_den <= tau_count/band_size *)
    lower_num * band_size <= tau_count * lower_den.
Proof.
  intros band_size prefix_count tau_count lower_num lower_den
    Hden Hprefix_lower Hsubset.
  eapply Nat.le_trans.
  - exact Hprefix_lower.
  - apply Nat.mul_le_mono_r.
    exact Hsubset.
Qed.

Theorem amplification_density_lower_bound_transfers_TEX :
  forall band_size prefix_count tau_count lower_num lower_den : nat,
    0 < band_size ->
    0 < lower_den ->
    lower_num * band_size <= prefix_count * lower_den ->
    prefix_count <= tau_count ->
    lower_num * band_size <= tau_count * lower_den.
Proof.
  intros band_size prefix_count tau_count lower_num lower_den
    Hband Hden Hprefix Hsubset.
  exact (amplification_prefix_subset_density_glue_TEX
    band_size prefix_count tau_count lower_num lower_den Hden Hprefix Hsubset).
Qed.

End CollatzDammroze_Part5_AmplificationDensityGlue_FromTex_v1.
