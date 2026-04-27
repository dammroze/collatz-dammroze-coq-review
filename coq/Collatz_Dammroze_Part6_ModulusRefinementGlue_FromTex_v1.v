(*
  Part 6 / Modulus refinement glue.

  Local congruence facts:
    m_big = c * m_small
    n ≡ R mod m_big
    R ≡ r mod m_small
    --------------------
    n ≡ r mod m_small

  and the corresponding exclusion transfer.

  This closes only the algebraic refinement from a common finer dyadic modulus
  to a coarser dyadic condition.

  It does NOT prove that 2^d divides 2^(K+L).
  It does NOT prove the full finite-union pullback.
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

Module CollatzDammroze_Part6_ModulusRefinementGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem divisible_modulus_refines_congruence_TEX :
  forall m_small m_big c n R r : Z,
    m_big = c * m_small ->
    zcong m_big n R ->
    zcong m_small R r ->
    zcong m_small n r.
Proof.
  intros m_small m_big c n R r Hdiv Hbig Hsmall.
  unfold zcong in *.
  destruct Hbig as [qbig Hbig].
  destruct Hsmall as [qsmall Hsmall].
  exists (qbig * c + qsmall).
  replace (n - r) with ((n - R) + (R - r)) by ring.
  rewrite Hbig, Hsmall, Hdiv.
  ring.
Qed.

Theorem divisible_modulus_refines_noncongruence_TEX :
  forall m_small m_big c n R r : Z,
    m_big = c * m_small ->
    zcong m_big n R ->
    ~ zcong m_small R r ->
    ~ zcong m_small n r.
Proof.
  intros m_small m_big c n R r Hdiv Hbig Hnot Hnr.
  apply Hnot.
  unfold zcong in *.
  destruct Hbig as [qbig Hbig].
  destruct Hnr as [qnr Hnr].
  exists (qnr - qbig * c).
  replace (R - r) with ((n - r) - (n - R)) by ring.
  rewrite Hnr, Hbig, Hdiv.
  ring.
Qed.

Theorem divisible_modulus_same_residue_implies_small_class_TEX :
  forall m_small m_big c n R : Z,
    m_big = c * m_small ->
    zcong m_big n R ->
    zcong m_small n R.
Proof.
  intros m_small m_big c n R Hdiv Hbig.
  unfold zcong in *.
  destruct Hbig as [qbig Hbig].
  exists (qbig * c).
  rewrite Hbig, Hdiv.
  ring.
Qed.

End CollatzDammroze_Part6_ModulusRefinementGlue_FromTex_v1.
