# Scratch Directory Artifact Management Proposal

## Problem Statement

Models frequently create excessive temporary files (ANALYSIS.md, REPORT.md, PLAN.md, TODO.md, etc.) that clutter the project root and violate the "ephemeral by default" principle. These files should be:
1. Redirected to a dedicated scratch area
2. Controlled via gating mechanisms
3. Auto-cleaned based on lifecycle rules
4. Tracked but not committed to git

## Solution Design

### 1. Core Concept: Artifact File Interception

**Scratch Directory Structure:**
```
.mide-lite/
  .scratch/           # NEW: Scratch workspace (git-ignored)
    session-{id}/     # Per-session isolation
      {timestamp}-{agent}-{type}.md
    _index.json       # Artifact registry
```

**Example:**
```
.mide-lite/.scratch/
  session-20250120-abc123/
    001-supervisor-workflow-output.json
    002-architect-design-doc.md
    003-reviewer-findings.md
  _index.json
```

### 2. Gating Mechanism: File Type Detection

**Intercept Pattern Matching:**
```yaml
scratch_patterns:
  # Temporary analysis files (always redirect)
  always_scratch:
    - "**/ANALYSIS.md"
    - "**/REPORT.md"
    - "**/PLAN.md"
    - "**/TODO.md"
    - "**/NOTES.md"
    - "**/FINDINGS.md"
    - "**/DIAGNOSTIC*.md"
    - "**/*_TEMP.md"
    - "**/*_DRAFT.md"

  # Artifact types that should be guided (prompt user)
  prompt_for_location:
    - "**/*_DESIGN.md"
    - "**/ARCHITECTURE.md"
    - "**/ADR-*.md"  # Architecture Decision Records
    - "**/API_*.md"

  # Never intercept (always allow in project)
  never_scratch:
    - "README.md"
    - "CHANGELOG.md"
    - "LICENSE.md"
    - "docs/**/*.md"
    - ".mide-lite/agents/**"
    - ".mide-lite/workflows/**"
    - ".mide-lite/rules/**"
```

### 3. Implementation Touchpoints

#### A. Configuration Extension (`.mide-lite/config.yaml`)

**Add new section:**
```yaml
# Existing supervisor config...
supervisor:
  output_mode: "balanced"
  storage_mode: "ephemeral"

  # NEW: Artifact file management
  artifact_files:
    # Enable scratch directory interception
    enable_scratch_directory: true

    # Scratch directory location
    scratch_location: ".mide-lite/.scratch/"

    # Auto-cleanup rules
    auto_cleanup:
      # Clean scratch files older than N days
      max_age_days: 7

      # Clean scratch files on session end
      cleanup_on_session_end: true

      # Keep artifacts referenced in persistent traces
      preserve_if_referenced: true

    # Interception behavior
    interception:
      # Always redirect these patterns to scratch
      auto_redirect_patterns:
        - "**/ANALYSIS.md"
        - "**/REPORT.md"
        - "**/PLAN.md"
        - "**/TODO.md"
        - "**/NOTES.md"
        - "**/FINDINGS.md"
        - "**/DIAGNOSTIC*.md"
        - "**/*_TEMP.md"
        - "**/*_DRAFT.md"

      # Prompt user for these patterns
      prompt_patterns:
        - "**/*_DESIGN.md"
        - "**/ARCHITECTURE.md"
        - "**/ADR-*.md"

      # Never intercept these patterns
      never_intercept_patterns:
        - "README.md"
        - "CHANGELOG.md"
        - "docs/**/*.md"
        - ".mide-lite/**"
```

#### B. Shared Context Update (`.mide-lite/agents/_shared_context.md`)

**Add new section after "Documentation & File Hygiene":**
```markdown
## Artifact File Management (IMPORTANT)

**Scratch Directory for Temporary Artifacts:**
- Temporary analysis files (ANALYSIS.md, REPORT.md, PLAN.md, etc.) are automatically redirected to `.mide-lite/.scratch/`
- Never create temporary files in project root or src directories
- Use artifact metadata to control output (see Artifact Tagging section)

**File Creation Guidelines:**
1. **Ephemeral artifacts** → Include in AgentOutput only (no files)
2. **Session artifacts** → Auto-created in scratch if needed (automatic)
3. **Persistent artifacts** → Only create in project if user confirms

**When to Create Files in Project:**
- User explicitly requests documentation: "Create a design doc in docs/"
- Deliverable is a file (e.g., "Create README.md")
- User confirms persistent storage (supervisor asks first)

**When Files Go to Scratch (Automatic):**
- Any file matching scratch patterns (ANALYSIS.md, REPORT.md, etc.)
- Working notes during multi-agent workflows
- Temporary diagnostic outputs

**File Path Decision Tree:**
```
Agent wants to create: "ANALYSIS.md"
  ↓
