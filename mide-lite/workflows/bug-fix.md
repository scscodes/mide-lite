---
name: bug-fix
description: Systematic bug fixing workflow with diagnosis and verification
tags: [workflows, bugfix, debugging, maintenance]
---

# Bug Fix Workflow

Systematic approach to debugging and fixing issues with proper diagnosis and verification.

Use contracts: `mide-lite/contracts/StepOutput.schema.json` for steps; `mide-lite/contracts/WorkflowOutput.schema.json` for final aggregation. Supervisor orchestrates; this file defines phases only.

## Phases

1. diagnose (debugger) → StepOutputContract
2. fix (implementer) → StepOutputContract
3. verify (reviewer) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.
