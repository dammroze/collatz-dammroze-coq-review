# Collatz–Dammroze Coq/Rocq Review Package

This repository contains a LaTeX manuscript and Coq/Rocq formalization artifacts for technical peer review.

## Contents

- `paper/` — LaTeX manuscript and PDF.
- `coq/` — Coq/Rocq proof files.
- `audit/` — assumption reports, hashes, manifests, and audit files.
- `scripts/` — local scripts, if present.

## Review request

Please review:

1. Coq/Rocq soundness;
2. assumption dependency tracking;
3. hidden or unintended assumptions;
4. alignment between the LaTeX manuscript and the `.v` files;
5. reproducibility of the audit/checksum package.

Please open GitHub Issues with file name, theorem/lemma name, line number, command run, and observed output.

cd /home/eduardo/Documents/collatz_prova/tex/COQ_FROM_TEX_CLEAN_V1/collatz-dammroze-coq-review

cat > README.md <<'EOF'
# Collatz–Dammroze Coq/Rocq Review Package

![Coq Build Check](https://github.com/dammroze/collatz-dammroze-coq-review/actions/workflows/coq.yml/badge.svg)

This repository contains a LaTeX manuscript, Coq/Rocq formalization files, audit artifacts, checksums, and a passing GitHub Actions Coq build for technical peer review of a non-ergodic deterministic framework for the analysis of the \(3n+1\) map.

Repository:

https://github.com/dammroze/collatz-dammroze-coq-review

---

## Critical Reader Advisory

This manuscript must be read in the order specified by its internal Reader’s Guide / Logical Map.

The argument is not ergodic, not probabilistic, and not statistical.

It does **not** use:

- ergodic theory;
- probability theory;
- mixing;
- independence assumptions;
- Cesàro averaging;
- statistical limits;
- global random-walk heuristics;
- typical-behavior reasoning.

The proof framework uses finite, deterministic, band-normalized arithmetic exclusion.

A review that imports probabilistic, ergodic, averaging, independence, or mixing assumptions into the argument is not reviewing the stated proof. It is reviewing a different framework.

The intended object of review is the non-ergodic deterministic chain actually stated in the manuscript and mirrored in the Coq/Rocq files.

---

## Mandatory Reading Order

Please do not begin by reading isolated lemmas out of order.

The manuscript is structured as a deterministic obstruction-exclusion chain. The correct reading order is:

1. **Reader Advisory / Methodological Note**  
   Establishes the zero-probability, zero-ergodicity framework.

2. **Reader’s Guide / Logical Map**  
   Specifies how the proof must be followed.

3. **Definitions and local dyadic-band normalization**  
   Establishes the finite local arithmetic setting.

4. **Local obstruction formulation**  
   A putative divergent trajectory or non-trivial cycle must create a finite locally admissible certificate.

5. **Finite alphabet / local repetition mechanism**  
   Local configurations inside dyadic bands are finite and must repeat under obstruction hypotheses.

6. **Amplification step**  
   Repetition of a local valuation configuration forces a deterministic lower bound on long stopping-time behavior.

7. **Tail-control / drift step**  
   Independent finite band-normalized estimates produce an upper bound incompatible with amplification.

8. **Contradiction / exclusion of obstruction**  
   Amplification lower bound and tail-control upper bound cannot simultaneously hold.

9. **Main theorem**  
   Since no global obstruction can exist, the Collatz obstruction class is excluded.

10. **Coq/Rocq artifacts**  
   Check formal dependencies, assumptions, theorem statements, and manuscript alignment.

Reading the paper in a different order can make the argument appear to rely on assumptions or heuristics that it explicitly rejects.

---

## Core Mechanism

The proof framework is a finite, non-ergodic contradiction engine.

In one sentence:

> Assuming a global obstruction exists, one derives a repeating local valuation configuration inside dyadic bands; repetition forces a deterministic lower bound on long stopping-time behavior through amplification, while drift and tail-control estimates yield an incompatible upper bound; hence the obstruction is excluded.

This is not an “almost all”, “typical orbit”, or “average-case” argument.

It is a deterministic local-exclusion argument.

---

## What This Repository Contains

- `paper/`  
  LaTeX manuscript and PDF.

- `coq/`  
  Coq/Rocq formalization files, `_CoqProject`, and `Makefile`.

- `audit/`  
  Assumption reports, checksum files, JSON manifests, and audit artifacts.

- `FINAL_DELIVERABLE_CHECKSUMS.txt`  
  Top-level checksum record.

- `.github/workflows/coq.yml`  
  GitHub Actions workflow that builds the Coq/Rocq files automatically.

---

## Coq/Rocq Build Status

The repository includes a passing GitHub Actions Coq build check.

Local check:

```bash
cd coq
coqc --version
make clean || true
make -j1
