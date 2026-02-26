## DEC-012: Kernel + Memory Restructure
Rewrote system_prompt.md as operational kernel (agents, orchestration, memory protocol, reasoning).
Split memory.md into memory/context.md (working memory) and memory/decisions.md (append-only log).
AGENTS.md slimmed to a pointer + directory map.

## DEC-011: Index-Driven Architecture
Adopted AGENTS.md as thin router, per-directory indexes as sources of truth.
Workflows split from monolith into 14 individual files.
Content conventions moved to src/contracts/content_conventions.md.
