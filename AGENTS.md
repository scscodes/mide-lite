# Mide-Lite

Read `src/system_prompt.md` — it defines agents, orchestration, memory, and reasoning.

## Directory Structure

```text
src/
  system_prompt.md      Kernel: agents, orchestration, memory protocol, reasoning.
  memory/
    context.md          Working memory: current phase, focus, blockers.
    decisions.md        Append-only decision log.
  agents/               Agent definitions. Load by ID: src/agents/<id>.md
  workflows/            Workflow definitions. Catalog: src/workflows/index.md
  rules/                Coding standards. Index: src/rules/base_rules.md
  contracts/            Artifact schema + content conventions.
  artifacts/            Temporal agent outputs (gitignored).
```
