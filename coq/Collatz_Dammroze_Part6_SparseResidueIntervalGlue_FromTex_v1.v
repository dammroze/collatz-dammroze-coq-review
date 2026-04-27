(*
  Part 6 / Sparse residue interval glue.

  Local sparse-counting fact:

    If an interval has length len <= m, then any fixed residue
    class modulo m has at most one representative in that interval.

  This closes only the deterministic sparse residue-class uniqueness
  needed for Regime B.

  It does NOT prove the full Regime B endpoint budget.
  It does NOT close the weighted endpoint budget.
  It does NOT close Axiom V or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import ZArith.ZArith.
From Coq Require Import micromega.Lia.
From Coq Require Import micromega.Psatz.
From Coq Require Import setoid_ring.Ring.

Open Scope Z_scope.

Module CollatzDammroze_Part6_SparseResidueIntervalGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem congruent_and_short_difference_equal_TEX :
  forall m x y : Z,
    0 < m ->
    -m < x - y < m ->
    zcong m x y ->
    x = y.
Proof.
  intros m x y Hm Hshort Hcong.
  unfold zcong in Hcong.
  destruct Hcong as [q Hq].
  assert (q = 0) by nia.
  subst q.
  lia.
Qed.

Theorem same_residue_unique_in_short_interval_TEX :
  forall m B len n1 n2 r : Z,
    0 < m ->
    0 <= len <= m ->
    B <= n1 < B + len ->
    B <= n2 < B + len ->
    zcong m n1 r ->
    zcong m n2 r ->
    n1 = n2.
Proof.
  intros m B len n1 n2 r Hm Hlen Hn1 Hn2 H1 H2.
  assert (Hdiff : -m < n1 - n2 < m) by lia.
  apply congruent_and_short_difference_equal_TEX with (m := m).
  - exact Hm.
  - exact Hdiff.
  - unfold zcong in *.
    destruct H1 as [q1 Hq1].
    destruct H2 as [q2 Hq2].
    exists (q1 - q2).
    replace (n1 - n2) with ((n1 - r) - (n2 - r)) by ring.
    rewrite Hq1, Hq2.
    ring.
Qed.

Theorem same_residue_unique_in_aligned_band_when_mod_exceeds_TEX :
  forall m B n1 n2 r : Z,
    0 < B ->
    B <= m ->
    B <= n1 < 2 * B ->
    B <= n2 < 2 * B ->
    zcong m n1 r ->
    zcong m n2 r ->
    n1 = n2.
Proof.
  intros m B n1 n2 r HB Hlen Hn1 Hn2 H1 H2.
  eapply same_residue_unique_in_short_interval_TEX with
    (m := m) (B := B) (len := B) (r := r).
  - lia.
  - lia.
  - replace (B + B) with (2 * B) by ring.
    exact Hn1.
  - replace (B + B) with (2 * B) by ring.
    exact Hn2.
  - exact H1.
  - exact H2.
Qed.

End CollatzDammroze_Part6_SparseResidueIntervalGlue_FromTex_v1.
