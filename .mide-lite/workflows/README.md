# Workflows

Portable workflow templates. Supervisor selects via registry and coordinates steps.

Use
- Registry: `.mide-lite/workflows/index.yaml` (name, path, tags, triggers)
- Per step: produce StepInput → expect StepOutput
- Final: emit WorkflowOutput (aggregate full artifacts)

Contracts
- `.mide-lite/contracts/`
