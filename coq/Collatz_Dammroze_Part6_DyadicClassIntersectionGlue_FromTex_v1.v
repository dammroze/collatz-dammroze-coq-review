(*
  Part 6 / Dyadic class intersection glue.

  Local congruence facts:
    n ≡ r mod m and n ≡ t mod m  =>  r ≡ t mod m.
    r ≡ t mod m and n ≡ r mod m  =>  n ≡ t mod m.

  This closes only same-modulus residue-class intersection algebra.
  It does NOT prove inverse existence.
  It does NOT prove full finite-union pullback.
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

Module CollatzDammroze_Part6_DyadicClassIntersectionGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem same_mod_common_point_forces_residue_compat_TEX :
  forall m n r t : Z,
    zcong m n r ->
    zcong m n t ->
    zcong m r t.
Proof.
  intros m n r t Hnr Hnt.
  unfold zcong in *.
  destruct Hnr as [q1 H1].
  destruct Hnt as [q2 H2].
  exists (q2 - q1).
  lia.
Qed.

Theorem compatible_residue_transfers_class_TEX :
  forall m n r t : Z,
    zcong m r t ->
    zcong m n r ->
    zcong m n t.
Proof.
  intros m n r t Hrt Hnr.
  unfold zcong in *.
  destruct Hrt as [q1 H1].
  destruct Hnr as [q2 H2].
  exists (q1 + q2).
  lia.
Qed.

Theorem same_mod_class_intersection_nonempty_equiv_TEX :
  forall m n r t : Z,
    zcong m n r ->
    (zcong m n t <-> zcong m r t).
Proof.
  intros m n r t Hnr.
  split.
  - intro Hnt.
    eapply same_mod_common_point_forces_residue_compat_TEX.
    exact Hnr.
    exact Hnt.
  - intro Hrt.
    eapply compatible_residue_transfers_class_TEX.
    exact Hrt.
    exact Hnr.
Qed.

End CollatzDammroze_Part6_DyadicClassIntersectionGlue_FromTex_v1.
