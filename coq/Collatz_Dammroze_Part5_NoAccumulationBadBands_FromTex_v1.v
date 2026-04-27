(*
  Collatz_Dammroze_Part5_NoAccumulationBadBands_FromTex_v1.v

  TEX Part 5 / lines 1491--1508:

    No accumulation of bad bands.

  Formal finite scaled-count version:
    if a band-local exceptional set has normalized count at least theta0,
    but Axiom III gives an excursion cap strictly below theta0/2,
    then the same set cannot be covered by such excursions.

  Everything is finite band-normalized counting encoded by integer products.

  No probability.
  No ergodicity.
  No independence.
  No mixing.
  No sliding windows.
  No Cesaro averaging.
  No Axiom IV final.
  No PaperAxioms.
  No PaperProofPackage.
  No final Collatz theorem.
*)

From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Module CollatzDammroze_Part5_NoAccumulationBadBands_FromTex_v1.

Theorem no_accumulation_bad_bands_scaled_contradiction_TEX :
  forall band_size bad_count excursion_count theta_num theta_den cap_num cap_den : nat,
    0 < band_size ->
    0 < theta_den ->
    0 < cap_den ->

    (* bad_count / band_size >= theta_num / theta_den *)
    theta_num * band_size <= bad_count * theta_den ->

    (* excursion_count / band_size <= cap_num / cap_den *)
    excursion_count * cap_den <= cap_num * band_size ->

    (* cap < theta/2, scaled without division:
       cap_num/cap_den < theta_num/(2 theta_den) *)
    2 * cap_num * theta_den < theta_num * cap_den ->

    (* if all bad elements are among the excursion-capped elements *)
    bad_count <= excursion_count ->

    False.
Proof.
  intros band_size bad_count excursion_count theta_num theta_den cap_num cap_den
    Hband Htheta_den Hcap_den Hbad_lower Hexc_upper Hcap_small Hcover.

  assert (Hbad_cap :
    bad_count * cap_den <= cap_num * band_size).
  {
    eapply Nat.le_trans.
    - apply Nat.mul_le_mono_r.
      exact Hcover.
    - exact Hexc_upper.
  }

  nia.
Qed.

End CollatzDammroze_Part5_NoAccumulationBadBands_FromTex_v1.
