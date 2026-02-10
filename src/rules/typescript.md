---
name: typescript
description: TypeScript core rules for strict, maintainable code
globs:
  - "**/*.ts"
  - "**/*.tsx"
alwaysApply: false
tags: [typescript]
---

# TypeScript Core

## Compiler & Config
- Enable `strict: true`; also `noUncheckedIndexedAccess`, `noImplicitOverride`.
- Prefer `unknown` over `any`; narrow with type guards.
- Use `interface` for extensible objects; `type` for unions/intersections.
- Use `satisfies` to validate shapes without widening.

## Types & APIs
- Public APIs fully typed; avoid implicit `any` in signatures.
- Model domain data with discriminated unions where variants exist.
- Prefer `readonly` where mutation is not required.

## Patterns
- Favor type inference; avoid redundant annotations.
- Extract reusable utility types; avoid duplication.
- Prefer composition over inheritance.

## Errors & Safety
- Never silence errors with `// @ts-ignore`.
- Avoid `as any`; narrow or refactor.
- Use exhaustive `switch` with `never` for unions.

## When in Doubt
1. Fix TypeScript strict errors first.
2. Keep types minimal but precise.
3. Optimize for readability.

