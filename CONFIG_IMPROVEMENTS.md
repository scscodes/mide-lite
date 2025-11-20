# High-ROI Configuration Improvements

## Critical Analysis: Current State

### Gaps Identified

**1. Zero Cost/Token Controls**
- No token budgets or limits
- No API cost awareness
- Can't prevent runaway token usage
- No pre-flight cost estimation

**2. No Execution Limits**
- Workflows can use unlimited agents
- No parallel execution limits
- No iteration caps
- No timeout controls

**3. Insufficient Artifact Control**
- Synthesis filters only (post-generation)
- No pre-generation artifact budgets
- Can't prevent artifact creation upfront
- Filtering happens too late (tokens already spent)

**4. Unused Workflow Metadata**
- `complexity_hint` field exists but unused
- No connection between complexity and execution
- Can't auto-optimize based on constraints

**5. No Efficiency Presets**
- Users must manually configure dozens of settings
- No simple "economy mode" toggle
- No cascading configuration profiles

**6. Missing Agent Selection Controls**
- Can't disable expensive agents
- Can't limit which agents participate
- No agent-level budget controls

**7. Configuration Drift**
- Shared context says "2-4 artifacts typical" but no enforcement
- Config has thresholds but agents don't honor them
- No connection between config.yaml and agent behavior

---

## 7 High-ROI Improvements

### **Improvement #1: Efficiency Profiles (Massive ROI)**

**Problem:** Users face 20+ configuration options. API-cost users need simple "economy mode."

**Solution:** Add top-level efficiency profiles that cascade to all settings.

```yaml
# NEW: Top-level efficiency profile
efficiency_profile: "standard"  # economy | standard | comprehensive

# Profile definitions (users can override individual settings)
profiles:
  economy:
    description: "Minimize token usage and API costs"
    output_mode: "minimal"
    max_agents_per_workflow: 2
    max_parallel_agents: 1
    max_iterations: 1
    max_artifacts_per_agent: 2
    agent_prompt_compression: true
    skip_optional_phases: true
    early_termination_on_confidence: 0.75

  standard:
    description: "Balanced quality and efficiency (default)"
    output_mode: "balanced"
    max_agents_per_workflow: 4
    max_parallel_agents: 2
    max_iterations: 2
    max_artifacts_per_agent: 5
    agent_prompt_compression: false
    skip_optional_phases: false
    early_termination_on_confidence: 0.9

  comprehensive:
    description: "Maximize quality and thoroughness"
    output_mode: "full"
    max_agents_per_workflow: null  # unlimited
    max_parallel_agents: 4
    max_iterations: 3
    max_artifacts_per_agent: null  # unlimited
    agent_prompt_compression: false
    skip_optional_phases: false
    early_termination_on_confidence: null  # never terminate early
```

**Impact:**
- ✅ One-line change to switch modes
- ✅ 50-80% token reduction in economy mode
- ✅ Users understand trade-offs immediately
- ✅ Cascades to all subsystems

---

### **Improvement #2: Execution Limits (High ROI)**

**Problem:** No caps on workflow complexity. Parallel workflows can spawn unlimited agents.

**Solution:** Add explicit execution limits with budget enforcement.

```yaml
supervisor:
  # ... existing config ...

  # NEW: Execution limits
  execution:
    # Maximum agents that can participate in a single workflow
    max_agents_per_workflow: 4  # economy: 2, comprehensive: null

    # Maximum agents running in parallel
    max_parallel_agents: 2  # economy: 1, comprehensive: 4

    # Maximum workflow iteration loops (for quality gates)
    max_iterations: 2  # economy: 1, comprehensive: 3

    # Workflow timeout in minutes
    timeout_minutes: 15  # economy: 10, comprehensive: 30

    # Agent selection controls
    enabled_agents:
      # null = all agents enabled, or specify list
      - supervisor
      - architect
      - implementer
      - reviewer
      - debugger
      # Expensive agents can be disabled:
      # - security-specialist
      # - performance-engineer
      # - devops-engineer

    # Workflow complexity gates
    complexity_enforcement:
      # Auto-downgrade workflows based on efficiency_profile
      enable: true

      # Map complexity_hint to allowed profiles
      simple: ["economy", "standard", "comprehensive"]
      moderate: ["standard", "comprehensive"]
      high: ["comprehensive"]

      # Behavior when workflow complexity exceeds profile
      on_exceed: "warn"  # warn | downgrade | block
```

