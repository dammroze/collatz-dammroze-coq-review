(*
  Part 6 / Odd-coefficient dyadic pullback glue.

  Abstract congruence glue:

    a*inv ≡ 1 (mod m)
    a*n + b ≡ r (mod m)
    --------------------------
    n ≡ inv*(r-b) (mod m)

  and conversely.

  This closes only the algebraic fact that an invertible odd coefficient
  pulls a dyadic congruence back to a dyadic residue class modulo the same
  dyadic modulus.

  It does NOT prove existence of the inverse for 3^(i+1) modulo 2^m.
  It does NOT prove the full finite-union dyadic pullback.
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

Module CollatzDammroze_Part6_OddCoefficientDyadicPullbackGlue_FromTex_v1.

Definition zcong (m x y : Z) : Prop :=
  exists q : Z, x - y = q * m.

Theorem invertible_linear_congruence_forward_TEX :
  forall m a inv b r n : Z,
    zcong m (a * inv) 1 ->
    zcong m (a * n + b) r ->
    zcong m n (inv * (r - b)).
Proof.
  intros m a inv b r n Hinv Hlin.
  unfold zcong in *.
  destruct Hinv as [u Hu].
  destruct Hlin as [v Hv].
  exists (inv * v - u * n).
  assert (H1 : inv * a = 1 + u * m).
  {
    rewrite Z.mul_comm.
    lia.
  }
  assert (H2 : a * n = (r - b) + v * m).
  {
    lia.
  }
  replace (n - inv * (r - b))
    with (inv * (a * n - (r - b)) - (inv * a - 1) * n) by ring.
  rewrite H2.
  rewrite H1.
  ring.
Qed.

Theorem invertible_linear_congruence_backward_TEX :
  forall m a inv b r n : Z,
    zcong m (a * inv) 1 ->
    zcong m n (inv * (r - b)) ->
    zcong m (a * n + b) r.
Proof.
  intros m a inv b r n Hinv Hn.
  unfold zcong in *.
  destruct Hinv as [u Hu].
  destruct Hn as [v Hv].
  exists (a * v + u * (r - b)).
  assert (H1 : a * inv = 1 + u * m).
  {
    lia.
  }
  replace (a * n + b - r)
    with (a * (n - inv * (r - b)) + (a * inv - 1) * (r - b)) by ring.
  rewrite Hv.
  rewrite H1.
  ring.
Qed.

Theorem invertible_linear_congruence_equiv_TEX :
  forall m a inv b r n : Z,
    zcong m (a * inv) 1 ->
    (zcong m (a * n + b) r <-> zcong m n (inv * (r - b))).
Proof.
  intros m a inv b r n Hinv.
  split.
  - apply invertible_linear_congruence_forward_TEX.
    exact Hinv.
  - apply invertible_linear_congruence_backward_TEX.
    exact Hinv.
Qed.

End CollatzDammroze_Part6_OddCoefficientDyadicPullbackGlue_FromTex_v1.
