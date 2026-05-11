# hostinger-cli plugin

Model-invoked skills that teach Claude Code how to drive
[`hostinger-cli`](https://github.com/rizaleow/hostinger-cli) — a Go CLI
covering the entire Hostinger API (VPS, DNS, domains, hosting, billing,
email marketing).

## Prerequisites

The plugin **shells out** to `hostinger-cli`. Install and authenticate
once before using:

```sh
brew install rizaleow/tap/hostinger-cli
hostinger-cli auth login            # or: export HOSTINGER_API_TOKEN=...
```

Skills run a preflight on each invocation and tell the user how to fix
missing prereqs — they never prompt for or store tokens themselves.

## Skills

| Skill | When Claude invokes it |
| --- | --- |
| `hostinger-cli:vps-lifecycle` | Start/stop/restart/recreate VMs, take and restore snapshots, wait for async actions. |
| `hostinger-cli:dns-records` | Read, validate, edit DNS zones; manage snapshots. |
| `hostinger-cli:domains` | Availability check, portfolio ops, WHOIS profiles, forwarding. |
| `hostinger-cli:output-filtering` | Force JSON, filter with `--jq`, format with Go templates. |

## Install

```sh
/plugin marketplace add rizaleow/claude-plugins
/plugin install hostinger-cli@rizaleow
```

## License

MIT
