(*
  Collatz_Dammroze_Part5_FixedMBandMass_FromTex_v1.v

  TEX Part 5 / Fixed-m band mass from one witness.

  Local deterministic absorption step:

    amplification lower bound:
      D_B >= base - error

    endpoint absorption:
      error <= base/2

    conclusion:
      D_B >= base/2

  Scaled finite-count form:

    band_size <= tau_count * pow + err_scaled
    2 * err_scaled <= band_size
    ---------------------------------------
    band_size <= 2 * tau_count * pow

  Here pow corresponds to 2^(mK), so
    band_size <= 2 * tau_count * pow
  is the scaled form of
    tau_count / band_size >= 1 / (2 * pow).

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

Module CollatzDammroze_Part5_FixedMBandMass_FromTex_v1.

Theorem fixed_m_band_mass_absorption_TEX :
  forall band_size tau_count pow err_scaled : nat,
    band_size <= tau_count * pow + err_scaled ->
    2 * err_scaled <= band_size ->
    band_size <= 2 * tau_count * pow.
Proof.
  intros band_size tau_count pow err_scaled Hamp Herr.
  nia.
Qed.

Theorem fixed_m_band_mass_positive_lower_TEX :
  forall band_size tau_count pow err_scaled : nat,
    0 < band_size ->
    0 < pow ->
    band_size <= tau_count * pow + err_scaled ->
    2 * err_scaled <= band_size ->
    band_size <= 2 * tau_count * pow.
Proof.
  intros band_size tau_count pow err_scaled Hband Hpow Hamp Herr.
  exact (fixed_m_band_mass_absorption_TEX band_size tau_count pow err_scaled Hamp Herr).
Qed.

End CollatzDammroze_Part5_FixedMBandMass_FromTex_v1.
