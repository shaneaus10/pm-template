---
name: create-shared-skill
description: >
  Creates a new reusable Claude skill in .claude/skills/ (or a top-level skills/
  library). Use when the user says "create a skill", "add a new skill", "promote
  this to a shared skill", or "build a reusable skill for [workflow]". Enforces the
  skill-standards structure. Do NOT use for one-off scripts or for project-specific
  skills that belong in a downstream project repo.
metadata:
  author: Template
  version: 1.0.0
  category: governance
  department: all
---

# Create Shared Skill

## Purpose

Creates a properly structured, reusable Claude skill that complies with `.claude/rules/skill-standards.md`, so it is discoverable, self-contained, and safe to compose with other skills.

## Prerequisites

- A clear understanding of what the skill does.
- Confirmation it's genuinely reusable (used in more than one situation without modification).
- If promoting from an ad-hoc workflow, the existing notes/steps as reference.

## Instructions

### Step 1 — Validate reuse

Confirm: will this be used repeatedly, across contexts, without modification? If it's a one-off, it doesn't need to be a skill. If it's specific to a single downstream project, it belongs in that project's own `skills/` folder, not here.

### Step 2 — Define skill identity

Collect:
1. **Name** (kebab-case) — matches the folder name.
2. **Purpose** — one sentence.
3. **Trigger phrases** — 2–3 phrases a user would naturally say.
4. **Negative triggers** — what this skill should NOT be used for.
5. **Category** — governance, document-generation, workflow, or mcp-enhancement.
6. **Department scope** — "all" or a specific team.

### Step 3 — Create the directory

```
.claude/skills/{kebab-case-name}/
├── SKILL.md
└── references/         # only if supporting docs are needed
```

### Step 4 — Write SKILL.md

Include, in order: YAML frontmatter (name, description with triggers + negative triggers, metadata) → Purpose → Prerequisites → Instructions (numbered steps) → Quality Validation Gates → Examples (≥1 concrete input→output) → Troubleshooting.

```yaml
---
name: kebab-case-name
description: >
  What it does. Triggers: "phrase one", "phrase two".
  Do NOT use for [exclusions].
metadata:
  author: First name
  version: 1.0.0
  category: workflow
  department: all
---
```

### Step 5 — Verify against the checklist

Run the Required Elements Checklist from `.claude/rules/skill-standards.md`.

## Quality Validation Gates

- [ ] `name` matches folder name; kebab-case.
- [ ] Description has both trigger phrases and negative triggers.
- [ ] Prerequisites, Instructions, Quality Gates, Examples, Troubleshooting all present.
- [ ] Instructions are self-contained (no reliance on context that may be absent).
- [ ] Dependencies on other skills stated explicitly in Prerequisites.

## Examples

**Input:** *"Turn our weekly-digest routine into a reusable skill."*
**Output:** `.claude/skills/weekly-digest/SKILL.md` with triggers ("generate the weekly digest"), numbered steps, quality gates, an example, and troubleshooting.

## Troubleshooting

- **It's a one-off.** Don't make a skill; just do the task.
- **It's project-specific.** Put it in the project repo's `skills/`, not here.
- **Missing negative triggers.** Always add "Do NOT use for…" — it prevents the skill from firing on the wrong requests.
