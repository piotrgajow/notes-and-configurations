# Utility

function killall {
    ps | grep "$1" | tr  -s ' ' | cut -d' ' -f2 | xargs kill
}

# Grails

export PATH="$PATH:$GRAILS_HOME/bin"

# MySQL

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

export PATH="$PATH:$LIQUIBASE_HOME"

# Sublime Text

function subl {
    "$SUBLIME_HOME"/sublime_text.exe $@ &
}

# mongoDB

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

export PATH="$PATH:$MAVEN_HOME/bin"

# Tomcat

function tomcatstart {
	"$TOMCAT_HOME"/bin/startup.sh
}

function tomcatend {
	"$TOMCAT_HOME"/bin/shutdown.sh
}

# Groovy

export PATH="$PATH:$GROOVY_HOME/bin"

# Git

function git {
	if [ "$1" == "pushu" ]
	then
		command git rev-parse --abbrev-ref HEAD | xargs git push -u origin
	else
		command git "$@"
	fi
}
