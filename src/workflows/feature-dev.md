# Workflow: Feature Development (id: feature-dev)

## Overview
- id: feature-dev
- name: Feature Development
- trigger: new feature, add functionality, implement user story, build new
- mode: sequential

## Description
End-to-end flow from design to implementation and review.

## Steps

### Step 1 (sequence: 1, agent: architect)
- goal: Design the solution (API, Schema, Strategy).
- output: design_doc

### Step 2 (sequence: 2, agent: builder)
- goal: Implement the design in code with tests.
- receives: design_doc
- output: code, test_plan

### Step 3 (sequence: 3, agent: critic)
- goal: Review implementation against design and rules.
- receives: code, design_doc
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

