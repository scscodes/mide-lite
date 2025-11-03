# mide-lite

TL;DR
- Drag and drop the `.mide-lite/` folder into your workspace root.
- Use the supervisor persona to orchestrate workflows and agents.

How it works
- Personas live in `.mide-lite/agents/` (e.g., supervisor, architect, implementer, reviewer, debugger, etc.).
- Workflows live in `.mide-lite/workflows/` with a registry at `.mide-lite/workflows/index.yaml` for discovery.
- Contracts live in `.mide-lite/contracts/` and define inputs/outputs for agents, steps, and workflows.
 - Rules live in `.mide-lite/rules/` (base + language + specialized) and are tag-aware.

Key contracts
- AgentInput/AgentOutput: `.mide-lite/contracts/agent/`
- StepInput/StepOutput: `.mide-lite/contracts/workflow/`
- WorkflowInput/WorkflowOutput: `.mide-lite/contracts/workflow/`

Customize
- Tweak behavior by editing schemas in `.mide-lite/contracts/` and the workflow registry in `.mide-lite/workflows/index.yaml`.
- Keep personas lean and point outputs to the AgentOutput schema. Select rules by tags (e.g., base, typescript, javascript, python, security, testing, hygiene).
