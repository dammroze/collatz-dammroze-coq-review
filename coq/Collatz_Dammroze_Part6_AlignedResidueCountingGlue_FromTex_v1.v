(*
  Part 6 / Aligned residue counting glue.

  Local aligned-band counting fact.

  If the interval starts at a multiple of m and has length Q*m, then
  every residue class modulo m has exactly Q representatives in the interval.

  This closes only the algebraic parametrization/uniqueness of representatives
  in an aligned finite band.

  It does NOT prove the full Regime A endpoint budget by itself.
  It does NOT prove Regime B.
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

Module CollatzDammroze_Part6_AlignedResidueCountingGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem aligned_residue_parametrization_TEX :
  forall m B Q r n base : Z,
    0 < m ->
    0 <= Q ->
    0 <= r < m ->
    B = base * m ->
    B <= n < B + Q * m ->
    zcong m n r ->
    exists t : Z,
      0 <= t < Q /\ n = B + r + t * m.
Proof.
  intros m B Q r n base Hm HQ Hr HB Hband Hcong.
  unfold zcong in Hcong.
  destruct Hcong as [q Hq].
  exists (q - base).
  split.
  - subst B.
    assert (Hn : n = r + q * m) by lia.
    split; nia.
  - subst B.
    assert (Hn : n = r + q * m) by lia.
    rewrite Hn.
    ring.
Qed.

Theorem aligned_residue_representative_in_band_TEX :
  forall m B Q r base t : Z,
    0 < m ->
    0 <= Q ->
    0 <= r < m ->
    B = base * m ->
    0 <= t < Q ->
    B <= B + r + t * m < B + Q * m.
Proof.
  intros m B Q r base t Hm HQ Hr HB Ht.
  subst B.
  nia.
Qed.

Theorem aligned_residue_representative_congruent_TEX :
  forall m B r base t : Z,
    B = base * m ->
    zcong m (B + r + t * m) r.
Proof.
  intros m B r base t HB.
  unfold zcong.
  exists (base + t).
  subst B.
  ring.
Qed.

Theorem aligned_residue_representative_unique_TEX :
  forall m B r t1 t2 : Z,
    0 < m ->
    B + r + t1 * m = B + r + t2 * m ->
    t1 = t2.
Proof.
  intros m B r t1 t2 Hm Heq.
  nia.
Qed.

Theorem aligned_residue_exact_parametrization_TEX :
  forall m B Q r n base : Z,
    0 < m ->
    0 <= Q ->
    0 <= r < m ->
    B = base * m ->
    B <= n < B + Q * m ->
    zcong m n r <->
    exists t : Z, 0 <= t < Q /\ n = B + r + t * m.
Proof.
  intros m B Q r n base Hm HQ Hr HB Hband.
  split.
  - apply aligned_residue_parametrization_TEX with (base := base); assumption.
  - intros [t [Ht Hn]].
    rewrite Hn.
    apply aligned_residue_representative_congruent_TEX with (base := base).
    exact HB.
Qed.

End CollatzDammroze_Part6_AlignedResidueCountingGlue_FromTex_v1.
