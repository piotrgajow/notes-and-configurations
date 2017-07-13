[Back](../README.md)

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
