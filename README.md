# PM Template

A structured, AI-native product-management repository for planning and governing automation and software initiatives across an organization.

This template turns product management into a **navigable knowledge graph**: every persona, value proposition, policy, tool decision, process, feature, user story, and epic is a keyed, cross-referenced artifact that Claude can read, trace, and keep current. It is battle-tested — a real organization runs its entire automation program on this structure — and it is **white-label**: nothing here is specific to any one company. Clone it, run the guided setup, and make it yours.

> **New here? Don't read the whole repo.** Open this folder in [Claude Code](https://claude.com/claude-code) and say **"Help me set up my PM"**. The guided onboarding skill (`.claude/skills/pm-onboard`) will interview you, brand the repo to your organization, and help you create your first artifacts. See [Getting Started](#getting-started) below.

---

## The 8-Layer Model

Product knowledge is organized into eight layers, numbered in **dependency order**. The stack is built **bottom-up** — personas are the foundation; epics sit on top. Every reference points **downward**, toward the foundations. That single rule is what keeps the graph from rotting (see [Why references point downward](#why-references-point-downward)).

```
8  Epics (EPIC)        Group user stories for delivery planning & tracking
7  User Stories (US)   The acceptance checklist that pressure-tests a feature per persona
6  Features (F)        The investment / opportunity — what we build to improve a process
5  Process (PROC)      How the work is actually done TODAY — the stable reference point
4  Tools (ADR)         The load-bearing tools & decisions we build on
3  Policy (NFR)        The rules / guardrails we must follow
2  Value Props (VP)    WHY the work matters
1  Personas (P)        WHO we're building for — the people & roles      ← foundation
```

Two of the key prefixes are historical and kept for traceability — read them as their plain-English labels:

- **`NFR` ≡ Policy** — the layer is *Policy* (rules/guardrails, like building codes); the `NFR-` prefix ("Non-Functional Requirement") is retained.
- **`ADR` ≡ Tools** — the layer is *Tools* (load-bearing decisions & tool adoptions); the `ADR-` prefix ("Architecture Decision Record") is retained, along with full ADR immutability governance.

See [GLOSSARY.md](GLOSSARY.md) for canonical definitions.

---

## Repository Structure

```
pm-template/
├── README.md              ← You are here
├── CLAUDE.md              ← AI assistant instructions for this repo (read by Claude Code)
├── CONVENTIONS.md         ← Keying, frontmatter, cross-references, status lifecycle
├── GLOSSARY.md            ← Canonical term definitions (NFR≡Policy, ADR≡Tools, etc.)
├── REVIEW-PROCESS.md      ← How artifacts get approved (human-in-the-loop)
│
├── 1-personas/            ← WHO           (P-NNN)
├── 2-value-props/         ← WHY           (VP-NNN)
├── 3-policy/              ← Policy/rules  (NFR-NNN)
├── 4-tools/               ← Tools/decisions (ADR-NNN)
├── 5-process/             ← How work is done today (PROC-NNN)
├── 6-features/            ← Investment / opportunity (F-NNN)
├── 7-user-stories/        ← Acceptance checklists (US-NNN)
├── 8-epics/               ← Delivery grouping (EPIC-NNN)
│
├── roadmap/               ← Phased rollout planning (no keys)
├── gtm/                   ← Positioning & messaging (no keys)
├── templates/             ← Document templates (PRD, SOP, questionnaire, GOVERNANCE)
├── scripts/               ← Scaffolding for downstream project repos
└── .claude/
    ├── rules/             ← Machine-enforced governance rules
    └── skills/            ← On-demand Claude skills (onboarding, create-adr, create-shared-skill)
```

Each of the eight dimension folders contains:

- **`_TEMPLATE.md`** — copy this to create a new artifact in that layer
- **`INDEX.md`** — the registry of every artifact in that layer, with status
- **One worked example** (`P-001`, `VP-001`, …) — a connected, industry-neutral illustration you can study, then adapt or delete

The eight examples form a single chain that traces top to bottom, so you can see the whole graph wired up before writing your own.

---

## Keying System

Every artifact has a unique, permanent key: `PREFIX-NNN` (zero-padded, e.g. `P-001`, `ADR-014`).

| Layer | Prefix | Dimension (label)  | Example filename                    |
|-------|--------|--------------------|-------------------------------------|
| 1     | P      | Persona            | `P-001-operations-lead.md`          |
| 2     | VP     | Value Prop         | `VP-001-eliminate-manual-reporting.md` |
| 3     | NFR    | Policy             | `NFR-001-human-approval-gates.md`   |
| 4     | ADR    | Tools / Decision   | `ADR-001-workflow-automation-platform.md` |
| 5     | PROC   | Process            | `PROC-001-weekly-status-assembly.md` |
| 6     | F      | Feature            | `F-001-automated-status-digest.md`  |
| 7     | US     | User Story         | `US-001-review-weekly-digest.md`    |
| 8     | EPIC   | Epic               | `EPIC-001-reporting-automation.md`  |

Keys are **never reused**, even after deprecation — gaps are fine, and disposition is recorded in the layer's `INDEX.md`. Trace the graph from any node with grep:

```bash
grep -r "\[VP-001\]" .      # every artifact that rests on VP-001
grep -r "\[ADR-001\]" .     # every feature/process built on tool ADR-001
```

---

## Why references point downward

The stack is built bottom-up, so **frontmatter relationships only ever point at lower layers** — each artifact declares the foundations it rests on, never what is built on top of it. A feature declares the personas, value props, policies, tools, and process it depends on. A persona declares nothing.

This is the single most important rule in the system. Reverse links decay: if a new feature that delivers `VP-001` had to edit `VP-001`, foundation artifacts would slowly fill with stale, orphaned back-references nobody maintains. Instead, dependents are discovered on demand with grep. The graph is navigable in both directions; only **authorship** is one-directional (downward). See [.claude/rules/relationship-direction.md](.claude/rules/relationship-direction.md).

---

## Status Lifecycle

Regular artifacts (P, VP, NFR, PROC, F, US, EPIC):

```
draft → proposed → approved → live → deprecated
```

Tools (ADRs), which keep full ADR governance:

```
proposed → accepted → superseded | deprecated
```

**Claude never promotes an artifact to `approved`/`accepted` on its own** — that requires explicit human sign-off. This is the human-in-the-loop guarantee. See [REVIEW-PROCESS.md](REVIEW-PROCESS.md) and [.claude/rules/status-lifecycle.md](.claude/rules/status-lifecycle.md).

---

## Getting Started

### 1. Clone and open in Claude Code

```bash
git clone <your-fork-of-this-template> my-org-pm
cd my-org-pm
claude   # or open the folder in the Claude Code app / IDE extension
```

### 2. Run the guided onboarding

Say to Claude:

> **"Help me set up my PM"**

This triggers the `pm-onboard` skill, which will:

1. Interview you about your organization — name, what you do, your teams/departments, and the roles and pain points you want to improve.
2. Explain the 8-layer model in your context.
3. Brand the repo to your org (README, CLAUDE.md, glossary) and remove or adapt the example artifacts.
4. Help you draft your first **personas** and **value propositions** — the foundation everything else rests on.

Everything Claude creates starts as `draft`. You stay in control of what gets approved.

### 3. Grow the graph, bottom-up

Work upward as your understanding solidifies: personas → value props → policies & tools → document your current processes → propose features → write user stories → group into epics. You don't need every layer on day one; the model is useful even with just personas and value props filled in.

### 4. Keep it current

- Create new artifacts by copying the relevant `_TEMPLATE.md` and adding a row to that layer's `INDEX.md`.
- Use the `create-adr` skill when you adopt a new tool or make a load-bearing decision.
- Use the `create-shared-skill` skill to add reusable Claude skills for your team.
- After a planning meeting, paste or point Claude at the notes and say *"process the meeting notes"* — it proposes status changes for your confirmation ([REVIEW-PROCESS.md](REVIEW-PROCESS.md)).

---

## Extending to project repos

When a feature graduates into an actual build, scaffold a dedicated project repo that links back to this governance repo:

```bash
bash scripts/init-project.sh
```

It generates a project repo pre-wired with a `GOVERNANCE.md` that references your PM's tools/decisions (ADRs) and shared skills, so downstream work stays anchored to the same source of truth. See [scripts/](scripts/).

---

## License & attribution

This template is provided for organizations to adopt and white-label freely. Replace this section with your own license and ownership once you've made it yours.
