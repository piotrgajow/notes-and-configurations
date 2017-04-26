# Notes
Contains notes regarding usefull hotkeys and commands

* [IntelliJ Idea hotkeys](notes/intellijHotkeys.md)
* [Linux](notes/linux.md)
* [Bash](notes/bash.md)
* [Git](notes/git.md)

# Configurations
Repository for configuration files used in development tools

### MySQL

#### Configuration files

* [my.cnf](config/mysql/my.cnf) - File containing configuration for mysql CLI. Should be copied to MySQL ROOT installation directory

### Sublime Text 3

#### COnfiguration files

* [preferences.json](config/sublime/preferences.json) - Content of this file should be copied into 'Preferences.sublime-settings User' (Sublime -> Preferences -> Settings OR Settings - User)

* [keymap.json](config/sublime/keymap.json) - Content of this file should be cpoied into 'Default (Windows).sublime-keymap' (Sublime -> Preferences -> Key Bindings OR Key Bindings - Users)

#### Plugins
1. [Package control](https://packagecontrol.io/installation)
2. [Pretty Json - Json formatter](https://github.com/dzhibas/SublimePrettyJson)

### Git

#### Aliases

    git config --global alias.hide 'update-index --assume-unchanged'
    git config --global alias.unhide 'update-index --no-assume-unchanged'
    git config --global alias.show-hidden '!git ls-files -v | grep ^[a-z]'
    git config --global alias.unstage 'reset HEAD'

### Git Bash

Add contents of [scripts.sh](config/git/scripts.sh) to `~/.bashrc` file
