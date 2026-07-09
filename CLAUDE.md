# PM Repository — AI Instructions

## Purpose

This is a **product-management governance repository**, not a code project. It holds a keyed, cross-referenced knowledge graph of an organization's automation and software initiatives: personas, value propositions, policies, tool decisions, processes, features, user stories, and epics.

> **First run:** If this repo still contains the shipped example artifacts (`P-001` "Operations Lead", `VP-001`, … `EPIC-001`) and has not been branded to an organization, offer to run the **`pm-onboard`** skill to set it up. See `.claude/skills/pm-onboard/`.

**Maintainer:** _(set during onboarding)_
**Scope:** _(set during onboarding)_

---

## Structure

Dimensions are numbered by dependency order — the stack is built bottom-up (personas are the foundation; epics sit on top) and references point **downward** toward foundations:

1. `1-personas/` — WHO (P-NNN keys)
2. `2-value-props/` — WHY (VP-NNN keys)
3. `3-policy/` — Policy / rules / guardrails (NFR-NNN keys; **NFR ≡ Policy**)
4. `4-tools/` — Tools / load-bearing decisions (ADR-NNN keys; **ADR ≡ Tools**; keeps full ADR governance)
5. `5-process/` — How work is actually done today (PROC-NNN keys)
6. `6-features/` — Investment / improvement opportunities (F-NNN keys)
7. `7-user-stories/` — Acceptance checklist that pressure-tests a feature per persona (US-NNN keys)
8. `8-epics/` — Delivery grouping of user stories (EPIC-NNN keys)

Supporting: `roadmap/` (phased rollout), `gtm/` (positioning), `templates/` (document templates), `scripts/` (project scaffolding), `.claude/` (governance rules and on-demand skills).

---

## Conventions (MUST follow)

- **Read [CONVENTIONS.md](CONVENTIONS.md) before making any changes.**
- Every artifact file has YAML frontmatter with `id`, `title`, `status`, `author`, and **downward-only** relationship fields (each dimension references only the foundation layers beneath it, never its dependents above — see the per-dimension table in CONVENTIONS.md).
- Cross-references in body text use bracket notation: `[P-001]`, `[F-003]`, `[ADR-002]`.
- Cross-references in INDEX.md tables use real relative markdown links: `[P-001](P-001-operations-lead.md)`.
- Cross-references in YAML frontmatter use bare keys: `serves: [P-001, P-003]`.
- Filenames embed the key: `PREFIX-NNN-slug.md`.
- Keys are never reused, even after deprecation — record disposition in the dimension's INDEX.md Retired Keys table.
- Each dimension directory has an `INDEX.md` registry and a `_TEMPLATE.md`.
- **Links point downward only** — see `.claude/rules/relationship-direction.md` for the per-dimension field table.

---

## Approval Lifecycle

All artifacts start as **draft** (or **proposed** for ADRs) and must be manually promoted by the team after review. **Claude must never create or set an artifact to `approved` or `accepted` status — only humans may do that.**

| Artifact type | Initial status | Approved status |
|---|---|---|
| Personas (P-NNN) | `draft` | `approved` |
| Value Props (VP-NNN) | `draft` | `approved` |
| Policy / NFRs (NFR-NNN) | `draft` | `approved` |
| Tools / ADRs (ADR-NNN) | `proposed` | `accepted` |
| Processes (PROC-NNN) | `draft` | `approved` |
| Features (F-NNN) | `draft` | `approved` |
| User Stories (US-NNN) | `draft` | `approved` |
| Epics (EPIC-NNN) | `draft` | `approved` |

The full regular lifecycle is `draft → proposed → approved → live → deprecated`. ADRs use `proposed → accepted → superseded | deprecated`. See `.claude/rules/status-lifecycle.md` for the canonical list and forbidden values.

---

## ADR System (the Tools layer)

ADRs live in `4-tools/`. Template at `4-tools/_TEMPLATE.md`. **Authoritative registry: [4-tools/INDEX.md](4-tools/INDEX.md)** — do not maintain a duplicate ADR list elsewhere.

- ADRs are immutable once accepted. Never modify an accepted ADR.
- To change a decision, create a new ADR that supersedes it (`supersedes: ADR-NNN`), and set the old one's status to `superseded`.
- Use the `create-adr` skill to create new ADRs correctly. See `.claude/rules/adr-governance.md`.

---

## Shared Skills

Reusable Claude skills live in `.claude/skills/` (and, if you keep a cross-project library, in a top-level `skills/`). Authoritative metadata lives in each skill's `SKILL.md` frontmatter. See `.claude/rules/skill-standards.md` and the `create-shared-skill` skill.

---

## When Adding New Artifacts

1. Copy `_TEMPLATE.md` from the target dimension.
2. Assign the next sequential key number (check `INDEX.md` — both the active registry and the Retired Keys table — for the last used number).
3. Fill in only the **downward** frontmatter fields for that dimension (references toward lower-numbered foundation layers — see CONVENTIONS.md).
4. **Always set `status: draft`** (or `status: proposed` for ADRs) — never `approved`/`accepted`.
5. **Always set `author`** — the first name of the human who requested or proposed the artifact. If unclear, ask before creating the file. Never use `Claude` or `AI` as the author.
6. **No reverse links** — do not update foundation artifacts to point back up. Discover higher-layer dependents with `grep -r "\[KEY\]" .`.
7. Use bracket notation `[KEY]` in body text; bare keys in YAML; real relative markdown links in INDEX.md.
8. Add the new entry to `INDEX.md` with `draft` status.

---

## Post-Meeting Approval Workflow

After a planning or team meeting, Claude can read the notes and propose artifact status changes.

Tell Claude: _"Process the meeting notes from [date or filename]"_ (paste the notes or give a file path).

Claude will: (1) read the notes, (2) identify every artifact mentioned by key or recognizable title, (3) classify each as **approved / rejected / deferred / ambiguous**, (4) present a summary for confirmation **before touching any files**, and (5) after confirmation, update `status` fields and the matching `INDEX.md` rows. Claude will never promote an artifact without explicit human confirmation.

---

## When Reviewing

- Use `grep -r "\[KEY\]" .` to trace the knowledge graph from any node.
- Validate the hierarchy: every feature should trace down to a value prop and a persona (its foundations).
- Check for orphans: artifacts with no inbound references may indicate gaps.

---

## Glossary (core terms)

- **ADR ≡ Tools** (layer 4) — a load-bearing decision or tool adoption ("we chose X"), recorded as an Architecture Decision Record. Immutable once accepted; superseded by a new ADR.
- **NFR ≡ Policy** (layer 3) — a rule or guardrail everything must follow (like a building code). The `NFR-` prefix is kept for traceability.
- **Process** (layer 5, PROC) — how work is actually done *today*: the documented current-state workflow. A stable reference point that features improve.
- **Feature** (layer 6, F) — an investment / improvement opportunity (justified by ROI / time saved) that improves a process or delivers a new capability.
- **Epic** (layer 8, EPIC) — a collection of user stories grouped for delivery planning.
- **Human-in-the-Loop** — no artifact is promoted to approved/accepted, and no consequential automated action is taken, without a defined human review step.

See [GLOSSARY.md](GLOSSARY.md) for the full list.
