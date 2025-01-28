[Back](../../README.md)

`jq '<COMMAND>' <JSON_FILE> > <OUT_FILE>`

## Options

| Option | Description                                                  |
|:-------|:-------------------------------------------------------------|
| `-s`   | Load multiple files into json array                          |
| `-r`   | Raw output - new line delimiter & remove quotes from strings |

## Syntax

### to_entries

Converting object to array of { key, value } objects

<details>
<summary>Example</summary>

Input:

```json
{
  "name": "John",
  "surname": "Doe",
  "age": 36
}
```

Command: `to_entries`

Output:

```json
[
  {
    "key": "name",
    "value": "John"
  },
  {
    "key": "surname",
    "value": "Doe"
  },
  {
    "key": "age",
    "value": 36
  }
]
```

</details>

### // - Alternative Operator

Alternative operator `//` filters truthy values from the left side and if no values are present uses the values on the
right.

<details>
<summary>Example 1</summary>

Input:

```json
{
  "name": "John",
  "surname": "Doe",
  "email": "john.doe@test.com",
  "age": 36
}
```

Command: `{ login: (.login //.email // "missing")  }`

Output:

```json
{
  "login": "john.doe@test.com"
}
```

</details>

<details>
<summary>Example 2</summary>

Input:

```json
{
  "name": "John",
  "surname": "Doe",
  "age": 36
}
```

Command: `{ login: (.login //.email // "missing")  }`

Output:

```json
{
  "login": "missing"
}
```

</details>

### reduce

Array reducing into single item

`reduce $EXPRESSION as $$VARIABLE ($INIT; $UPDATE)`

<details>
<summary>Example</summary>

Input:

```json
[
  1,
  2,
  3,
  4,
  5
]
```

Command: `reduce .[] as $it (0; . + $it)`

Output:
```json
15
```

</details>

## Utility methods

It is possible to define custom utility methods in jq:

`def $NAME($PARAMS): $BODY;`

### countBy

Process array of objects and count occurrences of values for given property key.

```
def countBy($key): group_by(.[$key]) | map ({ message: .[0].[$key], count: length })
```

<details>
<summary>Example</summary>

Input:

```json
[
  {
    "group": "A",
    "content": "foo"
  },
  {
    "group": "A",
    "content": "bar"
  },
  {
    "group": "B",
    "content": "foo"
  },
  {
    "group": "B",
    "content": "baz"
  },
  {
    "group": "C",
    "content": "bar"
  },
  {
    "group": "C",
    "content": "baz"
  }
]
```

Command: `countBy("content")`

Output:

```json
[
  {
    "message": "bar",
    "count": 2
  },
  {
    "message": "baz",
    "count": 2
  },
  {
    "message": "foo",
    "count": 2
  }
]
```

</details>

### groupByAppend

Process array of objects and group them by given key. Objects sharing the same key value will be combined into an array.

```
def groupByAppend($key): reduce .[] as $it ({}; .[$it[$key]] = (.[$it[$key]] // []) + [$it])
```

<details>
<summary>Example</summary>

Input:

```json
[
  {
    "group": "A",
    "content": "foo"
  },
  {
    "group": "A",
    "content": "bar"
  },
  {
    "group": "B",
    "content": "foo"
  },
  {
    "group": "B",
    "content": "baz"
  },
  {
    "group": "C",
    "content": "bar"
  },
  {
    "group": "C",
    "content": "baz"
  }
]
```

Command: `groupByAppend("group")`

Output:

```json
{
  "A": [
    {
      "group": "A",
      "content": "foo"
    },
    {
      "group": "A",
      "content": "bar"
    }
  ],
  "B": [
    {
      "group": "B",
      "content": "foo"
    },
    {
      "group": "B",
      "content": "baz"
    }
  ],
  "C": [
    {
      "group": "C",
      "content": "bar"
    },
    {
      "group": "C",
      "content": "baz"
    }
  ]
}
```

</details>

### extendByCapture

Process array of objects and extend each of them by extracting data from regex capture groups run on a given property.

```
def extendByCapture($key; $pattern): map(. + ((.[$key] | capture($pattern)) // {}));
```

<details>
<summary>Example</summary>

Input:

```json
[
  {
    "msg": "Error [A] Because foo",
    "time": 1
  },
  {
    "msg": "Error [B] Because foo",
    "time": 2
  },
  {
    "msg": "Error [C] Because foo",
    "time": 3
  },
  {
    "msg": "Error [A] whatever something else",
    "time": 4
  },
  {
    "msg": "Error [B] Because bar",
    "time": 5
  }
]
```

Command: `extendByCapture("msg"; "Error \\[(?<type>.*)] Because (?<reason>.*)")`

Output:

```json
[
  {
    "msg": "Error [A] Because foo",
    "time": 1,
    "type": "A",
    "reason": "foo"
  },
  {
    "msg": "Error [B] Because foo",
    "time": 2,
    "type": "B",
    "reason": "foo"
  },
  {
    "msg": "Error [C] Because foo",
    "time": 3,
    "type": "C",
    "reason": "foo"
  },
  {
    "msg": "Error [A] whatever something else",
    "time": 4
  },
  {
    "msg": "Error [B] Because bar",
    "time": 5,
    "type": "B",
    "reason": "bar"
  }
]

```

</details>

## Example usage

### Count number of dependencies from package-lock.json file

```
jq '.packages | length - 1' package-lock.json
```

Takes the value at `packages` key (object containing all packages) from `package-lock.json`, calculates the number of
keys and subtracts 1 (the package itself under `""` key) to get number of dependencies.

### Copy properties from one file to another

Take value of `"prop-name"` from `from.json` and put it into `to.json`, save the result into `result.json`

```
jq -s '.[1]."prop-name" = .[0]."prop-name" | .[1]' from.json to.json > result.json
```

Uses `-s` option to load multiple files into json array, perform assignment of value to second one based on the first
one, and select the second one for output

### Filter array property

```
jq '.path.to.array = (.path.to.array | map(select(condition)))' source.json > result.json
```

E.g.

```
jq '.logStreams = (.logStreams | map(select(.lastEventTimestamp > 1695195892000)))' source.json > result.json
```

### Filter array by type and/or property

E.g.

Filter array for objects with "page" property defined

```
jq '.[] | select(type == "object") | select(has("page"))' source.json > result.json
```

### Select array items by index

`.[5:15]` - select items 5 - 15

`.[:50]` - select first 50 items

### Take selected fields from an object

`{ field1, field2 }` - create new object with only `field1` and `field2` keys.

`.[] | map({ foo, bar })` - map array of objects by selecting keys `foo` and `bar`

[Back](../../README.md)
