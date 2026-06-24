# Authoring conventions — BASE docs

Working note for everyone (humans + agents) writing pages in this repo. Keep it
short; the QA gates in `scripts/` enforce the hard rules automatically.

## Component whitelist

Use ONLY these Mintlify components. Anything else is rejected in review:

- `Card`
- `CardGroup`
- `Steps`
- `Tip`
- `Tabs`
- `Accordion`

Do not introduce other components (no `Note`, `Warning`, `Frame`, custom MDX
components, etc.) without an explicit decision recorded here first.

## Cite-or-omit rule

Every factual/technical claim MUST be traceable to a pinned source in
`SOURCES.md`. If you cannot cite a canonical source for a statement, **omit it** —
do not guess, infer, or paraphrase from memory.

- Canonical source of truth: **BASE/`base`** (pinned SHA in `SOURCES.md`).
- **Never** source content from `PlatformNetwork/*` or any non-BASE org.
- If a value is known but not yet confirmed against source, mark it with the
  approved `unverified` token (the only placeholder the gates allow) and open an
  item in `issues.md`. `TODO`/`FIXME`/`lorem` are forbidden.

## Frontmatter template

Every `.mdx` page starts with YAML frontmatter:

```yaml
---
title: "Page title in sentence case"
description: "One-sentence summary of what this page covers."
---
```

- `title` and `description` are required on every page.
- Use sentence case for `title`.
- Optional keys when relevant: `icon`, `sidebarTitle`.

## Terminology (preferred usage)

Use these terms exactly; do not invent synonyms.

| Term | Usage |
|------|-------|
| **BASE** | The network's token (uppercase). |
| **hotkey** | Operational signing key (one word, lowercase). |
| **coldkey** | Custody/ownership key (one word, lowercase). |
| **UID** | A neuron's unique slot id within the subnet (uppercase). |
| **emissions** | Tokens distributed to participants per epoch. |
| **weights** | Validator-set scores assigned to miners. |
| **miner** | Participant that produces work/responses. |
| **validator** | Participant that scores miners and sets weights. |
| **subnet** | The network instance. |
| **netuid** | The subnet id. For BASE this is **100**. |

Network-specific facts (e.g. `netuid 100`) must match `SOURCES.md`.

## Brand colors

- Primary red: `#d91f35`
- Success green: `#b2ff22` (ALLOWED — whitelisted by the forbidden-string gate)
- Forbidden starter greens: `#16a34a`, `#07c983`, `#15803d` (gate fails on these)
- Forbidden paid font: `argent-pixel` / `pjc8nxd`

## Style

- Active voice, second person ("you").
- One idea per sentence; keep them concise.
- Sentence case for headings.
- Bold for UI elements (e.g. Click **Settings**).
- Code formatting for file names, commands, paths, and code references.

## Local QA gates

Run before every commit / PR (see `scripts/`):

```bash
bash scripts/qa-all.sh        # run all four gates
# or individually:
bash scripts/qa-forbidden.sh  # forbidden strings (greens, PlatformNetwork, paid font, bad org URLs)
bash scripts/qa-placeholder.sh # TODO/FIXME/lorem (allows `unverified`)
bash scripts/qa-build.sh      # mint validate (schema/build)
bash scripts/qa-links.sh      # mint broken-links
```

Each script exits non-zero on failure and prints a `PASS`/`FAIL` summary.
