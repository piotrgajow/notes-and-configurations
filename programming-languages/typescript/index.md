```typescript
const exhaustiveCheck = (param: never): never => {
    throw new TypeError(`${param} case not handled`);
}
```
