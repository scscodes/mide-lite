# Workflow: Performance Optimization (id: performance)

## Overview
- id: performance
- name: Performance Optimization
- trigger: slow, optimize performance, efficiency, speed up, latency, throughput, bottleneck
- mode: sequential

## Description
Data-driven performance analysis and optimization.

## Steps

### Step 1 (sequence: 1, agent: critic)
- lens: performance
- goal:
  - Quantify current performance baseline (or document anecdotal evidence).
  - Profile and identify bottlenecks: CPU, memory, I/O, network.
  - Prioritize optimization targets by impact.
- output: review_report

### Step 2 (sequence: 2, agent: architect)
- receives: review_report
- goal:
  - Design optimization strategy with expected gains.
  - Consider trade-offs: complexity, memory vs speed, caching implications.
  - Define measurable success criteria.
- output: design_doc

### Step 3 (sequence: 3, agent: builder)
- receives: design_doc, review_report
- goal: Implement optimizations per design. Add performance regression tests.
- output: code, test_plan

### Step 4 (sequence: 4, agent: critic)
- lens: performance
- receives: code, design_doc
- goal: Verify performance improvements meet success criteria. No functional regression.
- output: review_report

## On Critical Findings
- max_iterations: 2

### Remediation Step 1 (agent: builder)
- goal: Address critical and high-severity findings.
- receives: review_report, code
- output: code

### Remediation Step 2 (agent: critic)
- lens: performance
- receives: code
- goal: Verify all critical findings resolved.
- output: review_report

