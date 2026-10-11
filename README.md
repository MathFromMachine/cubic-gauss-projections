# Smooth cubic-Gauss projections with coprimality masks

**[Download the complete source bundle](source-bundle.zip) and unzip it
before running the reproduction commands.** This website is a flat
review payload; the full 40-module Lean source closure, build wrapper,
dependency configuration, license, and internal checksums are in the zip.

- [Read the proof](index.html) or [plain text](PROOF.txt)
- [Read the final Lean theorem statements](FinalTheorems.lean)
- [Build instructions and verification limits](README.txt)
- [Source manifest for the archive](sources.json)
- [Verification summary](verification-summary.json)
- [Website-payload checksums](SHA256SUMS)

The theorem gives exact mixed-prime costs for a smooth normalized
cubic-Gauss projection. A separate admissible coprimality mask, disjoint
from the fixed modulus and moving ideal, costs
`product [1+sqrt(2q^(-1/2)+q^(-2))]`, hence an arbitrarily small power of
its norm. Read the proof for full quantifiers, Gauss normalization,
positive-support masks, and overlap qualifications.

## Reproduce after extraction

```sh
unzip source-bundle.zip
cd cubic-gauss-projections
sha256sum -c SHA256SUMS
python3 reproduce.py check
python3 reproduce.py verify-env ../qrh-reproduction/project
python3 reproduce.py build ../qrh-reproduction/project
```

Use your own prebuilt OAI project at the recorded pins and Lean 4.34.1.
The loose theorem file is for reading; all its imports are inside the
archive. `sources.json` describes those archived files. The checksum
manifest beside this README checks the website payload; the archive has
a separate manifest for its full source tree.

## Scope and provenance

This is a formalization checkpoint, with no established novelty,
optimality, RH result, or zero-free endpoint improvement claimed. The
cubic specialization overlaps adjacent Patterson angular estimates in
the pinned [OpenAI mathematics source](https://github.com/openai/math/tree/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb).
The added assembly was developed with AI assistance. Existing notices
and the upstream license are retained in the source bundle.

All 40 bundled modules were checked by ordinary Lean compilation with
only `propext`, `Classical.choice`, and `Quot.sound`: 33 in the initial
portable check and seven in the update, with source/object hash checks
for unchanged modules. This is not a new exported-proof replay, second
kernel, foundation rebuild, or external peer review.
