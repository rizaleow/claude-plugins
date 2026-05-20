---
description: Scaffold a complete Filament v5 resource for a given Eloquent model
argument-hint: "[Model]"
---

# /filament:resource

Build a Filament v5 resource end-to-end for the model `$ARGUMENTS` (default: ask the user which model).

Steps:

1. If no model name was passed, ask the user which model and confirm the panel (use `mcp__boost__filament_list_panels`).
2. Dispatch the `filament-resource-builder` subagent with the model name and target panel.
3. After it finishes, run `mcp__boost__filament_inspect_resource` against the new resource and report a one-paragraph summary (route, navigation, fields, columns, actions).

Hard rules:

- Filament v5 only. Use `Filament\Schemas\Schema`, `Filament\Actions\*`, `recordActions()`, `toolbarActions()`. Do NOT generate v3/v4 `Forms\Form::make()` or `->actions([...])` on tables.
- Never auto-write files without a diff. Show the diff, then apply on approval.
