# Workflow: Parallel Code Audit (id: parallel-review)

## Overview
- id: parallel-review
- name: Parallel Code Audit
- trigger: comprehensive review, audit, full review, code audit
- mode: parallel

## Description
Concurrent multi-lens review for thorough code analysis.

## Steps

### Step 1a (sequence: 1, agent: critic)
- lens: security
- goal: Security audit (OWASP, Input Validation, Secrets).
- output: review_report

### Step 1b (sequence: 1, agent: critic)
- lens: maintainability
- goal: Code style, complexity, and maintainability check.
- output: review_report

### Step 2 (sequence: 2, agent: supervisor)
- receives: review_report
- goal: Synthesize findings into a single prioritized report.
- output: review_report

