[Back](../../README.md)

## Hotkeys

| Hotkey                                                             | Description                                                  |
|:-------------------------------------------------------------------|:-------------------------------------------------------------|
| <kbd>Cmd</kbd> + <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | Take a screenshot of selected area and put it into clipboard |
| <kbd>Cmd</kbd> + <kbd>Shift</kbd> + <kbd>.</kbd>                   | Toggle showing hidden files in Finder                        |

## Terminal commands

| Command                                             | Description                             |
|:----------------------------------------------------|:----------------------------------------|
| `open -a 'Google Chrome' 'http://url.to.be.opened'` | Open url in a new tab of chrome browser |

## Swap tilde key script

```bash
#!/bin/bash

# ?? 0x700000035 `
# 0x7000000e7 right command
# 0x7000000e6 right option
# ?? 0x700000064 §
MAPPING='{"UserKeyMapping":['
MAPPING+='  {"HIDKeyboardModifierMappingSrc":0x700000035, "HIDKeyboardModifierMappingDst":0x700000064}'
MAPPING+=', {"HIDKeyboardModifierMappingSrc":0x700000064, "HIDKeyboardModifierMappingDst":0x700000035}'
MAPPING+=']}'

hidutil property --set "${MAPPING}"
```

[Back](../../README.md)
