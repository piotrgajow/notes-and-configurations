[Back](../../README.md)

## Hotkeys

Hotkey | Description
---|:---
<kbd>Shift</kbd> + <kbd>F10</kbd> | Simulate right mouse click

## Git Bash

### Utility functions

```bash
function killall {
    ps | grep "$1" | tr  -s ' ' | cut -d' ' -f2 | xargs kill
}
export -f killall
```

### MySQL

Requires `killall` function from utility section & setting of `MYSQL_HOME` variable.

```bash
export MYSQL_HOME= # PATH TO MYSQL DIR

function mysqlstart {
    "$MYSQL_HOME"/bin/mysqld &
}
function mysqlend {
    killall mysqld
}
function mysql {
    winpty "$MYSQL_HOME"/bin/mysql.exe "$@"
}
function mysqldump {
    read -p 'Databse user name: ' USER
    read -p 'Database host: ' HOST
    read -p 'Port: ' PORT
    read -p 'Database name: ' DB
    DATE=`date +%Y.%m.%d`
    DUMP_NAME="$HOST"'_'"$DB"'_'"$DATE"'.sql'
    winpty "$MYSQL_HOME"/bin/mysqldump.exe -R -u "$USER" -p -h "$HOST" -P "$PORT" "$DB"  --result-file=./"$DUMP_NAME"
    echo "$DB@$HOST dumped to file: $DUMP_NAME"
}
function mysqlimport {
    read -p 'Database user name: ' USER
    read -p 'Database dump file: ' DUMP_FILE
    read -p 'Database name: ' DB
    echo 'Clearing database'
    winpty "$MYSQL_HOME"/bin/mysql.exe -p -u "$USER" -e "DROP DATABASE IF EXISTS $DB; CREATE DATABASE $DB"
    echo 'Importing data from dump file'
    winpty "$MYSQL_HOME"/bin/mysql.exe -p -u "$USER" -e "source $DUMP_FILE" "$DB"
    echo 'Import finished.'
}
export -f mysqlstart mysqlend mysql mysqldump mysqlimport
```

### JQ

- [Download jq for Windows](https://stedolan.github.io/jq/download/)
- Put the executable somewhere (e.g. `~/tools/jq-win64.exe`)
- Add alias to `~/.bashrc` (e.g. `alias jq=~/tools/jq-win64.exe`)
- Enjoy!

### Sublime Text

Requires setting of `SUBLIME_HOME` variable.

```bash
export SUBLIME_HOME= # PATH TO SUBLIME DIR

function subl {
    "$SUBLIME_HOME"/sublime_text.exe "$@" &
}
export -f subl
```



[Back](../../README.md)
