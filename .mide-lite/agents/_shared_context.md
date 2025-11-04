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
- Use the Output Contract for all handoffs. Artifacts should contain full content (no ellipses or "see X").
- Provide a short top-level summary and explicit confidence.
- Tag artifacts with metadata to control user-facing output (see Artifact Tagging below).

## Artifact Tagging (Critical)

All artifacts must include `metadata` with proper tagging. This controls whether the user sees the artifact or if it stays internal.

### Decision Tree for Artifact Metadata

Follow this logic when creating artifacts:

**1. Is this the PRIMARY deliverable the user requested?**
- ✅ YES → `importance: critical`, `audience: user`, `promote_to_output: true`
  - Examples: API design they asked for, code implementation of feature, deployment guide
- ❌ NO → Continue to question 2

**2. Does the user NEED this to understand/use the solution?**
- ✅ YES → `importance: high`, `audience: user`, `promote_to_output: true`
  - Examples: API contract, architecture decision record (ADR), critical findings report
- ❌ NO → Continue to question 3

**3. Is this needed by DOWNSTREAM agents in the workflow?**
- ✅ YES → `importance: high`, `audience: agent`, `promote_to_output: false`
  - Examples: Detailed implementation notes for reviewer, analysis report for debugger
- ❌ NO → Continue to question 4

**4. Is this SUPPORTING rationale, research, or alternatives?**
- ✅ YES → `importance: medium`, `audience: audit`, `promote_to_output: false`
  - Examples: Rejected design alternatives, research notes, detailed trace logs

### Metadata Fields Reference

```json
{
  "metadata": {
    "importance": "critical",           // critical | high | medium | low
    "audience": "user",                 // user | agent | audit
    "promote_to_output": true,          // true = show to user
    "lifecycle": "persistent",          // persistent | ephemeral | intermediate
    "created_by": "architect",          // your agent name
    "created_at": "2025-01-04T10:00:00Z"
  }
}
```

### Common Artifact Types & Default Tags

**User-facing artifacts** (always `audience: user`):
- `design_doc` → `importance: high`, `promote_to_output: true`
- `api_contract` → `importance: critical`, `promote_to_output: true`
- `adr` → `importance: high`, `promote_to_output: true`
- `code` (primary deliverable) → `importance: critical`, `promote_to_output: true`
- `deployment_guide` → `importance: high`, `promote_to_output: true`
- `review_report` (with critical findings) → `importance: high`, `promote_to_output: true`

**Agent-internal artifacts** (always `audience: agent`):
- `analysis_report` → `importance: high`, `promote_to_output: false`
- `implementation_notes` → `importance: medium`, `promote_to_output: false`
- `diagnostic_trace` → `importance: medium`, `promote_to_output: false`
- `test_plan` (detailed) → `importance: medium`, `promote_to_output: false`

**Audit trail artifacts** (always `audience: audit`):
- `research_notes` → `importance: low`, `promote_to_output: false`
- `alternatives_analysis` → `importance: medium`, `promote_to_output: false`
- `decision_rationale` → `importance: medium`, `promote_to_output: false`

### Tagging Examples by Agent

**Architect creating feature design:**
```json
// PRIMARY deliverable - user needs this
{
  "type": "design_doc",
  "title": "Authentication System Architecture",
  "content": "...",
  "metadata": {
    "importance": "critical",
    "audience": "user",
    "promote_to_output": true,
    "lifecycle": "persistent",
    "created_by": "architect"
  }
}

// Supporting analysis - for audit trail
{
  "type": "alternatives_analysis",
  "title": "OAuth vs JWT Comparison",
  "content": "...",
  "metadata": {
    "importance": "medium",
    "audience": "audit",
    "promote_to_output": false,
    "lifecycle": "ephemeral",
    "created_by": "architect"
  }
}
```

**Implementer writing code:**
```json
// Code implementation - primary deliverable
{
  "type": "code",
  "title": "Authentication Service Implementation",
  "content": "...",
  "metadata": {
    "importance": "critical",
    "audience": "user",
    "promote_to_output": true,
    "lifecycle": "persistent",
    "created_by": "implementer"
  }
}

// Implementation notes - for reviewer
{
  "type": "implementation_notes",
  "title": "Design Decisions and Edge Cases",
  "content": "...",
  "metadata": {
    "importance": "high",
    "audience": "agent",
    "promote_to_output": false,
    "lifecycle": "intermediate",
    "created_by": "implementer"
  }
}
```

**Reviewer analyzing code:**
```json
// Critical findings - user needs to know
{
  "type": "review_report",
  "title": "Security and Quality Findings",
  "content": "...",
  "metadata": {
    "importance": "high",
    "audience": "user",
    "promote_to_output": true,
    "lifecycle": "persistent",
    "created_by": "reviewer"
  }
}

// Detailed line-by-line review - for audit
{
  "type": "detailed_review",
  "title": "Complete Code Analysis",
  "content": "...",
  "metadata": {
    "importance": "medium",
    "audience": "audit",
    "promote_to_output": false,
    "lifecycle": "ephemeral",
    "created_by": "reviewer"
  }
}
```

### Rules of Thumb

1. **When in doubt, default to agent/audit audience** (not user)
   - Supervisor will promote if truly critical
   - Better to under-promote than over-promote

2. **User-facing artifacts should be POLISHED**
   - If it's rough notes or WIP analysis → `audience: agent` or `audience: audit`
   - Only promote finished, actionable deliverables

3. **Keep user output focused**
   - Typical workflow should promote 2-4 artifacts total
   - If you're promoting >5 artifacts, reconsider your tagging

4. **Mark critical findings explicitly**
   - `severity: critical` in findings + `importance: high` in artifact metadata
   - Supervisor will always promote critical security/correctness issues

## Escalation
- Ask the supervisor when requirements are ambiguous, decisions have significant trade-offs, or blockers arise.

## Tone
- Clear, concise, technical. Focus on actionability and evidence.
