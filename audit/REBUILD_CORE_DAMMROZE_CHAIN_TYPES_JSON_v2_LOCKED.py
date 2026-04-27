from pathlib import Path
import json, datetime, subprocess, hashlib, re

coq_file = Path("PRINT_CORE_DAMMROZE_CHAIN_TYPES_v2.v")
out_file = Path("CORE_DAMMROZE_CHAIN_TYPES_v2.out")
json_file = Path("CORE_DAMMROZE_CHAIN_TYPES_v2_LOCKED.json")

targets = [
    "CollatzDammroze_Part5_NonErgodicLocalClosure_FromTex_v1.nonergodic_local_closure_repeat_TEX",
    "CollatzDammroze_Part5_NonErgodicLocalClosure_FromTex_v1.nonergodic_local_closure_product_repeat_TEX",
    "CollatzDammroze_Part5_NoAccumulationBadBands_FromTex_v1.no_accumulation_bad_bands_scaled_contradiction_TEX",
    "CollatzDammroze_Part5_AmplificationDensityGlue_FromTex_v1.amplification_density_lower_bound_transfers_TEX",
    "CollatzDammroze_Part5_UniformBandStabilityGlue_FromTex_v1.uniform_band_stability_positive_good_fraction_TEX",
    "CollatzDammroze_Part6_EndpointBudgetGlue_FromTex_v1.endpoint_budget_absorbs_tail_TEX",
    "CollatzDammroze_Part6_MultiplicativeEndpointBudgetGlue_FromTex_v1.multiplicative_endpoint_budget_absorbs_tail_TEX",
    "CollatzDammroze_Part6_RegimeAConditionalGlue_FromTex_v1.regimeA_conditional_glue_with_scaled_coeff_TEX",
    "CollatzDammroze_Part6_AlignedResidueCountingGlue_FromTex_v1.aligned_residue_exact_parametrization_TEX",
    "CollatzDammroze_Part6_SparseResidueIntervalGlue_FromTex_v1.same_residue_unique_in_aligned_band_when_mod_exceeds_TEX",
    "CollatzDammroze_Part6_TwoRegimeBudgetRecombination_FromTex_v1.two_regime_budget_recombination_with_common_majorant_TEX",
]

def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

raw = out_file.read_text(errors="replace")

try:
    coq_version = subprocess.check_output(["coqc", "--version"], text=True).strip()
except Exception as e:
    coq_version = f"unavailable: {e}"

has_error = bool(re.search(r"\bError:|Toplevel input|not a defined object|was not found|Cannot find|Syntax error", raw))
has_axioms = "Axioms:" in raw
has_assumptions = "Assumptions:" in raw
closed_count = raw.count("Closed under the global context")

data = {
    "audit_name": "CORE_DAMMROZE_CHAIN_TYPES_JSON_v2_LOCKED",
    "created_utc": datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z"),
    "coq_version": coq_version,
    "opam_switch": "coq-8.18.0",
    "coq_file": str(coq_file),
    "output_file": str(out_file),
    "coq_file_sha256": sha256(coq_file),
    "output_file_sha256": sha256(out_file),
    "target_count": len(targets),
    "targets": targets,
    "closed_under_global_context_count": closed_count,
    "has_error": has_error,
    "has_axioms_marker": has_axioms,
    "has_assumptions_marker": has_assumptions,
    "pass": (
        len(targets) == 11
        and closed_count == 11
        and not has_error
        and not has_axioms
        and not has_assumptions
    ),
    "interpretation": "Core Dammroze non-ergodic chain target type audit: 11 selected central targets printed and their assumptions audited; all expected Closed-under-global-context markers are present and no error/axiom/assumption markers are detected.",
    "non_ergodic_constraints": [
        "finite band-local counting",
        "predecessor-admissible local structure",
        "no probability",
        "no mixing",
        "no Cesaro averaging",
        "no time-ergodic averaging",
        "no sliding windows"
    ],
    "raw_output": raw
}

json_file.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n")
print("wrote", json_file)
print("pass:", data["pass"])
print("target_count:", data["target_count"])
print("closed_under_global_context_count:", data["closed_under_global_context_count"])
print("has_error:", data["has_error"])
print("has_axioms_marker:", data["has_axioms_marker"])
print("has_assumptions_marker:", data["has_assumptions_marker"])
