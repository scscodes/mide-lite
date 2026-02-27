# Lessons Learned

> Updated after every user correction. Reviewed at session start.
> Format: **[date] Pattern → Rule**

---

## Meta-Rules

- If a lesson recurs 3+ times, promote it into CLAUDE.md or a skill file
- Prune resolved or irrelevant lessons every 10 entries
- Always include a concrete "never do X" or "always do Y" statement — vague lessons don't stick

---

## Pre-Seeded Lessons (from Anthropic research + this project)

**[2026-02] Subagent task overlap**
→ When spawning multiple subagents, define task boundaries explicitly. Overlapping assignments cause duplicate work and conflicting outputs. Tasks must be MECE.

**[2026-02] Context drift on long tasks**
→ After 10+ tool calls, re-read the original task spec. It's easy to lose the original goal and silently expand scope. Pause, summarize, confirm.

**[2026-02] Marking done without verification**
→ Never mark a task complete until the test/check/command has actually run and passed. "Should work" is not verification.

**[2026-02] Elegant solution deferred instead of noted**
→ When elegance requires out-of-scope refactoring, file a follow-up in tasks/todo.md instead of either blocking or silently doing a hacky fix.

**[2026-02] Subagent returned raw logs**
→ Subagents must return condensed summaries (1–2k tokens). Raw logs bloat the main context and degrade orchestrator accuracy.

**[2026-02] Asked user for information available in codebase**
→ grep/glob/read first. Only ask the user if the information genuinely cannot be found in the project.

---

## Project-Specific Lessons

<!-- Add entries here as corrections occur -->
<!-- Format: **[YYYY-MM] Short title** → Concrete rule -->
