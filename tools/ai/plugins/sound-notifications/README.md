# Sound Notifications

Sound notifications for Claude Code inspired and using sounds from [PeonPing](https://github.com/PeonPing)

## Setup

Copy the `_sounds` directory to `~/.claude/_sounds`.

Include the below hooks in the `settings.json` file under `"hooks": {}`:

```
"SessionStart": [
  {
    "matcher": "startup",
    "hooks": [
      {
        "type": "command",
        "command": "~/.claude/_sounds/play-random ~/.claude/_sounds/startup"
      }
    ]
  }
]
```

```
"Stop": [
  {
    "matcher": "",
    "hooks": [
      {
        "type": "command",
        "command": "~/.claude/_sounds/play-random ~/.claude/_sounds/task-completed"
      }
    ]
  }
],
```

```
"PermissionRequest": [
  {
    "matcher": "",
    "hooks": [
      {
        "type": "command",
        "command": "~/.claude/_sounds/play-random ~/.claude/_sounds/attention-needed"
      }
    ]
  }
]
```

## TBD

- Randomize sounds
- Include more events
- Darkest Dungeon? (https://liquipedia.net/dota2/Darkest_Dungeon_Announcer_Pack_(ft._Wayne_June), https://darkestdungeon.fandom.com/wiki/Narrator_(Darkest_Dungeon))
- Portal / GLaDOS?
