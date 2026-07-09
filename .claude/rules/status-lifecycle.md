---
paths:
  - "1-personas/**"
  - "2-value-props/**"
  - "3-policy/**"
  - "4-tools/**"
  - "5-process/**"
  - "6-features/**"
  - "7-user-stories/**"
  - "8-epics/**"
---

# Status Lifecycle Rule

Every artifact has a `status` field. Only the documented statuses are valid.

## Regular Artifacts (P, VP, NFR/Policy, PROC, F, US, EPIC)

```
draft → proposed → approved → live → deprecated
```

| Status     | Meaning                                       |
|------------|-----------------------------------------------|
| draft      | Captured but not yet reviewed                 |
| proposed   | On the agenda — ready for team review         |
| approved   | Team has signed off — safe to build against   |
| live       | Built and operating in production             |
| deprecated | Retired, kept for history                     |

## Tools (ADRs)

```
proposed → accepted → superseded | deprecated
```

| Status     | Meaning                                       |
|------------|-----------------------------------------------|
| proposed   | Under review                                  |
| accepted   | Active decision                               |
| superseded | Replaced by another ADR (use `supersedes`)    |
| deprecated | No longer relevant                            |

## Forbidden Statuses

The following are **not valid** and must not be introduced:

- `implemented` — use `live` instead
- `in-progress` — work in flight is tracked in `roadmap/`, not on the artifact
- `pending`, `wip`, `tbd` — use `draft` or `proposed` per workflow stage
- Flag glyphs (`⚑`, `⭐`, etc.) appended to status — use a separate `priority:` field if priority needs to be tracked

If you encounter a forbidden status, normalize it:

| Found            | Replace with                                                          |
|------------------|-----------------------------------------------------------------------|
| `implemented`    | `live`                                                                |
| `in-progress`    | `approved` (move build-progress tracking to roadmap)                  |
| `draft ⚑`        | `draft` (record priority elsewhere if needed)                         |
| `pending`        | `draft` or `proposed` depending on context                            |

## Promotion Rule

Claude **must never** set an artifact to `approved` or `accepted` without explicit human confirmation. This is the human-in-the-loop guarantee for governance — see `REVIEW-PROCESS.md`.

## INDEX.md Sync

When an artifact's status changes, update both:

1. The artifact's frontmatter `status:` field
2. The matching row in the dimension's `INDEX.md`

Out-of-sync status between artifact and INDEX is a defect — flag it for repair.
