[Back](../../README.md)

`jq '<COMMAND>' <JSON_FILE>`

## Options

| Option | Description                                                  |
|:-------|:-------------------------------------------------------------|
| `-s`   | Load multiple files into json array                          |
| `-r`   | Raw output - new line delimiter & remove quotes from strings |

## Example usage

## Count number of dependencies from package-lock.json file

```
jq '.packages | length - 1' package-lock.json
```

Takes the value at `packages` key (object containing all packages) from `package-lock.json`, calculates the number of keys and subtracts 1 (the package itself under `""` key) to get number of dependencies.

## Copy properties from one file to another

Take value of `"prop-name"` from `from.json` and put it into `to.json`, save the result into `result.json`

```
jq -s '.[1]."prop-name" = .[0]."prop-name" | .[1]' from.json to.json > result.json
```

Uses `-s` option to load multiple files into json array, perform assignment of value to second one based on the first one, and select the second one for output

## Filter array property

```
jq '.path.to.array = (.path.to.array | map(select(condition)))' source.json > result.json
```

E.g.

```
jq '.logStreams = (.logStreams | map(select(.lastEventTimestamp > 1695195892000)))' source.json > result.json
```


[Back](../../README.md)
