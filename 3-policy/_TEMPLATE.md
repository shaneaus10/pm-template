---
id: NFR-NNN
title: "Policy Title"
status: draft
author: "First name of person who proposed this artifact"
serves: [P-NNN]      # optional — personas this policy protects/affects
supports: [VP-NNN]   # optional — value props it underpins
---

# NFR-NNN: Policy Title

<!-- Layer 3 — Policy (the NFR- prefix is kept; "NFR ≡ Policy"). A rule or guardrail you
     must follow. Do NOT add a constrains field: the features/processes that must comply
     declare governed-by: [NFR-NNN] on their own side. Discover them via grep. -->

## Description

<!-- What this policy governs and why it matters. -->

## Requirements

- <!-- Specific, measurable requirement -->
- <!-- Specific, measurable requirement -->

## Targets / SLAs

| Metric | Target | Measurement |
|--------|--------|-------------|
| <!-- Metric --> | <!-- Value --> | <!-- How measured --> |

## Known Gaps

- <!-- Known areas where we fall short today or have open questions -->

## Related Artifacts

<!-- Downward refs only (toward foundations). A policy may optionally reference the personas
     it protects and the value props it underpins. Features/processes governed by this policy
     declare governed-by: [NFR-NNN] on their own side — discover them with grep. -->

| Key | Relationship |
|-----|-------------|
| [P-NNN] | persona this policy protects/affects |
| [VP-NNN] | value prop this policy underpins |
