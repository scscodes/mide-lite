# Workflow: Test Coverage Expansion (id: add-tests)

## Overview
- id: add-tests
- name: Test Coverage Expansion
- trigger: add tests, improve coverage, write tests, missing tests, increase coverage
- mode: sequential

## Description
Add tests to existing code without modifying implementation.

## Steps

### Step 1 (sequence: 1, agent: critic)
- lens: correctness
- goal: Identify untested code paths, edge cases, and boundary conditions.
- output: review_report

### Step 2 (sequence: 2, agent: builder)
- receives: review_report
- goal: Write comprehensive test suite covering identified gaps.
- output: test_plan, code

