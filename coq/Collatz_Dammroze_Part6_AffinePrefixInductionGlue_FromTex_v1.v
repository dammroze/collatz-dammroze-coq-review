(*
  Part 6 / Affine-prefix induction glue.

  If the affine prefix identity holds at i=0 and the affine step recurrence
  holds for every predecessor-admissible prefix step i<L, then the affine
  prefix identity holds for every i<=L:

    pow2S(i) * X(i) = pow3(i) * n + A(i).

  This closes only the algebraic induction of the affine-prefix representation.
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

From Coq Require Import Arith.Arith.
From Coq Require Import ZArith.ZArith.
From Coq Require Import micromega.Lia.
From Coq Require Import setoid_ring.Ring.

Open Scope Z_scope.

Module CollatzDammroze_Part6_AffinePrefixInductionGlue_FromTex_v1.

Theorem affine_prefix_induction_TEX :
  forall
    (n : Z)
    (L : nat)
    (X A pow2S pow2k pow3 : nat -> Z),
    pow2S O * X O = pow3 O * n + A O ->
    (forall i : nat,
      (i < L)%nat ->
      pow2S (S i) = pow2S i * pow2k i /\
      pow3 (S i) = 3 * pow3 i /\
      A (S i) = 3 * A i + pow2S i /\
      pow2k i * X (S i) = 3 * X i + 1) ->
    forall i : nat,
      (i <= L)%nat ->
      pow2S i * X i = pow3 i * n + A i.
Proof.
  intros n L X A pow2S pow2k pow3 Hbase Hstep.
  induction i as [|i IH]; intros Hi.
  - exact Hbase.
  - assert (Hi_le : (i <= L)%nat) by lia.
    assert (Hi_lt : (i < L)%nat) by lia.
    specialize (IH Hi_le).
    specialize (Hstep i Hi_lt) as [Hpow2 [Hpow3 [HA Hnext]]].
    rewrite Hpow2, Hpow3, HA.
    replace ((pow2S i * pow2k i) * X (S i))
      with (pow2S i * (pow2k i * X (S i))) by ring.
    rewrite Hnext.
    replace (pow2S i * (3 * X i + 1))
      with (3 * (pow2S i * X i) + pow2S i) by ring.
    rewrite IH.
    ring.
Qed.

Theorem affine_prefix_induction_normalized_base_TEX :
  forall
    (n : Z)
    (L : nat)
    (X A pow2S pow2k pow3 : nat -> Z),
    X O = n ->
    A O = 0 ->
    pow2S O = 1 ->
    pow3 O = 1 ->
    (forall i : nat,
      (i < L)%nat ->
      pow2S (S i) = pow2S i * pow2k i /\
      pow3 (S i) = 3 * pow3 i /\
      A (S i) = 3 * A i + pow2S i /\
      pow2k i * X (S i) = 3 * X i + 1) ->
    forall i : nat,
      (i <= L)%nat ->
      pow2S i * X i = pow3 i * n + A i.
Proof.
  intros n L X A pow2S pow2k pow3 HX0 HA0 H2 H3 Hstep.
  eapply affine_prefix_induction_TEX.
  - rewrite HX0, HA0, H2, H3. ring.
  - exact Hstep.
Qed.

End CollatzDammroze_Part6_AffinePrefixInductionGlue_FromTex_v1.
