---
name: contracts
description: Centralized first-class contracts used by supervisor, agents, and workflows
tags: [contracts]
---

# Contracts

Schemas for all I/O boundaries. Keep artifacts FULL (no ellipses) and include references.

Agent
- Input/Output: `.mide-lite/contracts/agent/`

Workflow
- Step Input/Output: `.mide-lite/contracts/workflow/`
- Workflow Input/Output: `.mide-lite/contracts/workflow/`

Supervisor quick reference
- Discover: `.mide-lite/workflows/index.yaml` → choose by keywords/tags (create WorkflowInput)
- Execute: produce StepInput per phase → expect StepOutput
- Aggregate: emit WorkflowOutput (preserve full artifacts)
- Rules: select by tags/globs; base rules always apply; specialized rules (security, testing, hygiene) by workflow context

