# filament-boost

Filament v5 expert mode for Claude Code. Extends [Laravel Boost](https://github.com/laravel/boost) with Filament-aware MCP tools, skills, commands, agents, and a lint-on-edit hook.

## Prerequisites

- A Laravel app using Filament v5
- Laravel Boost installed and configured

Install the Composer companion in your app:

```sh
composer require rizaleow/filament-boost --dev
php artisan boost:install
```

This registers extra MCP tools (`filament_list_resources`, `filament_inspect_resource`, `filament_scaffold_resource`, `filament_lint`, `filament_upgrade_suggest`, `filament_docs_search`, and more) on Boost's MCP server.

## Install the plugin

```sh
/plugin marketplace add rizaleow/claude-plugins
/plugin install filament-boost@rizaleow
```

## Commands

| Command | Purpose |
| --- | --- |
| `/filament:resource [Model]` | End-to-end Filament v5 resource scaffold via `filament-resource-builder` agent. |
| `/filament:widget [type]` | Scaffold a stats / chart / table widget. |
| `/filament:scaffold` | Multi-component planner; dispatches sub-agents. |
| `/filament:upgrade [path]` | Lint + v4→v5 upgrade suggestions, file-by-file with approval. |
| `/filament:review` | Read-only review of the current branch's Filament-touching files. |

## Agents

- `filament-resource-builder` — inspects model, scaffolds resource, refines schema/table.
- `filament-form-designer` — pure schema design for forms/infolists.
- `filament-migrator` — v4 → v5 file-by-file migrator with diffs.
- `filament-reviewer` — read-only branch review against v5 idioms.

## Skills

Progressive-disclosure skills auto-trigger when you touch Filament code: `filament-v5`, `filament-v5-migration`, `filament-resources`, `filament-schemas`, `filament-tables`, `filament-actions`, `filament-widgets`, `filament-panels`, `filament-custom-components`, `filament-testing`.

## Hook

`PostToolUse` runs `filament_lint` after any Write/Edit under `app/Filament/` and surfaces findings as a `<system-reminder>`.

## License

MIT
