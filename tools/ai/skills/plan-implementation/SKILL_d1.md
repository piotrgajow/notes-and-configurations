---
name: implementation-plan-create
description: Prepare an implementation plan for a task
argument-hint: [task]
disable-model-invocation: true
---

Analyse the task to be solved:

$ARGUMENTS

Prepare a step-by-step plan to implement required changes – which files should be changed, what should be updated. Each step should be a separate commit – suggest a commit message (it should be about one thing). After each step, all the verifications should pass.

Remember about updating relevant documentation in the `./docs` directory.

+ Prepare a step-by-step plan and save it to `.ai/dev/` directory.
+ Each step should include both code changes and their corresponding test updates.


## Key points:

- **No edits allowed** — only the plan file can be written/edited; all other actions must be read-only.
- Write the plan to `.ai/dev/` directory, unless there is a specific instruction from the user to write it elswhere.
- Update unit tests along the code changes
- Remember about updating relevant documentation
- Each planned step result should pass verification checks


## Workflow

- Phase 1: Understanding the Request
    - Explore the project documentation – if unsure where the documentation is, ask the user and suggest adding that information to `AGENTS.md` file
    - Assess what information you already have and what is missing
    - Prepare a plan to gather the missing information (reading the codebase, searching the internet, etc.)
    - Present the plan to the user for approval
    - On approval launch up to 3 Explore agents in parallel to gather all the information required
- Phase 2: Design
    - Launch up to 3 Plan agents to design the implementation.





The plan mode system prompt was injected into this conversation as a <system-reminder> when plan mode was active. Here's what it contained:




  ---

3. 5-phase workflow:
    - Phase 1 (Initial Understanding): Launch up to 3 Explore agents in parallel to understand the codebase.
    - Phase 2 (Design): Launch up to 3 Plan agents to design the implementation.
    - Phase 3 (Review): Read critical files, ensure alignment with user intent, use AskUserQuestion for clarifications.
    - Phase 4 (Final Plan): Write the final plan to the plan file. Must include Context, recommended approach, critical file paths, reusable utilities, and a verification section.
    - Phase 5: Call ExitPlanMode to signal completion.
4. Turn-ending rule: Every turn must end with either AskUserQuestion or ExitPlanMode.

  ---
This is the reason Correction 1 happened — the system prompt told me to write the plan to .claude/plans/snazzy-purring-firefly.md and follow its own 5-phase workflow. It doesn't reference custom skills like
/implementation-plan or project conventions like the .ai/dev/ directory.

This means the fix should go into the plan mode system prompt configuration if possible, or into CLAUDE.md which gets loaded into context regardless of mode — ensuring the .ai/dev/ convention and docs reminder
are always visible.