Does filename match auto_redirect_patterns?
  ├─ YES → Automatically redirect to .mide-lite/.scratch/session-{id}/
  └─ NO  → Continue...

Does filename match prompt_patterns?
  ├─ YES → Ask user: "Save to project or scratch?"
  └─ NO  → Continue...

Does filename match never_intercept_patterns?
  ├─ YES → Allow in project (normal behavior)
  └─ NO  → Apply default storage_mode rules
```
```

#### C. Supervisor Agent Update (`.mide-lite/agents/supervisor.md`)

**Add new section after "Storage Mode Handling":**
```markdown
### 6. Artifact File Interception (NEW)

**Automatic Scratch Redirection:**

When agents attempt to create temporary files, intercept and redirect to scratch:

**Interception Flow:**
1. Agent proposes file creation (e.g., "ANALYSIS.md")
2. Supervisor checks against `artifact_files.interception` rules
3. Apply decision:
   - **auto_redirect_patterns** → Silently redirect to `.mide-lite/.scratch/session-{id}/`
   - **prompt_patterns** → Ask user: "Save to project or scratch?"
   - **never_intercept_patterns** → Allow in project
   - **default** → Apply storage_mode rules

**User Messaging:**
```text
# When files are redirected to scratch:
"Working files saved to .mide-lite/.scratch/session-abc123/ (auto-cleaned in 7 days)"

# When prompting for location:
"Save ARCHITECTURE_DESIGN.md to:
  1. Project (docs/) - permanent, version controlled
  2. Scratch (.mide-lite/.scratch/) - temporary, auto-cleaned

Your choice: [1/2]"
```

**Cleanup Coordination:**
- On session end: Clean scratch if `cleanup_on_session_end: true`
- On workflow completion: Offer to cleanup: "Remove scratch files? [y/N]"
- Daily: Auto-clean files older than `max_age_days`

**Preserve Referenced Artifacts:**
- If artifact is referenced in persistent trace → Keep in scratch
- If user saves workflow to `.mide-lite/.traces/` → Keep referenced scratch files
- Add note: "Referenced scratch files preserved in .mide-lite/.scratch/preserved/"
```

#### D. Gitignore Update (`.gitignore` or `.mide-lite/.gitignore`)

**Add:**
```gitignore
# Scratch directory for temporary agent artifacts
.mide-lite/.scratch/

# Exception: Preserve the directory structure
!.mide-lite/.scratch/.gitkeep
```

**Create `.mide-lite/.scratch/.gitkeep`:**
```
# This directory contains temporary agent artifacts
# Files here are automatically cleaned based on config.yaml rules
# See SCRATCH_DIRECTORY_PROPOSAL.md for details
```

#### E. Index File Schema (`.mide-lite/.scratch/_index.json`)

**Purpose:** Track all scratch artifacts for cleanup and discovery

**Schema:**
```json
{
  "version": "1.0",
  "sessions": [
    {
      "session_id": "20250120-abc123",
      "created_at": "2025-01-20T14:30:00Z",
      "last_accessed": "2025-01-20T16:45:00Z",
      "status": "active | completed | abandoned",
      "artifacts": [
        {
          "filename": "001-supervisor-workflow-output.json",
          "type": "workflow_output",
          "created_by": "supervisor",
          "created_at": "2025-01-20T14:30:00Z",
          "size_bytes": 12456,
          "referenced_by": [],
          "preserve": false
        },
        {
          "filename": "002-architect-design-doc.md",
          "type": "design_doc",
          "created_by": "architect",
          "created_at": "2025-01-20T15:00:00Z",
          "size_bytes": 8924,
          "referenced_by": ["workflow_abc123"],
          "preserve": true
        }
      ]
    }
  ],
  "cleanup_rules": {
    "max_age_days": 7,
    "cleanup_on_session_end": true,
    "preserve_if_referenced": true
  },
  "last_cleanup": "2025-01-20T00:00:00Z"
}
```

### 4. Workflow Integration

#### Supervisor Workflow Modifications

**Before delegating to agents:**
```markdown
1. Check config: artifact_files.enable_scratch_directory
2. If enabled, activate file interception mode
3. Monitor agent outputs for file creation attempts
4. Apply interception rules per config
5. Update _index.json with created artifacts
```

**After workflow completion:**
```markdown
1. Offer cleanup: "Remove scratch files from this session? [y/N]"
2. If user saves to persistent traces → Preserve referenced artifacts
3. Update _index.json with session status = "completed"
4. Log session summary to _index.json
```

### 5. Migration Path (Backward Compatibility)

