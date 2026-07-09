# Governance Compliance Rule

This project is governed by the PM repository at {{PM_REPO_URL}}.

## Must follow

- Honor the tool decisions (ADRs) and policies (NFRs) listed in [GOVERNANCE.md](../../GOVERNANCE.md).
- The **requirements contract** is the governing feature artifact(s) in the PM repo — reference them by key (`[F-NNN]`, `[US-NNN]`); don't invent competing requirements here.
- Respect the human-in-the-loop rule: no consequential automated action (send, post, write to a system of record, notify an external party) without a defined human review step.
- Record any deviation from PM governance in GOVERNANCE.md with a rationale.

## When a decision comes up

- New load-bearing tool/tech choice → record it as an ADR in the PM repo, not here (unless it's purely project-internal, in which case note it in GOVERNANCE.md deviations).
- New rule everyone must follow → that's a policy (NFR) in the PM repo.
- Reusable skill needed across projects → propose it as a shared skill in the PM repo.
