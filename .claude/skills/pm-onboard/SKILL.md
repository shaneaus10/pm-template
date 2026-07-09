---
name: pm-onboard
description: >
  Guided first-run setup for a freshly cloned PM template. Interviews the user
  about their organization, white-labels the repo (README, CLAUDE.md, glossary),
  removes or adapts the shipped example artifacts, and helps seed the first
  personas and value propositions. Use when the user says "help me set up my PM",
  "onboard me", "white-label this template", "set up my organization", "get
  started", or opens a repo that still contains the shipped EXAMPLE artifacts.
  Do NOT use for routine artifact creation once setup is done (copy the relevant
  _TEMPLATE.md instead), or for creating an ADR (use create-adr).
metadata:
  author: Template
  version: 1.0.0
  category: governance
  department: all
---

# PM Onboarding

## Purpose

Take someone from "I just cloned this template" to "my PM repo reflects my organization and has its first real artifacts." This is a conversational, human-in-the-loop setup — you interview, explain, and draft; the user decides and approves.

The goal is not to fill every layer on day one. It is to (1) make the repo *theirs*, (2) teach the model well enough that they can keep going alone, and (3) leave them with a solid persona + value-prop foundation.

## Prerequisites

- The repo is open in Claude Code as the working directory.
- Read `README.md`, `CONVENTIONS.md`, and `GLOSSARY.md` so your guidance matches the shipped conventions.
- Know whether the shipped example artifacts are still present (`ls 1-personas` — a `P-001-operations-lead.md` means yes).

## Instructions

### Step 1 — Orient the user (briefly)

Give a 3–4 sentence explanation of the 8-layer model in plain language, framed around *their* eventual benefit ("a living map of who you serve, why it matters, and what you're building — that Claude can read and keep current"). Don't lecture. Point them at `README.md` for depth.

### Step 2 — Interview the organization

Ask these in small batches (2–3 at a time), conversationally. Use the `AskUserQuestion` tool when discrete choices help; otherwise free text.

1. **Organization name** and a one-line description of what it does.
2. **Industry / domain** (so examples and glossary terms fit).
3. **Teams / departments** and who leads each (even rough is fine).
4. **The roles you want to model first** — the 2–4 people/roles whose work you most want to improve. These become your first personas.
5. **Top pains / goals** for those roles — where time is lost, errors happen, or things fall through the cracks. These seed value props.
6. **Tools already in use** (spreadsheets, CRM, automation platforms, etc.) — informs future ADRs.
7. **Maintainer name** — who owns this repo.

Capture answers as you go; don't proceed to writing until you have at least name, domain, and one or two target roles.

### Step 3 — White-label the repo

With the user's confirmation, update:

- **`README.md`** — replace the title, the intro paragraph, and the "License & attribution" section with the org's details. Keep the structural/how-it-works content intact.
- **`CLAUDE.md`** — fill in the **Maintainer** and **Scope** lines near the top; remove the "First run" onboarding banner once setup is complete.
- **`GLOSSARY.md`** — add any domain-specific terms surfaced in the interview (customer/lead/account/job/etc.) under a new "Organization Terms" section.

Do **not** invent facts. If you don't know something, leave a clearly marked `TODO` placeholder and tell the user.

### Step 4 — Handle the shipped examples

The template ships one connected example per layer (`P-001` … `EPIC-001`) so the user can see the graph wired up. Offer two paths and let the user choose:

- **Adapt** — rename/rewrite the examples into the user's first real artifacts (good when their first persona is close to "Operations Lead").
- **Remove** — delete the eight example files and reset each `INDEX.md` to an empty registry, then start fresh.

If removing, delete the example artifact files (not the `_TEMPLATE.md` or `INDEX.md`) and strip their rows from each `INDEX.md`, leaving the header and an empty table.

> Never delete `_TEMPLATE.md` or `INDEX.md` from any dimension — those are structural.

### Step 5 — Seed the first personas

For each target role from the interview, create a persona by copying `1-personas/_TEMPLATE.md` to `P-NNN-slug.md`:

- Sequential keys starting at the next free number (check `1-personas/INDEX.md`).
- `status: draft`, `author:` = the maintainer or the person who requested it.
- Fill Description, Goals, Pain Points, Current Workflow Context, Key Workflows from the interview.
- Add each to `1-personas/INDEX.md`.

Show the user the first persona and get feedback before batch-creating the rest — match their voice.

### Step 6 — Seed the first value propositions

For the sharpest 1–3 pains, create value props (`2-value-props/_TEMPLATE.md` → `VP-NNN-slug.md`):

- `serves:` the relevant persona key(s).
- A crisp Statement, a Target Personas table, and a **Metrics** table with baseline → target (ask the user for rough numbers; estimates are fine and marked as such).

### Step 7 — Point the way forward

Summarize what now exists and what to do next, in the user's own terms. Typical next steps:

- Document current processes (`5-process/`) for the workflows the personas described.
- Record tool decisions with the `create-adr` skill as they're made.
- Draft features (`6-features/`) that improve those processes.
- Bring artifacts to a review and run *"process the meeting notes"* to promote them (see `REVIEW-PROCESS.md`).

Remind them: everything you created is `draft`. Nothing is approved until a human says so.

## Quality Validation Gates

Before finishing, verify:

- [ ] Every created artifact has all four required frontmatter fields (`id`, `title`, `status`, `author`) and `status: draft`.
- [ ] Frontmatter references point **downward only** (personas have none; VPs reference only personas).
- [ ] Every created artifact has a matching row in its dimension's `INDEX.md`, using real relative markdown links.
- [ ] Keys are sequential with no reuse; filenames embed the key.
- [ ] No example artifact was left half-adapted (either fully rewritten or fully removed).
- [ ] `README.md` and `CLAUDE.md` no longer describe a generic "template" as if it were unbranded (unless the user asked to defer branding).
- [ ] You never set anything to `approved`/`accepted`.

## Examples

**Input:** *"Help me set up my PM. We're a 30-person home-services company."*
**Output:** A short model explanation → an interview covering teams (dispatch, field techs, office admin), target roles, and pains → branded README/CLAUDE/GLOSSARY → examples removed → `P-001 Dispatch Coordinator`, `P-002 Field Technician`, `P-003 Office Administrator` drafted → `VP-001 Cut scheduling rework` seeded with a baseline/target metric → a "next steps" summary.

## Troubleshooting

- **User is vague about roles/pains.** Offer the shipped examples as a concrete starting point and adapt from there, rather than blocking on a perfect interview.
- **User wants to keep exploring before committing.** Leave the examples in place, brand nothing destructively, and just walk them through reading `README.md` + one example chain (`P-001` → `EPIC-001`).
- **Unsure whether something is a Policy (NFR) or a Tool (ADR).** A rule everyone must follow → Policy (`3-policy/`). A specific tool/technology/platform choice → Tools (`4-tools/`, via `create-adr`).
- **User asks you to approve artifacts.** Explain the human-in-the-loop rule and point to `REVIEW-PROCESS.md`; leave them `draft`.
