# Script Guides

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

