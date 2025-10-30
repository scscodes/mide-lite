# Static Content

This directory contains version-controlled static content for the Mide system.

## Structure

- **rules/** - Coding rules and standards (markdown)
  - `base_rules.md` - Universal security, performance, testing rules
  - `javascript_typescript_rules.md` - JavaScript/TypeScript specific rules
  - `python_rules.md` - Python specific rules

- **agents/** - Agent definitions (markdown with frontmatter)
  - `architect.md` - System design and architecture
  - `implementer.md` - Code implementation
  - `reviewer.md` - Code review and quality
  - `debugger.md` - Issue diagnosis
  - `supervisor.md` - Multi-agent orchestration
  - `toolsmith.md` - Developer tools

## Content Format

### Rules
Rules are written in markdown with optional frontmatter:
```yaml
---
name: rule-name
type: universal|language|api|tool
always_apply: true|false
tags: [tag1, tag2]
---
# Rule content in markdown
```

### Agents
Agents are written in markdown with frontmatter:
```yaml
---
name: agent-name
description: Agent description
model: sonnet|opus|haiku
capabilities: [capability1, capability2]
use_cases: [use-case1, use-case2]
---
# Agent prompt in markdown
```

## Usage

Content is loaded dynamically by the domain layer:
- `src/domain/agents/agent-loader.ts` - Loads agent definitions
- `src/domain/rules/rule-selector.ts` - Loads and selects rules

Paths are configured in `mide.yaml`:
```yaml
content_structure:
  rules_dir: "./.mide-lite/rules"
  agents_dir: "./.mide-lite/agents"
```
