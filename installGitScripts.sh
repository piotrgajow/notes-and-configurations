#!/bin/bash

SCRIPTS=$(realpath $(dirname $0))/config/git/scripts.sh

echo '' >> ~/.bashrc
echo 'SCRIPTS='"$SCRIPTS" >> ~/.bashrc
echo 'test -f "$SCRIPTS" && . "$SCRIPTS"' >> ~/.bashrc
