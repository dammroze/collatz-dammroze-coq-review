# Formalization Map: LaTeX Manuscript ↔ Coq/Rocq Files

This file was added in response to reviewer feedback requesting an explicit mapping between stated TeX results and their Rocq formalization.

## Purpose

This map is intended to help reviewers check:

1. which manuscript statements are represented in Rocq;
2. which Rocq files correspond to which manuscript steps;
3. which statements are proved, axiomatized, parameterized, or used as glue/bridge lemmas;
4. whether the final Rocq theorem matches the main theorem claimed in the manuscript.

## Current Status

The repository contains a Coq/Rocq formalization package for the deterministic obstruction-exclusion chain associated with the LaTeX manuscript. Reviewers should explicitly distinguish between:

1. a top-level formal statement of the Collatz conjecture itself; and
2. an internal closure theorem showing that the manuscript obstruction-exclusion chain closes under the stated assumptions.

This distinction is part of the review target.

## High-Level Manuscript → Rocq Roadmap

| Manuscript component | Mathematical role | Rocq artifact |
|---|---|---|
| Reader Advisory / Methodological Note | Zero-probability, zero-ergodicity reading framework | README.md; paper/*.tex |
| Reader’s Guide / Logical Map | Required order for reading the proof chain | README.md; paper/*.tex |
| Dyadic-band normalization | Finite local arithmetic setting | coq/*.v |
| Local obstruction formulation | Converts divergence/cycle into local certificate | Collatz_Dammroze_Coq_Monolithic_Final_FromTex_v2.v and related glue files |
| Finite alphabet / local repetition | Forces repeated local configurations | Collatz_Dammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.v |
| Amplification | Repetition forces deterministic lower bound | Collatz_Dammroze_Part5_AmplificationDensityGlue_FromTex_v1.v |
| Tail/control and budget recombination | Produces incompatible upper bound | Part6 budget/refinement glue files |
| Internal closure | Closes the obstruction-exclusion chain | Collatz_Dammroze_InternalSolution_TotalClosure_v1.v |
| Main theorem claim | Collatz-level manuscript conclusion | Must be checked against the final Rocq statement |

## Extracted Rocq File Map

| Rocq file | Intended role inferred from filename | Detected declarations | Axioms/Parameters detected | Admitted/admit detected |
|---|---|---|---|---|
| `Collatz_Dammroze_Coq_Monolithic_Final_FromTex_v2.v` | Coq Monolithic Final FromTex | Theorem monolithic_export_stack_closed_TEX | none detected | no |
| `Collatz_Dammroze_InternalSolution_TotalClosure_v1.v` | InternalSolution TotalClosure | Definition core_01_nonergodic_local_closure_repeat_TEX<br>Definition core_02_nonergodic_local_closure_product_repeat_TEX<br>Definition core_03_no_accumulation_bad_bands_scaled_contradiction_TEX<br>Definition core_04_amplification_density_lower_bound_transfers_TEX<br>Definition core_05_uniform_band_stability_positive_good_fraction_TEX<br>Definition core_06_endpoint_budget_absorbs_tail_TEX<br>Definition core_07_multiplicative_endpoint_budget_absorbs_tail_TEX<br>Definition core_08_regimeA_conditional_glue_with_scaled_coeff_TEX<br>Definition core_09_aligned_residue_exact_parametrization_TEX<br>Definition core_10_same_residue_unique_in_aligned_band_when_mod_exceeds_TEX<br>Definition core_11_two_regime_budget_recombination_with_common_majorant_TEX<br>Theorem dammroze_internal_solution_total_closure_TEX | none detected | yes |
| `Collatz_Dammroze_Part5_AmplificationDensityGlue_FromTex_v1.v` | Part5 AmplificationDensityGlue | Theorem amplification_prefix_subset_density_glue_TEX<br>Theorem amplification_density_lower_bound_transfers_TEX | none detected | no |
| `Collatz_Dammroze_Part5_FiniteAlphabetPigeonhole_FromTex_v1.v` | Part5 FiniteAlphabetPigeonhole | Definition bounded_certificate_codes<br>Theorem finite_alphabet_pigeonhole_TEX<br>Theorem finite_alphabet_pigeonhole_product_bound_TEX | none detected | no |
| `Collatz_Dammroze_Part5_FixedMBandMass_FromTex_v1.v` | Part5 FixedMBandMass | Theorem fixed_m_band_mass_absorption_TEX<br>Theorem fixed_m_band_mass_positive_lower_TEX | none detected | no |
| `Collatz_Dammroze_Part5_NoAccumulationBadBands_FromTex_v1.v` | Part5 NoAccumulationBadBands | Theorem no_accumulation_bad_bands_scaled_contradiction_TEX | none detected | no |
| `Collatz_Dammroze_Part5_NonErgodicLocalClosure_FromTex_v1.v` | Part5 NonErgodicLocalClosure | Theorem nonergodic_local_closure_repeat_TEX<br>Theorem nonergodic_local_closure_product_repeat_TEX | none detected | no |
| `Collatz_Dammroze_Part5_UniformBandStabilityGlue_FromTex_v1.v` | Part5 UniformBandStabilityGlue | Theorem uniform_band_stability_complement_TEX<br>Theorem uniform_band_stability_positive_good_fraction_TEX | none detected | no |
| `Collatz_Dammroze_Part6_AffinePrefixInductionGlue_FromTex_v1.v` | Part6 AffinePrefixInductionGlue | Theorem affine_prefix_induction_TEX<br>Theorem affine_prefix_induction_normalized_base_TEX | none detected | no |
| `Collatz_Dammroze_Part6_AffinePrefixStepGlue_FromTex_v1.v` | Part6 AffinePrefixStepGlue | Theorem affine_prefix_step_crossmul_TEX<br>Theorem affine_prefix_step_crossmul_scaled_TEX | none detected | no |
| `Collatz_Dammroze_Part6_AlignedResidueCountingGlue_FromTex_v1.v` | Part6 AlignedResidueCountingGlue | Definition zcong<br>Theorem aligned_residue_parametrization_TEX<br>Theorem aligned_residue_representative_in_band_TEX<br>Theorem aligned_residue_representative_congruent_TEX<br>Theorem aligned_residue_representative_unique_TEX<br>Theorem aligned_residue_exact_parametrization_TEX | none detected | no |
| `Collatz_Dammroze_Part6_BezoutToInverseGlue_FromTex_v1.v` | Part6 BezoutToInverseGlue | Definition zcong<br>Theorem bezout_to_inverse_left_TEX<br>Theorem bezout_to_inverse_right_TEX<br>Theorem bezout_to_inverse_commuted_TEX | none detected | no |
| `Collatz_Dammroze_Part6_DyadicClassIntersectionGlue_FromTex_v1.v` | Part6 DyadicClassIntersectionGlue | Definition zcong<br>Theorem same_mod_common_point_forces_residue_compat_TEX<br>Theorem compatible_residue_transfers_class_TEX<br>Theorem same_mod_class_intersection_nonempty_equiv_TEX | none detected | no |
| `Collatz_Dammroze_Part6_DyadicPowerDivisibilityGlue_FromTex_v1.v` | Part6 DyadicPowerDivisibilityGlue | Theorem pow2_divides_monotone_nat_TEX<br>Theorem pow2_divides_monotone_Z_of_nat_TEX<br>Theorem pow2_common_modulus_for_depth_TEX | none detected | no |
| `Collatz_Dammroze_Part6_EffectiveModulusDepthGlue_FromTex_v1.v` | Part6 EffectiveModulusDepthGlue | Theorem effective_modulus_depth_plus_one_TEX<br>Theorem effective_modulus_depth_bound_TEX | none detected | no |
| `Collatz_Dammroze_Part6_EndpointBudgetGlue_FromTex_v1.v` | Part6 EndpointBudgetGlue | Theorem endpoint_budget_absorbs_tail_TEX<br>Theorem endpoint_budget_absorbs_tail_scaled_TEX | none detected | no |
| `Collatz_Dammroze_Part6_FiniteUnionDyadicStabilityGlue_FromTex_v1.v` | Part6 FiniteUnionDyadicStabilityGlue | Definition zcong<br>Definition represented<br>Definition residue_sublist<br>Theorem zcong_class_compat_TEX<br>Theorem not_zcong_class_compat_TEX<br>Theorem represented_intersection_compatible_TEX<br>Theorem represented_intersection_congruence_TEX<br>Theorem represented_intersection_exclusion_TEX | none detected | no |
| `Collatz_Dammroze_Part6_ModulusRefinementGlue_FromTex_v1.v` | Part6 ModulusRefinementGlue | Definition zcong<br>Theorem divisible_modulus_refines_congruence_TEX<br>Theorem divisible_modulus_refines_noncongruence_TEX<br>Theorem divisible_modulus_same_residue_implies_small_class_TEX | none detected | no |
| `Collatz_Dammroze_Part6_MultiplicativeEndpointBudgetGlue_FromTex_v1.v` | Part6 MultiplicativeEndpointBudgetGlue | Theorem multiplicative_endpoint_budget_to_gap_TEX<br>Theorem multiplicative_endpoint_budget_absorbs_tail_TEX | none detected | no |
| `Collatz_Dammroze_Part6_OddCoeffInversePow2Glue_FromTex_v1.v` | Part6 OddCoeffInversePow2Glue | Theorem Z_of_nat_pow2_succ_TEX<br>Theorem odd_rel_prime_two_TEX<br>Theorem odd_rel_prime_pow2_TEX<br>Theorem pow3_succ_rel_prime_pow2_TEX<br>Theorem pow3_succ_inverse_mod_pow2_TEX | none detected | no |
| `Collatz_Dammroze_Part6_OddCoefficientDyadicPullbackGlue_FromTex_v1.v` | Part6 OddCoefficientDyadicPullbackGlue | Definition zcong<br>Theorem invertible_linear_congruence_forward_TEX<br>Theorem invertible_linear_congruence_backward_TEX<br>Theorem invertible_linear_congruence_equiv_TEX | none detected | no |
| `Collatz_Dammroze_Part6_OddPowerCoefficientGlue_FromTex_v1.v` | Part6 OddPowerCoefficientGlue | Theorem pow3_odd_nat_TEX<br>Theorem pow3_succ_odd_nat_TEX<br>Theorem pow3_succ_not_even_nat_TEX | none detected | no |
| `Collatz_Dammroze_Part6_RegimeAConditionalGlue_FromTex_v1.v` | Part6 RegimeAConditionalGlue | Theorem regimeA_conditional_glue_TEX<br>Theorem regimeA_conditional_glue_with_scaled_coeff_TEX | none detected | no |
| `Collatz_Dammroze_Part6_RelPrimeToInverseGlue_FromTex_v1.v` | Part6 RelPrimeToInverseGlue | Definition zcong<br>Theorem rel_prime_to_inverse_TEX<br>Theorem rel_prime_to_inverse_commuted_TEX | none detected | no |
| `Collatz_Dammroze_Part6_SparseResidueIntervalGlue_FromTex_v1.v` | Part6 SparseResidueIntervalGlue | Definition zcong<br>Theorem congruent_and_short_difference_equal_TEX<br>Theorem same_residue_unique_in_short_interval_TEX<br>Theorem same_residue_unique_in_aligned_band_when_mod_exceeds_TEX | none detected | no |
| `Collatz_Dammroze_Part6_TwoRegimeBudgetRecombination_FromTex_v1.v` | Part6 TwoRegimeBudgetRecombination | Theorem two_regime_budget_recombination_TEX<br>Theorem two_regime_budget_recombination_with_common_majorant_TEX | none detected | no |

## Immediate Review Tasks

1. Identify the exact Rocq theorem corresponding to the manuscript’s main theorem.
2. Mark each manuscript lemma/proposition/theorem with the exact Rocq declaration name.
3. Distinguish proved results from axioms, parameters, assumptions, and glue lemmas.
4. Explain auxiliary bridge names, including files such as `SparseResidueIntervalGlue`, when the exact phrase does not appear in the TeX manuscript.
5. Verify whether `Collatz_Dammroze_InternalSolution_TotalClosure_v1.v` is a Collatz-level theorem or an internal closure theorem under assumptions.

## Reproducibility Commands

```bash
cd coq
coqc --version
make clean || true
make -j1
```

## Review Target

> Does the finite deterministic obstruction-exclusion chain stated in the manuscript, and represented in Coq/Rocq, close without hidden assumptions or formalization errors?
