# Workflow: Feature Architecture (id: architecture-feature)

## Overview
- id: architecture-feature
- name: Feature Architecture
- trigger: design feature, plan implementation, technical design, how should we build, design for
- mode: sequential

## Description
Mid-level design for new features within existing systems.

## Steps

### Step 1 (sequence: 1, agent: architect)
- goal:
  - Design feature within existing system constraints.
  - Define interfaces, data changes, and integration points.
  - Document migration path if schema changes required.
- output: design_doc

### Step 2 (sequence: 2, agent: critic)
- receives: design_doc
- goal:
  - Validate design fits existing patterns and conventions.
  - Identify integration risks and edge cases.
- output: review_report

### Step 3 (sequence: 3, agent: architect)
- receives: review_report, design_doc
- goal: Incorporate valid critique. Finalize feature design.
- output: design_doc