**Impact:**
- ✅ Prevents runaway workflows
- ✅ Predictable resource usage
- ✅ Can disable expensive agents entirely
- ✅ Auto-downgrade high-complexity workflows in economy mode

---

### **Improvement #3: Artifact Budget Controls (High ROI)**

**Problem:** Artifact filtering happens post-generation (tokens already spent).

**Solution:** Enforce artifact budgets upfront before generation.

```yaml
supervisor:
  synthesis:
    # ... existing config ...

    # NEW: Artifact budget enforcement (pre-generation)
    artifact_budget:
      # Maximum artifacts each agent can create
      max_per_agent: 5  # economy: 2, comprehensive: null

      # Maximum total artifacts per workflow
      max_per_workflow: 15  # economy: 6, comprehensive: null

      # Maximum artifact size in KB
      max_artifact_size_kb: 50  # economy: 20, comprehensive: 200

      # Enforcement strategy
      enforcement: "strict"  # strict | warn | log

      # What to do when budget exceeded
      on_exceed:
        action: "truncate"  # truncate | skip | error
        message: "Artifact budget exceeded. Truncating to {max_per_agent} artifacts."
```

**Impact:**
- ✅ Prevents wasted token generation
- ✅ Enforces budget before API calls
- ✅ Predictable output size
- ✅ Direct cost savings (50-70% in economy mode)

---

### **Improvement #4: Agent Prompt Optimization (Medium-High ROI)**

**Problem:** Agents load full context regardless of need. Wastes tokens.

**Solution:** Add context optimization controls.

```yaml
supervisor:
  # NEW: Agent context optimization
  context_optimization:
    # Compress agent prompts in economy mode
    enable_compression: false  # economy: true, standard: false

    # Skip loading full contracts when not needed
    lazy_load_contracts: false  # economy: true, standard: false

    # Truncate long file contents
    truncate_long_files:
      enable: false  # economy: true, standard: false
      max_lines: 500  # economy: 200, standard: 1000

    # Summarize previous agent outputs instead of full content
    summarize_handoffs:
      enable: false  # economy: true, standard: false
      max_summary_lines: 50  # economy: 20, standard: 100

    # Skip loading optional rules in economy mode
    skip_optional_rules: false  # economy: true, standard: false
```

**Impact:**
- ✅ 20-40% token reduction on context loading
- ✅ Faster agent responses
- ✅ Lower API costs
- ✅ Minimal quality impact for simple tasks

---

### **Improvement #5: Workflow Complexity Intelligence (Medium ROI)**

**Problem:** `complexity_hint` exists but unused. No smart workflow selection.

**Solution:** Use complexity metadata to auto-optimize execution.

```yaml
# NEW: Workflow complexity configuration
workflows:
  # Complexity-based execution strategies
  complexity_strategies:
    simple:
      max_agents: 3
      prefer_sequential: true
      skip_parallel_phases: true
      early_termination: 0.75

    moderate:
      max_agents: 4
      prefer_sequential: false
      skip_parallel_phases: false
      early_termination: 0.85

    high:
      max_agents: null  # unlimited
      prefer_sequential: false
      skip_parallel_phases: false
      early_termination: null  # never

  # Auto-downgrade complex workflows in economy mode
  auto_downgrade:
    enable: true
    rules:
      # If workflow is "high" complexity and profile is "economy"
      - if_complexity: "high"
        if_profile: "economy"
        then: "use_simple_variant"  # use_simple_variant | warn | block

      # If workflow is "moderate" complexity and profile is "economy"
      - if_complexity: "moderate"
        if_profile: "economy"
        then: "reduce_agents"  # limit to max 2 agents
```

**Impact:**
- ✅ Automatic workflow optimization
- ✅ Respects user's efficiency profile
- ✅ Predictable costs per complexity level
- ✅ Clear trade-off communication

---

### **Improvement #6: Cost Transparency & Estimation (Medium ROI)**

