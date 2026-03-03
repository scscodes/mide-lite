# Agent Workflow

Use this for all non-trivial work.
**Trivial** = single-line fix or isolated typo. Everything else: follow this.

---

## 1. Analyze

Read only what is necessary to understand the problem and act safely.
Do not explore the entire codebase — gather just enough context to proceed with confidence.

Specifically:
- Open and read the files directly relevant to the task
- Check `docs/adr/` if the task touches architecture, data models, API contracts,
  or library choices — ADR conflicts must be surfaced now, not after execution
- Check `docs/agent/lessons.md` for known pitfalls in this area

Then state concisely:
- What the task is actually asking (not just what was said)
- Which files are involved and what they currently do
- Any constraints, risks, or ADR implications identified

Do not propose a solution yet. Do not open files speculatively.

## 2. Plan

Present a concise plan — 4–6 bullets covering:
- What changes and why
- Files to be created or modified
- New dependencies or migrations required
- How the change will be validated (be specific — see step 4)
- Trade-offs or open questions worth flagging

**Stop here. Wait for explicit approval before writing any code.**

The approval gate exists because the cost of re-planning is far lower than the
cost of re-doing work that went in the wrong direction. If scope is unclear,
ask one focused clarifying question rather than assuming.

## 3. Execute

Implement exactly what was approved.
- Match patterns in the surrounding code before writing new ones
- If execution reveals something that changes the scope or invalidates the plan,
  stop and surface it — do not silently adapt or expand

## 4. Validate

Validation is task-specific. Run all that apply and fix failures before continuing.

**Always run:**
```bash
pnpm typecheck
pnpm lint
pnpm test
```

**Also verify based on what changed:**
- New API route → confirm request/response shape matches the contract; test error paths
- Data model change → confirm migration runs cleanly; check affected queries
- UI component → confirm renders correctly at relevant states/breakpoints
- Shared utility → confirm all existing call sites still behave correctly

Report what passed, what was fixed, and any remaining warnings with reasoning.
Do not mark a task done until verification is complete.

## 5. Hygiene & Critical Analysis

Before closing, verify:

- [ ] No dead imports, unused variables, or unreachable code introduced
- [ ] No hardcoded values that belong in constants or env vars
- [ ] Error handling is appropriate for the context
- [ ] Change is consistent with relevant ADRs — state which ones apply
- [ ] No unintended side effects on adjacent functionality
- [ ] Any follow-up tasks, tech debt, or regressions worth flagging?

Close with: what was done, validation results, and any open items.
