---
name: parallel-maintenance-audit
description: Multiple agents audit different aspects of codebase maintenance simultaneously
tags: [workflows, maintenance, audit, parallel, quality]
---

# Parallel Maintenance Audit

Comprehensive maintenance audit with multiple agents examining different aspects of codebase health simultaneously.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## Overview

This workflow leverages multiple specialized agents to audit different aspects of codebase maintenance simultaneously, providing comprehensive coverage of technical debt and maintenance needs.

## When to Use

- Regular maintenance audits
- Pre-release codebase health checks
- Technical debt assessment
- Codebase cleanup initiatives
- Maintenance planning

## Maintenance Aspects

### Code Hygiene (Maintainer)
- File organization and structure
- Import statements and dependencies
- Code formatting and style
- Dead code identification

### Dependency Audit (Maintainer)
- Dependency versions and updates
- Security vulnerabilities
- Unused dependencies
- License compliance

### Test Maintenance (Implementer)
- Test coverage analysis
- Test quality and reliability
- Test maintenance needs
- Test automation opportunities

### Documentation Maintenance (Documentation Specialist)
- Documentation currency
- Accuracy and completeness
- User experience quality
- Knowledge base gaps

### Security Maintenance (Security Specialist)
- Security practice compliance
- Vulnerability assessment
- Security documentation
- Compliance requirements

### Performance Maintenance (Performance Engineer)
- Performance pattern analysis
- Bottleneck identification
- Optimization opportunities
- Monitoring improvements

## Expected Outcomes

- **Comprehensive Audit**: All maintenance aspects covered
- **Technical Debt Inventory**: Prioritized list of maintenance needs
- **Cleanup Recommendations**: Actionable improvement suggestions
- **Maintenance Roadmap**: Phased maintenance implementation plan
- **Health Metrics**: Quantified codebase health assessment

## Phases

- code-hygiene (maintainer) → StepOutputContract
- dependency-audit (maintainer) → StepOutputContract
- test-maintenance (implementer) → StepOutputContract
- documentation-maintenance (documentation-specialist) → StepOutputContract
- security-maintenance (security-specialist) → StepOutputContract
- performance-maintenance (performance-engineer) → StepOutputContract
- maintenance-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
