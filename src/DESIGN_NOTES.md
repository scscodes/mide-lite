# DESIGN_NOTES.md: System Prompt Architecture

## Overview

This document describes three complementary system prompt variants designed for different problem-solving contexts. Each variant embodies a distinct cognitive and operational approach, optimized for specific types of challenges and workflows.

## The Three Approaches

### V1: Standards-First (system_prompt_v1.md)

**Philosophy**: Accuracy and compliance over speed.

**When to use**:
- Security-critical systems
- Regulatory or compliance-driven projects
- High-assurance software
- Decisions that will be audited
- Multi-stakeholder approval processes

**Key Characteristics**:
- Emphasizes verification and evidence trails
- References authoritative standards (ISO, NIST, RFC, etc.)
- Explicit about assumptions and confidence levels
- Documents deviations from best practices
- Provides traceable decision rationale

**Operational Mode**:
- Verification-gate all recommendations
- Cite sources exhaustively
- Err on the side of caution
- Request clarification when standards conflict

**Output**: Auditable guidance with full provenance and citation chains.

---

### V2: Evidence-Driven (system_prompt_v2.md)

**Philosophy**: Verify through automation and measurement.

**When to use**:
- Infrastructure and DevOps tasks
- Data analysis and reporting
- Performance optimization
- Quality assurance and testing
- Any scenario where reproducibility matters

**Key Characteristics**:
- Delivers executable scripts (bash, Python, Node.js)
- Measures and verifies claims through automation
- Focuses on reproducibility and peer validation
- Includes test cases and success criteria
- Provides before/after evidence

**Operational Mode**:
- Automate verification steps
- Make recommendations backed by script output
- Include error handling and edge cases
- Document expected outcomes explicitly

**Output**: Actionable solutions backed by executable proof-of-concept code.

---

### V3: Orchestration-First (system_prompt_v3.md)

**Philosophy**: Decompose and parallelize for scale and speed.

**When to use**:
- Large, multi-faceted projects
- Complex analysis requiring diverse expertise
- Systems that benefit from parallel execution
- Organizational knowledge synthesis
- Meta-level project coordination

**Key Characteristics**:
- Breaks problems into independent subtasks
- Spawns specialized subagents for parallel work
- Uses zettel-based (linked-note) memory system
- Coordinates fan-out/fan-in execution patterns
- Maintains institutional memory across delegations

**Operational Mode**:
- Analyze for decomposition opportunities
- Delegate to specialized agents
- Collect and synthesize results
- Store findings in zettel graph for future reference
- Monitor and adapt based on subagent performance

**Output**: Synthesized solutions built from parallel specialist contributions, with linked memory artifacts.

---

## When to Combine Approaches

### V1 + V2: Verified & Proven (Compliance + Evidence)

Use when building systems that must be both auditable AND operationally proven.

**Example**: Deploying a HIPAA-compliant database system
- **V1 aspect**: Reference HIPAA standards, encryption requirements, access controls
- **V2 aspect**: Provide bash scripts that verify compliance configurations
- **Result**: Auditable deployment that can be verified by running automated checks

### V1 + V3: Federated Compliance (Standards + Orchestration)

Use when large teams need to ensure consistency while working in parallel.

**Example**: Multi-region cloud deployment with regional compliance requirements
- **V1 aspect**: Document compliance standards for each region
- **V3 aspect**: Spawn regional coordinators to implement standards in parallel
- **Result**: Coordinated compliance across distributed teams with shared standards

### V2 + V3: Measured Orchestration (Evidence + Delegation)

Use when parallelizing work and need to verify each component's correctness.

**Example**: Performance optimization across a microservice fleet
- **V2 aspect**: Each subagent provides performance metrics and optimization scripts
- **V3 aspect**: Coordinate optimization across services in parallel
- **Result**: Measurable improvements across fleet with evidence for each optimization

### V1 + V2 + V3: Full Stack (All Three)

Use for mission-critical, large-scale, highly regulated systems requiring parallel execution with full auditability.

**Example**: Building a regulated financial trading platform
- **V1**: Security standards, regulatory compliance, audit trails
- **V2**: Performance verification scripts, transaction tests, stress tests
- **V3**: Parallel development across subsystems (matching engine, risk, settlement), federated testing
- **Result**: Compliant, proven, scalable system with full decision history

---

## Zettel-Based Memory System

All three approaches benefit from a structured, linked-note memory architecture.

### Core Concept

**Zettel** (German: "note") is a system of atomic, interconnected notes that:
- Store single, focused ideas or findings
- Link to related notes and decisions
- Build knowledge graphs over time
- Enable rapid context recovery and pattern recognition

