[Back](../README.md)

# Intellij

## Hotkeys

### Default

Hotkey                                                          | Settings                                          | Description
---:                                                            | ---                                               | :---
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>L</kbd>                 | Main menu > Code > Reformat Code                  | Format code
<kbd>Alt</kbd> + <kbd>F7</kbd>                                  | Main menu > Edit > Find > Find Usages             | Find usages
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>               | Main menu > Edit > Paste from History...          | Paste with possibility to choose from clipboard history
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Y</kbd>                 | Main menu > File > Synchronize                    | Synchronize project
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd>               | Main menu > Navigate > Class...                   | Open project file
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>V</kbd>                 | Main menu > Refactor > Extract > Variable...      | Extract variable refactoring
<kbd>Shift</kbd> + <kbd>F6</kbd>                                | Main menu > Refactor > Rename...                  | Rename
<kbd>Ctrl</kbd> + <kbd>N</kbd>                                  | Main menu > Navigate > File...                    | Open source file
<kbd>Ctrl</kbd> + <kbd>F2</kbd>                                 | Main menu > Run > Stop                            | Stop process
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>I</kbd>               | Main menu > View > Quick Definition               | Open function definition in small window
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>E</kbd>               | Main menu > View > Recently Changed Files         | Opens list of recently edited files
<kbd>Ctrl</kbd> + <kbd>0</kbd>..<kbd>9</kbd>                    | Other > Go to Bookmark n                          | Jumps to bookmark 0..9
<kbd>Ctrl</kbd> + <kbd>F5</kbd>                                 | Other > Rerun                                     | Rerun
<kbd>Alt</kbd> + <kbd>F12</kbd>                                 | Other > Terminal                                  | Toggle terminal view
<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd>..<kbd>9</kbd> | Other > Toggle Bookmark n                         | Adds/Deletes bookmark 0..9 on the current line of code
<kbd>Alt</kbd> + <kbd>Insert</kbd>                              | Other > New                                       | Create new file/folder
<kbd>Ctrl</kbd> + <kbd>Alt</kbd + <kbd>Left</kbd>               | Main menu > Navigate > Back                       | Jumps to previous (history) cursor position
<kbd>Ctrl</kbd> + <kbd>Alt</kbd + <kbd>Right</kbd>              | Main menu > Navigate > Forward                    | Jumps to next (history) cursor position
<kbd>Ctrl</kbd> + <kbd>B</kbd>                                  | Main menu > Navigate > Declaration                | Jump to declaration
<kbd>F2</kbd>                                                   | Main menu > Navigate > Next Highlighted Error     | Jump to next error/warning
<kdb>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>J</kbd>                 | Main menu > Code > Surround with Live Template... | Surround with live template
<kbd>Ctrl</kbd> + <kbd>Q</kbd>                                  | Main menu > View > Quick Documentation            | Show method documentation in a popup

### Custom

Hotkey                                             | Settings                                    | Description
---:                                               | ---                                         | :---
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Up</kbd>   | Editor Actions > Clone Caret Above          | Clones caret to line above enabling multiline edits
<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Down</kbd> | Editor Actions > Clone Caret Below          | Clones caret to line above enabling multiline edits
<kbd>Ctrl</kbd> + <kbd>D</kbd>                     | Editor Actions > Delete Line                | Delete current line
<kbd>Alt</kbd> + <kbd>S</kbd>                      | Editor Actions > Extend Selection           | Extend selected text
<kbd>Alt</kbd> + <kbd>LMB</kbd>                    | Main menu > Navigate > Declaration          | Go to method declaration
<kbd>Alt</kbd> + <kbd>Down</kbd>                   | Main menu > Code > Move Line Down           | Move current line down
<kbd>Alt</kbd> + <kbd>Up</kbd>                     | Main menu > Code > Move Line Up             | Move current line up
<kbd>Ctrl</kbd> + <kbd>W</kbd>                     | Main menu > Window > Editor Tabs > Close    | Close current window
<kbd>Alt</kbd> + <kbd>P</kbd>                      | Main menu > View > Toggle Presentation mode | Toggle presentation mode

## Templates

Template abbreviation | Description
---:                  | ---
soutm                 | Print current class and method name
soutv                 | Print variable name and value
soutp                 | Print method parameter names and values

### Writing new templates

Variable    | Description
---:        | ---
$SELECTION$ | Body of the selected text (for surround templates)

## Other features

- Analyse > Inspect code

Inspects code similarly as static code analysis

- Analyse > Locate duplicates

Finds possible duplicated code lines

[Back](../README.md)
