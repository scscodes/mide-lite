# Content Conventions

## Description
All workflows produce artifacts per `src/contracts/Artifact.schema.json`.
Each artifact type has required content sections that agents must include.

## Artifacts

### design_doc
- type: design_doc
- required_sections:
  - Overview
  - Architecture/Design
  - Interfaces
  - Trade-offs

### design_doc (mode: diagnostic)
- type: design_doc
- mode: diagnostic
- title_prefix: Diagnostic:
- required_sections:
  - Root Cause
  - Contributing Factors
  - Fault Boundary
  - Data Flow
  - Assessment

### design_doc (mode: impact)
- type: design_doc
- mode: impact
- title_prefix: Impact Analysis:
- required_sections:
  - Dependencies
  - Blast Radius
  - Rollback Plan
  - Risk Assessment

### review_report
- type: review_report
- required_sections:
  - Summary
  - Critical
  - High
  - Medium/Low

### test_plan
- type: test_plan
- required_sections:
  - Scope
  - Test Cases
  - Coverage Targets

### code
- type: code
- note: No required sections. Content is the code itself.

