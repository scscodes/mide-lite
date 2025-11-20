---
name: javascript
description: Modern JavaScript core rules for scripts and Node tooling
globs:
  - "**/*.js"
  - "**/*.jsx"
alwaysApply: false
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

## Node (Scripts/CLIs)
- Dependencies: prefer stdlib and small, maintained libs; avoid heavy transitive deps.
- CLI: use a single entrypoint, parse args once, validate early, exit with codes.
- Process: handle `SIGINT`/`SIGTERM`; graceful shutdown with timeouts.
- I/O: stream large files; avoid reading whole files into memory.
- FS: use `fs/promises`; guard paths; avoid race conditions (TOCTOU).
- Security: no secrets in logs; environment via process.env with defaults; sanitize inputs.

## When in Doubt
1. Keep scripts small and focused.
2. Prefer readability over cleverness.
3. Reuse utilities; avoid duplication.

