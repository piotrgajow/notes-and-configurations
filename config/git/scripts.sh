# Utility

function killall {
    ps | grep "$1" | tr  -s ' ' | cut -d' ' -f2 | xargs kill
}

# Grails

export GRAILS_HOME=/d/tools/grails/3.2.7
export PATH="$PATH:$GRAILS_HOME/bin"

# MySQL

export MYSQL_HOME=/d/tools/mysql/5.7.17

alias mysqlstart="$MYSQL_HOME/bin/mysqld &"
alias mysqlend="killall mysqld"
alias mysql="winpty $MYSQL_HOME/bin/mysql"
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

# Liquibase

export LIQUIBASE_HOME=/d/tools/liquibase/3.5.3
export PATH="$PATH:$LIQUIBASE_HOME"

# Sublime Text

export SUBLIME_HOME="/d/Programs/Sublime Text 3"
function subl {
    "$SUBLIME_HOME"/sublime_text.exe $@ &
}

# mongoDB

export MONGO_HOME=/d/Programs/mongodb/3.0.11

function mongostart {
    "$MONGO_HOME"/bin/mongod.exe --dbpath "$MONGO_HOME"/data/db > "$MONGO_HOME"/run.log &
}
function mongoend {
    killall mongod
}
function mongo {
    "$MONGO_HOME"/bin/mongo
}
function mongorestore {
    read -p 'Database dump directory: ' DB_DIR
    "$MONGO_HOME"/bin/mongorestore.exe --drop "$DB_DIR"
    echo "Restored mongoDB database"
}

# Maven

export MAVEN_HOME=/c/tools/maven/3.3.9
export PATH="$PATH:$MAVEN_HOME/bin"
