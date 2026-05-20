---
description: Multi-component Filament v5 scaffolding planner; dispatches sub-agents
---

# /filament:scaffold

Plan and execute a multi-component Filament v5 build.

Steps:

1. Ask the user: what are they building? (feature description, models involved, panel(s)).
2. Decompose into a checklist of components: resources, relation managers, widgets, custom actions, custom fields, tests.
3. Confirm the plan with the user.
4. For each item, dispatch the appropriate subagent:
   - Resource / relation manager → `filament-resource-builder`
   - Pure form/infolist schema → `filament-form-designer`
   - Other components → handle inline using `mcp__boost__filament_scaffold_*` tools
5. After each step, run `mcp__boost__filament_lint` on the written file and report findings.
6. Finish with a one-paragraph summary and a list of follow-up TODOs (tests, policies, navigation grouping).

Filament v5 only.
