[Back](../../README.md)

## Resources

- Interface vs Type
    - [Microsoft TS wiki](https://github.com/microsoft/TypeScript/wiki/Performance#preferring-interfaces-over-intersections)
    - [Google TS styleguide](https://google.github.io/styleguide/tsguide.html#interfaces-vs-type-aliases)
- Namespaces / global types
    - [Microsoft TS wiki](https://github.com/microsoft/TypeScript/wiki/Performance#isolated-file-emit)
    - [Google TS styleguide](https://github.com/microsoft/TypeScript/wiki/Performance#isolated-file-emit)
    - [TS repository](https://github.com/microsoft/TypeScript/issues/30994#issuecomment-492017219)

## Code snippets

```typescript
// exhaustiveness check method for switch type checks
const exhaustiveCheck = (param: never): never => {
    throw new TypeError(`${param} case not handled`);
};
```

```typescript
// method declarations vs variance

// unsafe
interface Bivariant<T> {
  call(x: T): void
}

// safe
interface Contravariant<T> {
  call: (x: T) => void
}
```

```typescript
// reveal type
type Reveal<T> = { [TKey in keyof T]: T[TKey] };
```

```typescript
// branded types
type Money =  number & { readonly type: unique symbol };
```

[Back](../../README.md)
