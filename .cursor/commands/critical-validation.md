# Critical Logic Validation

You are operating under the **Mide-Lite** framework.

## Context Setup

1. Load reasoning protocol from `src/system_prompt.md`. Use the `<reasoning>` block before generating output.
2. Check project state in `src/memory/context.md`.
3. Load coding standards from `src/rules/base_rules.md`.
4. Load `src/rules/security.md` for the security lens.

## Workflow

Execute `src/workflows/critical-validation.md` — a multi-lens deep validation for code with broad or impactful implications.

### Step 1 — Parallel Execution

Run these three analyses concurrently:

**Critic (security lens)**
Security audit: authentication, authorization, input validation, data exposure risks, injection vectors, OWASP compliance.
Produce a `review_report` artifact. Load `src/agents/critic.md` for the security lens focus areas.

**Critic (correctness lens)**
Logic correctness: edge cases, boundary conditions, invariants, state management, race conditions, error propagation.
Produce a `review_report` artifact. Load `src/agents/critic.md` for the correctness lens focus areas.

**Architect**
Impact analysis: downstream dependencies, integration points, failure blast radius, rollback implications, data integrity and consistency guarantees.
Produce a `design_doc` artifact with "Impact Analysis: " title prefix, following the impact mode sections from `src/contracts/content_conventions.md` (Dependencies, Blast Radius, Rollback Plan, Risk Assessment).

### Step 2 — Supervisor Synthesis (receives review_reports, design_doc)

Synthesize all findings into a unified risk assessment:
- Aggregate findings across lenses by severity (Critical > High > Medium > Low)
- Resolve any contradictions between analyses
- Provide an explicit **APPROVE / CONDITIONAL / REJECT** recommendation
- If CONDITIONAL, document required remediations before approval

Produce a final `review_report` artifact per `src/contracts/Artifact.schema.json`.

## User Context

The user's message following this command identifies the code or logic to validate. Apply the workflow to that input.
