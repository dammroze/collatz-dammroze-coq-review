(*
  Part 6 / Bezout-to-inverse glue.

  Local algebraic glue:

    u*a + v*m = 1
    ----------------
    a*u ≡ 1 (mod m)

  This closes only the conversion from a Bezout identity to a modular inverse.
  It does NOT prove that odd coefficients are coprime to powers of 2.
  It does NOT prove the Bezout identity for 3^(i+1) and 2^m.
  It does NOT prove the full dyadic pullback.
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

Module CollatzDammroze_Part6_BezoutToInverseGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem bezout_to_inverse_left_TEX :
  forall a m u v : Z,
    u * a + v * m = 1 ->
    zcong m (a * u) 1.
Proof.
  intros a m u v Hbez.
  unfold zcong.
  exists (-v).
  replace (a * u - 1) with (-(v * m)).
  - ring.
  - rewrite <- Hbez.
    ring.
Qed.

Theorem bezout_to_inverse_right_TEX :
  forall a m u v : Z,
    a * u + m * v = 1 ->
    zcong m (a * u) 1.
Proof.
  intros a m u v Hbez.
  unfold zcong.
  exists (-v).
  replace (a * u - 1) with (-(m * v)).
  - ring.
  - rewrite <- Hbez.
    ring.
Qed.

Theorem bezout_to_inverse_commuted_TEX :
  forall a m u v : Z,
    u * a + v * m = 1 ->
    zcong m (u * a) 1.
Proof.
  intros a m u v Hbez.
  unfold zcong.
  exists (-v).
  replace (u * a - 1) with (-(v * m)).
  - ring.
  - rewrite <- Hbez.
    ring.
Qed.

End CollatzDammroze_Part6_BezoutToInverseGlue_FromTex_v1.
