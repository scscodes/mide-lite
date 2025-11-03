---
name: base_rules
description: Universal code quality and collaboration guidance
globs: ["**"]
alwaysApply: True
tags: [base, global]
---

# Setup, Environment & Communication

## Always Know Your Environment
- **FIRST** confirm the local runtime environment (OS, shell) before executing commands or scripts.
- **SECOND** find critical project files (package.json, requirements.txt, .env) to understand dependencies, configurations, and project scope.
- **THIRD** identify common directories (scripts, docs, src) and **USE** them.

## Communication & Workflow
- **USE** technical and concise tone, and be clear with reasoning.
- **REQUEST** for clarification or context when requirements are unclear.
- **CLARIFY** scope and intent, with clear requirements and outcomes.
- **NEVER** operate under assumption or accept ambiguous tasks.

## Decision & Escalation Gates
- **TIMEBOX** investigations; escalate if no progress within agreed window.
- **ESCALATE** when requirements conflict, risks are high, or trade-offs need input.
- **ORCHESTRATE** via supervisor for multi-agent tasks; **DIRECT** response for small, clear changes.

# Code Development Standards
## Core Principles
- **USE** SOLID and DRY principles.
- **USE** standard libraries and built-ins over custom solutions.
- **STAY FOCUSED** and solve the task with **MINIMAL CODE** and **MINIMAL COMPLEXITY**.
- **KEEP IT SIMPLE** and escalate growing complexity.
- **DEFENSIVE PROGRAMMING** fail fast, fail early and sanitize all inputs.
- **STABILITY IS REQUIRED** for all builds and all tests.

## SCM & Git
- **COMMIT** changes **ONLY AFTER** receiving explicit consent.
- **WRITE** meaningful commit messages with semantic versioning.
- **NEVER** push changes without explicit consent.
- **CHANGE MANAGEMENT**: small, reviewable PRs; single-purpose commits; green CI before merge; avoid mixing refactor with feature.

## Security & Performance
- **NEVER** introduce new or deprecated/EOL dependencies without explicit consent.
- **NEVER** create empty directories or incomplete functions.
- **VALIDATE & SANITIZE** all external inputs at boundaries; **reject by default**.
- **LOGGING & SECRETS**: structured logs with levels; no secrets/PII; **redact at source**; use correlation/trace IDs.
- **CONTROL CONCURRENCY** and **BACKPRESSURE**; avoid unbounded queues. 
- **STREAM & BATCH** large data; eliminate **N+1 I/O**.
- **CACHE**: bound size/TTL; clear invalidation strategy.
- **COMPRESS** large data structures.
- **STANDARDIZE** responses and error codes.
- **SET BOUNDARIES** and **TIMEOUTS** for external calls.
- **RETRY SAFELY** only idempotent ops with **exponential backoff + jitter**; cap attempts.
- **IDEMPOTENCY** at boundaries (keys/dedup) for create-like actions.

## Documentation & File Hygiene
- **KEEP SINGLE SOURCE** per topic; avoid duplicated docs.
- **PURGE TEMPORARY ARTIFACTS** or assign explicit TTL.
- **PRUNE** between tasks and before commits.


## Agent Persona Standards
- **Frontmatter** minimal: `name`, `description` (no other keys).
- **Contracts**: reference `.mide-lite/contracts/` for inputs/outputs.
- **Concise**: no dead sections; avoid project-specific paths.


## Testing
- **MOCK BOUNDARIES** and never test real data or depdendencies.
- **TEST BEHAVIOR** and functional outcomes, not explicit values.


## Tech/Rules References
- Base: `.mide-lite/rules/base_rules.md`
- Language: `.mide-lite/rules/typescript.md`, `.mide-lite/rules/javascript.md`, `.mide-lite/rules/python.md`
- Workflows: `.mide-lite/workflows/*`
- Specialized: `.mide-lite/rules/security.md`, `.mide-lite/rules/testing.md`, `.mide-lite/rules/hygiene.md`