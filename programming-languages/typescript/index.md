[Back](../../README.md)

## Types vs Interfaces

Interfaces
- allow declaration merging
- has to have statically known members
- faster compilation (cached)

## Snippets

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