**Phase 1: Opt-in (Default: Disabled)**
```yaml
artifact_files:
  enable_scratch_directory: false  # Default
```

**Phase 2: Soft Launch (Default: Enabled, but prompt-heavy)**
```yaml
artifact_files:
  enable_scratch_directory: true
  interception:
    prompt_for_all_temporary_files: true  # Ask before redirecting
```

**Phase 3: Full Adoption (Default: Enabled, auto-redirect)**
```yaml
artifact_files:
  enable_scratch_directory: true
  interception:
    auto_redirect_patterns: [extensive list]
```

### 6. User Experience Flows

#### Flow 1: Automatic Scratch (Seamless)
```
User: "Analyze the codebase and provide recommendations"
  ↓
Supervisor: Orchestrates → Architect, Reviewer
  ↓
Architect creates: "ANALYSIS.md" (matches auto_redirect_patterns)
  ↓
Supervisor: Silently redirects to .mide-lite/.scratch/session-abc/001-architect-analysis.md
  ↓
Supervisor: Synthesizes output (user sees synthesized results, not file)
  ↓
User sees: "Analysis complete. Working files in .mide-lite/.scratch/ (auto-cleaned in 7 days)"
```

#### Flow 2: Prompted Save (User Choice)
```
User: "Design the authentication architecture"
  ↓
Supervisor: Delegates → Architect
  ↓
Architect creates: "AUTH_ARCHITECTURE_DESIGN.md" (matches prompt_patterns)
  ↓
Supervisor: Prompts user:
  "Save AUTH_ARCHITECTURE_DESIGN.md to:
   1. Project (docs/architecture/) - permanent
   2. Scratch (.mide-lite/.scratch/) - temporary
   Your choice: [1/2]"
  ↓
User selects 1 → File saved to docs/architecture/
User selects 2 → File saved to .mide-lite/.scratch/
```

#### Flow 3: Persistent Trace with References
```
User: "Run bug-fix workflow and save trace"
  ↓
Supervisor: Executes workflow → Multiple agents create scratch files
  ↓
Supervisor: "Save full workflow trace to .mide-lite/.traces/? [y/N]"
  ↓
User: "y"
  ↓
Supervisor:
  - Saves workflow trace to .mide-lite/.traces/workflow-abc123.json
  - Preserves referenced scratch artifacts
  - Moves them to .mide-lite/.scratch/preserved/
  - Updates _index.json: preserve=true
  ↓
User sees: "Trace saved. Referenced artifacts preserved in .mide-lite/.scratch/preserved/"
```

### 7. Benefits

✅ **Reduces Clutter:** Temporary files never pollute project root
✅ **Maintains Portability:** Scratch is self-contained in .mide-lite/
✅ **Auto-Cleanup:** Old scratch files automatically removed
✅ **User Control:** Prompt for important files, auto-redirect temp files
✅ **Backward Compatible:** Opt-in, doesn't break existing workflows
✅ **Git-Friendly:** Scratch is git-ignored by default
✅ **Audit Trail:** _index.json tracks all scratch artifacts
✅ **Flexible:** Configure patterns per project needs

### 8. Implementation Checklist

- [ ] Update `.mide-lite/config.yaml` with `artifact_files` section
- [ ] Update `.mide-lite/agents/_shared_context.md` with file management rules
- [ ] Update `.mide-lite/agents/supervisor.md` with interception logic
- [ ] Create `.mide-lite/.scratch/` directory structure
- [ ] Create `.mide-lite/.scratch/.gitkeep` placeholder
- [ ] Update `.gitignore` to exclude `.mide-lite/.scratch/` (except .gitkeep)
- [ ] Create `.mide-lite/.scratch/_index.json` schema
- [ ] Document in README.md (optional user-facing section)
- [ ] Test with common workflows (bug-fix, feature-development)

### 9. Future Enhancements (Out of Scope)

- Web UI for browsing scratch artifacts
- Scratch artifact search/filter
- Scratch artifact export (zip/tar)
- Scratch artifact sharing across sessions
- Scratch artifact analytics (size, frequency, agents)

---

## Summary

This proposal introduces a **lightweight, gated scratch directory system** that:

1. **Intercepts** temporary file creation attempts
2. **Redirects** them to `.mide-lite/.scratch/` based on configurable patterns
3. **Prompts** users for important files (design docs, ADRs)
4. **Auto-cleans** old scratch files based on age and session status
5. **Preserves** artifacts referenced in persistent traces
6. **Maintains** the portable, zero-dependency philosophy

The solution is **opt-in, backward-compatible, and configuration-driven**, ensuring minimal overhead for developers while maximizing control over artifact proliferation.
