---
name: component-performance-review
description: Parallel performance analysis across multiple system components
tags: [workflows, performance, analysis, parallel]
---

# Component Performance Review

Parallel performance analysis across multiple system components to identify optimization opportunities.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## Overview

This workflow analyzes performance across different system layers simultaneously, providing a comprehensive view of system performance and optimization opportunities.

## When to Use

- Regular performance audits
- Before major releases
- After performance regression reports
- System scaling planning
- Performance budget establishment

## Component Analysis

### Database Performance
- Query execution times
- Connection pool utilization
- Index effectiveness
- Data access patterns

### API Performance
- Response time analysis
- Throughput measurement
- Caching effectiveness
- Rate limiting impact

### Frontend Performance
- Page load times
- Bundle size analysis
- Rendering performance
- User experience metrics

### Infrastructure Performance
- Server resource utilization
- Scaling bottlenecks
- Deployment performance
- Monitoring and alerting

## Expected Outcomes

- **Performance Baseline**: Current performance metrics for all components
- **Bottleneck Identification**: Prioritized list of performance issues
- **Optimization Roadmap**: Actionable recommendations with impact estimates
- **Performance Budget**: Target metrics for future development

## Phases

- database-performance (performance-engineer) → StepOutputContract
- api-performance (performance-engineer) → StepOutputContract
- frontend-performance (performance-engineer) → StepOutputContract
- infrastructure-performance (devops-engineer) → StepOutputContract
- performance-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
