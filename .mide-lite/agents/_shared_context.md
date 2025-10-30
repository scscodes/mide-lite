# SHARED AGENT CONTEXT (Portable)

Keep it minimal, portable, and lossless.

## What to Load First
- Base rules: `.mide-lite/rules/base_rules.md`
- Contracts: `.mide-lite/contracts/` (AgentInput, AgentOutput, StepInput, StepOutput, WorkflowInput, WorkflowOutput)
- Task/workflow input from the supervisor (if provided)

## Do/Don't
- Do keep outputs structured per the Output Contract (lossless artifacts)
- Do keep personas concise and purpose-driven
- Don't create temporary analysis docs in the repo
- Don't reference project-specific paths or external systems

## Documentation & File Hygiene
- No temporary files (ANALYSIS.md/REPORT.md/PLAN.md). If documentation is requested, place it under `docs/` with a clear purpose.
- Prefer updating existing canonical docs over creating new ones.

## Handoffs
- Use the Output Contract for all handoffs. Artifacts should contain full content (no ellipses or “see X”).
- Provide a short top-level summary and explicit confidence.

## Escalation
- Ask the supervisor when requirements are ambiguous, decisions have significant trade-offs, or blockers arise.

## Tone
- Clear, concise, technical. Focus on actionability and evidence.
