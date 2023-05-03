[Back](../../README.md)

[Explain Shell webpage](http://explainshell.com/)

## Hotkeys

| Hotkey                                | Description                              |
|:--------------------------------------|:-----------------------------------------|
| <kbd>Ctrl</kbd> + <kbd>R</kbd>        | Search in command history                |
| <kbd>Ctrl</kbd> + <kbd>L</kbd>        | Clear terminal window                    |
| <kbd>Ctrl</kbd> + <kbd>U</kbd>        | Copies current command into clipboard    |
| <kbd>Ctrl</kbd> + <kbd>Y</kbd>        | Pastes command from clipboard            |
| <kbd>Ctrl</kbd> + <kbd>A</kbd>        | Sets cursor at the beginning of the line |
| <kbd>Ctrl</kbd> + <kbd>E</kbd>        | Sets cursor at the end of the line       |
| <kbd>Ctrl</kbd> + <kbd>K</kbd>        | Removes text after cursor                |
| <kbd>Alt</kbd> + <kbd>Backspace</kbd> | Removes last word                        |

## Commands

| Command                    | Description                                                                                  |
|:---------------------------|:---------------------------------------------------------------------------------------------|
| `ln -s <x> <y>`            | Create a symbolic link where path `<X>` points to `<Y>`                                      |
| `sort -n`                  | Sort by numeric value                                                                        |
| `sort -r`                  | Sort in reverse order                                                                        |
| `uniq`                     | Remove duplicate lines from a file (requires the file to be sorted first)                    |
| `uniq -c`                  | Count the number of line occurrences in a file (requires the file to be sorted first)        |
| `cut -c<N>-<M>`            | Cut characters located at position from `<N>` to `<M>`                                       |
| `cut -d'<X>' -fN`          | Cur `<N>`'th element of string after splitting by delimiter `<X>`                            |
| `wc`                       | Count number of words                                                                        |
| `tar -xzf`                 | Extract tar archive                                                                          |
| `gunzip`                   | Extract .gz file                                                                             |
| `df -h`                    | File system disk usage in A human readable format                                            |
| `crontab -l`               | Show crontab rules configuration                                                             |
| `crontab -e`               | Open crontab rules for editing                                                               |
| `sudo service cron reload` | Reload cron service with updated rules                                                       |
| `grep -v`                  | Reverse matching / select lines not containing argument                                      |
| `grep -e <PATTERN>`        | Add additional `<PATTERN>` to the search (OR)                                                |
| `grep -c`                  | Count occurrences                                                                            |
| `grep -n`                  | Prefix each line with line number                                                            |
| `grep -A <X>`              | Print `<X>` lines after found line                                                           |
| `grep -B <X>`              | Print `<X>` lines before found line                                                          |
| `grep -C <X>`              | Print `<X>` lines before and after line                                                      |
| `fuser <PORT>/tcp`         | Find process using port `<PORT>` for TCP                                                     |
| `free`                     | Display memory usage in the system                                                           |
| `free -m`                  | Display memory usage in the system using MiB units                                           |
| `printenv`                 | Print environment variables                                                                  |
| `uname`                    | Print system information                                                                     |
| `uname -a`                 | Print all system information                                                                 |
| `xargs <CMD>`              | Used in pipes to run `<CMD>` for each output of previous command                             |
| `xargs -I{} <CMD>`         | Allows to place input in position of `{}` within `<CMD>`                                     |
| `xargs -P <N> <CMD>`       | Runs the `<CMD>` commands in parallel in max `<N>` processes (0 = as many as possible        | 
| `lsof -i tcp:<PORT>`       | Find process that is running on TCP port `<PORT>`                                            |
| `lsof -F <PARAMS>`         | Runs `lsof <PARAMS>` command which output will be suited for further processing (e.g. pipes) |
| `kill -9 <PID>`            | Kills process with given `<PID>`                                                             |
| `bash -c <CMD>`            | Runs `<CMD>` given by string in a subshell                                                   |

## Config

### Terminal prompt

| Shell | Setting                                                  |
|:------|:---------------------------------------------------------|
| ZSH   | export PROMPT='%F{green}%n@%m%f %F{yellow}%d%f'$'\n''$ ' |

### Custom functions

Useful functions that can be but e.g. in `.bashrc` file to be used globally

- `killbyport <PORT>`

Kills process that is using port `<PORT>`

```bash
function killbyport() {
	if [[ -z $1 ]]
	then
		echo 'Pass TCP port'
	else
		lsof -i tcp:"$1" -F | grep ^p | cut -c2- | xargs kill -9
	fi
}
```

## Crontab rules

- `m` - minute 0-59
- `h` - hour 0-23
- `dom` - day of month 1-31
- `mon` - month 1-12
- `dow` - day of week 0-7 (Sunday is both 0 and 7)
- `command` - command to be run

`1 * * * *` - Run one minute past every hour
`*/10 * * * *` - Run every 10 minutes

## Output redirection

Redirect all output into a `<FILE>>`
`command > <FILE> 2>&1`

## Setting environment variable for all users

- Create `*.sh`file in `/etc/profile.d/`
- Put in the file `export VARIABLE=value`

## Vim

| Command      | Description                                          |
|:-------------|:-----------------------------------------------------|
| `:%s/A/B/gc` | Replace A with B in the whole file with confirmation |
| `u`          | Undo change                                          |
| `v`          | Select characters                                    |
| `V`          | Select lines                                         |
| `d`          | Cut selected                                         |
| `y`          | Copy selected                                        |
| `P`          | Paste before cursor                                  |
| `p`          | Paste after cursor                                   |

[Back](../../README.md)
