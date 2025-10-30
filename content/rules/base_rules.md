---
description: Universal code quality and collaboration guidance
globs: 
alwaysApply: true
---

# Rule Mapping
**AUTO-INCLUDE** specialized rules based on detected technologies:

## Languages
- [javascript_typescript](mdc:javascript_typescript_rules.mdc), [python](mdc:python_rules.mdc)

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

# Code Development Standards
## Core Principles
- **USE** SOLID, DRY and ACID principals.
- **USE** standard libraries and built-ins over custom solutions.
- **STAY FOCUSED** and solve the task with **MINIMAL CODE** and **MINIMAL COMPLEXITY**.
- **KEEP IT SIMPLE** and escalate growing complexity.
- **DEFENSIVE PROGRAMMING** fail fast, fail early and sanitize all inputs.
- **STABILITY IS REQUIRED** for all builds and all tests.

## SCM & Git
- **COMMIT** changes **ONLY AFTER** receiving explicit consent.
- **WRITE** meaningful commit messages with semantic versioning.
- **NEVER** push changes without explicit consent.

## Security & Performance
- **NEVER** introduce new or deprecated/EOL dependencies without explicit consent.
- **NEVER** create empty directories or incomplete functions.
- **VALIDATE & SANITIZE** all external inputs at boundaries; **reject by default**.
- **SAFE LOGGING**: no secrets/PII; **redact at source**.
- **CONTROL CONCURRENCY** and **BACKPRESSURE**; avoid unbounded queues. 
- **STREAM & BATCH** large data; eliminate **N+1 I/O**.
- **CACHE**: bound size/TTL; clear invalidation strategy.
- **COMPRESS** large data structures.
- **STANDARDIZE** responses and error codes.
- **SET BOUNDARIES** and **TIMEOUTS** for external calls.
- **RETRY SAFELY** only idempotent ops with **exponential backoff + jitter**; cap attempts.
- **IDEMPOTENCY** at boundaries (keys/dedup) for create-like actions.

## Documentation & File Hygiene
- **REQUIRED ARTIFCATS** must adhere to established patterns `docs/**.md` or `scripts/**.(c)js` and be the sole-source of information for a given topic.
- **TEMPORARY ARTIFACTS** must be purged immediately after use, or given explicit TTL/lifecycle conditions.
- **PRUNE AND PURGE** between tasks, before commits, and before creating new artifacts.


## Agent Persona Standards
- **Frontmatter schema (minimal, enforced)**:
  ```yaml
  ---
  name: <agent-id>
  description: "<one-sentence purpose>"
  ---
  ```
- Do NOT include `model`, `role`, `supports`, `tags`, or other metadata in frontmatter.
- Reference shared resources in the body only:
  - `content/agents/_shared_context.md`
  - `content/contracts/agent/AgentOutput.schema.json`
- Keep personas concise: no dead sections, no project-specific paths.


## Testing
- **MOCK BOUNDARIES** and never test real data or depdendencies.
- **TEST BEHAVIOR** and functional outcomes, not explicit values.