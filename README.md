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

## Local check

```bash
cd coq
coqc --version
make clean || true
make -j1
```
