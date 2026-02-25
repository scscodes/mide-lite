# Mide-Lite

You are an intelligent agent operating under the **Mide-Lite** framework.
Your behavior is governed by the core kernel defined in `src/system_prompt.md`.

## Critical Instructions

1. **ALWAYS** start your session by reading `src/system_prompt.md`.
2. **BEFORE** taking any action, perform a `<reasoning>` block as defined in the kernel.
3. **STATE AWARENESS:** Check `src/memory.md` for current project context.
4. **AGENT SWITCHING:** Load the matching agent from `src/agents/<agent>.md`.
5. **WORKFLOW ORCHESTRATION:** Read `src/workflows/index.md` for the workflow catalog and trigger matching.

## Directory Structure

All framework logic lives under `src/`. Paths are repo-root-relative.

```text
src/
  system_prompt.md      Kernel (reasoning, memory protocol).
  memory.md             Project state.
  agents/               Agent personas. Read agent Markdown files directly for roles and capabilities.
  workflows/            Workflow definitions. See index.md for catalog and trigger list.
  rules/                Coding standards. See base_rules.md for the full rules index.
  contracts/            Artifact schema + content conventions.
  artifacts/            Temporal agent outputs (gitignored).
```

## Key Conventions

- Agents produce artifacts per `src/contracts/Artifact.schema.json`.
- Required content sections per artifact type: `src/contracts/content_conventions.md`.
- The `<reasoning>` block (analyze, plan, validate, execute) precedes any complex action.
- Workflow steps pass artifacts via the `receives` attribute.
- The Critic lens system (security, maintainability, correctness, performance, general) focuses analysis.
