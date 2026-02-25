# Workflow: Fix Review Findings (id: fix-findings)

## Overview
- id: fix-findings
- name: Fix Review Findings
- trigger: fix these, fix findings, address issues, resolve findings, fix what critic found
- mode: sequential

## Description
Address findings from a prior review. User-facing wrapper around remediation.

## Preconditions
- A review_report must exist from a prior Critic step or be provided by the user.

## Steps

### Step 1 (sequence: 1, agent: builder)
- receives: review_report
- goal:
  - Address all critical and high-severity findings from the received review report.
- output: code

### Step 2 (sequence: 2, agent: critic)
- receives: code
- goal: Verify all critical and high findings resolved. Document any remaining issues.
- output: review_report

## On Critical Findings
- max_iterations: 2

### Remediation Step 1 (agent: builder)
- goal: Address remaining critical and high-severity findings.
- receives: review_report, code
- output: code

### Remediation Step 2 (agent: critic)
- goal: Verify all critical findings resolved.
- receives: code
- output: review_report

