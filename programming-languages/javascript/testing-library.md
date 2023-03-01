[Back](./index.md)

# React Testing library (RTL)

## act

React Testing Library wraps `render` and `fireEvent` in a call to `act` already so most cases should not require using it manually.

In cases when you want to test without triggering `act` you need to have separate versions of render

```ts
import ReactDOM from 'react-dom';
import { ReactElement } from 'react';

interface RenderResult {
    container: HTMLDivElement;
}

let container: HTMLDivElement;

/**
 * Regular render from React Testing Library will internally execute `act()` triggering all synchronous updates from
 * useEffect etc. This util method is using bare render that does not do that and is intended to be used in tests for
 * initial states of the components
 * @param ui - react component to be rendered
 */
export const renderWithoutAct = (ui: ReactElement): RenderResult => {
    if (!container) {
        container = document.createElement('div');
    }
    document.body.appendChild(container);

    ReactDOM.render(ui, container);

    return { container };
};
```

```ts
import { renderWithoutAct } from './renderWithoutAct';

type Result<R> = {
    result: {
        current: R;
    };
};

export const renderHookWithoutAct = <R,>(
    renderCallback: () => R
): Result<R> => {
    const result = {} as { current: R };
    const HookWrapper = () => {
        result.current = renderCallback();
        return null;
    };
    renderWithoutAct(<HookWrapper />);
    return { result };
};
```

## Testing Library queries

| Type of Query | 0 Matches   | 1 Match        | >1 Matches   | Retry (Async/Await) |
|---------------|-------------|----------------|--------------|---------------------|
| getBy...      | Throw error | Return element | Throw error  | No                  |
| queryBy...    | Return null | Return element | Throw error  | No                  |
| findBy...     | Throw error | Return element | Throw error  | Yes                 |
| getAllBy...   | Throw error | Return array   | Return array | No                  |
| queryAllBy... | Return []   | Return array   | Return array | No                  |
| findAllBy...  | Throw error | Return array   | Return array | Yes                 |

[Back](./index.md)