### Application in This Architecture

#### Atomic Notes
Each significant finding or decision becomes a zettel:

```markdown
# mide-001: Standards-First Verification Gates

**Date**: 2024-02-26
**Variant**: V1
**Tags**: compliance, verification, decision

## Content
For security-critical paths, always implement a verification gate that checks 
recommendations against relevant standards (NIST, OWASP, domain-specific).

## References
- Related to [[mide-002: Evidence Collection Workflow]]
- Implements [[mide-003: Quality Gates for Output]]
- Complements [[mide-004: Orchestration Decision Points]]

## Decision Rationale
Verification gates prevent non-compliant recommendations from propagating, 
especially critical when multiple agents contribute to the same system.
```

#### Memory Use Cases

**Recovery After Context Switches**:
- Agent restarts can query zettel system
- Find relevant prior decisions and findings
- Resume work without recomputing context

**Pattern Recognition**:
- Link similar problems across projects
- Identify which variant succeeded historically
- Avoid repeating failed approaches

**Team Knowledge**:
- Distributed teams can query shared zettel store
- Understand why past decisions were made
- Learn from accumulated experience

**Audit & Compliance**:
- Full decision trail for regulatory review
- Links to standards and requirements
- Evidence of deliberation and approval

### Tagging Strategy

Organize zettels with consistent tags:

```
# Variant Tags
variant:v1, variant:v2, variant:v3, variant:combined

# Phase Tags
phase:planning, phase:implementation, phase:testing, phase:deployment

# Domain Tags
domain:security, domain:performance, domain:compliance, domain:architecture

# Decision Tags
decision:chosen, decision:rejected, decision:pending, decision:archived

# Type Tags
type:finding, type:decision, type:pattern, type:lesson-learned
```

### Zettel Linking Patterns

```
# Forward Links (dependencies)
- [[dependent-note]]: This note enables this other work

# Backlinks (context)
- Enabled by [[prerequisite-note]]

# Horizontal Links (similar/contrasting)
- Related to [[comparable-note]]
- Contrasts with [[opposing-note]]
```

---

## Implementation Recommendations

### For Single-Agent Systems
- Use V1 or V2 depending on whether accuracy (V1) or reproducibility (V2) matters more
- Maintain a basic zettel store for important decisions
- Document standards compliance alongside code

### For Small Teams (2-5 people)
- Primary variant based on domain (V1 for security, V2 for infrastructure, V3 for meta-projects)
- Invest in shared zettel repository
- Use backreferences to maintain consistency

### For Medium Teams (5-20 people)
- Use all three variants, assigned by problem type
- Zettel system becomes central knowledge repository
- Regular "zettel reviews" to maintain quality and coherence

### For Large Organizations (20+ people)
- V3 becomes essential for coordination
- Zettel system is critical infrastructure
- Automated zettel indexing and query layer
- Regular synthesis sessions to extract organizational patterns

---

## Integration Points

These system prompts can be:
1. **Selected dynamically** based on task classification
2. **Combined in sequence** for multi-phase workflows
3. **Used as templates** to build domain-specific variants
4. **Extended** with organization-specific standards and practices

### Workflow Example: Full System Integration

```
[Task arrives]
  ↓
[Classify by domain and criticality]
  ↓
[Select primary variant: V1 (secure), V2 (operational), V3 (complex)]
  ↓
[Query zettel system for related past work]
  ↓
[Execute using selected variant]
  ↓
[Record findings in zettel system]
  ↓
[Link to related decisions]
  ↓
[Make available for future queries]
```

---

## Future Extensions

### Variant Specializations
- **V1-Security**: Focused on security standards (NIST, OWASP, CWE)
- **V2-Analytics**: Data-driven analysis with statistical rigor
- **V3-Governance**: Federated decision-making across organizations

### Zettel Enhancements
- Automatic backreference generation
- Pattern detection across linked notes
- Time-series analysis of decision trends
- Integration with knowledge graphs

### Adaptive Selection
- Machine-learned variant selection based on task properties
- Hybrid prompts that combine approaches dynamically
- Feedback loops to optimize variant assignment

---

## References & Inspiration

- **Standards-First**: Influenced by ISO/IEC quality management, NIST cybersecurity framework
- **Evidence-Driven**: Inspired by DevOps practices, scientific method, reproducible research
- **Orchestration-First**: Based on distributed systems patterns, actor model, agent-based systems
- **Zettel Memory**: Derived from Niklas Luhmann's zettelkasten method, applied to AI coordination

---

*Last Updated: 2024-02-26*
*Variant Versions: V1.0, V2.0, V3.0*
