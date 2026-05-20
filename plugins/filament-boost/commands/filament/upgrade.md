---
description: Lint and upgrade Filament v4 code to v5, file-by-file with approval
argument-hint: "[path]"
---

# /filament:upgrade

Migrate Filament v4 code under `$ARGUMENTS` (default: `app/Filament`) to v5.

Steps:

1. Resolve the target path. If a directory, glob `**/*.php`.
2. For each file:
   a. Call `mcp__boost__filament_lint` — collect v4-pattern findings.
   b. Call `mcp__boost__filament_upgrade_suggest` — get the proposed rewrite as a diff.
   c. Show the user the diff and a one-line rationale per finding.
   d. On approval, apply with `Edit`. On rejection, skip and move on.
3. After all files processed, print a summary table: file | findings | applied | skipped.
4. Remind the user to run their test suite.

Never apply rewrites without explicit approval. Treat low-confidence suggestions as advisory only.
