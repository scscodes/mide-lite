---
name: javascript_core
description: Modern JavaScript core rules for scripts and Node tooling
tags: [javascript]
---

# JavaScript Core

## Language & Runtime
- Target ES2022+; use Node 18+ for scripts.
- Default to `const`; use `let` only when reassigning.
- Use modules (import/export); avoid CommonJS in new code.

## Async
- Prefer async/await; avoid mixed promise chains.
- Always handle rejections; add global handlers in Node.
- Use `AbortController` and timeouts for external I/O.

## Code Organization
- Group imports: external first, then internal.
- One primary responsibility per file.
- Named exports preferred.

## Naming
- camelCase for vars/functions; PascalCase for classes.
- Booleans start with `is/has/can/should`.

## Errors & Safety
- Don’t use `eval`/`Function`.
- Avoid mutating function parameters; avoid `==`.

## When in Doubt
1. Keep scripts small and focused.
2. Prefer readability over cleverness.
3. Reuse utilities; avoid duplication.

