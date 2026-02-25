# Workflow: Critical Logic Validation (id: critical-validation)

## Overview
- id: critical-validation
- name: Critical Logic Validation
- trigger: critical review, sensitive logic, high risk, validate thoroughly, security sensitive, high stakes
- mode: parallel

## Description
Multi-lens deep validation for code with broad or impactful implications.

## Steps

### Step 1a (sequence: 1, agent: critic)
- lens: security
- goal:
  - Security audit: authentication, authorization, input validation.
  - Data exposure risks, injection vectors, OWASP compliance.
- output: review_report

### Step 1b (sequence: 1, agent: critic)
- lens: correctness
- goal:
  - Logic correctness: edge cases, boundary conditions, invariants.
  - State management, race conditions, error propagation.
- output: review_report

### Step 1c (sequence: 1, agent: architect)
- goal:
  - Impact analysis: downstream dependencies, integration points.
  - Failure blast radius, rollback implications.
  - Data integrity and consistency guarantees.
  - Output as design_doc with "Impact Analysis: " title prefix.
- output: design_doc

### Step 2 (sequence: 2, agent: supervisor)
- receives: review_report, design_doc
- goal:
  - Synthesize all findings into unified risk assessment.
  - Provide explicit APPROVE / CONDITIONAL / REJECT recommendation.
  - Document required remediations before approval (if conditional).
- output: review_report

