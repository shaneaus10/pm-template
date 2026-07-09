---
name: create-adr
description: >
  Creates a new Architecture Decision Record (the Tools layer — "ADR ≡ Tools")
  in 4-tools/. Use when the user says "create an ADR", "record this decision",
  "add an ADR", or "we adopted [tool/tech/platform]". Do NOT use for modifying
  accepted ADRs — they are immutable; supersede with a new ADR instead. Do NOT
  use for rules/guardrails (those are Policy/NFR in 3-policy/).
metadata:
  author: Template
  version: 1.0.0
  category: governance
  department: all
---

# Create ADR (Tools)

## Purpose

Creates a new Architecture Decision Record in the **Tools** layer (`4-tools/`, layer 4). "ADR" and "Tools" are synonyms — an ADR records a load-bearing tool / technology / platform decision (e.g., "we chose a workflow-automation platform for new integrations"). Follows `.claude/rules/adr-governance.md` and the canonical `4-tools/_TEMPLATE.md`.

## Prerequisites

- A clear understanding of the decision/tool being recorded.
- Read `4-tools/_TEMPLATE.md` and `.claude/rules/adr-governance.md`.
- Check `4-tools/INDEX.md` for related/superseded ADRs and the highest key number.

## Instructions

### Step 1 — Determine the ADR number

Check **`4-tools/INDEX.md`** — both the active registry AND the Retired Keys table — for the highest existing number. The new ADR gets the next sequential number, zero-padded to 3 digits (`ADR-NNN`). Keys are never reused — skip any retired numbers.

### Step 2 — Confirm it's actually a Tool decision (not a Policy)

If the thing is a **rule or guardrail everything must follow** (not a load-bearing tool choice), it belongs in the **Policy** layer (`3-policy/`, `NFR-`), not here. If it's a policy, stop and use the Policy template instead.

### Step 3 — Gather decision context

1. **What is the decision?** — one clear statement.
2. **Context** — the problem, constraints, and forces at play.
3. **Alternatives** considered and why they were not chosen.
4. **Consequences** — positive, negative, and neutral.
5. **Policies it must conform to** — any `[NFR-NNN]` (optional, `governed-by`).
6. **Does it supersede an existing ADR?** — if so, note the key.

### Step 4 — Write the ADR

Copy `4-tools/_TEMPLATE.md` to `4-tools/ADR-NNN-slug.md` and fill every required section: Context, Decision, Consequences (Positive/Negative/Neutral), Alternatives Considered, Related Artifacts.

Frontmatter:
```yaml
---
id: ADR-NNN
title: "Decision Title"
status: proposed          # NEVER accepted — only a human promotes
date: YYYY-MM-DD
author: "First name of the requester"
governed-by: [NFR-NNN]    # or omit
supersedes: null          # or ADR-NNN
---
```

### Step 5 — Handle supersession

If this ADR supersedes another:
1. Set `supersedes: ADR-NNN` in the new ADR.
2. Edit the old ADR's `status` to `superseded` and add a one-line note pointing to the new ADR (the only permitted edit to an accepted ADR).

### Step 6 — Update the registry

Add a row to `4-tools/INDEX.md`:
```markdown
| [ADR-NNN](ADR-NNN-slug.md) | Title | proposed | Notes |
```

## Quality Validation Gates

- [ ] `status: proposed` (never `accepted`).
- [ ] `author` is a human first name (never `Claude`/`AI`).
- [ ] All five required sections present and non-empty.
- [ ] Cross-references use bracket notation `[KEY]`.
- [ ] INDEX.md row added; supersede chain updated on both files if applicable.

## Examples

**Input:** *"We decided to standardize on a single relational database for all new services. Create an ADR."*
**Output:** `4-tools/ADR-00N-standardize-relational-database.md` (status `proposed`) with Context/Decision/Consequences/Alternatives/Related, plus an INDEX.md row.

## Troubleshooting

- **It's really a rule, not a tool.** Redirect to `3-policy/` (Policy/NFR).
- **They want to edit an accepted ADR.** Not allowed — create a superseding ADR instead.
- **Unsure of the next number.** Re-read the full INDEX including Retired Keys; never reuse a key.
