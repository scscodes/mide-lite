# mide-lite

> **Portable multi-agent AI framework** for orchestrating specialized AI agents in development workflows. No dependencies, no cost, no hassle. Drag, drop, prompt.

Multi-agent AI systems are reshaping how we approach complex development tasks. Unlike monolithic AI assistants, **mide-lite** enables a team of specialized agents (architect, implementer, reviewer, debugger, etc.) to collaborate through structured workflows, ensuring consistency and quality.

**Built for** Cursor, Claude, Copilot, and similar assistants that can read local files. **Use cases**: structured code reviews, consistent feature work, safer refactors, and repeatable debug workflows.

## Why I Built This

I perpetually refactor. Agents help, but need coaching. What started as prompts, quickly evolved into rules, personas and workflows. This vastly improved quality and repeatability, with comparatively zero overhead when compared to commercial alternatives.

- Truly plug-n-play: OS, project and model agnostic
- Immediate value, no new dependencies, apps or integrations 
- Easy to manage, tweak and extend; it's just yaml


## Quickstart (<30 seconds)

1. Copy the `.mide-lite/` folder into the root of your project.

2. In your AI assistant (Cursor/Claude/Copilot), give it this instruction:

   ```text
   You are the "supervisor" agent from .mide-lite.
   
   - Discover workflows from .mide-lite/workflows/index.yaml
   - Use the "bug-fix" or "feature-development" workflow as appropriate
   - Respect contracts in .mide-lite/contracts and rules in .mide-lite/rules
   ```

3. Ask it to run a workflow:

   ```text
   Supervisor: run the "bug-fix" workflow on src/user-service.ts.
   ```

The supervisor will select the right agents and apply language-appropriate rules automatically.

## Use Cases

**Feature Development:** Architect designs the solution, implementer writes the code, reviewer ensures quality—all orchestrated automatically through the feature-development workflow.

**Bug Fixes:** Debugger analyzes the issue, implementer applies the fix, reviewer validates—complete bug resolution cycle with structured handoffs.

**Security Audits:** Security-specialist agent works through threat assessment workflow, applying security rules and generating comprehensive reports.

**Code Reviews:** Parallel review workflow enables multiple specialized agents (security, performance, maintainability) to review code simultaneously, then aggregate findings.

**Maintenance Tasks:** Maintainer agent handles refactoring, dependency updates, and technical debt reduction with appropriate workflows.

## How It Works

It's all about perspective. Mide-lite offers a number of options designed to reduce noise and keep agents focused on the inputs and outputs that matter:

- **Agents** – focused personas for specific tasks (architect, implementer, reviewer, debugger, etc.)
- **Workflows** – step-by-step templates that chain agents together
- **Contracts** – structured schemas defining all inputs/outputs
- **Rules** – context-aware guidance tied to files and languages

```
user request
   ↓
supervisor (persona)
   ↓            ↘
workflow steps   rules (language, security, hygiene)
   ↓
agents (architect / implementer / reviewer / debugger)
   ↓
structured outputs (JSON contracts + code changes)
```

## Key Features

- **Focused Expertise**: Each agent has a specific role, leading to higher quality outputs than general-purpose assistants
- **Portable & Zero-Config**: Drop `.mide-lite/` into any project—no dependencies, no setup
- **Contract-Driven**: Structured schemas enforce consistency at all communication boundaries
- **Context-Aware**: Rules automatically apply based on file types and workflow context
- **Deterministic Workflows**: Workflow registry enables predictable agent orchestration for common tasks

## Architecture

All of mide-lite lives in a single folder so it's easy to copy between projects:

```
.mide-lite/
  agents/       # Personas for focused tasks
  workflows/    # Workflow templates + registry
  contracts/    # JSON schemas for inputs/outputs
  rules/        # Tag-aware rules for code & hygiene
```

**Core Agents:** supervisor (orchestrator), architect, implementer, reviewer, debugger

**Specialized Agents:** security-specialist, performance-engineer, devops-engineer, documentation-specialist, maintainer, toolsmith

**Built-in Workflows:** bug-fix, feature-development, parallel-code-review, security-threat-assessment

**Language Support:** TypeScript, JavaScript, Python with automatic rule selection

Each component uses minimal configuration and follows structured contracts for predictable, testable communication between agents.

**Technical Highlights:**
- Multi-agent coordination patterns
- Structured output generation with schema validation
- Workflow orchestration with phase-based execution
- Context-aware rule application via globs and tags

This framework demonstrates feasibility of building production-ready multi-agent systems that help extract more value with effectively zero cost/overhead.

## Customization

You customize behavior by editing files, not code:

- **Workflows**: Update or add entries in `.mide-lite/workflows/index.yaml`
- **Contracts**: Evolve JSON schemas in `.mide-lite/contracts/` as your automation matures
- **Rules**: Add language-/domain-specific markdown files and tags
- **Agents**: Keep personas lean; reference contracts and rules, avoid project-specific paths

All components are portable—avoid project-specific paths to maintain framework portability.
