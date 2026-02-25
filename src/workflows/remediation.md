# Workflow: Finding Remediation (id: remediation)

## Overview
- id: remediation
- name: Finding Remediation
- internal: true
- mode: sequential
- max_iterations: 2

## Description
Address findings from review reports.
Invoked by Supervisor when critical issues found and no on_critical_findings block exists.
The review_report is always passed from the Critic step that triggered remediation.
NOT user-triggerable. Users should use fix-findings workflow instead.

## Steps

### Step 1 (sequence: 1, agent: builder)
- receives: review_report
- goal: Address all critical and high-severity findings from the review report.
- output: code

### Step 2 (sequence: 2, agent: critic)
- receives: code, review_report
- goal: Verify all critical findings resolved. Document any remaining issues.
- output: review_report

