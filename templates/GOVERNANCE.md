# Governance

Drop this file into a downstream **project repo** to anchor it to your PM governance repository. It declares which tool decisions (ADRs), policies (NFRs), and shared skills the project must honor. (The scaffolding script in `scripts/` generates a pre-filled version of this automatically.)

**Governance source:** `<URL of your PM repo>`
**Project:** [Project Name]
**Team / Department:** [Team]
**Lead:** [Lead]

---

## Applicable Tool Decisions (ADRs)

List the PM repo's ADRs this project must comply with, and how.

| ADR | Title | Relevance to This Project |
|-----|-------|--------------------------|
| [ADR-001](<pm-repo-url>/4-tools/ADR-001-...) | [Title] | [How this project applies it] |

## Applicable Policies (NFRs)

| Policy | Title | How This Project Complies |
|--------|-------|---------------------------|
| [NFR-001](<pm-repo-url>/3-policy/NFR-001-...) | Human Approval Gates | [Where the human review step lives in this project] |

## Requirements & Implementation Reference

The requirements contract is the PM repo's feature artifact(s) and their user stories; build sequencing lives in this project's own `IMPLEMENTATION.md`.

| Document | Status | Location |
|----------|--------|----------|
| Governing feature artifact | [draft / approved] | [link to F-NNN in the PM repo] |
| IMPLEMENTATION.md | [draft / signed off] | ./IMPLEMENTATION.md |

## Shared Skills Used

| Skill | Source | Purpose in This Project |
|-------|--------|------------------------|
| [skill-name] | [pm-repo/.claude/skills/name] | [How this project uses it] |

## Human-in-the-Loop Compliance

If this project uses AI/automation, document the decision matrix and review tiers per the PM repo's approval-gates policy.

| Action | Automated | Human Review |
|--------|-----------|-------------|
| [e.g., Draft the weekly digest] | [Assembled automatically] | [Lead approves before send] |

> Delete this section if the project has no AI/automation component.

## Deviations

Any deviation from PM governance must be documented here with rationale.

| Item | Deviation | Rationale | Approved By |
|------|-----------|-----------|-------------|
| (none) | | | |

## Update Log

| Date | Change | Author |
|------|--------|--------|
| [YYYY-MM-DD] | Initial governance setup | [Author] |
