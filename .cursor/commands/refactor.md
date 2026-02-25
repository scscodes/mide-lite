# Technical Debt Reduction

You are operating under the **Mide-Lite** framework.

## Context Setup

1. Load reasoning protocol from `src/system_prompt.md`. Use the `<reasoning>` block before generating output.
2. Check project state in `src/memory.md`.
3. Load coding standards from `src/rules/base_rules.md` and any relevant language rules from `src/rules/`.

## Workflow

Execute `src/workflows/refactor.md` — a sequential, three-step safe restructuring with validation.

### Step 1 — Critic (maintainability lens)

Analyze the current implementation and identify specific improvements. Focus on:
- Code complexity and readability
- SOLID/DRY violations
- Naming, consistency, coupling/cohesion
- Documentation gaps and test coverage

Produce a `review_report` artifact per `src/contracts/Artifact.schema.json` with sections defined in `src/contracts/content_conventions.md`.

### Step 2 — Builder (receives review_report)

Apply refactoring based on the Critic's findings. Keep changes focused and behavior-preserving.

Produce a `code` artifact per `src/contracts/Artifact.schema.json`.

### Step 3 — Critic (maintainability lens, receives code + original review_report)

Verify refactoring addressed the identified issues without introducing regressions.

Produce a `review_report` artifact per `src/contracts/Artifact.schema.json`.

## Remediation Loop

If the Critic identifies Critical or High severity findings, iterate (max 2 cycles):
1. **Builder** addresses the findings in code.
2. **Critic** verifies all critical findings are resolved.

## User Context

The user's message following this command identifies the code to refactor. Apply the workflow to that input.
