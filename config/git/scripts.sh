# Utility
function killall {
    ps | grep "$1" | tr  -s ' ' | cut -d' ' -f2 | xargs kill
}
function checkHome {
    test -z "$1" && echo "Proper path variable in ~/.bashrc  file not set" &&  return 1
    test ! -d "$1" && echo "Proper path variable in ~/.bashrc does not point to valid directory" && return 1
    return 0
}
function addToPath {
    test -d "$1" && export PATH="$PATH:$1$2"
}
function gbash {
    start /git-bash.exe 
}
export -f killall checkHome addToPath gbash

# Git
addToPath "$GIT_SCRIPTS"

# Gradle
addToPath "$GRADLE_HOME" '/bin'

# Grails
addToPath "$GRAILS_HOME" '/bin'

# Groovy
addToPath "$GROOVY_HOME" '/bin'

# Java
addToPath "$JAVA_HOME" '/bin'

# Liquibase
addToPath "$LIQUIBASE_HOME"

# Maven
addToPath "$MAVEN_HOME" '/bin'

# mongoDB
function mongostart {
    checkHome "$MONGO_HOME" || return
    "$MONGO_HOME"/bin/mongod.exe --dbpath "$MONGO_HOME"/data/db > "$MONGO_HOME"/run.log &
}
function mongoend {
    checkHome "$MONGO_HOME" || return
    killall mongod
}
function mongo {
    checkHome "$MONGO_HOME" || return
    "$MONGO_HOME"/bin/mongo
}
function mongorestore {
    checkHome "$MONGO_HOME" || return
    read -p 'Database dump directory: ' DB_DIR
    "$MONGO_HOME"/bin/mongorestore.exe --drop "$DB_DIR"
    echo "Restored mongoDB database"
}
export -f mongostart mongoend mongo mongorestore

# MySQL
function mysqlstart {
    checkHome "$MYSQL_HOME" || return
    "$MYSQL_HOME"/bin/mysqld &
}
function mysqlend {
    checkHome "$MYSQL_HOME" || return
    killall mysqld
}
function mysql {
    checkHome "$MYSQL_HOME" || return
    winpty "$MYSQL_HOME"/bin/mysql.exe "$@"
}
function mysqldump {
    checkHome "$MYSQL_HOME" || return
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
    checkHome "$MYSQL_HOME" || return
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

# Node
addToPath "$NODE_HOME"

# Sublime Text
function subl {
    checkHome "$SUBLIME_HOME" || return
    "$SUBLIME_HOME"/sublime_text.exe $@ &
}
export -f subl
function sdiff {
    checkHome "$SUBLIME_HOME" || return
    f1=`realpath $1`
    d1=${f1:1:1}
    f2=`realpath $2`
    d2=${f2:1:1}
    "$SUBLIME_HOME"/subl.exe --command 'sbs_compare_files {"A": "'"$d1"':'"${f1:2}"'", "B":"'"$d2"':'"${f2:2}"'"}'
}
export -f sdiff

# Tomcat
function tomcatstart {
    checkHome "$TOMCAT_HOME" || return
	"$TOMCAT_HOME"/bin/startup.sh
}
function tomcatend {
    checkHome "$TOMCAT_HOME" || return
    "$TOMCAT_HOME"/bin/shutdown.sh
}
export -f tomcatstart tomcatend
