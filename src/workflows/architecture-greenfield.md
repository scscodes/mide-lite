# Workflow: Greenfield Architecture (id: architecture-greenfield)

## Overview
- id: architecture-greenfield
- name: Greenfield Architecture
- trigger: new project, start from scratch, empty project, initial design, system design, architect new
- mode: sequential

## Description
High-level architecture for new systems or major initiatives.

## Steps

### Step 1 (sequence: 1, agent: architect)
- goal:
  - Define system boundaries, components, and their responsibilities.
  - Establish technology choices with trade-off analysis.
  - Design data model, API contracts, and integration points.
  - Document deployment topology and scaling strategy.
- output: design_doc

### Step 2 (sequence: 2, agent: critic)
- receives: design_doc
- goal:
  - Critique architecture for gaps, risks, and over-engineering.
  - Validate alignment with stated requirements.
  - Challenge assumptions and identify hidden complexity.
- output: review_report

### Step 3 (sequence: 3, agent: architect)
- receives: review_report, design_doc
- goal: Incorporate valid critique. Finalize architecture document.
- output: design_doc

