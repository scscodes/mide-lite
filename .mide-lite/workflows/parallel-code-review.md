---
name: parallel-code-review
description: Multiple agents review code from different perspectives simultaneously
tags: [workflows, code-review, quality, parallel, security]
---

# Parallel Code Review

Comprehensive code review with multiple agents examining code from different perspectives simultaneously.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## Overview

This workflow leverages multiple specialized agents to review code from different angles simultaneously, providing comprehensive coverage and diverse perspectives on code quality.

## When to Use

- Major feature implementations
- Critical security-sensitive code
- Performance-critical components
- Architecture changes
- Pre-release code audits

## Review Perspectives

### Quality Review (Reviewer)
- Code standards compliance
- Best practices adherence
- Error handling quality
- Test coverage adequacy

### Security Review (Security Specialist)
- Vulnerability assessment
- Input validation
- Authentication/authorization
- Data protection

### Performance Review (Performance Engineer)
- Algorithmic efficiency
- Resource utilization
- Scalability considerations
- Bottleneck identification

### Maintainability Review (Maintainer)
- Code organization
- Technical debt
- Documentation quality
- Refactoring opportunities

### Architecture Review (Architect)
- Design pattern compliance
- Component interaction
- System integration
- Future extensibility

## Expected Outcomes

- **Comprehensive Coverage**: All aspects of code quality reviewed
- **Prioritized Issues**: Issues ranked by severity and impact
- **Diverse Perspectives**: Multiple expert viewpoints
- **Unified Action Plan**: Coordinated improvement strategy
- **Quality Metrics**: Quantified code quality assessment

## Phases

- quality-review (reviewer) → StepOutputContract
- security-review (security-specialist) → StepOutputContract
- performance-review (performance-engineer) → StepOutputContract
- maintainability-review (maintainer) → StepOutputContract
- architecture-review (architect) → StepOutputContract
- review-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
