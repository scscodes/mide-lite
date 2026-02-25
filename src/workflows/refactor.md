# Workflow: Technical Debt Reduction (id: refactor)

## Overview
- id: refactor
- name: Technical Debt Reduction
- trigger: refactor, cleanup, simplify, reduce complexity, restructure
- mode: sequential

## Description
Safe restructuring of existing code with validation.

## Steps

### Step 1 (sequence: 1, agent: critic)
- lens: maintainability
- goal: Analyze current implementation and identify specific improvements.
- output: review_report

### Step 2 (sequence: 2, agent: builder)
- receives: review_report
- goal: Apply refactoring based on critique.
- output: code

### Step 3 (sequence: 3, agent: critic)
- lens: maintainability
- receives: code, review_report
- goal: Verify refactoring addressed identified issues without regression.
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

