#!/bin/bash

SCRIPTS=$(realpath $(dirname $0))/config/git/scripts.sh

function addConfigLine {
    echo "$1" >> ~/.bashrc
}

addConfigLine '# Path variables'
addConfigLine ''
addConfigLine 'export ANDROID_SDK_ROOT='
addConfigLine 'export GIT_SCRIPTS='"$(realpath $(dirname $0))/config/git"
addConfigLine 'export GRADLE_HOME='
addConfigLine 'export GRAILS_HOME='
addConfigLine 'export GROOVY_HOME='
addConfigLine 'export LIQUIBASE_HOME='
addConfigLine 'export MAVEN_HOME='
addConfigLine 'export MONGO_HOME='
addConfigLine 'export MYSQL_HOME='
addConfigLine 'export NODE_HOME='
addConfigLine 'export SUBLIME_HOME='
addConfigLine 'export TOMCAT_HOME='
addConfigLine ''
addConfigLine 'SCRIPTS='"$SCRIPTS"
addConfigLine 'test -f "$SCRIPTS" && . "$SCRIPTS"'
addConfigLine ''
addConfigLine '# Git scripts autocompletion'
addConfigLine 'source /mingw64/share/git/completion/git-completion.bash'
addConfigLine '_git_cl () { __gitcomp_nl "$(__git_refs)"; }'
