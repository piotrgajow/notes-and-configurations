```typescript
const exhaustiveCheck = (param: never): never => {
    throw new TypeError(`${param} case not handled`);
}
```

```typescript
// unsafe
interface Bivariant<T> {
  call(x: T): void
}

// safe
interface Contravariant<T> {
  call: (x: T) => void
}
```