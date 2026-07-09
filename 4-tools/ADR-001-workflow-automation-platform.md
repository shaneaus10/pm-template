---
id: ADR-001
title: "Adopt a Workflow Automation Platform"
status: accepted
date: 2026-01-01
author: "Template"
governed-by: [NFR-001]
supersedes: null
---

# ADR-001: Adopt a Workflow Automation Platform

> **📎 EXAMPLE ARTIFACT — delete or adapt during onboarding.** Part of the shipped example chain. Fictional decision. Note the ADR-specific status (`accepted`) and immutability rules.

<!-- Layer 4 — Tools ("ADR ≡ Tools"). Features/processes that use this tool declare
     uses-tools: [ADR-001] on their own side. -->

## Context

Status data lives in several spreadsheets and inboxes. Consolidating it manually is the core toil behind [VP-001]. To automate collection and digest generation, we need a way to move data between systems on a schedule and shape it into a report — without building and hosting a bespoke service.

The chosen approach must respect [NFR-001]: any action that sends or writes externally must pause for human approval.

## Decision

Adopt a general-purpose **workflow automation platform** (the kind that connects apps via triggers and steps) as the default tool for scheduled data movement and report assembly. Bespoke code is reserved for cases the platform cannot handle.

## Consequences

### Positive
- Fast to build and change workflows without a deployment pipeline.
- Built-in connectors to common apps (spreadsheets, email, chat).
- Non-developers can read and maintain the workflows.

### Negative
- Vendor lock-in risk; export/portability must be considered.
- Complex logic can become hard to test inside a visual builder.

### Neutral
- Introduces a new system of record for "how work moves" that must itself be governed.

## Alternatives Considered

| Alternative | Reason Not Chosen |
|-------------|------------------|
| Build a bespoke service | Higher upfront cost and ongoing maintenance for a first automation |
| Spreadsheet macros only | Cannot reliably pull from external systems or notify on a schedule |
| Do nothing (stay manual) | Fails to deliver [VP-001] |

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [NFR-001] | policy this decision conforms to (approval gates) |
| — | supersedes nothing (first ADR) |
