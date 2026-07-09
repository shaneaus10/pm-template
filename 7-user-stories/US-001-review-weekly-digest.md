---
id: US-001
title: "Review and Send the Weekly Digest"
status: approved
author: "Template"
implements: [F-001]
---

# US-001: Review and Send the Weekly Digest

> **📎 EXAMPLE ARTIFACT — delete or adapt during onboarding.** Part of the shipped example chain. Fictional data.

## User Story

> As a [P-001] **Operations Lead**, I want to **review an auto-generated status digest and approve it before it sends** so that **the weekly report is accurate, trustworthy, and takes minutes instead of hours**.

## Acceptance Criteria

- [ ] The digest is generated automatically from each team's source data on a weekly schedule.
- [ ] Conflicting or missing inputs are clearly flagged in the draft for the Operations Lead to resolve.
- [ ] The digest does **not** send until the Operations Lead explicitly approves it (per [NFR-001]).
- [ ] The Operations Lead can edit the draft before approving.
- [ ] Total review-and-send time is under 15 minutes.

## Workflow

1. On schedule, the digest is assembled and a draft is presented to the Operations Lead.
2. The Operations Lead reviews flagged items and edits as needed.
3. The Operations Lead approves; the digest is sent to leadership.

## Technical Notes

Exercises the approval gate from [NFR-001] and the assembly capability of [F-001]. The "flagged conflicts" criterion is the key acceptance test — silent auto-resolution would violate the intent.

## Related Artifacts

| Key | Relationship |
|-----|-------------|
| [F-001] | feature this story implements |
