[Back](../../README.md)

## Conde oneliners

Code | Description
---:|:---
`cd "${0%/*}"` | Navigate to script directory
`set -e` | Exit script on error
`NOW=$(date +"%Y_%m_%d__%H_%M")` | Current formatted date saved into a variable

## If conditions

Command | Description
---:|:---
`-d <VAR>` | Checks if `<VAR>` points to existing directory
`-a` | And
`-o` | Or
`-z <VAR>` | if `<VAR>` has no value
`-s <VAR>` | if `<VAR>` is a file and has >0 size

## Command line menu

A simple menu with two choices YES and NO

```
select YN in 'YES' 'NO'
do
    case $YN in
    'YES' ) echo 'Ok';;
    'NO' )  exit;;
    * ) continue;;
    esac
break
done
```

[Back](../../README.md)
