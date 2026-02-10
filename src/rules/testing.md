---
name: testing
description: Testing and observability guidelines
globs: []
alwaysApply: false
tags: [testing]
---

# Testing & Observability

## Strategy
- Test behavior, not implementation details.
- Unit fast and deterministic; run slow/e2e separately.
- Mock at boundaries (APIs, DB, FS), not internals.

## Organization
- Co-locate tests with code.
- Use clear Arrange-Act-Assert structure.

## Async & Concurrency
- Avoid flakiness: await async work; add timeouts; control concurrency.

## Metrics & Logs
- Structured logs with levels and trace IDs; no secrets.
- Metrics for throughput, latency percentiles, errors, resources.

## When in Doubt
1. Fail fast with clear diagnostics.
2. Prefer small, focused tests.
3. Reproduce before fixing; add regression tests.

