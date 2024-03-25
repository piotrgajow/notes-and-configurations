[Back](./index.md)

#### Configuration global

```shell
git config --global fetch.prune true
git config --global rebase.updateRefs true
git config --global rerere.enabled true
git config --global column.ui auto

git maintenance start
```

#### Global gitignore

```shell
touch ~/.gitignore
echo '__scripts__' >> ~/.gitignore
echo '__notes__' >> ~/.gitignore
echo '__stuff__' >> ~/.gitignore
echo '.idea' >> ~/.gitignore
echo '.DS_Store' >> ~/.gitignore
git config --global core.excludesfile '~/.gitignore'
```

[Back](./index.md)
