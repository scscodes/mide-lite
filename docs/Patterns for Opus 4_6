# CLAUDE.md and lessons.md patterns for Claude Opus 4.6

Claude Opus 4.6 behaves best when CLAUDE.md and related docs are short, universal, and paired with a lightweight lessons.md feedback loop that continuously promotes proven lessons into higher‑leverage instructions and skills.[^1][^2]

## Core principles

Anthropic’s own Claude Code best‑practices and independent CLAUDE.md deep dives converge on the same rule: less but sharper instructions outperform long, over‑specified files. Because CLAUDE.md is injected into every project session, anything that is not universally applicable to how Opus should work in that repo degrades performance and is more likely to be ignored.[^3][^4][^1]

Practical consequences:
- Reserve CLAUDE.md for WHY/WHAT/HOW of the project and a few behavioral invariants; push everything situational into separate markdown files, skills, or prompts.[^4][^1]
- Treat CLAUDE.md as code: version it, prune it, and test changes by watching whether Opus 4.6 actually changes behavior in live sessions.[^5][^3]

## Designing CLAUDE.md for Opus 4.6

Anthropic’s prompt‑engineering guide notes that Opus 4.6 is more sensitive to system‑level instructions and more prone to aggressive tool use and upfront exploration than older models. This means pre‑4.6 style "CRITICAL, ALWAYS do X" language can now cause over‑triggering of tools or over‑engineering unless dialed back.[^2][^6]

Recommended content for a project‑level CLAUDE.md:
- **Project overview and domain**: a concise description of what the system does, its users, and core constraints (latency budgets, safety limits, supported platforms). This is exactly how Anthropic frames CLAUDE.md as an onboarding file into a repo.[^7][^1][^5]
- **Stack, architecture, and workflows**: frameworks, directory layout, how to run tests, typical feature/bugfix workflow, and any “house style” for APIs or data models, as recommended in CLAUDE.md tutorials and community guides.[^1][^7][^4][^5]
- **Behavioral invariants for Opus 4.6**: explicit instructions like "prefer minimal changes over large refactors", "never commit without running tests", or "use dry‑run / plan mode before making edits" to counter its tendency to over‑engineer.[^8][^2][^3]

## File size and universality

HumanLayer’s CLAUDE.md guidance and Anthropic’s own docs both stress that long, mixed‑purpose CLAUDE.md files are a failure mode: Claude will ignore rules lost in the noise or treat the whole file as low‑relevance background. These sources recommend keeping instructions few, concise, and universally applicable to every task Opus performs in that repo, using pointers to other files instead of inlining examples or code.[^3][^1]

Concrete targets and patterns:
- Keep the *behavioral* section under a few hundred tokens; additional project knowledge should be mostly pointers like "See `docs/workflows/feature-dev.md`" or "See `tasks/lessons.md` for common pitfalls".[^4][^5][^1]
- Remove anything Claude already does well without being told (e.g., "write clean code"), and migrate procedural checklists into hooks, skills, or task‑specific markdown that is only loaded when relevant.[^9][^3]

## Modular documentation layout

Anthropic’s Claude Code docs and multiple practitioner write‑ups describe better results from modular, role‑specific markdown rather than a monolithic CLAUDE.md. Typical structures split long‑lived project memory, style rules, workflows, and ephemeral notes into separate files that Claude can selectively read based on the current task.[^7][^5][^8][^1][^3]

A battle‑tested repo layout:
- `CLAUDE.md`: project why/what/how, model behavior invariants, and links to other docs.[^1][^7]
- `docs/` or `.claude/` subfolder with files like `ARCHITECTURE.md`, `WORKFLOWS.md`, `TESTING.md`, and `lessons.md`, which house details that do *not* need to be injected into every task up front.[^5][^8][^4][^1]
- Optional `agents/` or `skills/` folder where each agent/skill has its own brief spec following Anthropic’s Skills guide (purpose, when to trigger, how to use tools, and examples).[^10][^9]

## Global vs project CLAUDE.md

