[Back](./index.md)

```javascript
// Measuring elements
const Example = () => {
    const measureRef = React.useCallback((node) => {
        if (node) {
            const boundingRect = node.getBoundingClientRect();
            // do something with the bounding rect
        }
    }, []);

    return (<div ref={measureRef}></div>);
}
```

```javascript
// Autofocus
const Example = () => {
    const autofocusRef = React.useCallback((node) => {
        node?.focus();
    }, []);

    return (<input ref={autofocusRef}></input>);
}
```

[Back](./index.md)
