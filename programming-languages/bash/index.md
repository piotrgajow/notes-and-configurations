[Back](../../README.md)

## Code oneliners

| Code                             | Description                                   |
|:---------------------------------|:----------------------------------------------|
| `cd "${0%/*}"`                   | Navigate to script directory                  |
| `set -e`                         | Exit script on error                          |
| `NOW=$(date +"%Y_%m_%d__%H_%M")` | Current formatted date saved into a variable  |
| `DIR=$(dirname <PATH>)`          | Directory part of `<PATH>`                    |
| `FILE=$(basename <PATH>)`        | File name (with extension) part of `<PATH>`   |
| `FILENAME=$(dirname <FILE>)`     | File name without extension of given `<FILE>` |

## If conditions

| Command    | Description                                    |
|:-----------|:-----------------------------------------------|
| `-d <VAR>` | Checks if `<VAR>` points to existing directory |
| `-a`       | And                                            |
| `-o`       | Or                                             |
| `-z <VAR>` | if `<VAR>` has no value                        |
| `-s <VAR>` | if `<VAR>` is a file and has >0 size           |

## Snippets

If argument not set exit

```bash
if [[ -z $1 ]]
then
  echo 'Error message'
  exit 1
fi
```

---

Execute a command `cmd`, show stdout normally in the console and also put it into a variable `RES`

```bash
RES=(cmd | tee /dev/tty)

```

---

A simple menu with two choices YES and NO

```bash
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
