# Workflow: Deep Diagnostic Analysis (id: diagnostic)

## Overview
- id: diagnostic
- name: Deep Diagnostic Analysis
- trigger: debug, error analysis, log analysis, root cause, why is this happening, investigate error
- mode: sequential

## Description
Comprehensive debugging with root cause and contributing factor analysis.

## Steps

### Step 1 (sequence: 1, agent: critic)
- lens: correctness
- goal:
  - Forensic analysis of error context, logs, and stack traces.
  - Identify the fault boundary and failure propagation path.
  - Document symptoms and immediate causes.
- output: review_report

### Step 2 (sequence: 2, agent: architect)
- receives: review_report
- goal:
  - Analyze systemic factors: data flow, integration points, state management.
  - Document root cause AND contributing factors.
  - Determine if issue is isolated or indicates design flaw.
  - Output as design_doc with "Diagnostic: " title prefix.
- output: design_doc

### Step 3 (sequence: 3, agent: builder)
- receives: design_doc, review_report
- goal:
  - Implement explicit remediation steps addressing root cause.
  - Add defensive measures for contributing factors.
  - Create regression test capturing the failure mode.
- output: code, test_plan

### Step 4 (sequence: 4, agent: critic)
- lens: correctness
- receives: code, design_doc
- goal:
  - Verify root cause is addressed (not just symptoms).
  - Confirm contributing factors are mitigated.
  - Check for introduced regressions.
- output: review_report

## On Critical Findings
- max_iterations: 2

### Remediation Step 1 (agent: builder)
- goal: Address critical and high-severity findings.
- receives: review_report, code
- output: code

### Remediation Step 2 (agent: critic)
- goal: Verify all critical findings resolved.
- receives: code
- output: review_report

