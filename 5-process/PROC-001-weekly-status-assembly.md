---
id: PROC-001
title: "Weekly Status Report Assembly"
status: approved
author: "Template"
serves: [P-001]
supports: [VP-001]
governed-by: [NFR-001]
uses-tools: [ADR-001]
---

# PROC-001: Weekly Status Report Assembly

> **📎 EXAMPLE ARTIFACT — delete or adapt during onboarding.** Part of the shipped example chain. Fictional data. This documents the *current, manual* state — the feature [F-001] improves it.

<!-- Layer 5 — Process. CURRENT-STATE workflow. The feature that improves it names it via
     improves: [PROC-001]. -->

## Purpose

Produce a single, accurate weekly status summary for leadership from the updates each team provides.

## Current Workflow

1. Every Friday morning, the [P-001] Operations Lead messages each team asking for their status update.
2. Teams reply in chat or email, in varying formats.
3. The Operations Lead copies each update into a master spreadsheet.
4. Conflicting or ambiguous numbers are reconciled by follow-up questions.
5. The Operations Lead hand-formats a summary email and sends it to leadership.

## Actors & Handoffs

- **Teams** → provide raw updates (input).
- **Operations Lead** → consolidates, reconciles, formats, sends (owner).
- **Leadership** → consumes the summary (output).

## Gates / Approvals

- The Operations Lead reviews the full summary before it is sent — the human approval point required by [NFR-001].

## Known Pain / Improvement Hooks

- **Collection is manual** — chasing teams costs ~1–2 hrs/week.
- **Formats vary** — reconciliation is error-prone and adds ~1 hr/week.
- **Output is stale** — updates gathered Friday morning are outdated by the afternoon send.
- Total: ~4 hrs/week of toil, the target of [F-001].

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [P-001] | persona who runs this process |
| [VP-001] | value prop this process supports |
| [NFR-001] | policy governing the approval step |
| [ADR-001] | tool the improved version will be built on |

## Revision History

| Version | Live from | What changed | Driven by | Prior text |
|---------|-----------|--------------|-----------|-----------|
| v1 | 2026-01-01 | Initial documentation of current manual state | — | — |
