---
name: feature-development
description: Complete feature development workflow from design to deployment
tags: [workflows, development, feature, full-cycle]
---

# Feature Development Workflow

Complete end-to-end workflow for implementing new features with proper architecture, implementation, and review cycles.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates; this file defines phases only.

## Overview

This workflow orchestrates multiple agents to deliver production-ready features:

1. **Architect** - System design and technical decisions
2. **Implementer** - Code implementation with tests
3. **Reviewer** - Quality and security validation
4. **Iterative refinement** - Address feedback and re-review

## When to Use

- Adding new user-facing features
- Implementing new API endpoints
- Building new modules or components
- Medium to large development tasks

## Expected Outcomes

- Well-architected solution
- Production-quality code
- Comprehensive tests
- Reviewed and approved changes
- Updated documentation

## Phases

1. design (architect) → StepOutputContract
2. implement (implementer) → StepOutputContract
3. review (reviewer) → StepOutputContract
4. fix-issues (implementer) → StepOutputContract
5. final-review (reviewer) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.