**Problem:** No visibility into token usage or costs.

**Solution:** Add cost tracking and pre-flight estimation.

```yaml
supervisor:
  # NEW: Cost transparency
  cost_tracking:
    # Enable cost estimation and tracking
    enable: true

    # Estimated tokens per workflow (for user reference)
    workflow_estimates:
      bug-fix:
        min_tokens: 2000
        typical_tokens: 4000
        max_tokens: 8000

      feature-development:
        min_tokens: 5000
        typical_tokens: 10000
        max_tokens: 20000

      parallel-code-review:
        min_tokens: 8000
        typical_tokens: 15000
        max_tokens: 30000

    # Pre-flight warnings
    warnings:
      # Warn if estimated tokens exceed threshold
      token_threshold: 10000  # economy: 5000, comprehensive: null

      # Require confirmation for expensive workflows
      require_confirmation_above: 15000  # economy: 8000, comprehensive: null

      # Show estimate before execution
      show_estimate: true  # economy: true, standard: false

    # Post-execution reporting
    reporting:
      # Show actual token usage after workflow
      show_usage: false  # economy: true, standard: false

      # Log usage to file for tracking
      log_to_file: false
      log_location: "traces/token-usage.log"
```

**Impact:**
- ✅ Users know costs upfront
- ✅ Avoid surprises on API bills
- ✅ Can set budgets and track usage
- ✅ Informed decision-making

---

### **Improvement #7: Early Termination & Quality Gates (Medium ROI)**

**Problem:** Workflows continue even when confidence is high. Wastes tokens on unnecessary validation.

**Solution:** Add smart early termination.

```yaml
supervisor:
  # NEW: Early termination and quality gates
  quality_gates:
    # ... existing quality_gates config ...

    # Early termination when confidence high
    early_termination:
      # Enable early termination
      enable: false  # economy: true, standard: false

      # Confidence threshold for early termination
      confidence_threshold: 0.85  # economy: 0.75, comprehensive: null

      # Skip optional workflow phases when confidence high
      skip_optional_phases:
        enable: false  # economy: true, standard: false
        phases:
          - "additional-review"
          - "extended-testing"
          - "performance-analysis"

      # Reduce iteration depth when high confidence
      reduce_iterations:
        enable: false  # economy: true, standard: false
        from: 2
        to: 1

    # Skip reviewer step if implementer confidence very high
    skip_review_on_high_confidence:
      enable: false  # economy: true, standard: false
      confidence_threshold: 0.95
      only_for_simple_workflows: true
```

**Impact:**
- ✅ 30-50% token savings on simple tasks
- ✅ Faster completion for obvious fixes
- ✅ Preserves quality for complex work
- ✅ Smart, not just cheap

---

## Implementation Priority

### Phase 1: Immediate (Highest ROI)
1. **Efficiency Profiles** - One change, massive impact
2. **Execution Limits** - Prevent runaway costs
3. **Artifact Budget Controls** - Direct cost savings

### Phase 2: Near-term (High ROI)
4. **Agent Prompt Optimization** - Context reduction
5. **Workflow Complexity Intelligence** - Smart workflow selection

### Phase 3: Optional (Medium ROI)
6. **Cost Transparency & Estimation** - User awareness
7. **Early Termination & Quality Gates** - Smart optimization

---

## Configuration Drift Fixes

### Fix #1: Align Shared Context with Config

**Current Drift:**
- Shared context says "2-4 artifacts typical"
- Config has no such enforcement

**Fix:**
```yaml
# In config.yaml under artifact_budget:
max_per_agent: 5  # Aligns with "2-4 typical" guidance
max_per_workflow: 15  # ~3-4 agents * 4 artifacts
```

**Update shared context:**
```markdown
3. **Keep user output focused**
   - Typical workflow should promote 2-4 artifacts total
   - Maximum per agent: {max_per_agent from config}
   - If you're promoting >{max_per_agent} artifacts, reconsider your tagging
```

### Fix #2: Connect Complexity Hints to Execution

**Current Drift:**
- `complexity_hint` exists in index.yaml
- Zero connection to actual execution

