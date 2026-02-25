# Workflow: Pre-flight Analysis (id: pre-flight)

## Overview
- id: pre-flight
- name: Pre-flight Analysis
- trigger: review plan, critique proposal, before we start, sanity check, validate approach, check plan
- mode: sequential

## Description
Critical analysis of plans and proposals BEFORE any implementation begins.

## Steps

### Step 1 (sequence: 1, agent: critic)
- goal:
  - Analyze the proposed plan/strategy for:
  - Gaps in coverage or missing considerations
  - Risk exposure and failure modes
  - Anti-patterns or known pitfalls
  - Unnecessary overhead or complexity
- output: review_report

### Step 2 (sequence: 2, agent: architect)
- receives: review_report
- goal:
  - Assess strategic alignment and architectural soundness.
  - Identify scope drift from original intent.
  - Evaluate feasibility and hidden dependencies.
  - Provide go/revise/no-go recommendation with rationale.
- output: design_doc