Claude Code distinguishes between project‑level CLAUDE.md (tracked in the repo) and more global guidance tied to the user or machine, and newer docs suggest importing personal notes rather than relying on deprecated local‑memory files. Community experience with Opus 4.6 personas shows that a compact, global persona block can materially change coding behavior when kept under a few hundred tokens.[^11][^12][^5]

Effective separation:
- **Global CLAUDE.md / persona**: who Opus should be for you in general (tone, collaboration style, risk posture, brevity, and default planning behavior), kept tiny and stable.[^2][^11]
- **Project CLAUDE.md**: what this particular codebase is, how to work safely within it, and project‑specific workflows; this travels with the repo and is version‑controlled.[^7][^4][^5]

## lessons.md as a learning surface

While Anthropic does not prescribe a specific `lessons.md` file, their Skills guide and multiple community skills center on exactly this idea: structured capture of mistakes, fixes, and reusable patterns that upgrade Claude’s future behavior. Several Claude Code skills explicitly implement "lessons learned" and retrospectives that read recent history, extract insights, and either emit markdown or update a shared knowledge store.[^13][^14][^15][^16][^9]

A practical `lessons.md` pattern:
- Store lessons as small, consistently‑structured entries: context or trigger, mistake/anti‑pattern, correct pattern, and a short example or pointer (e.g., to a PR or commit).[^14][^15][^13]
- Tag each lesson with scope (repo‑only, organization‑wide, or global) and maturity (new, confirmed, deprecated) so Opus can prioritize which to treat as hard rules versus soft suggestions.[^15][^13]

## Lesson lifecycle and “graduation”

Some public Claude skills implement a "lesson graduation" system: retrospectives write many raw observations, but only repeatedly useful ones get promoted into CLAUDE.md or global rules. This avoids bloating CLAUDE.md while still letting the system get smarter over time.[^17][^13][^15]

A battle‑tested lifecycle, consistent with Anthropic’s Skills guidance:
- At the end of a session or milestone, run a retrospective flow (manual or via a skill) that reads the conversation or JSONL log and outputs a structured markdown summary and candidate lessons.[^13][^14][^15]
- Periodically review lessons; promote the small subset that are clearly evergreen into CLAUDE.md or a dedicated skill, and retire ones that are obsolete or overly specific.[^9][^15][^13]

## How this interacts with Opus 4.6

Anthropic’s Opus 4.6 prompt‑engineering docs emphasize that this model already does more implicit planning, exploration, and sub‑agent‑like reasoning, especially at higher `effort` and with extended thinking enabled. Overly detailed instructions to "always be exhaustive" or "always research deeply" can now cause wasteful context gathering and slow responses if not tempered.[^6][^2]

To maximize both quality and performance:
- In CLAUDE.md, steer Opus 4.6 toward *minimal sufficient* exploration ("gather just enough context to act safely") and away from unconstrained research, and explicitly instruct it to avoid unnecessary abstractions and file creation.[^8][^2][^3]
- Use `lessons.md` entries to encode concrete cases where Opus over‑ or under‑did it (e.g., "created new service when a small change to X would do") and link those lessons from CLAUDE.md so the model can self‑correct using real project history.[^15][^2][^13]

## Testing and iteration

Both Anthropic and experienced Claude Code users treat CLAUDE.md and related docs as living artifacts: they are measured by observed behavior, not elegance on paper. Recommended practice is to change one thing at a time, run the same tasks, and see whether failure modes (ignored rules, over‑engineering, missing tests) actually improve.[^18][^19][^3][^9][^8]

A simple but effective testing loop:
- Log notable failures (and their fixes) into `lessons.md`, then revise wording or placement in CLAUDE.md when a pattern repeats.[^14][^3][^13]
- For Opus 4.6 specifically, watch for over‑use of tools, long digressions, or defensive behavior in coding sessions and adjust the small persona/behavior block rather than piling more rules into the main file.[^11][^2][^3]

---

## References

