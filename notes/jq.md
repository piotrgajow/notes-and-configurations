[Back](../README.md)

# jq

## Copy properties from one file to another

Take `"prop-name"` from `from.json` and put it into `to.json`, save the result into `result.json`

Uses `-s` option to load multiple files into json array, perform assignment of value to second one based on the first one, and select the second one for output

```
jq -s '.[1]."prop-name" = .[0]."prop-name" | .[1]' from.json to.json > result.json
```

[Back](../README.md)
