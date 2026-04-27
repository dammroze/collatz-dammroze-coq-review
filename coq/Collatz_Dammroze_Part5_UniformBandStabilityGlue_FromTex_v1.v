(*
  Collatz_Dammroze_Part5_UniformBandStabilityGlue_FromTex_v1.v

  TEX Part 5 / Uniform band stability.

  Local finite-count complement step:

    good_count + bad_count = band_size
    bad_count / band_size <= theta
    theta < 1
    --------------------------------
    good_count / band_size >= 1 - theta

  Scaled by theta_den:
    bad_count * theta_den <= theta_num * band_size
    theta_num <= theta_den
    good + bad = band
    --------------------------------
    (theta_den - theta_num) * band_size <= good_count * theta_den

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

Module CollatzDammroze_Part5_UniformBandStabilityGlue_FromTex_v1.

Theorem uniform_band_stability_complement_TEX :
  forall band_size good_count bad_count theta_num theta_den : nat,
    good_count + bad_count = band_size ->
    theta_num <= theta_den ->
    bad_count * theta_den <= theta_num * band_size ->
    (theta_den - theta_num) * band_size <= good_count * theta_den.
Proof.
  intros band_size good_count bad_count theta_num theta_den
    Hpartition Htheta Hbad.
  subst band_size.
  nia.
Qed.

Theorem uniform_band_stability_positive_good_fraction_TEX :
  forall band_size good_count bad_count theta_num theta_den : nat,
    0 < band_size ->
    theta_num < theta_den ->
    good_count + bad_count = band_size ->
    bad_count * theta_den <= theta_num * band_size ->
    0 < good_count.
Proof.
  intros band_size good_count bad_count theta_num theta_den
    Hband Htheta Hpartition Hbad.
  assert (Hcomp :
    (theta_den - theta_num) * band_size <= good_count * theta_den).
  {
    apply uniform_band_stability_complement_TEX with (bad_count := bad_count).
    - exact Hpartition.
    - lia.
    - exact Hbad.
  }
  nia.
Qed.

End CollatzDammroze_Part5_UniformBandStabilityGlue_FromTex_v1.
