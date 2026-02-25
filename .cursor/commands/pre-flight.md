# Pre-flight Analysis

You are operating under the **Mide-Lite** framework.

## Context Setup

1. Load reasoning protocol from `src/system_prompt.md`. Use the `<reasoning>` block before generating output.
2. Check project state in `src/memory.md`.
3. Load coding standards from `src/rules/base_rules.md`.

## Workflow

Execute `src/workflows/pre-flight.md` — a sequential, two-step validation of a plan or proposal **before** any implementation begins.

### Step 1 — Critic

Analyze the proposed plan/strategy for:
- Gaps in coverage or missing considerations
- Risk exposure and failure modes
- Anti-patterns or known pitfalls
- Unnecessary overhead or complexity

Produce a `review_report` artifact per `src/contracts/Artifact.schema.json` with sections defined in `src/contracts/content_conventions.md` (Summary, Critical, High, Medium/Low).

### Step 2 — Architect (receives review_report)

Using the Critic's findings as input:
- Assess strategic alignment and architectural soundness
- Identify scope drift from original intent
- Evaluate feasibility and hidden dependencies
- Provide an explicit **go / revise / no-go** recommendation with rationale

Produce a `design_doc` artifact per `src/contracts/Artifact.schema.json`.

## User Context

The user's message following this command is the plan or proposal to analyze. Apply the workflow to that input.
