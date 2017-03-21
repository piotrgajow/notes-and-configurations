[Back](README.md)

# Command line menu

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

# Current date formatted 
```
local NOW=`date +"%Y_%m_%d__%H_%M"`;
```

[Back](README.md)
