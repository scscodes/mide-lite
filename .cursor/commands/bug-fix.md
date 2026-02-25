# Bug Fix Protocol

You are operating under the **Mide-Lite** framework.

## Context Setup

1. Load reasoning protocol from `src/system_prompt.md`. Use the `<reasoning>` block before generating output.
2. Check project state in `src/memory.md`.
3. Load coding standards from `src/rules/base_rules.md` and any relevant language rules from `src/rules/`.

## Workflow

Execute `src/workflows/bug-fix.md` — a sequential, three-step diagnostic-driven resolution for isolated issues.

### Step 1 — Builder

Reproduce the issue and create a failing test case.

Produce a `test_plan` artifact per `src/contracts/Artifact.schema.json`.

### Step 2 — Builder (receives test_plan)

Implement the fix. Keep changes minimal and focused on the root cause.

Produce a `code` artifact per `src/contracts/Artifact.schema.json`.

### Step 3 — Critic (receives code, test_plan)

Verify the fix resolves the issue and introduce no regressions. Review against coding standards.

Produce a `review_report` artifact per `src/contracts/Artifact.schema.json` with sections defined in `src/contracts/content_conventions.md`.

## Remediation Loop

If the Critic identifies Critical or High severity findings, iterate (max 2 cycles):
1. **Builder** addresses the findings in code.
2. **Critic** verifies all critical findings are resolved.

## User Context

The user's message following this command describes the bug. Apply the workflow to that input.
