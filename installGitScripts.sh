#!/bin/bash

SCRIPTS=$(realpath $(dirname $0))/config/git/scripts.sh

echo '# Path variables' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'export GRAILS_HOME=' >> ~/.bashrc
echo 'export GROOVY_HOME=' >> ~/.bashrc
echo 'export LIQUIBASE_HOME=' >> ~/.bashrc
echo 'export MAVEN_HOME=' >> ~/.bashrc
echo 'export MONGO_HOME=' >> ~/.bashrc
echo 'export MYSQL_HOME=' >> ~/.bashrc
echo 'export NODE_HOME=' >> ~/.bashrc
echo 'export SUBLIME_HOME=' >> ~/.bashrc
echo 'export TOMCAT_HOME=' >> ~/.bashrc
echo '' >> ~/.bashrc
echo 'SCRIPTS='"$SCRIPTS" >> ~/.bashrc
echo 'test -f "$SCRIPTS" && . "$SCRIPTS"' >> ~/.bashrc
