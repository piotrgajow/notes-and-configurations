[Back](../README.md)

[Explain Shell webpage](http://explainshell.com/)

# Hotkeys
Hotkey | Description
---|:---
<kbd>Ctrl</kbd> + <kbd>R</kbd> | Search in command history
<kbd>Ctrl</kbd> + <kbd>L</kbd> | Clear terminal window
<kbd>Ctrl</kbd> + <kbd>U</kbd> | Copies current command into clipboard
<kbd>Ctrl</kbd> + <kbd>Y</kbd> | Pastes command from clipboard
<kbd>Ctrl</kbd> + <kbd>A</kbd> | Sets cursor at the beginning of the line
<kbd>Ctrl</kbd> + <kbd>E</kbd> | Sets cursor at the end of the line
<kbd>Ctrl</kbd> + <kbd>K</kbd> | Removes text after cursor
<kbd>Alt</kbd> + <kbd>Backspace</kbd> | Removes last word

# history

`!!` - Runs previous command

`!!:` + `0..9` - Uses part of previous command

`cd -` - Returns to previous directory

`^string^replace` - Runs previous command with `string` replaced by `replace`

`{a,b,c}1` - Creates list of string `a1`, `b1`, `c1`

# curl
Data transfer using URL

Parameter | Description
---|:---
`-v`,`--verbose` | Verbose mode
`-I`,`--head` | Fetch Http headers only
`-L`,`--location` | In case of redirection, redoes the curl to the new address

# uname
Print system information

Parameter | Description
---|:---
`-a`,`--all` | Print all information

# nc
TCP/IP tool

Parameter | Description
---|:---
`-v` | Verbose mode
`-z` | Network scanning (zero-I/O mode)

# printenv
Print environment variables

# free
Display memory usage in the system

Parameter | Description
---|:---
`-m` | Use MiB unit for display

# apache

## apachectl
Apache server control interface

Command | Description
---|:---
`configtest` | Tests

## a2enmod a2dismod
Enable/Disable apache modules

## a2ensite a2dissite
Enable/Disable sites from sites-available

apache: apachectl a2enmod a2ensite a2dissite

[Back](../README.md)
