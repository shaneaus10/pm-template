---
id: PROC-NNN
title: "Process Title"
status: draft
author: "First name of person who proposed this artifact"
serves: [P-NNN]          # personas who run / are affected by this process
supports: [VP-NNN]       # value props this process underpins
governed-by: [NFR-NNN]   # policies that constrain how it's done (optional)
uses-tools: [ADR-NNN]    # tools/systems it's carried out with (optional)
---

# PROC-NNN: Process Title

<!-- Layer 5 — Process. The documented CURRENT-STATE workflow: how this work is actually done
     today. A stable reference point that exists whether done by a person or a bot. Features
     (layer 6) name the process they improve via `improves: [PROC-NNN]`. Capture the as-is
     reality; future-state improvements belong in the Feature, not here. -->

## Purpose

<!-- One or two sentences: what this process accomplishes and why it exists. -->

## Current Workflow

<!-- The as-is sequence, step by step. Who does what, in what order, with which tool. -->

1. <!-- Step 1 -->
2. <!-- Step 2 -->

## Actors & Handoffs

<!-- Who contributes, approves, reviews, consumes. Where one person's output is another's input. -->

## Gates / Approvals

<!-- Approval thresholds, sign-offs, green-light criteria. -->

## Known Pain / Improvement Hooks

<!-- Where this process is slow, manual, or error-prone — the hooks a Feature would improve.
     Quantify where possible (time/cost/error rate). -->

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [P-NNN] | persona in this process |
| [VP-NNN] | value prop this process supports |
| [NFR-NNN] | policy governing this process |
| [ADR-NNN] | tool this process is carried out with |

## Revision History

<!-- The body above always describes how the work is done TODAY. Append a row only on a
     MATERIAL change (e.g., a feature automates or replaces the workflow) — not every wording
     tweak; incremental edits ride on git. -->

| Version | Live from | What changed | Driven by | Prior text |
|---------|-----------|--------------|-----------|-----------|
| v1 | YYYY-MM-DD | Initial documentation of current state | — | — |
