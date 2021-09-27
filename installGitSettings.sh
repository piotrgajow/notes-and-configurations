#!/bin/bash

echo 'stuff' >> ~/.gitignore
echo 'aux' >> ~/.gitignore
echo '.idea' >> ~/.gitignore

git config --global alias.hide 'update-index --assume-unchanged'
git config --global alias.unhide 'update-index --no-assume-unchanged'
git config --global alias.show-hidden '!git ls-files -v | grep ^[a-z]'
git config --global alias.unstage 'reset HEAD'
git config --global alias.pushu '!git rev-parse --abbrev-ref HEAD | xargs git push -u origin'
git config --global alias.ap '!git add -N . && git add -p'
git config --global alias.st 'status'
git config --global alias.ct 'commit'
git config --global alias.cta 'commit --amend'
git config --global alias.co 'checkout'
git config --global alias.fa 'fetch --all'
git config --global alias.branch-rename 'branch -m'
git config --global alias.branch-move 'branch -f'
git config --global alias.branch-cleanup '!git branch --merged | grep -v master | grep -v develop | tr "\n" " " | tr -s " " | xargs git branch -d'
git config --global alias.branch-cleanup-alt '!git fetch --prune && git branch -v | grep "\[gone\]" | awk "{print $1}" | xargs git branch -D'

git config --global core.excludesfile '~/.gitignore'
git config --global fetch.prune true
