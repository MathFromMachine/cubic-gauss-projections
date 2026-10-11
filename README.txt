WEBSITE PAYLOAD — DOWNLOAD AND UNZIP FIRST

This flat directory is a website and review payload, not a standalone
Lean project. Download source-bundle.zip and unpack it. The archive
contains cubic-gauss-projections/ with all 40 Lean modules, the pinned
configuration and license, reproduce.py, and its own SHA256SUMS.

The loose FinalTheorems.lean is for convenient reading. Its imports are
inside the archive. sources.json describes that full archive's source
closure, not the flat website directory.

To check the website payload, run sha256sum -c SHA256SUMS here. To check
and build the full sources, first run:

    unzip source-bundle.zip
    cd cubic-gauss-projections
    sha256sum -c SHA256SUMS
    python3 reproduce.py check
    python3 reproduce.py verify-env ../qrh-reproduction/project
    python3 reproduce.py build ../qrh-reproduction/project

Replace the project path with your own prebuilt pinned OAI Lake project.
The website checksum manifest is separate from the one inside the zip.
The complete source-bundle reproduction instructions follow.

Smooth cubic-Gauss projections with coprimality masks
================================================

This companion records an explicit mixed-conductor bound for smooth
normalized cubic-Gauss projections with sextic row twists. Read PROOF.txt
or index.html for the theorem, definitions, complete argument, exact
normalizations, assumptions, source pointers, and scope.

This is a formalization checkpoint. No change to a zeta or L-function
zero-free endpoint is asserted. Novelty or priority is not established.

CONTENTS

lean/ contains only the 40 experimental modules in the exact import
closure of FinalTheorems.lean. They are byte-identical to
the locally compiled research sources. No .olean files, identifying
machine logs, or private filesystem paths are distributed.

sources.json records their topological build order and SHA-256 hashes,
as well as the 353 required OAI source files and their hashes. All these
OAI files match the pinned upstream source. OAI and Mathlib sources are
not duplicated here. config/ preserves the dependency configuration and
the upstream Lean license. No Liu-extension module is required.

PINNED ENVIRONMENT

OpenAI mathematics source:
https://github.com/openai/math/tree/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb/lean
Lean toolchain: leanprover/lean4:v4.34.1
Mathlib: d13f23b723b8a846827a245b89c10fc7d3f11612
The remaining dependency revisions are in config/lake-manifest.json.

The build wrapper requires a PREBUILT OAI Lake project at those pins.
The existing QRH reproduction project or the prepared/build project from
the earlier cubic-proof companion is suitable if verify-env succeeds.
That project's compiled dependency objects must be available. This
package does not fetch or rebuild the full mathematical foundation.
The existing environment has local changes in two dependency packages.
The wrapper checks its pinned configuration and every required OAI source;
it does not independently reproduce or audit the prebuilt dependency
objects. None of the 353 OAI source files differs from the pinned source.

RECHECKING THIS COMPANION

From this directory, with Python 3, Bash, and Lean/Lake 4.34.1 on PATH:

    sha256sum -c SHA256SUMS
    python3 reproduce.py check
    python3 reproduce.py verify-env ../qrh-reproduction/project
    python3 reproduce.py build ../qrh-reproduction/project

Replace the relative project argument with your own prebuilt OAI project.
The wrapper uses one Lean process at a time, at most two Lean threads,
and Lean's 6144 MiB cap. For an operating-system memory limit on Linux:

    systemd-run --user --wait --pipe --collect \
      --working-directory="$PWD" \
      -p MemoryMax=7G -p MemorySwapMax=0 \
      python3 reproduce.py build ../qrh-reproduction/project

The build compiles each included module and checks all printed axiom
receipts against propext, Classical.choice, and Quot.sound. Generated
objects, logs, and a build summary go to build/, which is excluded from
the release archive. Logs from a new run may contain the reader's own
filesystem paths; inspect them before sharing.

FINAL THEOREMS

Read lean/FinalTheorems.lean for the three public entry points. The mask
corollary requires a supported admissible mask coprime to both the moving
ideal and the fixed modulus. Exact overlap reductions are included in
MaskOverlap.lean; PROOF.txt explains how to separate that support.

WHAT THE CHECK MEANS

The mixed theorem, exact local-cost table, and cheap-mask corollaries
compiled in Lean
4.34.1, with the three standard axioms only and no sorryAx. The neutral
verification summary records the evidence actually checked for this
bundle. Ordinary compilation is NOT a fresh exported-proof kernel replay,
a second-kernel verification, or external peer review. A separate
Comparator/export replay is not supplied or claimed for this theorem.
A hash identifies bytes; it is not an independent truth attestation.

RIGHTS AND PROVENANCE

The analytic framework, field conventions, local reflection brackets,
cusp arithmetic, and cube-inversion identity are from the pinned OpenAI
source. Its Lean source is Apache-2.0; see config/OPENAI-LEAN-LICENSE.
Existing notices are retained. This archive does not relicense upstream
material or assert an exclusive author identity. The added proof assembly
was developed with AI assistance. PROOF.txt describes the mathematical
provenance and its overlap with adjacent Patterson angular estimates.
