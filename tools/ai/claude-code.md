[Back](./index.md)

## Claude Code

### CLI params

- `-c` continue recent conversation
- `mcp` configure mcp servers

### Quick commands

- `/` Command or skill prefix
- `!` Bash mode
- `@` Mentioning a file (autocomplete)

### Hotkeys

- <kbd>Shift</kbd> + <kbd>Tab</kbd> – Switch between modes (plan, auto-accept, regular)
- <kbd>Option</kbd> + <kbd>P</kbd> – Switch model
- <kbd>Ctrl</kbd> + <kbd>R</kbd> – Search prompt history (<kbd>Tab</kbd> select and edit, <kbd>Enter</kbd> select and execute)
- <kbd>Ctrl</kbd> + <kbd>L</kbd> – Clear the terminal window
- <kbd>Ctrl</kbd> + <kbd>S</kbd> – Stash current prompt
- <kbd>Esc</kbd> <kbd>Esc</kbd> – Clear current prompt

### Commands

- `/clear` - clear context
- `/btw` - ask quick question that will not clutter the main context. Access to the current context, no tool access, no conversations – single answer
- `/compact [instructions]` - compact the context with optional focus instructions
- `/copy [N]` - Copy the latest response to clipboard. Can target Nth response instead of the latest
- `/rename [name]` - Set name for current session
- `/resume [session]` - Resume session by name
- `/stats` - Show daily usage etc.

### Skills

#### Frontmatter

- `context: fork` - will create a subagent for skill execution
- `agent: <name>` - specify which subagent should be used for the execution

#### Inject context via commands

When skill description contains 
```
!`<command>`
```
or
```
```!<commands multiline>```
```
it will resolve the commands and include the output in the prompt given to Clause


[Back](./index.md)
