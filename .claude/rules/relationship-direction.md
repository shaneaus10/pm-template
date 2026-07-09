---
paths:
  - "1-personas/**"
  - "2-value-props/**"
  - "3-policy/**"
  - "4-tools/**"
  - "5-process/**"
  - "6-features/**"
  - "7-user-stories/**"
  - "8-epics/**"
---

# Relationship Direction Rule

The stack is built **bottom-up** — personas are the foundation (layer 1), epics sit on top (layer 8). All artifact frontmatter relationships point **downward only**: each artifact declares the foundations it rests on (lower-numbered layers beneath it), never what is built on top of it. This is the "downstream-only" guardrail.

An artifact at layer N may reference any layer 1..N-1 — not only the layer immediately below. A feature (6) may reference personas (1), value props (2), policies (3), tools (4), and processes (5).

## Why

Reverse links decay. A feature added next month that delivers VP-001 should not require editing VP-001's frontmatter — only the feature file. Otherwise foundation artifacts collect stale, orphaned `enables` / `implemented-by` arrays that nobody refreshes.

Discovery of higher-layer dependents is done by grep, not by frontmatter:

```bash
grep -r "\[VP-001\]" .   # every artifact that rests on VP-001
grep -r "\[NFR-006\]" .  # every artifact governed by policy NFR-006
grep -r "\[PROC-001\]" . # every feature that improves process PROC-001
```

## Allowed Frontmatter Fields per Dimension

Required on every artifact: `id`, `title`, `status`, `author`. Relationship fields (all point downward, toward lower layers):

| Layer | Dimension       | Downward relationship fields                                                                       |
|-------|-----------------|----------------------------------------------------------------------------------------------------|
| 1     | Persona (P)     | (none — foundation)                                                                                |
| 2     | Value Prop (VP) | `serves` (→ P)                                                                                     |
| 3     | Policy (NFR)    | `serves` (→ P), `supports` (→ VP) — optional                                                       |
| 4     | Tools (ADR)     | `date`, `governed-by` (→ NFR), `supersedes` (→ ADR or `null`); `serves`/`supports` optional        |
| 5     | Process (PROC)  | `serves` (→ P), `supports` (→ VP), `governed-by` (→ NFR), `uses-tools` (→ ADR)                      |
| 6     | Feature (F)     | `serves` (→ P), `delivers` (→ VP), `governed-by` (→ NFR), `uses-tools` (→ ADR), `improves` (→ PROC) |
| 7     | User Story (US) | `implements` (→ F)                                                                                 |
| 8     | Epic (EPIC)     | `bundles` (→ F), `delivers` (→ VP), `realized-by` (→ US)                                            |

`serves` lists **every persona involved or affected** — both makers (internal teams, vendors) and receivers (customers, end users). Don't split makers from receivers in frontmatter; if the distinction matters, capture it in the body's "Target Personas" table.

## Forbidden Fields

These **must not** appear in frontmatter:

- Any **upward** field that points at a higher layer (a dependent): `enables`, `delivered-by`, `implemented-by`, `governs`, `improved-by`, `bundled-into`, `value-props`/`features` (on personas/VPs), `constrains`.
- `realized-by` anywhere other than an epic pointing at its own user stories.

If you encounter a forbidden field in an existing artifact, remove it. If a template still suggests one, fix the template — do not propagate the field to new artifacts.

## Body Text vs. Frontmatter

The rule above governs **frontmatter only**. Body text in any artifact may freely mention `[KEY]` references in either direction — that's prose context, not graph metadata. INDEX.md tables and matrices may also display higher-layer views (e.g., a Feature × Persona matrix) because the index file is the single source for that dimension and is updated in one place.
