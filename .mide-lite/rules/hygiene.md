---
name: hygiene
description: Project hygiene and artifact lifecycle rules
globs: []
alwaysApply: false
tags: [hygiene, artifacts]
---

# Hygiene

## Artifacts
- Single source of truth per topic; avoid duplicates.
- Purge temporary artifacts or assign explicit TTL.
- Keep scripts/docs minimal and accurate; remove stale content.

## Changes
- Small, reviewable PRs; single-purpose commits.
- Green CI required before merge.
- Avoid mixing refactor with feature work.

## Filesystem
- No empty directories; no placeholder functions.
- Consistent naming and structure; avoid dead code.

## When in Doubt
1. Delete stale or unused artifacts.
2. Prefer clarity over completeness.
3. Make the change easy to review.

