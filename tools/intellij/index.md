[Back](../../README.md)

## Live Templates

|       Snippet | Description                                        |
|--------------:|:---------------------------------------------------|
| `$SELECTION$` | Body of the selected text (for surround templates) |
|       `$END$` | Puts cursor here at the end                        |

- [My templates](./live-templates.md)

## Http Client

- Any file with `.http` or `.rest` extension can be run with IntelliJ HTTP Client.
- Requests are delimited by `###`
- Comments can be added with z `#` or `//`
  - There is a doc-like syntax e.g. `# @name Request name`
- Allows importing from cURL or Postman
- Pre-request scripts can be run with `< {% script body %}` or `< path/to/script.js` (place at top)
- Post-response scripts can be run with `> {% script body %}` or `> path/to/script.js` (place at bottom)
- Response output can be redirected to file with `>> path/to/file` (creating new files) or `>>! path/to/file` (overwriting same file) 
- In-file variables with `@variable = value`

Format:
```
Method Request-URI HTTP-Version
Header-field: Header-value

Request-Body
```

### Scripts

- Scripts can include tests via `client.test(testName, function)` and `client.assert(condition, message)`
- `client.log` will print values to the runner console
- `jsonPath(json, path)` can be used to retrieve values from JSON (e.g. `$.key.array[0].prop`)
- `xpath(xml, path)` can be used to retrieve values from XML (e.g. `//key/array[1]/prop/text()`)
- `client.global.set` & `client.global.get` to store and retrieve global variables (string type!)
- `request.variables.set` set variables for given request

## Other

|                        Option | Description                                     |
|------------------------------:|:------------------------------------------------|
|      `Analyse > Inspect code` | Inspects code similarly as static code analysis |
| `Analyse > Locate duplicates` | Finds possible duplicated code lines            |

## Plugins

|                     Plugin | Link                                                          |
|---------------------------:|:--------------------------------------------------------------|
| String manipulation plugin | https://plugins.jetbrains.com/plugin/2162-string-manipulation |

[Back](../../README.md)
