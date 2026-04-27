(*
  Collatz_Dammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.v

  TEX Part 5 / lines 1357--1375:

    Finite alphabet and pigeonhole.

  Formal finite version:

    if a band-internal segment emits more certificates than the size
    of the finite scale-normalized certificate alphabet, then the
    certificate list cannot be duplicate-free.

  Certificates are represented by finite codes 0 <= code < M.

  No probability.
  No ergodicity.
  No independence.
  No mixing.
  No sliding windows.
  No global averaging.
  No Axiom IV final.
  No PaperAxioms.
  No PaperProofPackage.
  No final Collatz theorem.
*)

From Coq Require Import Lists.List.
From Coq Require Import Arith.Arith.
From Coq Require Import micromega.Lia.

Import ListNotations.

Module CollatzDammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.

Definition bounded_certificate_codes (M : nat) (xs : list nat) : Prop :=
  forall x, In x xs -> x < M.

Theorem finite_alphabet_pigeonhole_TEX :
  forall (M : nat) (xs : list nat),
    bounded_certificate_codes M xs ->
    M < length xs ->
    ~ NoDup xs.
Proof.
  intros M xs Hbound Hlong Hnodup.

  assert (Hin_seq : incl xs (seq 0 M)).
  {
    unfold incl.
    intros x Hx.
    apply in_seq.
    split.
    - lia.
    - apply Hbound in Hx.
      lia.
  }

  pose proof (NoDup_incl_length Hnodup Hin_seq) as Hlen.
  rewrite seq_length in Hlen.
  lia.
Qed.

Theorem finite_alphabet_pigeonhole_product_bound_TEX :
  forall (G N : nat) (xs : list nat),
    bounded_certificate_codes (G * N) xs ->
    G * N < length xs ->
    ~ NoDup xs.
Proof.
  intros G N xs Hbound Hlong.
  exact (finite_alphabet_pigeonhole_TEX (G * N) xs Hbound Hlong).
Qed.

End CollatzDammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.
