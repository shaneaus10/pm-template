---
id: F-001
title: "Automated Status Digest"
status: approved
author: "Template"
serves: [P-001]
delivers: [VP-001]
governed-by: [NFR-001]
uses-tools: [ADR-001]
improves: [PROC-001]
---

# F-001: Automated Status Digest

> **📎 EXAMPLE ARTIFACT — delete or adapt during onboarding.** Part of the shipped example chain. Fictional data.

## Description

An automated workflow that pulls each team's status from where the work already lives, reconciles it into a single view, and produces a draft weekly digest for the [P-001] Operations Lead to review and send. This is the investment that delivers [VP-001] by replacing the manual assembly in [PROC-001].

## Capabilities

- Scheduled collection of status from each team's source (no manual chasing).
- Automatic reconciliation into one consistent format, with conflicts flagged for review.
- A draft digest generated on demand, held for human approval per [NFR-001].
- One-click send once the Operations Lead approves.

## Technical Notes

Built on the workflow automation platform adopted in [ADR-001]. The send step is gated behind explicit human approval so the feature complies with [NFR-001]. Conflicting inputs are surfaced in the draft rather than silently resolved.

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [P-001] | persona this feature serves |
| [VP-001] | value prop this feature delivers |
| [NFR-001] | policy governing this feature (approval gate) |
| [ADR-001] | tool this feature is built on |
| [PROC-001] | process this feature improves |
