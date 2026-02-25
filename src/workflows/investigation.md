# Workflow: Codebase Investigation (id: investigation)

## Overview
- id: investigation
- name: Codebase Investigation
- trigger: understand, explore, how does this work, explain, map out, trace, analyze codebase
- mode: sequential

## Description
Analysis and documentation of existing systems without modification.

## Steps

### Step 1 (sequence: 1, agent: architect)
- goal:
  - Map system structure: components, data flows, dependencies.
  - Document key patterns and conventions in use.
  - Identify entry points, hot paths, and critical sections.
- output: design_doc

### Step 2 (sequence: 2, agent: critic)
- receives: design_doc
- goal:
  - Identify technical debt, risks, and improvement opportunities.
  - Note deviations from best practices.
- output: review_report

