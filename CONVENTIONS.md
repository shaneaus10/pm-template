# PM Conventions

Conventions for creating, keying, and managing all PM artifacts in this repository. Read this before making any changes.

---

## Keying System

Every artifact has a unique **key** that enables cross-referencing across dimensions. Keys are the nodes of the product knowledge graph; references between them are the edges.

### Key Format

```
PREFIX-NNN
```

- **PREFIX**: dimension abbreviation (see table below)
- **NNN**: zero-padded integer, 001–999
- Keys are permanent and never reused — gaps are acceptable if an artifact is deprecated

| Layer | Prefix | Dimension (plain-English label)        | Directory          |
|-------|--------|----------------------------------------|--------------------|
| 1     | P      | Persona                                | `1-personas/`      |
| 2     | VP     | Value Proposition                      | `2-value-props/`   |
| 3     | NFR    | **Policy** (rules/guardrails)          | `3-policy/`        |
| 4     | ADR    | **Tools** (load-bearing decisions)     | `4-tools/`         |
| 5     | PROC   | Process                                | `5-process/`       |
| 6     | F      | Feature (investment / opportunity)     | `6-features/`      |
| 7     | US     | User Story                             | `7-user-stories/`  |
| 8     | EPIC   | Epic                                   | `8-epics/`         |

The dimensions are numbered in **dependency order** — each layer is built on the layers beneath it (lower numbers). Build bottom-up; reference downward (see _Frontmatter — Downward References Only_).

**Key letters are historical and kept stable for traceability.** The `NFR-` prefix reads as **Policy** and the `ADR-` prefix reads as **Tools** — treat `NFR ≡ Policy` and `ADR ≡ Tools` as synonyms (see [GLOSSARY.md](GLOSSARY.md)).

### Filename Convention

```
PREFIX-NNN-slug.md
```

- Slug is kebab-case, descriptive
- Key is always embedded in the filename
- Examples: `P-001-operations-lead.md`, `ADR-002-database-choice.md`

---

## Cross-References

The repository uses **three reference notations** depending on context:

### In artifact body text — bracket notation

```markdown
This feature serves [P-001] and delivers [VP-002].
Governed by [NFR-001] and built on [ADR-001].
```

This makes references grep-able:
```bash
grep -r "\[ADR-001\]" .        # find all references to ADR-001
grep -r "status: proposed" .   # find all artifacts ready for review
```

### In INDEX.md tables — real relative markdown links

```markdown
| [P-001](P-001-operations-lead.md) | Operations Lead | approved | ... |
```

This makes INDEX entries clickable in any markdown viewer.

### In YAML frontmatter — bare keys

```yaml
serves: [P-001, P-003]
delivers: [VP-001]
```

No quotes, no brackets, no markdown links.

---

## Frontmatter — Downward References Only

The stack is built **bottom-up**: personas are the foundation (layer 1), epics sit at the top (layer 8). **Frontmatter relationships point downward only** — each artifact declares the foundations it rests on (the lower-numbered layers beneath it), never what is built on top of it. This is the "downstream-only" guardrail: it avoids stale reverse links — if a feature is added that delivers VP-001, only the feature file needs updating, not VP-001.

An artifact at layer N may reference any layer 1..N-1 (not only the layer immediately below). A feature (6) may reference personas (1), value props (2), policies (3), tools (4), and processes (5).

```
8 Epic (EPIC)      → bundles: [F], delivers: [VP], realized-by: [US]
7 User Story (US)  → implements: [F]
6 Feature (F)      → serves: [P], delivers: [VP], governed-by: [NFR], uses-tools: [ADR], improves: [PROC]
5 Process (PROC)   → serves: [P], supports: [VP], governed-by: [NFR], uses-tools: [ADR]
4 Tools (ADR)      → governed-by: [NFR], supersedes: [ADR]  (serves/supports optional)
3 Policy (NFR)     → serves: [P], supports: [VP]            (optional; policies are foundational)
2 Value Prop (VP)  → serves: [P]
1 Persona (P)      → (foundation — no references)
```

