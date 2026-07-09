---
id: ADR-NNN
title: "Decision Title"
status: proposed
date: YYYY-MM-DD
author: "First name of person who proposed this artifact"
governed-by: [NFR-NNN]   # optional — policies this decision must conform to
supersedes: null         # ADR key this replaces, or null
---

# ADR-NNN: Decision Title

<!-- Layer 4 — Tools (the ADR- prefix is kept; "ADR ≡ Tools"). A load-bearing decision or
     tool adoption. Do NOT add a constrains field: the features/processes that use this tool
     declare uses-tools: [ADR-NNN] on their own side. Discover them via grep. -->

## Context

<!-- What is the problem or situation requiring a decision? What constraints and forces are at play? -->

## Decision

<!-- What was decided and why? Be specific. -->

## Consequences

### Positive
- <!-- Benefit 1 -->
- <!-- Benefit 2 -->

### Negative
- <!-- Trade-off 1 -->
- <!-- Trade-off 2 -->

### Neutral
- <!-- Neither good nor bad -->

## Alternatives Considered

| Alternative | Reason Not Chosen |
|-------------|------------------|
| <!-- Alt 1 --> | <!-- Why rejected --> |

## Related Artifacts

<!-- Downward refs only (toward foundations). A tool decision may reference the policies it
     conforms to and (optionally) another ADR it supersedes. Features/processes that use this
     tool declare uses-tools: [ADR-NNN] on their own side — discover them with grep. -->

| Key | Relationship |
|-----|-------------|
| [NFR-NNN] | policy this decision conforms to |
| [ADR-NNN] | <!-- supersedes / superseded by --> |
