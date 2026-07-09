---
id: NFR-001
title: "Human Approval Gates for Automated Actions"
status: approved
author: "Template"
serves: [P-001]
supports: [VP-001]
---

# NFR-001: Human Approval Gates for Automated Actions

> **📎 EXAMPLE ARTIFACT — delete or adapt during onboarding.** Part of the shipped example chain. Fictional data. This is a good starter policy for most organizations — you may want to keep an adapted version.

<!-- Layer 3 — Policy ("NFR ≡ Policy"). A rule everything must follow. Features/processes that
     must comply declare governed-by: [NFR-001] on their own side. -->

## Description

No consequential automated action reaches an external party or a system of record without a defined point of human review. Automation may gather, draft, reconcile, and propose — but a human approves anything that is hard to reverse or externally visible. This is the organization's human-in-the-loop guarantee.

## Requirements

- Every automated workflow that sends, posts, writes to a system of record, or notifies an external party must define an explicit review step and reviewer.
- Read-only, drafting, and internal-summary actions may run unattended.
- Each automated decision must be logged with enough context for a human to audit it after the fact.
- A reviewer must be able to reject or edit a proposed action before it takes effect.

## Targets / SLAs

| Metric | Target | Measurement |
|--------|--------|-------------|
| Consequential actions with a defined approval gate | 100% | Workflow design review |
| Automated decisions with an audit log entry | 100% | Log spot-check |

## Known Gaps

- No central dashboard yet for reviewing pending approvals across workflows.

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [P-001] | persona whose reviews this policy protects |
| [VP-001] | value prop this policy underpins (trustworthy automation) |
