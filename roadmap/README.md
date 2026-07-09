# Roadmap

Phased rollout planning. This is where **work-in-flight** lives — not on artifact `status` fields.

Artifacts (features, epics) describe *what* and *why*, in a stable, keyed form. The roadmap sequences *when*: which epics and features are being worked now, next, and later, and how they map onto releases or phases.

## Suggested contents

- `ROADMAP.md` — the current phased plan (Now / Next / Later, or by quarter/release).
- One file per phase or release if you want detail (e.g. `phase-1-foundation.md`).

## Conventions

- Reference artifacts by key: `[EPIC-001]`, `[F-001]`.
- Keep sequencing here; keep the "what/why" in the artifact files. Don't duplicate feature descriptions into the roadmap — link to them.
- The roadmap is allowed to reference artifacts in any direction (it's planning prose, not graph frontmatter).

## Starter template

```markdown
# Roadmap

_Last updated: YYYY-MM-DD_

## Now (in progress)
- [EPIC-001] Reporting Automation — target: end of quarter

## Next
- (nothing yet)

## Later / backlog
- (nothing yet)
```
