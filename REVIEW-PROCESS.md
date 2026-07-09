# Artifact Review Process

How PM artifacts move from `proposed` to `approved` (or `accepted`, for ADRs). This is the human-in-the-loop gate: Claude drafts and proposes, humans approve.

---

## Overview

Artifact approval happens through team discussion (sync or async). Claude can assist by processing meeting notes and applying the team's decisions to the repo — but never promotes anything without explicit human confirmation.

---

## Workflow

### 1. Before the review

- Set the artifact's status to `proposed` in its YAML frontmatter and in the dimension's `INDEX.md`.
- Share the artifact with the team (a link, a printout, or the file itself).

### 2. During the review

- Discuss the artifact — don't edit files live.
- Capture the discussion and the decision in notes.

### 3. After the review

- Export the notes as plain text (from a doc, a transcript tool, or just paste them into the conversation).
- Tell Claude: **"Process the meeting notes from [date]"** and provide the text or a file path.

### 4. Claude's review workflow

Claude will:
1. Read the notes.
2. Find every artifact mentioned by key (`P-001`, `F-003`, `ADR-002`, …) or recognizable title.
3. Classify the team's decision for each:
   - **Approve** — explicit or clear consensus ("let's go", "approved", "ship it")
   - **Reject** — dropped or not moving forward
   - **Defer** — tabled for a future review
   - **Ambiguous** — discussed but no clear decision
4. Show a summary **before touching any files** — you must confirm.

### 5. Confirm and apply

After you confirm, Claude updates:
- The `status` field in each artifact's YAML frontmatter
- The corresponding `INDEX.md` row

### 6. Commit

Review `git diff` and commit with a descriptive message, e.g.:

```
pm: approve VP-001, F-002; accept ADR-005; defer P-002
```

---

## Manual process

Prefer to edit directly? Just:
1. Change `status: proposed` → `status: approved` (or `accepted` for ADRs) in the artifact file.
2. Update the same row in `INDEX.md`.
3. Commit.

---

## Signal words for approval

| Signal                             | Classification |
|------------------------------------|----------------|
| "approved", "let's go", "ship it"  | Approve        |
| "not ready", "kill it", "no"       | Reject         |
| "next meeting", "later", "defer"   | Defer          |
| Discussion without resolution      | Ambiguous      |

---

## ADR-specific notes

- ADRs require explicit team acceptance — implicit consensus is not enough.
- Once `accepted`, an ADR is immutable. Only a superseding ADR can change the decision.
- Claude will never set an ADR to `accepted` — only a human may do so.

---

## Status lifecycle reference

Regular artifacts (P, VP, NFR, PROC, F, US, EPIC): `draft → proposed → approved → live → deprecated`
ADRs: `proposed → accepted → superseded | deprecated`

These are the only valid statuses. See `.claude/rules/status-lifecycle.md` for forbidden values and normalization rules.
