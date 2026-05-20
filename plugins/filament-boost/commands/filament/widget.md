---
description: Scaffold a Filament v5 widget (stats, chart, or table)
argument-hint: "[type]"
---

# /filament:widget

Scaffold a Filament v5 widget. `$ARGUMENTS` is the widget type (`stats`, `chart`, `table`); ask if not provided.

Steps:

1. Confirm widget type and target panel (`mcp__boost__filament_list_panels`).
2. Ask for the widget's purpose in one sentence and the data source (model, query, or static).
3. Call `mcp__boost__filament_scaffold_widget` with `{ type, name, panel, data_source }` and present the diff.
4. On approval, write the file and register it on the panel if not auto-discovered.
5. Run `mcp__boost__filament_list_widgets` to confirm registration.

Filament v5 idioms only: `StatsOverviewWidget`, `ChartWidget`, `TableWidget` from `Filament\Widgets\*`. Use typed return signatures.
