# Configuration Reference

Documentation for `config.yaml` settings. This file is NOT loaded at runtime.

## Efficiency Profiles

| Profile | Best For | Token Impact |
|---------|----------|--------------|
| `economy` | Simple tasks, cost-sensitive | 50-80% reduction |
| `standard` | Most workflows (default) | Baseline |
| `comprehensive` | Security audits, complex work | 150-200% increase |

### Economy Mode Overrides
```yaml
output_mode: minimal
max_agents_per_workflow: 2
max_parallel_agents: 1
max_iterations: 1
max_per_agent: 2
max_per_workflow: 6
max_artifact_size_kb: 20
enable_compression: true
truncate_long_files: true (200 lines)
summarize_handoffs: true (20 lines)
early_termination: true (0.75)
```

### Comprehensive Mode Overrides
```yaml
output_mode: full
max_agents_per_workflow: null
max_parallel_agents: 4
max_iterations: 3
max_per_agent: null
max_per_workflow: null
max_artifact_size_kb: 200
```

## Output Templates

### Minimal
```
## {workflow_name} Complete

{executive_summary}

**Outcome:** {outcome_status}
**Confidence:** {confidence}

{critical_blockers_only}
```

### Balanced (Default)
```
## {workflow_name} Complete

{executive_summary}

### Critical Items
{critical_findings_full_detail}

### Key Decisions
{decisions_with_rationale}

### Next Steps
{actionable_next_steps}

<details>
<summary>Additional Findings ({count})</summary>
{minor_findings_summary}
</details>

<details>
<summary>Artifacts Created ({count})</summary>
{artifact_list}
</details>
```

### Full
```
## {workflow_name} Complete

{executive_summary}

### All Artifacts
{all_artifacts_full_content}

### All Decisions
{all_decisions}

### All Findings
{all_findings}

### References
{all_references}
```

## Complexity Enforcement

When `on_exceed` is triggered:
- `warn`: Log warning, continue execution
- `downgrade`: Use simpler workflow variant
- `block`: Prevent workflow execution

## Storage Modes

| Mode | Location | Cleanup | Use Case |
|------|----------|---------|----------|
| `ephemeral` | In-response only | N/A | Default, no files |
| `session` | `/tmp/mide-session-{id}/` | Auto (60min) | Temporary traces |
| `persistent` | `traces/` | Manual | Audit trails |
