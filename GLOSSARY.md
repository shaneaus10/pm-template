# Glossary

Canonical definitions for the terms and layer labels used across this PM repository. When a term here conflicts with usage in an existing artifact, update the artifact — this glossary is the source of truth for terminology.

> **Tip:** Add your organization's own ambiguous terms here as you go. Whenever a word causes confusion in a meeting, spec, or review — "what do we mean by *account*, *lead*, *customer*, *job*?" — pin it down here. A shared vocabulary is one of the highest-leverage habits this system enables.

---

## Layer Labels & Key Prefixes

### ADR ≡ Tools (layer 4)

**Architecture Decision Record.** The plain-English layer label is **Tools**; the `ADR-` key prefix is kept for traceability. A tool adoption — "we chose PostgreSQL," "we standardized on a workflow-automation platform" — is a load-bearing decision recorded as an ADR. ADRs are **immutable once accepted**; to change a decision you write a new ADR that supersedes the old one. Numbered `ADR-001`, `ADR-002`, … Status: `proposed → accepted → superseded | deprecated`.

### NFR ≡ Policy (layer 3)

**Non-Functional Requirement.** The plain-English layer label is **Policy** — the rules and guardrails you must follow, like building codes. The `NFR-` key prefix is kept for traceability. Examples: "every consequential automated action needs a human approval gate," "data must be no more than 24 hours stale."

### Persona (layer 1, P)

**WHO** the work is for — a person or role, internal or external, who makes the work happen or receives its value. Personas are the foundation of the graph and declare no downward references.

### Value Proposition (layer 2, VP)

**WHY** the work matters — the concrete outcome delivered to one or more personas, with measurable metrics (baseline → target).

### Process (layer 5, PROC)

How work is actually done **today**: the documented current-state workflow, with actors, handoffs, and approval gates. A stable reference point that features improve. A process is present-tense and mutable in place; its key stays stable even as the workflow changes.

### Feature (layer 6, F)

An **investment / improvement opportunity** (justified by ROI or time saved) that improves a process or delivers a new capability. A feature describes the *future* state; the current state lives in the process it `improves`. A feature is a permanent ledger entry — its `status` tracks its lifecycle from `draft` to `live`.

### User Story (layer 7, US)

The **acceptance checklist** that pressure-tests a feature from a specific persona's point of view: *"As a [persona], I want [action] so that [benefit]"* plus concrete acceptance criteria.

### Epic (layer 8, EPIC)

A **collection of user stories** (and the features they cover) grouped for delivery planning and progress tracking against the roadmap. The "no-holes" completeness contract for a cohesive deliverable.

---

## Cross-Cutting Concepts

### Downward-only references

Frontmatter relationships always point at lower (foundation) layers, never higher (dependent) ones. See [CONVENTIONS.md](CONVENTIONS.md) and `.claude/rules/relationship-direction.md`. Discover higher-layer dependents with `grep`, not reverse-link fields.

### Human-in-the-Loop

No artifact is promoted to `approved`/`accepted`, and no consequential automated action is taken, without a defined human review step. Claude drafts and proposes; humans approve. This is the core governance guarantee.

### Knowledge graph

The set of all artifacts (nodes) and their cross-references (edges). Navigable in both directions via `grep -r "\[KEY\]" .`, even though authorship of edges is one-directional (downward).

### Shared Skill

A reusable Claude skill (a `SKILL.md` and optional supporting files) usable across projects without modification. See `.claude/rules/skill-standards.md`.
