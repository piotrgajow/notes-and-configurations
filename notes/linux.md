[Back](../README.md)

[Explain Shell webpage](http://explainshell.com/)

# Commands

Command | Parameter |Description
---|:---
`uniq` || Removes duplicate lines from a file (requires the file to be sorted first)
| `-c` | Counts number of occurrences
`cut` || Cuts out part of input
| `-c$X$-$Y$` | Cuts characters located in position from $X$ to $Y$
| `-d'$X$' -f$N$` | Cuts $N$'th element when splitting by $X$ delimiter
`wc` || Count number of words
`tar` || Tar archiving Utility
| `-xzf` | Extract .tar.gz file
`gunzip` || Extract .gz file
`df` || File system disk usage
| `-h` | Human readable format
`sort` || Sorting utility
| `-n` | numeric sorting
| `-r` | reverse sorting


<kbd>Ctrl</kbd> + <kbd>L</kbd> | Clear terminal window
<kbd>Ctrl</kbd> + <kbd>U</kbd> | Copies current command into clipboard
<kbd>Ctrl</kbd> + <kbd>Y</kbd> | Pastes command from clipboard
<kbd>Ctrl</kbd> + <kbd>A</kbd> | Sets cursor at the beginning of the line
<kbd>Ctrl</kbd> + <kbd>E</kbd> | Sets cursor at the end of the line
<kbd>Ctrl</kbd> + <kbd>K</kbd> | Removes text after cursor
<kbd>Alt</kbd> + <kbd>Backspace</kbd> | Removes last word

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

# grep

Parameter | Description
---|:---
`-v` | Reverse matching / select lines not containing ...
`-e $PATTERN$` | Add additional $PATTERN$ to the search (OR)
`-c` | Count occurrences
`-n` | Prefix each line with line number
`-A $X$` | Print $X$ lines after found line
`-B $X$` | Print $X$ lines before found line
`-C $X$` | Print $X$ lines before and after line

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

# Vi

```
:%s/A/B/gc
    Replace A with B in the whole file with confirmation
u
    Undo change
v
    Select characters
V
    Select lines
d
    Cut selected
y
    Copy selected
P   
    Paste before cursor
p
    Paste after cursor
```

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
