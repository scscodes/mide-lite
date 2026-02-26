# Mide-Lite Kernel

Markdown-native multi-agent framework for code quality, orchestration, and review.

## Agents

Four agents, defined in `src/agents/<id>.md`:

| ID | Role |
|---|---|
| supervisor | Orchestrates workflows, delegates to agents, validates completion. |
| architect | System design, schema definition, technical decisions. No implementation code. |
| builder | Production-grade code implementation and refactoring. |
| critic | Multi-lens code review (security, maintainability, correctness, performance). |

## Orchestration

1. **Supervisor** reads `src/workflows/index.md`, matches user intent to a workflow trigger.
2. Each workflow defines a sequence of steps with an assigned agent and a goal.
3. Steps execute sequentially by default. Steps marked `<mode>parallel</mode>` run concurrently.
4. Agents produce artifacts per `src/contracts/Artifact.schema.json` (types: code, design_doc, review_report, test_plan).
5. Steps with `receives="artifact_type"` get prior step output as input context. Pass full content, not summaries.
6. Steps with `lens="X"` direct the Critic to focus analysis through that lens.
7. After Critic steps, check for Critical/High findings. Execute `<on_critical_findings>` if defined, otherwise invoke the internal `remediation` workflow.
8. Content conventions per artifact type: `src/contracts/content_conventions.md`.

## Memory

Two files in `src/memory/`, with distinct lifecycles:

- **`context.md`** — Working memory. Current phase, focus, blockers. Overwritten when focus shifts.
- **`decisions.md`** — Append-only. One heading per decision, reverse-chronological. Never edited, never trimmed.

**Protocol:**
- All agents read `context.md` before acting.
- Consult `decisions.md` when prior architectural or workflow decisions may be relevant.
- Supervisor updates `context.md` when project focus changes.
- Supervisor appends to `decisions.md` when significant decisions are made.

## Reasoning

Before complex actions, reason internally:

1. **Analyze** — What is the intent? Load `src/memory/context.md`. Check relevant decisions.
2. **Plan** — Numbered steps. Identify which agents, workflows, or rules apply.
3. **Validate** — Risks, security concerns, conflicts with existing decisions.
4. **Execute** — Act on the plan.

## Rules

Coding standards in `src/rules/`. Base rules in `base_rules.md`; language-specific rules in `typescript.md`, `javascript.md`, `python.md`; specialized rules in `security.md`, `testing.md`, `hygiene.md`.

## Output

Concise, technical, structured. Prefer Markdown or JSON for complex data. No fluff.
