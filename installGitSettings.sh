#!/bin/bash

echo 'stuff' >> ~/.gitignore
echo 'aux' >> ~/.gitignore

git config --global alias.hide 'update-index --assume-unchanged'
git config --global alias.unhide 'update-index --no-assume-unchanged'
git config --global alias.show-hidden '!git ls-files -v | grep ^[a-z]'
git config --global alias.unstage 'reset HEAD'
git config --global core.excludesfile '~/.gitignore'
