---
name: parallel-documentation-review
description: Multiple agents review and update different types of documentation in parallel
tags: [workflows, documentation, review, parallel, maintenance]
---

# Parallel Documentation Review

Comprehensive documentation review with multiple agents working on different documentation types simultaneously.

Use contracts: `mide-lite/contracts/StepOutput.schema.json` (per step) and `mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## When to Use

- Regular documentation audits
- Before major releases
- After significant code changes
- Documentation quality improvement
- Compliance documentation review

## Documentation Types

### API Documentation (Documentation Specialist)
- OpenAPI specifications
- Code comments and docstrings
- API endpoint documentation
- Integration examples

### User Documentation (Documentation Specialist)
- README files
- Getting started guides
- User manuals
- Tutorials and examples

### Architecture Documentation (Architect)
- System design documents
- Technical specifications
- Architecture decision records
- Component diagrams

### Deployment Documentation (DevOps Engineer)
- Deployment guides
- Infrastructure documentation
- Operational procedures
- Environment setup

### Security Documentation (Security Specialist)
- Security policies
- Compliance documentation
- Security procedures
- Vulnerability reports

## Phases

- api-documentation (documentation-specialist) → StepOutputContract
- user-documentation (documentation-specialist) → StepOutputContract
- architecture-documentation (architect) → StepOutputContract
- deployment-documentation (devops-engineer) → StepOutputContract
- security-documentation (security-specialist) → StepOutputContract
- documentation-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
