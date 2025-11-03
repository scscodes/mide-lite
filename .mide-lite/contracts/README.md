---
name: contracts
description: Centralized first-class contracts used by supervisor, agents, and workflows
tags: [contracts]
---

# Contracts

Schemas for all I/O boundaries. Keep artifacts FULL (no ellipses) and include references.

Agent
- Input/Output: `.mide-lite/contracts/AgentInput.schema.json`, `.mide-lite/contracts/AgentOutput.schema.json`

Workflow
- Step Input/Output: `.mide-lite/contracts/StepInput.schema.json`, `.mide-lite/contracts/StepOutput.schema.json`
- Workflow Input/Output: `.mide-lite/contracts/WorkflowInput.schema.json`, `.mide-lite/contracts/WorkflowOutput.schema.json`

Supervisor quick reference
- Discover: `.mide-lite/workflows/index.yaml` → choose by keywords/tags (create WorkflowInput)
- Execute: produce StepInput per phase → expect StepOutput
- Aggregate: emit WorkflowOutput (preserve full artifacts)
- Rules: select by tags/globs; base rules always apply; specialized rules (security, testing, hygiene) by workflow context

