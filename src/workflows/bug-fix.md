# Workflow: Bug Fix Protocol (id: bug-fix)

## Overview
- id: bug-fix
- name: Bug Fix Protocol
- trigger: fix bug, broken, failing test, regression, quick fix
- mode: sequential

## Description
Quick diagnostic-driven resolution for isolated issues.

## Steps

### Step 1 (sequence: 1, agent: builder)
- goal: Reproduce the issue and create a failing test case.
- output: test_plan

### Step 2 (sequence: 2, agent: builder)
- goal: Implement the fix.
- receives: test_plan
- output: code

### Step 3 (sequence: 3, agent: critic)
- goal: Verify the fix and ensure no regression.
- receives: code, test_plan
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

