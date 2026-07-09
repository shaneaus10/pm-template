---
paths:
  - "4-tools/**"
---

# ADR (Tools) Governance Rules

> The **Tools** layer (layer 4, `4-tools/`) keeps the `ADR-` key prefix and full ADR governance. "ADR" and "Tools" are synonyms (see [GLOSSARY.md](../../GLOSSARY.md)); a tool adoption — "we chose X as our Y" — is recorded as a load-bearing decision and superseded like any ADR, preserving the track record of every tool the org has used.

## Immutability

Never modify an accepted ADR. To change a decision, create a new ADR that supersedes the original:
1. Create the new ADR with the next sequential number.
2. Set `supersedes: ADR-NNN` in the new ADR's frontmatter.
3. Update the original ADR's frontmatter `status` to `superseded` and add a note pointing to the new ADR (this is the only allowed edit to an accepted ADR).

## Location

ADRs (Tools) live in `4-tools/`. Template at `4-tools/_TEMPLATE.md`. Registry at `4-tools/INDEX.md`.

## Numbering

- Sequential, zero-padded to 3 digits: ADR-001, ADR-002, ADR-003…
- Before creating a new ADR, check `4-tools/INDEX.md` (active registry **and** Retired Keys) for the highest existing number.
- Filenames: `ADR-NNN-kebab-case-slug.md`

## Required Frontmatter

```yaml
---
id: ADR-NNN
title: "Decision Title"
status: proposed
date: YYYY-MM-DD
author: "Your first name"
governed-by: [NFR-NNN]   # policies this decision must conform to (optional, downward)
supersedes: null         # ADR key this replaces, or null
---
```

Tools (ADRs) sit at layer 4 — beneath features. Do **not** add a `constrains` field: the features/processes that depend on a tool declare `uses-tools: [ADR-NNN]` on their own side. Downstream dependents are found with `grep -r "\[ADR-NNN\]" .`.

## Status Lifecycle

`proposed → accepted → superseded | deprecated`

- No other statuses are valid.
- A proposed ADR can be withdrawn by deleting it (it was never accepted, so no immutability applies).
- Superseded ADRs retain their content — they become historical reference.
- **Claude may never set an ADR status to `accepted` — only a human may do that.**

## Required Sections

1. **Context** — What is the issue motivating this decision?
2. **Decision** — What is the change being made?
3. **Consequences** — Positive, Negative, Neutral subsections.
4. **Alternatives Considered** — What else was evaluated and why it was not chosen.
5. **Related Artifacts** — Cross-references using bracket notation `[ADR-NNN]`.

## Cross-References

- Always use bracket notation: `[ADR-001]`, `[F-003]`, `[VP-001]`.
- If a new ADR supersedes an existing one, update both files.
- Keep cross-references specific — link to the key, not a generic description.

## INDEX.md

After creating a new ADR, add a row to `4-tools/INDEX.md`:

```markdown
| [ADR-NNN](ADR-NNN-slug.md) | Title | proposed | Notes |
```

## Commit Convention

When committing ADR changes: `adr: ADR-NNN: Title`
