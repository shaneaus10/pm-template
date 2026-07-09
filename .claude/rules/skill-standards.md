---
paths:
  - "skills/**"
  - ".claude/skills/**"
---

# Skill Standards Rules

All reusable Claude skills in this repo must follow this structure so they are discoverable, self-contained, and safe to compose.

## Structure Requirements

Every skill is a directory containing at minimum a `SKILL.md` file:

```
skills/{kebab-case-name}/
├── SKILL.md           # Required: skill definition
└── references/        # Optional: supporting docs, templates, changelog
```

## YAML Frontmatter (Required)

Every SKILL.md must begin with YAML frontmatter:

```yaml
---
name: kebab-case-name
description: >
  What this skill does. Include trigger phrases: "phrase one", "phrase two".
  Include negative triggers: Do NOT use for [specific exclusions].
metadata:
  author: First name
  version: X.Y.Z
  category: governance | document-generation | workflow | mcp-enhancement
  department: all | [specific team]
---
```

## Required Elements Checklist

Before a skill is accepted, verify:

- [ ] **Trigger phrases** in description — explicit phrases that activate this skill
- [ ] **Negative triggers** in description — "Do NOT use for…" exclusions
- [ ] **Prerequisites** section — what's needed before the skill runs
- [ ] **Instructions** section — step-by-step workflow
- [ ] **Quality Validation Gates** — checkpoints before output is delivered
- [ ] **Examples** section — at least one concrete input → output scenario
- [ ] **Troubleshooting** section — common failure modes and resolutions

## Metadata Rules

- `name`: Must match the folder name. Kebab-case only.
- `version`: Semantic versioning (MAJOR.MINOR.PATCH). Start at 1.0.0.
- `category`: One of governance, document-generation, workflow, mcp-enhancement.
- `department`: "all" for cross-team skills; a specific team name for targeted skills.

## Composability

- Skills must not assume they are the only skill loaded.
- Instructions must be self-contained — do not reference external context that may not exist.
- If a skill depends on another skill, state the dependency explicitly in Prerequisites.

## Commit Convention

When committing skill changes: `skill: {skill-name}: Description of change`
