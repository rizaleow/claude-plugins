#!/usr/bin/env bash
# filament-boost: PostToolUse lint-on-edit
# Reads the Claude Code hook payload from stdin, extracts the edited file path,
# and if it lives under app/Filament/, runs the Boost MCP filament_lint helper
# and surfaces results as a <system-reminder> for the next turn.

set -u

payload="$(cat 2>/dev/null || true)"
if [ -z "$payload" ]; then
  exit 0
fi

# Best-effort file path extraction (no jq dependency).
file=$(printf '%s' "$payload" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]+"' | head -n1 | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')

if [ -z "${file:-}" ]; then
  exit 0
fi

case "$file" in
  *app/Filament/*) ;;
  *) exit 0 ;;
esac

if ! command -v php >/dev/null 2>&1; then
  exit 0
fi

if [ ! -f "artisan" ]; then
  exit 0
fi

output=$(php artisan boost:mcp:call filament_lint --path "$file" 2>/dev/null || true)

if [ -n "$output" ]; then
  printf '<system-reminder>\nfilament-boost lint on %s:\n%s\n</system-reminder>\n' "$file" "$output"
fi

exit 0
