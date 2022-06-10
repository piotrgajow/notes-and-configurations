[Back](../../README.md)

## Aliases
Run [these commands](./configureAliases.md) to setup aliases. 

Alias | Description
---:|:---
`git ap` | Marks all files with intent-to-add and then runs add patch
`git st` | Status
`git ct` | Commit
`git cta` | Commit amend
`git co` | Checkout
`git fa` | Fetch all
`git rb` | Rebase
`git rbc` | Rebase continue
`git rbfmi` | Fetch latest master from origin and do interactive rebase on top of it
`git pushu` | Push with set upstream for current branch
`git branch-rename <NEW_NAME>` | Rename branch to `<NEW_NAME>`
`git branch-move <NAME> <HASH>` | Move branch `<NAME>` pointer to commit `<HASH>`
`git branch-cleanup` | Loads info about branches that were deleted on remote, and removes all those branches locally
`git branch-cleanup-merged` | Removes all branches that were merged
`git unstage` | Removes all files from staging
`git decommit` | Remove last commit - move all changes from commit to staging, move branch pointer to previous commit

## Rebasing

### Rebase interactive options

- p, pick <commit> = use commit
- r, reword <commit> = use commit, but edit the commit message
- e, edit <commit> = use commit, but stop for amending
- f, fixup <commit> = like "squash", but discard this commit's log message
- x, exec <command> = run command (the rest of the line) using shell
- d, drop <commit> = remove commit
- s, squash <commit> = use commit, but meld into previous commit
- b, break = stop here (continue rebase later with 'git rebase --continue')
- l, label <label> = label current HEAD with a name
- t, reset <label> = reset HEAD to a label
- m, merge \[-C \<commit\> | -c \<commit\>] \<label\> \[# \<oneline\>\]

### Splitting a commit into parts during rebase

- Set `break` on commit you want to split
- `git reset HEAD~1` (or alias `git decommit`) - undo last commit 
- Use regular `git add` & `git commit` to create multiple smaller commits
- Continue rebase with `git rebase --continue` (or alias `git rbc`)

## Bisecting

Command | Description
---:|:---
`git bisect start` | Start process of bisecting
`git bisect bad` | Mark current commit as bad
`git bisect good` | Mark current commit as good
`git bisect good <COMMIT>` | Mark commit given by hash `<COMMINT>` as good
`git bisect reset` | Reset bisecting process

## Referencing commits

Option | Description
---:|:---
`HEAD` | current commit
`<X>~<N>` e.g. `HEAD~1` | `<N>` commits in history of `<X>`, e.g. parent of `HEAD`
`@{-<N>}` e.g. `@{-1}` | `<N>` commits in reflog history
`-` | Shorthand for `@{-1}`

## Other useful commands

Command | Description
---:|:---
`git log X..Y` | Show log between two given commits
`git log --oneline` | Show only commit hash and subject
`git diff --name-only` | Show only names of changed files

## Custom commands

To enable scripts put them in `bin` directory of `Git` installation.

Command | File | Description
---:|---|:---
`git cl [<BRANCH>]` | [git-cl](./git-cl) | Counts number of changed lines between current branch and `<BRANCH>` (master by default)
`git heatmap [<N>]` | [git-heatmap](./git-heatmap) | Finds top `<N>` (10 by default) most frequently changed files in the repository

### Configuring auto-completion

Requires adding the following line to `.bashrc`

Enable auto-completion

```bash
source /mingw64/share/git/completion/git-completion.bash
```

Add branch name autocompletion to `git cl` command

```bash
_git_cl () { __gitcomp_nl "$(__git_refs)"; }
```

## Configuration

### Global gitignore settings
Create `.gitignore` file in user home with exclusions configured
```
echo '.idea' >> ~/.gitignore
echo '__scripts__' >> ~/.gitignore
```

Set up the file in git as global .gitignore
```
git config --global core.excludesfile '~/.gitignore'
```

### Auto prune
`git config --global fetch.prune true`

### Git bash (Windows) fix for error related to too long path names
`git config core.longpaths true`

### SSH keys
- Generate SSH key `ssh-keygen -t ed25519 -C "<EMAIL_ADDRESS>"`
- Specify file name (`<FILE_NAME>`) and passphrase
- Start ssh-agent `eval "$(ssh-agent -s)"`
- Ass ssh key to ssh-agent `ssh-add <FILE_NAME>`
- Add public key (content of `<FILE_NAME>.pub) to remote repository account

[Back](../../README.md)
