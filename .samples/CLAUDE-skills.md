# Workflow Orchestration

> Re-read this file at the start of every session. It is the single source of truth for how to work.

---

## 1. Plan Node Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- Write the plan to `tasks/todo.md` with checkable items — don't hold it in context
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity
- For architectural decisions, write a short ADR (Architecture Decision Record) inline in the plan

**Explore → Plan → Implement → Verify** is the mandatory sequence. Never skip directly to Implement.

---

## 2. Subagent Strategy

- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent — tasks must be MECE (mutually exclusive, collectively exhaustive)
- Each subagent returns a **condensed summary only** (1–2k tokens max), never raw logs
- Subagents should self-correct on tool failure before surfacing issues upward
- Load domain-specific skills from `.claude/skills/` when relevant to the subagent's task

---

## 3. Self-Improvement Loop

- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review `tasks/lessons.md` at session start for the relevant project
- Promote recurring lessons into CLAUDE.md or skill files so they persist beyond tasks
- Every 10 corrections: prune redundant or resolved lessons from the file

---

## 4. Verification Before Done

- **Never mark a task complete without proving it works**
- Run the appropriate check for the task type:
  - Code change → run tests, check logs
  - UI change → diff screenshots or DOM output
  - Refactor → run tests + `git diff` to verify behavior parity
  - Data change → re-run query, validate output shape
- Ask yourself: "Would a staff engineer approve this PR?"
- Ask yourself: "Am I addressing the root cause or suppressing the symptom?"
- A task is Done when: tests pass, diffs look correct, and no regressions introduced

---

## 5. Demand Elegance (Balanced)

- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: *"Knowing everything I know now, implement the elegant solution"*
- Skip this for simple, obvious fixes — don't over-engineer
- Challenge your own work before presenting it
- If elegance would require a significant refactor outside the task scope, note it in `tasks/todo.md` as a follow-up instead of blocking

---

## 6. Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests — then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how
- If a tool fails, adapt and retry — don't surface transient errors as blockers
- Zero-context-switch rule: if you need information, grep/glob/read the codebase — don't ask

---

## 7. Context Drift Prevention

*(New — sourced from Anthropic autonomy research, Feb 2026)*

- If a task exceeds **10 tool calls**, pause and re-read the original task spec
- Summarize progress-to-date in one sentence before continuing
- If scope has changed since the plan was written, flag it explicitly before proceeding
- Do not silently expand scope — surface it and get confirmation

---

## Task Management

1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plans**: Check in before starting implementation on non-trivial tasks
3. **Track Progress**: Mark items `[x]` complete as you go
4. **Explain Changes**: High-level summary at each step (what changed and why)
5. **Document Results**: Add a review section to `tasks/todo.md` when done
6. **Capture Lessons**: Update `tasks/lessons.md` after any correction
7. **Prune Regularly**: Remove completed/stale items from `tasks/todo.md` weekly

---

## Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Explain the Why**: When breaking from convention, leave a comment explaining the reason.
- **Tools Over Questions**: If you need information, use grep/glob/read. Don't ask the user.
