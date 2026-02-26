# Mide-Lite

**Mide-Lite (Gen 2)** is a Markdown-native multi-agent framework designed for modern LLMs (Claude 3.5 Sonnet, GPT-4o).

It succeeds the Gen 1 implementation by shifting from ad-hoc prompt templates to structured, index-driven Markdown definitions with a reasoning-first kernel.

## Project Structure

```text
/
├── AGENTS.md              # Entry point: thin router to all framework components
├── README.md
├── src/
│   ├── system_prompt.md   # Kernel: agents, orchestration, memory protocol, reasoning
│   ├── memory/
│   │   ├── context.md     # Working memory: current phase, focus, blockers
│   │   └── decisions.md   # Append-only decision log
│   ├── agents/            # Agent personas (Markdown). Read directly for roles/capabilities.
│   ├── workflows/         # Workflow definitions. See index.md for catalog.
│   ├── rules/             # Coding standards. See base_rules.md for rules index.
│   ├── contracts/         # Artifact schema + content conventions
│   └── artifacts/         # Temporal outputs (gitignored)
```

## Quickstart

1.  **Add this directory to your Cursor/LLM workspace.**
2.  **Start a chat.** The framework loads via `AGENTS.md` → `src/system_prompt.md`.
3.  **Engage an agent or workflow:**

### Direct Agent Invocation

```text
Act as the Architect agent. Design a REST API for user authentication
with JWT tokens. Consider security boundaries and data flow.
```

```text
Act as the Builder agent. Implement the login endpoint based on the
design above. Follow the rules in src/rules/typescript.md.
```

```text
Act as the Critic agent with a security focus. Review the authentication
implementation for OWASP vulnerabilities.
```

### Workflow-Based Orchestration

```text
Act as the Supervisor agent. Run the "feature-dev" workflow to add
a password reset feature to the user service.
```

```text
Supervisor: Execute the "bug-fix" workflow on src/auth/login.ts -
users are getting 401 errors on valid credentials.
```

```text
Supervisor: Run "parallel-review" on the payment processing module.
```

## Key References

- **Framework entry point:** `AGENTS.md` (routes to all components)
- **Workflow catalog:** `src/workflows/index.md`
- **Agent definitions:** `src/agents/*.md`
- **Coding rules index:** `src/rules/base_rules.md`
- **Artifact contracts:** `src/contracts/Artifact.schema.json` + `src/contracts/content_conventions.md`

## Key Features

-   **Cognition-First:** Agents must perform a `<reasoning>` block to plan strategies before generating code.
-   **Structured Markdown:** Prompts and configuration are structured in Markdown to reduce instruction bleeding and improve adherence in modern models.
-   **Persistent Context:** `src/memory/context.md` (working state) and `src/memory/decisions.md` (decision log) track state across sessions.
