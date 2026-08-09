# Script Guides

## `pd-sync` — two-way Proton Drive sync

Wraps the official `proton-drive` CLI to sync configured local/remote path
pairs. Requires `proton-drive` on `$PATH` (see `pkgs/proton-drive-cli.nix`).

### Usage

```sh
pd-sync <push|pull> <profile>
```

| Profile           | Local                          | Remote                                  |
| ----------------- | ------------------------------ | --------------------------------------- |
| `music-dj`        | `$HOME/Music/DJ`               | `/my-files/03 RESOURCES/Music/DJ`       |
| `music-library`   | `$HOME/Music/LIBRARY`          | `/my-files/03 RESOURCES/Music/LIBRARY`  |
| `docs-dj-branding`| `$HOME/Documents/DJ/Branding`  | `/my-files/02 AREAS/DJ/Branding`        |

`push` runs `proton-drive filesystem upload <local> <remote>`; `pull` runs
`proton-drive filesystem download <remote> <local-parent>` (the CLI treats the
local arg as a parent folder, so the parent is passed to land contents at the
exact local path).

### First-time authentication (once per machine)

```sh
# macOS (Keychain Services)
proton-drive auth login

# NixOS desktop/KDE (KWallet Secret Service)
proton-drive auth login

# NixOS headless/SSH (needs a D-Bus session for libsecret)
dbus-run-session -- proton-drive auth login

# Automation/no keyring (plaintext store — see pkgs/proton-drive-cli.nix)
PROTON_DRIVE_CREDENTIALS_STORE=unsafe_file proton-drive auth login
```

## OKR template (replaces `okf-init.sh`)

This repository now provides a committed `okr/` directory as the canonical
starter for OKF-based research projects.

### How to start a new project

1. Copy `okr/` to a new project folder (for example under `~/research/`).
2. Rename the copied folder to your project name.
3. Open the copied folder and start from:
   - `README.md`
   - `AGENTS.md`
   - `index.md`

### What the template includes

- OKF v0.2 root structure (`index.md`, `log.md`, `concepts/`, `references/`,
  `playbooks/`, `assets/raw/`, `outputs/`)
- Canonical agent operating guide: `AGENTS.md`
- Portable skills in `.agents/skills/*/SKILL.md`:
  - `okf-query` (catalog-only queries)
  - `okf-ingest` (source ingestion)
  - `okf-maintain` (indexes/lifecycle/logs)
  - `okf-audit` (conformance/trust/freshness checks)
- Thin tool adapters:
  - `.github/copilot-instructions.md`
  - `CLAUDE.md`
  - `GEMINI.md`
- Local methodology reference:
  - `references/okf-v0.2.md`

### Why this changed

Copying a committed template is simpler and more predictable than generating
the structure from a shell script, and keeps a single source of truth for the
instruction files.

