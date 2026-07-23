#!/usr/bin/env bash
# okf-init.sh — Scaffold an Open Knowledge Format (OKF) bundle.

set -euo pipefail

research_root="${HOME}/research"

read -r -p "Enter a name for your OKF knowledge bundle (e.g. customer-data): " topic

if [[ -z "${topic}" ]]; then
	echo "Error: bundle name cannot be empty." >&2
	exit 1
fi

if [[ ! "${topic}" =~ ^[a-zA-Z0-9._-]+$ ]]; then
	echo "Error: bundle name may only contain letters, numbers, dots, hyphens, and underscores." >&2
	exit 1
fi

bundle_root="${research_root}/${topic}"

if [[ -e "${bundle_root}" ]]; then
	echo "Error: '${bundle_root}' already exists. Choose a different name or remove it first." >&2
	exit 1
fi

echo "Creating OKF bundle at ${bundle_root} ..."

mkdir -p \
	"${bundle_root}/concepts" \
	"${bundle_root}/references" \
	"${bundle_root}/playbooks" \
	"${bundle_root}/skills" \
	"${bundle_root}/assets/raw" \
	"${bundle_root}/outputs"

created_date="$(date -u +%Y-%m-%d)"
created_ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

cat > "${bundle_root}/index.md" <<EOF
---
okf_version: "0.1"
---

# ${topic} Knowledge Bundle

# Directories

* [concepts](concepts/) - Core domain concepts and definitions.
* [references](references/) - Structured notes linked to external sources.
* [playbooks](playbooks/) - Step-by-step operational procedures.
* [skills](skills/) - Agent-ready task skills for maintaining this bundle.
* [assets](assets/) - Optional non-markdown source artifacts (PDFs, exports, images).

# Core Guides

* [README](README.md) - How to use OKF in this bundle with NVIM, Copilot CLI, and opencode.
* [AGENTS](AGENTS.md) - Ground rules and workflows for coding agents.
* [log](log.md) - Chronological bundle update history.
EOF

cat > "${bundle_root}/log.md" <<EOF
# Directory Update Log

