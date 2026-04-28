# Formalization Map: LaTeX Manuscript ↔ Coq/Rocq Files

This file was added in response to reviewer feedback requesting an explicit mapping between stated TeX results and their Rocq formalization.

The purpose of this file is to make the review target explicit.

Reviewers should use this file to check:

1. what the formalization is intended to achieve;
2. which manuscript components correspond to which Rocq files;
3. whether the final Rocq statement matches the manuscript’s main theorem;
4. which parts are proved, assumed, axiomatized, parameterized, or used as bridge/glue lemmas;
5. whether auxiliary Rocq files correspond to named manuscript results or only to internal formalization bridges.

---

## 1. Purpose of the Formalization

The purpose of the Rocq/Coq package is to formalize the deterministic obstruction-exclusion chain described in the LaTeX manuscript.

At the manuscript level, the intended chain is:

```text
global obstruction
→ local dyadic-band certificate
→ finite local repetition
→ deterministic amplification lower bound
→ tail/control upper bound
→ contradiction
→ exclusion of obstruction