1. [Writing a good CLAUDE.md | HumanLayer Blog](https://www.humanlayer.dev/blog/writing-a-good-claude-md) - The following section provides a number of recommendations on how to write a good CLAUDE.md file fol...

2. [Prompting best practices - Claude API Docs](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) - Comprehensive guide to prompt engineering ... Claude Opus 4.5 and Claude Opus 4.6 are also more resp...

3. [Best Practices for Claude Code](https://code.claude.com/docs/en/best-practices) - This guide covers patterns that have proven effective across Anthropic's internal teams and for engi...

4. [Creating the Perfect CLAUDE.md for Claude Code - Dometrain](https://dometrain.com/blog/creating-the-perfect-claudemd-for-claude-code/) - Best Practices for CLAUDE.md · Keep It Concise · Treat It Like a Living Document · Version Control t...

5. [Claude Code Tutorial #2 - CLAUDE.md Files & /init - YouTube](https://www.youtube.com/watch?v=i_OHQH4-M2Y) - Comments · Claude Code Tutorial #3 - Context · Why Claude Code is the inflection point | Boris Chern...

6. [Introducing Claude Opus 4.6 - Anthropic](https://www.anthropic.com/news/claude-opus-4-6) - Opus 4.6 resolves software engineering issues across programming languages. ... A detailed descripti...

7. [Anthropic's Guide to Claude Code: Best Practices for Agentic Coding](https://www.reddit.com/r/ClaudeAI/comments/1k5slll/anthropics_guide_to_claude_code_best_practices/) - Anthropic recommends structuring your repo to make Claude "agentic" — i.e., act more like an intelli...

8. [Context Engineering: How I've Been Using Claude Code in My ...](https://alabeduarte.com/context-engineering-with-claude-code-my-evolving-workflow/) - This article shares a workflow I've been experimenting with over a couple of months using Claude Cod...

9. [[PDF] The Complete Guide to Building Skills for Claude | Anthropic](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf?hsLang=en) - Skills are the knowledge layer on top - capturing the workflows and best practices you already know,...

10. [Anthropic's Full Claude Skills Guide In 22 Minutes - YouTube](https://www.youtube.com/watch?v=TzJecWCbex0) - ... Anthropic just dropped a 33-page guide on building Skills for Claude ... Claude Code to remember...

11. [27-line system prompt persona that fixes Opus 4.6's ... - Reddit](https://www.reddit.com/r/ClaudeCode/comments/1rfl6i0/27line_system_prompt_persona_that_fixes_opus_46s/) - I built a system prompt persona that completely changes how Opus 4.6 relates to you during coding se...

12. [Sonnet 4.6 Just Dropped. Here's a Prompt That Tells You Exactly ...](https://limitededitionjonathan.substack.com/p/the-only-sonnet-46-breakdown-thats) - When Anthropic dropped Opus 4.6 a couple weeks ago, I built a prompt that reads the entire announcem...

13. [Development Retrospective - Claude Code Skill for Post-Mortems](https://mcpmarket.com/tools/skills/development-retrospective) - Reviews completed project milestones and captures hard-won lessons to build organizational memory an...

14. [Building a session retrospective skill for Claude Code](https://www.accidentalrebel.com/building-a-session-retrospective-skill-for-claude-code.html) - A Claude Code skill that reads the session JSONL history and generates a human-readable markdown ret...

15. [How We Use Claude Code Skills to Run 1,000+ ML Experiments a ...](https://huggingface.co/blog/sionic-ai/claude-code-skills-training) - Before closing the session, you type /retrospective . Claude reads through your conversation, extrac...

16. [Lessons Learned Claude Code Skill | AI Development Retro](https://mcpmarket.com/es/tools/skills/lessons-learned-retrospectives) - Capture project insights and reusable patterns with the Lessons Learned skill for Claude Code. Autom...

17. [fix: rrr command should append lessons learned to CLAUDE.md #15](https://github.com/laris-co/alchemist/issues/15) - Retrospective includes 'Lessons Learned' section; These lessons stay in the retrospective file only;...

18. [6 Weeks of Claude Code - Puzzmo Blog](https://blog.puzzmo.com/posts/2025/07/30/six-weeks-of-claude-code/) - Claude Code has considerably changed my relationship to writing and maintaining code at scale. I sti...

19. [The COMPLETE "Wait, I Can Use Claude Code?!" Guide (Yes, you ...](https://natesnewsletter.substack.com/p/the-complete-wait-i-can-use-claude) - Start with the setup guide to try one workflow end-to-end. Then read the principles before your seco...
