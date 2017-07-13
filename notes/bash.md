[Back](../README.md)

## Ifs

Command | Description
---|:---
`-d $X$` | $X$ exists and is a directory
`-a` | And
`-o` | Or
`-z $X$` | if $X$ has no value
`-s $X$` | if x is a file and has >0 size

## Command line menu

Simple menu with two choices YES and NO
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

## Current date formatted
```
local NOW=`date +"%Y_%m_%d__%H_%M"`;
```

## Exit on error
```
set -e
```

## Navigate to script directory
```
cd "${0%/*}"
```

[Back](../README.md)
