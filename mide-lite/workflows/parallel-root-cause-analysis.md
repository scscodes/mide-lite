---
name: parallel-root-cause-analysis
description: Multiple agents analyze different aspects of the same issue in parallel
tags: [workflows, debugging, analysis, parallel]
---

# Parallel Root Cause Analysis

Multi-agent approach to complex issue diagnosis with parallel analysis and correlation.

Use contracts: `mide-lite/contracts/StepOutput.schema.json` (per step) and `mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## When to Use

- Complex bugs affecting multiple components
- System failures with unclear origins
- Performance issues with multiple potential causes
- Security incidents requiring comprehensive analysis
- Issues that have resisted single-agent diagnosis

## Analysis Perspectives

### Code Analysis (Debugger)
- Stack trace analysis
- Logic error identification
- Code path analysis
- Exception handling issues

### Performance Analysis (Performance Engineer)
- Bottleneck identification
- Resource utilization analysis
- Scalability issues
- Memory leaks and CPU spikes

### Security Analysis (Security Specialist)
- Vulnerability assessment
- Attack vector analysis
- Input validation issues
- Authentication/authorization problems

### Architecture Analysis (Architect)
- Design pattern violations
- Component interaction issues
- Data flow problems
- Integration failures

## Phases

- code-analysis (debugger) → StepOutputContract
- performance-analysis (performance-engineer) → StepOutputContract
- security-analysis (security-specialist) → StepOutputContract
- architecture-analysis (architect) → StepOutputContract
- correlation-analysis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
