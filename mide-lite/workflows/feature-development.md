---
name: feature-development
description: Complete feature development workflow from design to deployment
tags: [workflows, development, feature, full-cycle]
---

# Feature Development Workflow

Complete end-to-end workflow for implementing new features with proper architecture, implementation, and review cycles.

Use contracts: `mide-lite/contracts/StepOutput.schema.json` (per step) and `mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates; this file defines phases only.

## Phases

1. design (architect) → StepOutputContract
2. implement (implementer) → StepOutputContract
3. review (reviewer) → StepOutputContract
4. fix-issues (implementer) → StepOutputContract
5. final-review (reviewer) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.
