# Script Guides

## `okf-init.sh`

`okf-init.sh` scaffolds a new **Open Knowledge Format (OKF)** bundle under `~/research/<bundle-name>`.

### What it creates

- Root navigation and history files:
  - `index.md` (declares `okf_version: "0.1"` and top-level navigation)
  - `log.md` (date-grouped update history)
- Knowledge directories:
  - `concepts/`
  - `references/`
  - `playbooks/`
  - `skills/`
  - `assets/raw/`
  - `outputs/`
- Starter concept docs with valid OKF frontmatter (`type` is always present)
- Agent operating docs:
  - `AGENTS.md`
  - skill specs in `skills/*.md`
- A bundle-local `README.md` with day-to-day maintenance instructions
- A fresh git repository in the created bundle

### Run it

```bash
okf-init
# or: scripts/okf-init.sh
```

You will be prompted for a bundle name. The script validates the name and refuses to overwrite existing directories.

### OKF rules this scaffold enforces

1. Every non-reserved markdown document contains YAML frontmatter with non-empty `type`.
2. Reserved names (`index.md`, `log.md`) are used only for navigation/history.
3. Internal linking uses standard markdown links (bundle-relative links are preferred).
4. Citation-friendly structure is included in starter reference material.

### Updating the knowledge base

1. Place raw artifacts in `assets/raw/` when needed.
2. Add source-backed notes in `references/`.
3. Add or update durable concepts in `concepts/`.
4. Keep `index.md` files up to date so agents can traverse the bundle quickly.
5. Append meaningful changes to `log.md` with ISO date headings (`YYYY-MM-DD`).

### Using coding agents (Copilot CLI / opencode)

Start each task by asking the agent to read:

1. `AGENTS.md`
2. The relevant skill in `skills/` (`ingest-material.md`, `refresh-indexes.md`, `maintain-log.md`, `lint-okf-conformance.md`)

Then assign one bounded operation at a time, for example:

```text
Ingest assets/raw/<file> into references/<slug>.md using OKF.
Update related concepts, refresh indexes, and append log.md.
```

### NVIM-first workflow

1. `nvim ~/research/<bundle-name>`
2. Use `:vimgrep /<term>/ **/*.md` to find related concepts and references.
3. Keep `index.md` open while editing to maintain discoverability.

