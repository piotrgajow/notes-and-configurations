# Plan: Sound Notifications for Claude Code

## Context

You want audible feedback for three key Claude Code lifecycle moments so you can multitask without constantly watching the terminal. Claude Code's **hooks system** lets us run shell commands on specific events — we'll use macOS's built-in `afplay` command to play system sounds.

## How Claude Code Hooks Work

Hooks are configured in `~/.claude/settings.json` under a `"hooks"` key. Each hook binds to a named event and runs a shell command when that event fires. The format is:

```json
"hooks": {
  "EventName": [
    {
      "matcher": "",
      "hooks": [
        { "type": "command", "command": "shell command here" }
      ]
    }
  ]
}
```

## Event-to-Hook Mapping

| You want sound when... | Hook Event | Matcher | Why this event |
|:---|:---|:---|:---|
| Claude Code starts | `SessionStart` | `""` (all) | Fires when a new session begins or resumes |
| Claude finishes a task | `Stop` | `""` (all) | Fires when Claude finishes responding |
| Claude needs your input | `Notification` | `idle_prompt` | Fires after 60s of waiting for user input |
| Claude needs permission | `Notification` | `permission_prompt` | Fires when Claude asks for tool permission |

## Sound Assignments

Three distinct macOS system sounds so you can tell events apart by ear:

| Event | Sound | Why |
|:---|:---|:---|
| Session starts | **Submarine** | Deep, rising tone — "diving in" |
| Task finished | **Hero** | Bright fanfare — completion |
| Needs input | **Glass** | Short alert chime — attention needed |

All sounds live at `/System/Library/Sounds/*.aiff` and play via `afplay`.

## Implementation

### Step 1: Edit `~/.claude/settings.json`

Add `hooks` key to the existing config (preserving current `permissions`, `effortLevel`, etc.):

```json
{
  "permissions": {
    "allow": [
      "Bash(node scripts/codeowners-check.mjs *)"
    ],
    "defaultMode": "default"
  },
  "syntaxHighlightingDisabled": false,
  "effortLevel": "medium",
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "afplay /System/Library/Sounds/Submarine.aiff"
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "afplay /System/Library/Sounds/Hero.aiff"
          }
        ]
      }
    ],
    "Notification": [
      {
        "matcher": "idle_prompt",
        "hooks": [
          {
            "type": "command",
            "command": "afplay /System/Library/Sounds/Glass.aiff"
          }
        ]
      },
      {
        "matcher": "permission_prompt",
        "hooks": [
          {
            "type": "command",
            "command": "afplay /System/Library/Sounds/Glass.aiff"
          }
        ]
      }
    ]
  }
}
```

**File:** `/Users/piotr.gajowniczek/.claude/settings.json`

### Step 2: Create documentation in notes repo

Create `index.md` at the sound-notifications plugin directory documenting the setup, available sounds, and customization options.

**File:** `/Users/piotr.gajowniczek/work/piotrgajow/notes-and-configurations/tools/ai/plugins/sound-notifications/index.md`

## Verification

1. **Test sounds manually** — run each command to confirm they play:
   - `afplay /System/Library/Sounds/Submarine.aiff`
   - `afplay /System/Library/Sounds/Hero.aiff`
   - `afplay /System/Library/Sounds/Glass.aiff`
2. **Restart Claude Code** — hooks load from settings.json at startup
3. **Verify SessionStart** — you should hear Submarine when Claude starts
4. **Verify Stop** — ask Claude a question and hear Hero when it finishes
5. **Verify Notification** — trigger a permission prompt or wait 60s idle to hear Glass

## Customization Notes

- **Change sound:** swap the `.aiff` filename (available: Basso, Blow, Bottle, Frog, Funk, Glass, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine, Tink)
- **Adjust volume:** add `-v 0.5` flag (range 0.0-1.0)
- **Disable one event:** remove its entry from hooks
- **Different sounds for idle vs permission:** change the `command` in each `Notification` matcher independently
