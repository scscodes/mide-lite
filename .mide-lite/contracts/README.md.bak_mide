---
name: contracts
description: Centralized first-class contracts used by supervisor, agents, and workflows
tags: [contracts]
---

# Contracts

Authoritative schemas for all inputs/outputs:

- AgentInput → produced by supervisor, consumed by agents
- AgentOutput → produced by agents, consumed by supervisor
- StepInput → produced by supervisor, consumed by workflow steps
- StepOutput → produced by steps, consumed by supervisor
- WorkflowInput → produced by supervisor (workflow selection), consumed by workflow runner
- WorkflowOutput → produced by supervisor, final aggregated output

Schemas live under `content/contracts/{agent,workflow}/`.

Notes:
- artifacts.content must be FULL (no ellipses)
- references should include file paths and/or URLs

## Supervisor usage (at-a-glance)

1) Choosing a workflow
- Read `content/workflows/index.yaml` and select by triggers/tags; produce a `WorkflowInput` (name, reason) and proceed.

2) Running steps
- For each phase, produce a `StepInput` (step, task, references, constraints) and expect a `StepOutput` per `content/contracts/workflow/StepOutput.schema.json`.

3) Aggregating results
- Emit a `WorkflowOutput` with `workflow.name`, `reason`, aggregated `artifacts` (FULL content), combined `findings/decisions`, and `confidence`.

