# [Project Name] — Agent Context

[One sentence: what this app does and who it's for.]

## Orientation

Before doing anything non-trivial:
- Read the workflow: `docs/agent/workflow.md`
- Check for known gotchas: `docs/agent/lessons.md`
- Consult ADRs before any architectural, API, or data model decision: `docs/adr/`

Never speculate about code you have not read. Open and read relevant files first.

## Stack
- **Frontend**: React, TypeScript
- **Backend**: Node.js, TypeScript
- **Database**: PostgreSQL
- **Package manager**: pnpm — always pnpm, never npm or yarn

## Commands
```bash
pnpm dev           # start dev server
pnpm build         # production build
pnpm typecheck     # tsc check
pnpm lint          # ESLint
pnpm lint:fix      # ESLint auto-fix
pnpm format        # Prettier format
pnpm test          # run tests
pnpm test:watch    # watch mode
```

## Behavioral Invariants

These are the rules that require explicit reinforcement — not general good practice.

- **Minimal sufficient change.** Make the smallest change that correctly solves the
  problem. Do not refactor, restructure, or improve things outside the scope of the
  approved plan. Opus 4.6 tends toward over-engineering; resist that default.

- **ESLint and Prettier are the authority on style.** Run `pnpm format && pnpm lint:fix`.
  Do not reason about formatting or style rules — the tools decide.

- **Scope creep is a blocker, not a judgment call.** If execution reveals that the
  approved plan is insufficient or wrong, surface it and re-plan rather than
  silently expanding scope.

- **ADRs are binding.** If a task conflicts with an ADR, flag it during planning —
  not after the code is written.

## VSCode
Team settings and recommended extensions live in `.vscode/`. They enforce
formatting on save — respect them.
