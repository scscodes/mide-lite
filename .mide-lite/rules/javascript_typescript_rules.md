---
description: JavaScript and TypeScript language rules and patterns
globs:
  - "**/*.js"
  - "**/*.jsx"
  - "**/*.ts"
  - "**/*.tsx"
alwaysApply: false
---

# JavaScript & TypeScript Rules

## Environment
- **Target**: ES2022+ for JavaScript, TypeScript 5.0+
- **Runtime**: Node.js 18 LTS minimum (20 LTS preferred)

## TypeScript (Required)
- Enable `strict: true` in tsconfig.json - non-negotiable
- Enable `noUncheckedIndexedAccess` and `noImplicitOverride`
- Never use `any` - use `unknown` then narrow with type guards
- Use `interface` for extensible objects, `type` for unions/intersections
- Prefer type inference over explicit types when obvious
- Use utility types (Partial, Pick, Omit, Record) to reduce duplication
- Use `satisfies` operator to verify types without widening

## Modern JavaScript
- Always `const` by default, `let` only when reassigning, never `var`
- Arrow functions for callbacks, function declarations for named functions
- Always async/await over raw Promises
- Use optional chaining `?.` and nullish coalescing `??`
- Use template literals for string interpolation

## Error Handling
- Wrap async functions in try/catch or .catch()
- Use global handlers: `unhandledRejection`, `uncaughtException` (Node)

## Code Organization
- Use ES modules (import/export), never CommonJS in new code
- Group imports: external first, then internal
- Named exports preferred, default export sparingly
- One primary component/class per file

## Naming
- `camelCase`: variables, functions, methods
- `PascalCase`: classes, interfaces, types, React components
- `SCREAMING_SNAKE_CASE`: true constants only
- Booleans: `is*`, `has*`, `can*`, `should*`

## Front-end Frameworks (if applicable)
- Prefer composition over inheritance; keep components small and pure
- Use typed props/interfaces and exhaustive dependency arrays
- Co-locate tests next to components; mock only at boundaries

## Tooling
- **ESLint**: With TypeScript parser and recommended rules
- **Prettier**: Non-negotiable formatting
- **lint-staged**: Run on git staged files only
- Run in pre-commit hooks (husky + lint-staged)

## Critical Anti-Patterns

### TypeScript Mistakes
- Never use `@ts-ignore` without understanding why
- Never use `as any` casting
- Don't ignore TypeScript errors in CI

### JavaScript Pitfalls
- Never modify function parameters
- Never use `==` - always `===`
- Never use `eval()` or `Function()` constructor

### React Anti-Patterns
- Never use index as key in lists (unless truly static)
- Never mutate state directly
- Never create functions inside render without useCallback
- Don't use useEffect for deriving state
- Don't over-memoize without measuring

### Async Mistakes
- Never forget to await async functions
- Never ignore unhandled promise rejections
- Never use async functions in useEffect without cleanup
- Don't mix Promise chains with async/await

## Security (see base)
- Prefer framework sanitization APIs; avoid unsafe HTML injection
- Use httpOnly cookies for tokens; avoid localStorage for secrets

## Performance (see base)
- Use `AbortController` and timeouts; avoid unbounded concurrency
- Debounce/throttle high-frequency UI events; use `requestAnimationFrame` when needed

## When in Doubt
1. Fix TypeScript strict errors first
2. Use ESLint recommended rules
3. Optimize for readability over cleverness