#!/usr/bin/env bash
# gen-wiki.sh — Scaffold a Karpathy-style "LLM Wiki" knowledge base.
#
# Creates ~/research/<my-topic> with the three-layer structure described in
# "How to Build Karpathy's LLM Wiki": raw/ (immutable sources), wiki/
# (LLM-generated markdown), and AGENTS.md (the schema, tooling-agnostic
# equivalent of CLAUDE.md). Initialises git in the new directory.

set -euo pipefail

research_root="${HOME}/research"

read -r -p "Enter a name for your wiki topic (e.g. my-topic): " topic

if [[ -z "${topic}" ]]; then
	echo "Error: topic name cannot be empty." >&2
	exit 1
fi

if [[ ! "${topic}" =~ ^[a-zA-Z0-9._-]+$ ]]; then
	echo "Error: topic name may only contain letters, numbers, dots, hyphens, and underscores." >&2
	exit 1
fi

wiki_root="${research_root}/${topic}"

if [[ -e "${wiki_root}" ]]; then
	echo "Error: '${wiki_root}' already exists. Choose a different topic name or remove it first." >&2
	exit 1
fi

echo "Creating wiki at ${wiki_root} ..."

mkdir -p \
	"${wiki_root}/raw/articles" \
	"${wiki_root}/raw/papers" \
	"${wiki_root}/raw/repos" \
	"${wiki_root}/raw/data" \
	"${wiki_root}/raw/images" \
	"${wiki_root}/raw/assets" \
	"${wiki_root}/wiki/concepts" \
	"${wiki_root}/wiki/entities" \
	"${wiki_root}/wiki/sources" \
	"${wiki_root}/wiki/comparisons" \
	"${wiki_root}/outputs"

created_date="$(date +%Y-%m-%d)"

cat > "${wiki_root}/wiki/index.md" <<EOF
---
title: Index
updated: ${created_date}
---

# ${topic} — Wiki Index

Master content catalog. Update this file on every ingest operation.

## Concepts

## Entities

## Sources

## Comparisons
EOF

cat > "${wiki_root}/wiki/log.md" <<EOF
# Operation Log

Append-only record of every ingest, page update, and lint result.

## ${created_date}

- Initialized wiki with \`gen-wiki.sh\`.
EOF

cat > "${wiki_root}/AGENTS.md" <<EOF
# Research Wiki: ${topic}

## Project Structure

- \`raw/\` — Immutable source documents. Never modify files here.
- \`wiki/\` — LLM-generated and maintained markdown pages.
- \`wiki/index.md\` — Master content catalog. Update on every operation.
- \`wiki/log.md\` — Append-only operation log.
- \`outputs/\` — Generated reports, presentations, lint results.

## Page Types and Conventions

Every wiki page must have YAML frontmatter:

\`\`\`
---
title: Page Title
type: concept | entity | source-summary | comparison
sources:
  - raw/papers/filename.md
related:
  - "[related concept](../concepts/related-concept.md)"
created: YYYY-MM-DD
updated: YYYY-MM-DD
confidence: high | medium | low
---
\`\`\`

### Naming

- Filenames: kebab-case matching the concept (e.g. \`attention-mechanism.md\`).
- Cross-references: use standard relative markdown links for all internal links,
  e.g. \`[attention mechanism](../concepts/attention-mechanism.md)\` from one
  \`wiki/\` subdirectory to another. Do not use Obsidian-style \`[[wikilinks]]\`
  — these files are read as plain markdown (e.g. in Neovim), not through an
  Obsidian vault.
- Source references: always link back to \`raw/\` file paths, e.g.
  \`[source](../../raw/papers/filename.md)\`.

## Workflows

### Ingest

1. Read the source document in \`raw/\`.
2. Discuss key takeaways with the user.
3. Create a \`wiki/sources/[source-name].md\` summary.
4. Update or create concept/entity pages as needed, linking to them with
   relative markdown links.
5. Update \`wiki/index.md\` with new entries.
6. Append to \`wiki/log.md\`.

### Query

1. Read \`wiki/index.md\` to identify relevant pages.
2. Read those pages and synthesize an answer.
3. Cite sources using relative markdown links back to the relevant
   \`wiki/\` pages and \`raw/\` documents.
4. If the answer is novel and valuable, offer to save it as a new wiki page.

### Lint

1. Scan all wiki pages for contradictions.
2. Identify orphan pages (no incoming links from other wiki pages).
3. Flag missing concepts referenced but not created.
4. Find stale claims superseded by newer sources.
5. Save results to \`outputs/lint-YYYY-MM-DD.md\`.

Customize this file for your domain. A machine learning wiki might add
conventions for tracking paper citations and benchmark results. A competitive
intelligence wiki might add conventions for confidence levels and source
freshness.
EOF

cat > "${wiki_root}/.gitignore" <<'EOF'
outputs/*.pdf
.DS_Store
EOF

(
	cd "${wiki_root}"
	git init --quiet
)

echo "Done. Wiki created at ${wiki_root}"
echo "Next steps:"
echo "  1. Drop source documents into ${wiki_root}/raw/<category>/"
echo "  2. Point your AI coding agent at ${wiki_root} and ask it to ingest new sources."
