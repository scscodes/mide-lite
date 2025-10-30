# Agent Output Contract

**This template should be added to all agent persona files**

## Output Contract

You MUST structure your output according to `content/contracts/agent/AgentOutput.schema.json` for consistent, lossless communication between workflow steps.

### Required Output Structure

```json
{
  "summary": "Executive summary of your work (max 200 words)",
  "artifacts": [
    {
      "type": "design_doc | implementation_plan | code_review | api_contract | adr | test_plan | security_analysis | performance_analysis | data_model | diagram | markdown | yaml | json",
      "title": "Human-readable title",
      "content": "FULL content - complete markdown/YAML/JSON (NO SUMMARIES)",
      "description": "What this artifact contains",
      "metadata": {}
    }
  ],
  "decisions": [ // OPTIONAL - For architects, designers
    {
      "decision": "What was decided",
      "rationale": "Why this approach",
      "alternatives_rejected": ["alt1", "alt2"],
      "trade_offs": "What we gain vs lose",
      "context": "Additional context"
    }
  ],
  "findings": [ // OPTIONAL - For reviewers, debuggers
    {
      "severity": "critical | high | medium | low",
      "category": "security | performance | quality | maintainability",
      "description": "What was found",
      "location": "file.ts:123-145",
      "recommendation": "How to fix",
      "impact": "What breaks if not fixed"
    }
  ],
  "next_steps": ["Step 1", "Step 2"], // OPTIONAL
  "blockers": ["Blocker 1"], // OPTIONAL
  "references": ["path/to/file.ts", "https://..."], // REQUIRED
  "confidence": 0.85 // REQUIRED: 0.0-1.0
}
```

### Critical Guidelines

1. **Artifacts contain FULL content** - Do NOT summarize in artifact.content
   - ✅ Include complete API specs, ADRs, diagrams, code
   - ❌ Do NOT abbreviate with "..." or "etc."
   - ✅ Your output is stored long-term for documentation
   - ❌ Summaries belong in the top-level summary field only

2. **Multiple artifacts encouraged** - Create separate artifacts for:
   - Design document (design_doc)
   - API contract (api_contract)
   - Architecture Decision Record (adr)
   - Data model (data_model)
   - Diagrams (diagram)

3. **Decisions track rationale** - Record ALL design decisions:
   - What you chose and why
   - Alternatives you rejected and why
   - Trade-offs you accepted

4. **Findings are actionable** - Each finding must include:
   - Clear severity level
   - Specific location (file:line)
   - Concrete recommendation

5. **Confidence reflects certainty** - Use realistic scores:
   - 0.9-1.0: Very confident, well-researched
   - 0.7-0.9: Confident, some assumptions
   - 0.5-0.7: Moderate confidence, needs validation
   - Below 0.5: Low confidence, speculative

### Output Detail Level

Your output will be:
- **Stored long-term** in workflow_artifacts table
- **Referenced** by downstream agents in the workflow
- **Used** for project documentation and decision tracking
- **Queried** for analytics and reporting

Therefore:
- ✅ Include ALL technical specifications
- ✅ Preserve design rationale and alternatives considered
- ✅ Document edge cases and considerations
- ✅ Use complete examples, not abbreviated placeholders
- ✅ Provide full context for future readers

### Minimal Example

```json
{
  "summary": "One-line executive summary",
  "artifacts": [
    {
      "type": "markdown",
      "title": "Primary Deliverable",
      "content": "# Complete Content Here\n\nAll details included (no ellipses)",
      "description": "What this artifact contains"
    }
  ],
  "references": ["path/to/relevant/files"],
  "confidence": 0.85
}
```