## ${created_date}
* **Initialization**: Created OKF bundle with \`okf-init.sh\`.
EOF

cat > "${bundle_root}/README.md" <<EOF
---
type: Guide
title: ${topic} Knowledge Bundle Guide
description: How to maintain this Open Knowledge Format bundle with NVIM and coding agents.
tags: [okf, guide, workflow]
timestamp: ${created_ts}
---

# Open Knowledge Format in this bundle

This repository follows **OKF v0.1**: a hierarchy of markdown documents with YAML frontmatter. Every concept file requires a non-empty \`type\` field in frontmatter.

# Directory layout

| Path | Purpose |
|---|---|
| \`index.md\` | Progressive-disclosure entry point for the bundle root. |
| \`log.md\` | Date-grouped update history (newest dates first). |
| \`concepts/\` | Durable concepts: definitions, assets, systems, metrics. |
| \`references/\` | Source-backed concept notes and summaries. |
| \`playbooks/\` | Repeatable procedures for operations and analysis. |
| \`skills/\` | Agent task specs for ingesting, indexing, logging, and linting. |
| \`assets/raw/\` | Optional raw artifacts (PDFs, exports, screenshots). |
| \`outputs/\` | Generated artifacts (lint reports, audits, exports). |

# Authoring rules

1. Every non-reserved \`.md\` file must start with frontmatter and include \`type\`.
2. Use standard markdown links. Prefer bundle-relative links like \`/concepts/foo.md\`.
3. Put external evidence under \`# Citations\` whenever claims need backing.
4. Keep \`index.md\` files current so humans and agents can discover content quickly.
5. Append meaningful changes to \`log.md\` with ISO date headings (\`YYYY-MM-DD\`).

# Add new knowledge material

1. Save raw source artifacts (if any) in \`assets/raw/\`.
2. Create a concept in \`references/\` with frontmatter, summary, findings, and citations.
3. Add or update related concepts in \`concepts/\` and link across files.
4. Update the nearest \`index.md\` files and root \`index.md\` if top-level navigation changed.
5. Add a dated entry in \`log.md\` describing what changed and why.

# NVIM workflow

1. Open the bundle: \`nvim ~/research/${topic}\`
2. Use \`:vimgrep /pattern/ **/*.md\` for cross-file lookup.
3. Keep one split on \`index.md\` and one on your active concept while editing.
4. Validate frontmatter consistency before saving major updates.

# Copilot CLI workflow

Use focused prompts that bind the agent to OKF rules, for example:

\`\`\`
Ingest assets/raw/<file> into references/<slug>.md as OKF.
Require frontmatter.type, add citations, update indexes, and append log.md.
\`\`\`

For maintenance tasks:

\`\`\`
Check this bundle for OKF conformance issues:
- non-reserved markdown files missing frontmatter.type
- stale index entries
- broken internal links
Write findings to outputs/lint-YYYY-MM-DD.md.
\`\`\`

# opencode workflow

Use the same task boundaries as Copilot CLI:

1. Ask opencode to read \`AGENTS.md\` and relevant \`skills/*.md\` first.
2. Delegate one operation per run (ingest, index refresh, lint, or log update).
3. Require explicit file-level outputs (which files were created/edited and why).

# Keeping the bundle healthy

Run a periodic quality pass:

1. Verify each concept has clear \`type\`, \`title\`, and \`description\`.
2. Confirm index entries point to existing targets with accurate descriptions.
3. Ensure critical claims include citations.
4. Capture a summary in \`outputs/\` and append an entry to \`log.md\`.
EOF

cat > "${bundle_root}/AGENTS.md" <<EOF
---
type: Agent Operating Guide
title: ${topic} Agent Operating Rules
description: Operating instructions for coding agents maintaining this OKF bundle.
tags: [okf, agent, operations]
timestamp: ${created_ts}
---

# Mission

Maintain this repository as an **OKF-conformant knowledge bundle** while preserving traceability and navigability.

# Non-negotiable rules

1. Never write a non-reserved markdown file without YAML frontmatter including non-empty \`type\`.
2. Treat \`index.md\` and \`log.md\` as reserved filenames; do not use them for concepts.
3. Prefer bundle-relative internal links (\`/path/to/doc.md\`) for stable cross-linking.
4. Add \`# Citations\` when content relies on external claims or data.
5. Update relevant \`index.md\` files and append \`log.md\` for meaningful changes.

# Standard operations

1. **Ingest material**: Use \`skills/ingest-material.md\`.
2. **Refresh navigation**: Use \`skills/refresh-indexes.md\`.
3. **Record updates**: Use \`skills/maintain-log.md\`.
4. **Run conformance lint**: Use \`skills/lint-okf-conformance.md\`.

# Output expectations

When finishing a task, report:

1. Files created/updated.
2. New or changed links.
3. Citation additions.
4. Log entry added.
EOF

cat > "${bundle_root}/concepts/index.md" <<EOF
# Concepts

* [Example concept](example-concept.md) - Starter concept showing minimal OKF-conformant metadata.
EOF

cat > "${bundle_root}/concepts/example-concept.md" <<EOF
---
type: Reference
title: Example Concept
description: Minimal concept document to demonstrate required OKF frontmatter.
tags: [example, starter]
timestamp: ${created_ts}
---

Replace this file with a real concept for your domain.
EOF

cat > "${bundle_root}/references/index.md" <<EOF
# References

* [Example source note](example-source-note.md) - Starter source-backed note with citation section.
EOF

cat > "${bundle_root}/references/example-source-note.md" <<EOF
---
type: Source Summary
title: Example Source Note
description: Template for capturing source-derived findings in OKF.
tags: [reference, source]
timestamp: ${created_ts}
---

# Summary

Summarize the source and key claims here.

# Related Concepts

Link concepts such as [Example Concept](/concepts/example-concept.md).

# Citations

[1] [Replace with source URL](https://example.com)
EOF

cat > "${bundle_root}/playbooks/index.md" <<EOF
# Playbooks

* [Knowledge ingest playbook](knowledge-ingest.md) - Repeatable process for adding new material.
EOF

cat > "${bundle_root}/playbooks/knowledge-ingest.md" <<EOF
---
type: Playbook
title: Knowledge Ingest Playbook
description: Repeatable procedure for ingesting new material into this OKF bundle.
tags: [playbook, ingest]
timestamp: ${created_ts}
---

# Trigger

New source material needs to be represented as concepts in this bundle.

# Steps

1. Capture source artifacts in \`/assets/raw/\` when needed.
2. Create or update reference notes in \`/references/\`.
3. Create or update domain concepts in \`/concepts/\`.
4. Update nearest \`index.md\` files and root \`/index.md\` when navigation changes.
5. Append a dated update in \`/log.md\`.
EOF

cat > "${bundle_root}/skills/index.md" <<EOF
# Skills

* [Ingest material](ingest-material.md) - Convert new source material into OKF concepts.
* [Refresh indexes](refresh-indexes.md) - Keep progressive-disclosure indexes accurate.
* [Maintain log](maintain-log.md) - Record changes in ISO-date grouped entries.
* [Lint OKF conformance](lint-okf-conformance.md) - Detect and report bundle conformance issues.
EOF

cat > "${bundle_root}/skills/ingest-material.md" <<EOF
---
type: Agent Skill
title: Ingest Material
description: Convert new material into linked OKF concepts with citations and navigation updates.
tags: [skill, ingest, okf]
timestamp: ${created_ts}
---

# Task

Ingest new material into this bundle while preserving OKF conformance.

# Inputs

- Source material location (URL, raw file path, or existing notes).
- Target concept areas (\`/references\`, \`/concepts\`, \`/playbooks\`).

# Procedure

1. Read source material and extract core facts and entities.
2. Create or update \`/references/*.md\` as source summaries.
3. Update related concepts with bundle-relative links.
4. Add or refresh \`# Citations\` in affected documents.
5. Update impacted \`index.md\` files.
6. Append a dated entry in \`/log.md\`.

# Output

Return changed files and a short summary of new knowledge added.
EOF

cat > "${bundle_root}/skills/refresh-indexes.md" <<EOF
---
type: Agent Skill
title: Refresh Indexes
description: Reconcile index entries with actual files for progressive disclosure.
tags: [skill, index, navigation]
timestamp: ${created_ts}
---

# Task

Update \`index.md\` files so they match current directory contents and descriptions.

# Procedure

1. For each directory with concepts, list concept files and subdirectories.
2. Ensure entries exist and link targets are valid relative paths.
3. Keep entries concise with one-line descriptions.
4. Preserve section grouping and readability.

# Output

Return updated \`index.md\` files and missing/removed entries handled.
EOF

cat > "${bundle_root}/skills/maintain-log.md" <<EOF
---
type: Agent Skill
title: Maintain Log
description: Record meaningful changes in log.md using ISO date sections.
tags: [skill, log, audit]
timestamp: ${created_ts}
---

# Task

Append updates to \`/log.md\` in date-grouped format.

# Procedure

1. Use UTC date heading format \`YYYY-MM-DD\`.
2. Place newest date groups at the top when adding a new day.
3. Use concise entries with action labels (for example **Creation**, **Update**, **Deprecation**).
4. Reference changed concepts with markdown links where useful.

# Output

Return the new log entry text and linked files.
EOF

cat > "${bundle_root}/skills/lint-okf-conformance.md" <<EOF
---
type: Agent Skill
title: Lint OKF Conformance
description: Identify conformance and quality issues in this OKF bundle.
tags: [skill, lint, conformance]
timestamp: ${created_ts}
---

# Task

Audit this bundle for OKF conformance and navigation quality.

# Checks

1. Non-reserved markdown files missing frontmatter or non-empty \`type\`.
2. Reserved files (\`index.md\`, \`log.md\`) used incorrectly as concept docs.
3. Broken internal markdown links.
4. Index files with stale or missing entries.
5. Claim-heavy docs missing a \`# Citations\` section.

# Output

Write findings to \`/outputs/lint-YYYY-MM-DD.md\` and summarize remediation actions.
EOF

cat > "${bundle_root}/.gitignore" <<'EOF'
.DS_Store
outputs/*.pdf
outputs/*.html
EOF

(
	cd "${bundle_root}"
	git init --quiet
)

echo "Done. OKF bundle created at ${bundle_root}"
echo "Next steps:"
echo "  1. Open ${bundle_root}/README.md for workflow guidance."
echo "  2. Add source artifacts to ${bundle_root}/assets/raw/."
echo "  3. Use skills in ${bundle_root}/skills/ with your coding agent."
