---
name: parallel-code-review
description: Multiple agents review code from different perspectives simultaneously
tags: [workflows, code-review, quality, parallel, security]
---

# Parallel Code Review

Comprehensive code review with multiple agents examining code from different perspectives simultaneously.

Use contracts: `mide-lite/contracts/StepOutput.schema.json` (per step) and `mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

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

## Phases

- quality-review (reviewer) → StepOutputContract
- security-review (security-specialist) → StepOutputContract
- performance-review (performance-engineer) → StepOutputContract
- maintainability-review (maintainer) → StepOutputContract
- architecture-review (architect) → StepOutputContract
- review-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
