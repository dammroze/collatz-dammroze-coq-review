(*
  Part 6 / Finite-union dyadic stability glue.

  Abstract local fact:
    If P is represented by a finite union of residue classes modulo m,
    and C is a class-compatible congruence/exclusion condition modulo m,
    then P /\ C is again represented by a finite union of residue classes
    modulo m.

  This closes only the finite-union stability glue.
  It does NOT construct the actual predecessor-admissible pullback.
  It does NOT prove fixed-K level-wise endpoint estimate.
  It does NOT close Regime A, Regime B, Axiom V, or the global theorem.

  No probability.
  No mixing.
  No time-ergodicity.
  No Cesaro averaging.
  No sliding windows.
*)

From Coq Require Import ZArith.ZArith.
From Coq Require Import Lists.List.
From Coq Require Import micromega.Lia.
Import ListNotations.

Open Scope Z_scope.

Module CollatzDammroze_Part6_FiniteUnionDyadicStabilityGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Definition represented (m : Z) (Rs : list Z) (P : Z -> Prop) : Prop :=
  forall n : Z, P n <-> exists r : Z, In r Rs /\ zcong m n r.

Definition residue_sublist
  (Rs Rs' : list Z) (keep : Z -> Prop) : Prop :=
  forall r : Z, In r Rs' <-> In r Rs /\ keep r.

Theorem zcong_class_compat_TEX :
  forall m n r a : Z,
    zcong m n r ->
    (zcong m n a <-> zcong m r a).
Proof.
  intros m n r a Hnr.
  unfold zcong in *.
  destruct Hnr as [q0 H0].
  split.
  - intros [q1 H1].
    exists (q1 - q0).
    replace (r - a) with ((n - a) - (n - r)) by ring.
    rewrite H1, H0.
    ring.
  - intros [q1 H1].
    exists (q0 + q1).
    replace (n - a) with ((n - r) + (r - a)) by ring.
    rewrite H0, H1.
    ring.
Qed.

Theorem not_zcong_class_compat_TEX :
  forall m n r a : Z,
    zcong m n r ->
    (~ zcong m n a <-> ~ zcong m r a).
Proof.
  intros m n r a Hnr.
  pose proof (zcong_class_compat_TEX m n r a Hnr) as Hiff.
  tauto.
Qed.

Theorem represented_intersection_compatible_TEX :
  forall (m : Z) (Rs Rs' : list Z) (P C : Z -> Prop) (keep : Z -> Prop),
    represented m Rs P ->
    residue_sublist Rs Rs' keep ->
    (forall n r : Z, zcong m n r -> (C n <-> keep r)) ->
    represented m Rs' (fun n => P n /\ C n).
Proof.
  intros m Rs Rs' P C keep Hrep Hsub Hcompat.
  unfold represented in *.
  intro n.
  split.
  - intros [HP HC].
    apply Hrep in HP.
    destruct HP as [r [HinRs Hnr]].
    exists r.
    split.
    + apply Hsub.
      split.
      * exact HinRs.
      * apply (proj1 (Hcompat n r Hnr)).
        exact HC.
    + exact Hnr.
  - intros [r [HinRs' Hnr]].
    apply Hsub in HinRs'.
    destruct HinRs' as [HinRs Hkeep].
    split.
    + apply Hrep.
      exists r.
      split; assumption.
    + apply (proj2 (Hcompat n r Hnr)).
      exact Hkeep.
Qed.

Theorem represented_intersection_congruence_TEX :
  forall (m : Z) (Rs Rs' : list Z) (P : Z -> Prop) (a : Z),
    represented m Rs P ->
    residue_sublist Rs Rs' (fun r => zcong m r a) ->
    represented m Rs' (fun n => P n /\ zcong m n a).
Proof.
  intros m Rs Rs' P a Hrep Hsub.
  eapply represented_intersection_compatible_TEX.
  - exact Hrep.
  - exact Hsub.
  - intros n r Hnr.
    apply zcong_class_compat_TEX.
    exact Hnr.
Qed.

Theorem represented_intersection_exclusion_TEX :
  forall (m : Z) (Rs Rs' : list Z) (P : Z -> Prop) (a : Z),
    represented m Rs P ->
    residue_sublist Rs Rs' (fun r => ~ zcong m r a) ->
    represented m Rs' (fun n => P n /\ ~ zcong m n a).
Proof.
  intros m Rs Rs' P a Hrep Hsub.
  eapply represented_intersection_compatible_TEX.
  - exact Hrep.
  - exact Hsub.
  - intros n r Hnr.
    apply not_zcong_class_compat_TEX.
    exact Hnr.
Qed.

End CollatzDammroze_Part6_FiniteUnionDyadicStabilityGlue_FromTex_v1.
