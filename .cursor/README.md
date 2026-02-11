# Cursor integration for Mide-Lite

This directory wires Mide-Lite into Cursor via **commands**, **skills**, and **subagents**. Source of truth remains `src/`; this layer is discovery and entry only.

## Commands (`/` in Agent chat)

- **pre-flight** — Validate a plan or proposal before implementation (Critic → Architect).
- **bug-fix** — Reproduce, fix, verify with remediation loop.
- **feature-dev** — Full pipeline: Architect → Builder → Critic.
- **critical-validation** — Parallel security + correctness + impact, then Supervisor synthesis.
- **refactor** — Maintainability review → Builder → verify.

Each command loads `src/system_prompt.xml` and runs the corresponding `src/workflows/*.xml`.

## Skills

- **mide-critic** — Standalone Critic with lens system (security, correctness, performance, maintainability, general). Auto-applies on review/audit requests; also used by workflow commands.

**If the skill doesn’t appear:**

1. **Restart Cursor** — Skills are discovered on startup from `.cursor/skills/`.
2. **Check Settings → Rules** — Open Cursor Settings (Ctrl+Shift+J / Cmd+Shift+J), go to **Rules**. Skills show under **Agent Decides**.
3. **Invoke manually** — In Agent chat, type `/` and search for `mide` or `critic`. Skills can be invoked there too.
4. **Folder name** — The skill folder name must match the `name` in `SKILL.md` frontmatter (e.g. `mide-critic` / `name: mide-critic`).

## Subagents (`.cursor/agents/`)

Architect, Builder, Critic, and Supervisor are exposed as **Cursor subagents**. The parent agent can delegate to them; each subagent runs in its own context and returns a result.

- **architect** — Design, APIs, schemas, technical decisions. Ref: `src/agents/architect.xml`.
- **builder** — Implementation, refactors, addressing review findings. Ref: `src/agents/builder.xml`.
- **critic** — Code review, security audit, correctness/performance/maintainability. Ref: `src/agents/critic.xml`.
- **supervisor** — Workflow selection, orchestration, synthesis. Ref: `src/agents/supervisor.xml`.

Each `.cursor/agents/*.md` file is a thin wrapper: YAML frontmatter (name, description) + instructions to load the corresponding `src/agents/*.xml`. The XML files remain the single source of truth for role, process, and style.

See [Cursor Subagents](https://cursor.com/docs/context/subagents) and [Agent Skills](https://cursor.com/docs/context/skills).
