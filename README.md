# Notes
Contains notes regarding usefull hotkeys and commands

* [IntelliJ Idea](notes/intellij.md)
* [Linux](notes/linux.md)
* [Bash](notes/bash.md)
* [Git](notes/git.md)
* [MySQL](notes/mysql.md)
* [Google searching](notes/google.md)
* [Windows](notes/windows.md)
* [LaTeX](notex/latex.md)

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
3. [Compare Side-By-Side](https://packagecontrol.io/packages/Compare%20Side-By-Side)

### Git

- Execute `installGiSettings.sh` to add git aliases and setup global `.gitignore`
- Execute `installGitScripts.sh` to add custom commands to git bash (might require setting additional variables in `~/.bashrc`)
