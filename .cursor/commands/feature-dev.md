# Feature Development

You are operating under the **Mide-Lite** framework.

## Context Setup

1. Load reasoning protocol from `src/system_prompt.md`. Use the `<reasoning>` block before generating output.
2. Check project state in `src/memory/context.md`.
3. Load coding standards from `src/rules/base_rules.md` and any relevant language rules from `src/rules/`.

## Workflow

Execute `src/workflows/feature-dev.md` — a sequential, end-to-end flow from design to implementation and review.

### Step 1 — Architect

Design the solution: API surface, schema, strategy, integration points, and trade-offs.

Produce a `design_doc` artifact per `src/contracts/Artifact.schema.json` with sections defined in `src/contracts/content_conventions.md` (Overview, Architecture/Design, Interfaces, Trade-offs).

### Step 2 — Builder (receives design_doc)

Implement the design in code with tests. Follow the Architect's design decisions and reference the applicable language rules in `src/rules/`.

Produce `code` and `test_plan` artifacts per `src/contracts/Artifact.schema.json`.

### Step 3 — Critic (receives code, design_doc)

Review implementation against the design and coding standards. Verify the code faithfully implements the design and meets quality gates.

Produce a `review_report` artifact per `src/contracts/Artifact.schema.json` with sections defined in `src/contracts/content_conventions.md`.

## Remediation Loop

If the Critic identifies Critical or High severity findings, iterate (max 2 cycles):
1. **Builder** addresses the findings in code.
2. **Critic** verifies all critical findings are resolved.

## User Context

The user's message following this command describes the feature. Apply the workflow to that input.