**No reverse links in frontmatter.** A persona does not list its value props. A VP does not list its features. A feature *does* declare the policies, tools, and processes it rests on (lower layers), but it does **not** declare its user stories or epics (higher layers). Discover higher-layer dependents with `grep -r "\[KEY\]" .` — the knowledge graph is navigable in both directions, but authorship is unidirectional (downward).

### Per-Dimension Frontmatter Fields

Required on every artifact: `id`, `title`, `status`, `author`. Beyond those, each dimension declares only **downward** relationship fields:

| Layer | Dimension       | Downward relationship fields                                                                       |
|-------|-----------------|----------------------------------------------------------------------------------------------------|
| 1     | Persona (P)     | (none — foundation)                                                                                |
| 2     | Value Prop (VP) | `serves` (→ P)                                                                                     |
| 3     | Policy (NFR)    | `serves` (→ P), `supports` (→ VP) — *optional; populate only when a policy maps to a specific persona/VP* |
| 4     | Tools (ADR)     | `date`, `governed-by` (→ NFR), `supersedes` (→ ADR key or `null`); `serves`/`supports` optional    |
| 5     | Process (PROC)  | `serves` (→ P), `supports` (→ VP), `governed-by` (→ NFR), `uses-tools` (→ ADR)                      |
| 6     | Feature (F)     | `serves` (→ P), `delivers` (→ VP), `governed-by` (→ NFR), `uses-tools` (→ ADR), `improves` (→ PROC) |
| 7     | User Story (US) | `implements` (→ F)                                                                                 |
| 8     | Epic (EPIC)     | `bundles` (→ F), `delivers` (→ VP), `realized-by` (→ US)                                            |

#### `serves` and `supports` semantics

`serves` lists **every persona involved or affected** by the artifact — both the people who make it happen (internal teams, vendors) and the people who receive the value (customers, end users). `supports` names the value props the artifact underpins. The maker-vs-receiver distinction can be made explicit in the artifact's body (e.g., a "Target Personas" table with a per-persona relevance note) when it matters; the frontmatter list is intentionally undivided to keep bookkeeping single-source.

### Author Field

Every artifact must include an `author` field immediately after `status`. This records who proposed or drafted the artifact.

- **Format**: First name only (e.g. `Alex`, `Sam`, `Jordan`)
- **Required**: Yes — never leave as a placeholder when creating a real artifact
- **Set once**: Captures the original author; do not change it if the artifact is later edited by someone else
- **AI-created**: When Claude creates an artifact on behalf of a user, the author is the person who requested it — not Claude

---

## Status Lifecycle

### Regular Artifacts (P, VP, NFR/Policy, PROC, F, US, EPIC)

```
draft → proposed → approved → live → deprecated
```

| Status     | Meaning                                       |
|------------|-----------------------------------------------|
| draft      | Captured but not yet reviewed                 |
| proposed   | On the agenda — ready for team review         |
| approved   | Team has signed off — safe to build against   |
| live       | Built and operating in production             |
| deprecated | Retired, kept for history                     |

These are the **only** valid statuses. No `in-progress`, no `implemented`, no flag glyphs — work-in-flight belongs in `roadmap/`, not as artifact status.

### Tools (ADRs)

The Tools layer keeps full ADR governance — decisions are immutable once accepted, and the supersede chain preserves the track record of every tool the org has adopted.

```
proposed → accepted → superseded | deprecated
```

| Status     | Meaning                                          |
|------------|--------------------------------------------------|
| proposed   | Under review                                     |
| accepted   | Active decision                                  |
| superseded | Replaced by another ADR (link to successor)      |
| deprecated | No longer relevant                               |

**ADRs are immutable once accepted.** To change a decision, create a new ADR that supersedes the original — never modify an accepted ADR directly.

### Promotion Rule

Claude must never set an artifact to `approved` (or `accepted` for ADRs) without explicit human confirmation. See [REVIEW-PROCESS.md](REVIEW-PROCESS.md).

