[Back](./index.md)

## Claude Code

### Usage reference

#### CLI params

- `-c` continue recent conversation
- `mcp` configure mcp servers

#### Quick commands

- `/` Command or skill prefix
- `!` Bash mode
- `@` Mentioning a file (autocomplete)

#### Hotkeys

- <kbd>Shift</kbd> + <kbd>Tab</kbd> – Switch between modes (plan, auto-accept, regular)
- <kbd>Option</kbd> + <kbd>P</kbd> – Switch model
- <kbd>Ctrl</kbd> + <kbd>R</kbd> – Search prompt history (<kbd>Tab</kbd> select and edit, <kbd>Enter</kbd> select and execute)
- <kbd>Ctrl</kbd> + <kbd>L</kbd> – Clear the terminal window
- <kbd>Ctrl</kbd> + <kbd>S</kbd> – Stash current prompt
- <kbd>Esc</kbd> <kbd>Esc</kbd> – Clear current prompt
- <kbd>Ctrl</kbd> + <kbd>G</kbd> - Manual plan edit 

#### Commands

- `/clear` - clear context
- `/btw` - ask quick question that will not clutter the main context. Access to the current context, no tool access, no conversations – single answer
- `/compact [instructions]` - compact the context with optional focus instructions
- `/copy [N]` - Copy the latest response to clipboard. Can target Nth response instead of the latest
- `/rename [name]` - Set name for current session
- `/resume [session]` - Resume session by name
- `/stats` - Show daily usage etc.

### Configuration

#### CLAUDE.md

`.claude/CLAUDE.md` / `CLAUDE.md`

Markdown files with context included in every prompt. Read at the session start. Can be defined in the project directory or in the user directory.

- Max 200 lines per file
- Should use Markdown headers and bullets to group related instructions
- Should contain specific instructions (can be verified)
- Can import more files using `@path/to/import` syntax

If repository uses `AGENTS.md` you can create `CLAUDE.md` file that iports it.

Project can contain multiple `CLAUDE.md` files nested in directories. Claude will read them from most to least specific.

Sections:
- Project context - what the project is about
- Tech Stack - important dependencies, tools used
- Project structure - how the project is organized; directories, modules and their purpose
- Workflow - commands to run, test, generate code etc.the
- Code style preferences - specific conventions to be used everywhere (if only applicable for some files, consider adding rules instead)
- Additional information 
  - links to files with some other specific information - documentation, specifications, ADRs
  - Environment requirements

#### Rules

`.claude/rules/<name>.md`

Frontmatter
- `paths` (array) - define for which files the rule applies - uses GLOB syntax.

#### Skills

`.claude/skills/<name>/SKILL.md` - main entrypoint
`.claude/skills/<name>/**` - additional files adding context

Frontmatter section
```
---
<content>
---
```
- `name:` - skill name
- `description:` - what the skill does and when to use it. Used by Claude to determine when to apply the skill
- `argument-hint:` - hint shown during autocomplete, e.g. `[filename]`
- `context:` - `fork` will create a subagent for skill execution
- `agent:` - specify which subagent should be used for the execution
- `disable-model-invocation:` - `true` will prevent Claude from using the skill automatically, it could be only used manually as `/` command
- `user-invocable:` - `false` will hide the skill from `/` menu
- `paths` - glob patterns that limit skill usage.

When skill description contains 
```
!`<command>`
```
or
```
```!<commands multiline>```
```
it will resolve the commands and include the output in the prompt given to Clause

#### Output styles

[https://code.claude.com/docs/en/output-styles]

Can be used to customize the communication with Claude Code in a similar way as the LLM system prompts do.

[Back](./index.md)