**Fix:**
- Implement Improvement #5 (Workflow Complexity Intelligence)
- Use hints to set agent limits, parallelism, iteration depth

### Fix #3: Enforce Over-Promotion Threshold

**Current Drift:**
- Config has `over_promotion_threshold: 0.5`
- Only applied in supervisor synthesis (post-generation)

**Fix:**
```yaml
# Move threshold to artifact_budget (pre-generation):
artifact_budget:
  max_per_agent: 5
  # If agent tries to promote >50% of artifacts, auto-filter
  auto_filter_on_over_promotion: true
  over_promotion_threshold: 0.5  # Moved from synthesis section
```

---

## Example: Economy Mode Configuration

**Before** (40+ lines of manual config):
```yaml
supervisor:
  output_mode: "minimal"
  storage_mode: "ephemeral"
  synthesis:
    max_promoted_artifacts: 2
    # ... 10 more settings ...
  interactive:
    # ... 5 more settings ...
  # ... etc
```

**After** (1 line):
```yaml
efficiency_profile: "economy"
```

**Auto-applies:**
- output_mode: minimal
- max_agents_per_workflow: 2
- max_parallel_agents: 1
- max_iterations: 1
- max_artifacts_per_agent: 2
- agent_prompt_compression: true
- early_termination: 0.75
- truncate_long_files: true
- skip_optional_phases: true

**Token Savings:** 50-80% compared to standard mode

---

## Testing Strategy

### Test Cases

1. **Economy Profile**
   - Run bug-fix workflow
   - Verify max 2 agents used
   - Verify output is minimal
   - Verify early termination at 0.75 confidence
   - Measure token usage (should be <50% of standard)

2. **Execution Limits**
   - Run parallel-code-review with max_agents: 2
   - Verify only 2 agents participate (not all 4)
   - Verify warning/error when limit exceeded

3. **Artifact Budget**
   - Set max_per_agent: 3
   - Verify architect creates ≤3 artifacts
   - Verify supervisor truncates if exceeded

4. **Complexity Downgrade**
   - Set profile: economy
   - Run "high" complexity workflow
   - Verify auto-downgrade or warning

5. **Early Termination**
   - Run simple bug-fix
   - Implementer confidence: 0.95
   - Verify reviewer step skipped

---

## Migration Path

### For Existing Users

**Non-Breaking:**
- All new settings have sensible defaults
- Default profile: "standard" (current behavior)
- All limits default to `null` (unlimited, current behavior)
- New features opt-in only

**Recommended Migration:**
1. Review current config.yaml
2. Add `efficiency_profile: "standard"` (explicit, same as default)
3. Test workflows behave identically
4. Experiment with `efficiency_profile: "economy"` for cost-sensitive work
5. Fine-tune individual settings as needed

**No breaking changes** - fully backward compatible

---

## Summary: ROI Analysis

| Improvement | Token Savings | Impl. Effort | User Effort | ROI |
|-------------|---------------|--------------|-------------|-----|
| #1: Efficiency Profiles | 50-80% | Medium | **1 line** | ⭐⭐⭐⭐⭐ |
| #2: Execution Limits | 30-50% | Low | Low | ⭐⭐⭐⭐⭐ |
| #3: Artifact Budget | 40-60% | Low | Low | ⭐⭐⭐⭐⭐ |
| #4: Prompt Optimization | 20-40% | Medium | Zero | ⭐⭐⭐⭐ |
| #5: Complexity Intelligence | 10-30% | Medium | Zero | ⭐⭐⭐⭐ |
| #6: Cost Transparency | 0% (awareness) | Low | Zero | ⭐⭐⭐ |
| #7: Early Termination | 30-50% | Medium | Zero | ⭐⭐⭐⭐ |

**Combined Impact:**
- **Economy Mode:** 70-85% token reduction vs. current default
- **User Experience:** Complexity reduced from 40+ config options to 1 line
- **Backward Compatible:** Zero breaking changes

---

**Next Steps:**
1. Review and approve improvements
2. Implement Phase 1 (efficiency profiles, execution limits, artifact budgets)
3. Update supervisor.md to honor new config settings
4. Update shared_context.md to reference config values
5. Test with real workflows
6. Document in README.md
