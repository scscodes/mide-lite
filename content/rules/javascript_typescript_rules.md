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

**Official Documentation:** https://developer.mozilla.org/en-US/docs/Web/JavaScript | https://www.typescriptlang.org/docs/

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

## React Patterns (18+)

### Official Documentation
https://react.dev/ | https://nextjs.org/docs

### Server vs Client Components (Next.js App Router)
- Default to Server Components - faster, more secure
- Use `'use client'` only for: hooks, browser APIs, interactivity
- Pass serializable props from Server to Client components

### Component Structure
- Extract custom hooks for reusable stateful logic
- Use composition over prop drilling
- Split when multiple `useState` calls for different concerns

### Hooks Best Practices
- Follow Rules of Hooks: top level only, functions/hooks only
- Name custom hooks with `use` prefix
- Don't overuse `useEffect` - often just need derived state
- Use `useCallback` only when passing to memoized children
- Use `useMemo` only for expensive computations (measure first)
- Keep useEffect dependencies exhaustive

### State Management
- **Local**: `useState` for component-only state
- **Lifted**: Share between siblings via common parent
- **Context**: App-wide state (theme, auth, locale)
- **URL**: Filters, pagination, search terms

## Next.js Patterns (14+ App Router)

### File Structure
- Use App Router for new projects
- Layouts cascade across route segments
- Use `loading.tsx` and `error.tsx` at route level
- Dynamic routes with `[param]` folders
- Route groups `(group)` for organization without URL impact

### Data Fetching
- Server Components: fetch directly, use cache options
- `cache: 'force-cache'` for static, `'no-store'` for dynamic
- `next: { revalidate: 60 }` for ISR
- Client Components: use TanStack Query or SWR

### Performance
- Use Next.js Image component for optimization
- Dynamic imports for code splitting
- Implement Suspense boundaries
- Use Metadata API for SEO
- Optimize fonts with next/font

### API Routes
- Use Route Handlers (`app/api/*/route.ts`)
- Export HTTP method functions (GET, POST, etc.)

## Angular Patterns (17+)

### Official Documentation
https://angular.io/docs

### Modern Patterns
- Use standalone components, avoid NgModules (deprecated v17+)
- Use new control flow: `@if`, `@for`, `@switch` (not `*ngIf`, `*ngFor`)
- Use Signals for reactive state instead of RxJS where appropriate
- Use `inject()` function over constructor injection
- Implement OnPush change detection for performance

### Dependency Injection
- Use injection tokens for non-class dependencies
- Keep hierarchical injectors for feature isolation

### Forms and Routing
- Use Reactive Forms with typed FormControl<T>
- Lazy load routes for performance
- Use guard functions (not classes) for route protection

## Testing

### Jest/Vitest
- Co-locate tests: `component.test.ts` next to `component.ts`
- Use describe/it, avoid deep nesting (max 2 levels)
- Use beforeEach for setup, avoid shared mutable state
- Mock at boundaries, not implementation details
- Keep tests fast (< 50ms) or mark slow tests

### React Testing
- Use React Testing Library, not Enzyme
- Query by accessible attributes (role, label), not class/ID
- Use `waitFor` and `findBy` for async changes
- Use `@testing-library/user-event` for interactions
- Test component behavior, not internal state

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

## Security (See base Security (Global))
- Prefer framework sanitization APIs; avoid `dangerouslySetInnerHTML` unless data is sanitized.
- Use httpOnly cookies for tokens; avoid localStorage for secrets.
- Enforce CSP headers; avoid dynamic eval/Function constructors.

## Performance (See base Performance (Global))
- Use `AbortController` and timeouts for fetch/HTTP; avoid unbounded concurrency.
- Debounce/throttle high-frequency UI events; prefer `requestAnimationFrame` for visual updates.
- Code-split via dynamic imports; offload CPU work to Web Workers.

## When in Doubt
1. Check TypeScript strict mode errors first
2. Read official framework documentation
3. Use ESLint recommended rules
4. Optimize for readability over cleverness