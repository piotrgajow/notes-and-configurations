[Back](../README.md)

[Explain Shell webpage](http://explainshell.com/)

## Commands

- Sort by numeric value

  `sort -n`

- Sort in reverse order

  `sort -r`

- Create a symbolic link where path `X` points to `Y`

  `ln -s X Y`

- Remove duplicate lines from a file (requires the file to be sorted first)

  `uniq`

- Count the number of line occurrences in a file (requires the file to be sorted first)

  `uniq -c`

- Cut characters located at position from N to M

  `cut -cN-M`

- Cur N'th element of string after splitting by delimiter X

  `cut -d'X' -fN`

- Count number of words

  `wc`

- Extract tar archive

  `tar -xzf`

- Extract .gz file

  `gunzip`

- File system disk usage in human readable format

  `df -h`

- grep

Parameter | Description
---|:---
`-v` | Reverse matching / select lines not containing ...
`-e $PATTERN$` | Add additional $PATTERN$ to the search (OR)
`-c` | Count occurrences
`-n` | Prefix each line with line number
`-A $X$` | Print $X$ lines after found line
`-B $X$` | Print $X$ lines before found line
`-C $X$` | Print $X$ lines before and after line

## Hotkeys

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

`Ctrl + R` - Search command in history

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

# Processes and ports

`fuser 7000/tcp` - Find process using port 7000 for TCP

[Back](../README.md)
