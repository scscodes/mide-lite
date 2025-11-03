---
name: bug-fix
description: Systematic bug fixing workflow with diagnosis and verification
tags: [workflows, bugfix, debugging, maintenance]
---

# Bug Fix Workflow

Systematic approach to debugging and fixing issues with proper diagnosis and verification.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` for steps; `.mide-lite/contracts/WorkflowOutput.schema.json` for final aggregation. Supervisor orchestrates; this file defines phases only.

## Overview

This workflow ensures bugs are properly understood and fixed:

1. **Debugger** - Root cause analysis
2. **Implementer** - Fix with regression tests
3. **Reviewer** - Verification and validation

## When to Use

- Fixing reported bugs
- Addressing test failures
- Resolving errors or crashes
- Quick to moderate complexity issues

## Phases

1. diagnose (debugger) → StepOutputContract
2. fix (implementer) → StepOutputContract
3. verify (reviewer) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.
