---
description: Review the current branch's Filament-touching files for v5 correctness
---

# /filament:review

Read-only review of Filament changes on the current branch.

Steps:

1. Determine the base branch (`git symbolic-ref refs/remotes/origin/HEAD` or ask).
2. List changed files matching `app/Filament/**`, `app/Providers/Filament/**`, `database/migrations/**` related to Filament tables, and any `*Resource.php`, `*Widget.php`, `*Schema.php`.
3. Dispatch the `filament-reviewer` subagent with the file list and base branch.
4. The agent returns a structured report: findings grouped by severity (blocker / warning / nit), each with file:line and a v5-idiomatic suggestion.
5. Print the report. Do NOT modify any files.
