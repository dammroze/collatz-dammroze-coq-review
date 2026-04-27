(*
  Collatz_Dammroze_Part5_NonErgodicLocalClosure_FromTex_v1.v

  TEX Part 5 / lines 1383--1408:

    Non-ergodic local closure.

  Formal finite version:
    within one fixed dyadic band and one fixed window length,
    locally admissible configurations form a finite alphabet.
    If an orbit emits more band-entry configurations than the finite
    alphabet size, then some configuration repeats.

  This file intentionally asserts no accelerated-time gap bound,
  matching the TEX.

  No probability.
  No ergodicity.
  No independence.
  No mixing.
  No sliding windows.
  No global averaging.
  No accelerated-time gap bound.
  No Axiom IV final.
  No PaperAxioms.
  No PaperProofPackage.
  No final Collatz theorem.
*)

From Coq Require Import Lists.List.
From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Require Import Collatz_Dammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.

Import ListNotations.
Import CollatzDammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.

Module CollatzDammroze_Part5_NonErgodicLocalClosure_FromTex_v1.

Theorem nonergodic_local_closure_repeat_TEX :
  forall (N : nat) (band_entry_config_codes : list nat),
    bounded_certificate_codes N band_entry_config_codes ->
    S N <= length band_entry_config_codes ->
    ~ NoDup band_entry_config_codes.
Proof.
  intros N band_entry_config_codes Hcodes Hvisits.
  apply (finite_alphabet_pigeonhole_TEX N band_entry_config_codes).
  - exact Hcodes.
  - lia.
Qed.

Theorem nonergodic_local_closure_product_repeat_TEX :
  forall (G N : nat) (band_entry_certificate_codes : list nat),
    bounded_certificate_codes (G * N) band_entry_certificate_codes ->
    S (G * N) <= length band_entry_certificate_codes ->
    ~ NoDup band_entry_certificate_codes.
Proof.
  intros G N band_entry_certificate_codes Hcodes Hvisits.
  apply (finite_alphabet_pigeonhole_product_bound_TEX G N band_entry_certificate_codes).
  - exact Hcodes.
  - lia.
Qed.

End CollatzDammroze_Part5_NonErgodicLocalClosure_FromTex_v1.