---

## Process & Feature Lifecycle

How the graph evolves once things get built. The key idea: a **Process** is present-tense ("how the work is done today") with mutable content and a stable key; a **Feature** is the **change/investment** applied to it — a permanent ledger entry whose `status` tracks its lifecycle. They evolve in opposite directions and never merge.

**When a feature ships (`status → live`):**
1. The feature **stays a feature** (now `live`) — the permanent record of the investment, its ROI case, and the user stories that validated it. It does **not** become a process.
2. The **process it `improves:` is rewritten in place** to the new current-state (its key is stable; its content always reflects today). A feature with no process (net-new capability) that ships may **give birth to a new process** describing the new way of working.
3. Direction stays **feature → process** (downward). A process never adds an upward link to the feature; the driving feature is found via `grep "improves:.*PROC-NNN"` and may be acknowledged in the process body in prose.

**Deprecating a process:** only when the underlying activity ceases entirely (`status → deprecated`, with disposition). If the activity continues but differently (the common manual→automated case), **rewrite the process in place** — do not deprecate it.

---

## INDEX.md Pattern

Every dimension directory has an `INDEX.md` registry. Required sections:

1. **Active Registry** — table of all current artifacts with status and primary references (using real markdown links)
2. **Retired Keys** — table of deprecated/absorbed keys with disposition explaining where the content went
3. (Optional) **Matrices** — Feature × Persona, Feature × Value Prop, etc. — helpful cross-cutting views

Example active registry:

```markdown
| Key | Title | Status | Primary References |
|-----|-------|--------|-------------------|
| [P-001](P-001-operations-lead.md) | Operations Lead | approved | — |
```

Example retired-keys table:

```markdown
## Retired Keys

| Key | Original Title | Disposition |
|-----|---------------|-------------|
| P-003 | Sales Team | Absorbed into [P-002] — consolidated |
```

Update the INDEX whenever an artifact is added, its status changes, or a key is retired.

---

## _TEMPLATE.md

Each dimension directory has a `_TEMPLATE.md` showing the required structure. Copy it when creating a new artifact — never skip required sections. Templates only carry **downward** relationship fields per the per-dimension table above. If a template suggests an upward field, the template is out of date — fix the template, do not propagate the field.

---

## Numbering Rules

- Sequential within prefix
- Zero-padded to 3 digits
- Never reuse a key
- Gaps are fine (e.g., if F-003 is deprecated, skip it; record disposition in the Retired Keys table)

---

## ADR Cascade Rule

When an ADR changes status:

1. Grep for all `[ADR-NNN]` references across the repo.
2. Every referencing document is a **review candidate**.
3. The ADR document itself links to its successor if superseded (via `supersedes` frontmatter and a body note).
4. Update referencing documents or mark them for revision.

---

## Metrics in Value Props

Value propositions include a `## Metrics` section with quantitative KPIs:

```markdown
## Metrics

| Metric | Baseline | Target | Measurement |
|--------|----------|--------|-------------|
| Time to assemble weekly report | 4 hrs/wk | 15 min/wk | Ops time log |
| Reports missing data | 3/month | 0/month | QA checklist |
```

---

## Contribution Workflow

1. Copy `_TEMPLATE.md` from the target dimension and name it `PREFIX-NNN-slug.md`.
2. Assign the next sequential key number — check `INDEX.md` (including the Retired Keys table) for the last used number.
3. Fill in only the **downward** frontmatter fields for that dimension.
4. Set `author` to the human first name (never `Claude` or `AI`).
5. **Always set `status: draft`** (or `status: proposed` for ADRs) — never `approved`/`accepted`.
6. Use bracket notation `[KEY]` in body text; bare keys in YAML; real relative markdown links in INDEX.md.
7. Add a row to `INDEX.md` with status `draft` and real markdown links.
8. Use the process in [REVIEW-PROCESS.md](REVIEW-PROCESS.md) to move to `approved`.
