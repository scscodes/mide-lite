# mide-lite

Portable multi-agent collaboration framework. Drag `.mide-lite/` into your project root and use the supervisor persona to orchestrate workflows.

## Quick Start

1. Copy `.mide-lite/` to your project root
2. Invoke the **supervisor** persona to select workflows and coordinate agents

## Structure

### Agents (`.mide-lite/agents/`)

Personas for focused tasks. All outputs follow `AgentOutput.schema.json`.

**Core agents:**
- **supervisor**: Orchestrates workflows and aggregation
- **architect**: Design decisions and specifications
- **implementer**: Code generation and implementation
- **reviewer**: Code quality and security analysis
- **debugger**: Root cause analysis and fixes

**Specialized agents:** maintainer, toolsmith, security-specialist, performance-engineer, devops-engineer, documentation-specialist

**Frontmatter:** `name` and `description` only (minimal schema enforced)

### Workflows (`.mide-lite/workflows/`)

Portable workflow templates. Supervisor discovers via `.mide-lite/workflows/index.yaml` and coordinates steps.

**Workflow registry:** `index.yaml` maps keywords/tags to workflows for deterministic discovery

**Examples:** bug-fix, feature-development, parallel-code-review, security-threat-assessment

**Frontmatter:** `name`, `description`, `tags`

### Contracts (`.mide-lite/contracts/`)

JSON schemas for all I/O boundaries. Keep artifacts FULL (no ellipses).

**Agent:**
- `AgentInput.schema.json` → supervisor to agent
- `AgentOutput.schema.json` → agent to supervisor

**Workflow:**
- `StepInput.schema.json` → supervisor to step
- `StepOutput.schema.json` → step to supervisor
- `WorkflowInput.schema.json` → workflow selection
- `WorkflowOutput.schema.json` → final aggregation

### Rules (`.mide-lite/rules/`)

Tag-aware rules for code quality and standards. Select by tags/globs based on context.

**Base:** `base_rules.md` (tags: base, global) - always applies

**Language-specific:**
- `typescript.md` (tags: typescript, globs: `**/*.ts`, `**/*.tsx`)
- `javascript.md` (tags: javascript, globs: `**/*.js`, `**/*.jsx`)
- `python.md` (tags: python, globs: `**/*.py`)

**Specialized:**
- `security.md` (tags: security)
- `testing.md` (tags: testing)
- `hygiene.md` (tags: hygiene, artifacts)

**Frontmatter:** `name`, `description`, `globs`, `alwaysApply: false`, `tags`

## Customization

**Workflows:** Edit `.mide-lite/workflows/index.yaml` to add/modify workflow discovery

**Contracts:** Modify schemas in `.mide-lite/contracts/` to change I/O structure

**Rules:** Add language-specific or specialized rules; select by tags in workflow context

**Agents:** Keep personas lean; reference contracts and rules, avoid project-specific paths
