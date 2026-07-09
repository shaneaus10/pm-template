---
id: F-NNN
title: "Feature Title"
status: draft
author: "First name of person who proposed this artifact"
serves: [P-NNN]
delivers: [VP-NNN]
governed-by: [NFR-NNN]   # policies this feature must comply with (optional)
uses-tools: [ADR-NNN]    # tools/decisions it's built on (optional)
improves: [PROC-NNN]     # process(es) this feature improves (optional)
---

# F-NNN: Feature Title

## Description

<!-- 2–3 sentences describing the future opportunity / improvement this feature delivers and
     why. A feature is an investment/opportunity — describe the FUTURE state. The current-state
     workflow belongs in the Process (layer 5) named in `improves:`, not here. -->

## Capabilities

- <!-- Key capability 1 -->
- <!-- Key capability 2 -->
- <!-- Key capability 3 -->

## Technical Notes

<!-- Brief notes on how this is implemented or key technical considerations. May reference ADRs in body text. -->

## Related Artifacts

<!-- Downward refs only (toward foundations). A feature declares the personas/VPs it serves,
     the policies/tools it rests on, and the process it improves. Higher layers (user stories,
     epics) declare their own relationship to this feature — discover them via grep. -->

| Key | Relationship |
|-----|-------------|
| [P-NNN] | persona this feature serves |
| [VP-NNN] | value prop this feature delivers |
| [NFR-NNN] | policy governing this feature |
| [ADR-NNN] | tool this feature uses |
| [PROC-NNN] | process this feature improves |
