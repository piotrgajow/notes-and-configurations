[Back](../README.md)

## rebase

### Interactive rebase commands

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
- m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]

### Splitting commit into parts during rebase

- Set `break` on commit you want to split
- `git reset HEAD^` - undo last commit
- Use regular `git add` & `git commit` to create multiple smaller commits
- Continue rebase with `git rebase --continue`

## log

Options | Description
---|:---
`X..Y` | Show log between two given commits
`--oneline` | Show only commit hash and subject

## checkout

Options | Description
---|:---
`-` | Checkout previous branch

## diff

Options | Description
---|:---
`--name-only` | Print only names of changed files

## bisect

Command | Description
---|:---
`start` | Start process of bisecting
`bad` | Mark current commit as bad
`good` | Mark current commit as good
`good $COMMIT$` | Mark given commit as good
`reset` | Reset bisecting process

## config
Fix errors with to long path names in Widnows (not tested)
`git config core.longpaths true`

[Back](../README.md)
