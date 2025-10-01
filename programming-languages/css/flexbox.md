[Back](./index.md)

## Flexbox

Reference: [CSS-TRICKS: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

### Container

`display: flex`

#### flex-direction

- `row` - left to right
- `row-reverse` - right to left
- `column` - top to bottom
- `column-reverse` - bottom to top

#### flex-wrap

- `nowrap` - no wrapping, adjusting size to fit
- `wrap` - wrapping to more rows/columns
- `wrap-reverse` - wrapping in the reverse direction

#### flex-flow

Shorthand for `flex-direction` `flex-wrap`

#### justify-content

Layout along the direction axis

- `flex-start`
- `flex-end`
- `center`
- `space-between`
- `space-around`
- `space-evenly`

#### align-items

Layout along the direction cross-axis

- `flex-start`
- `flex-end`
- `center`
- `stretch`
- `baseline`

### Items 

`flex: flex-grow flex-shrink flex-basis`

#### flex-grow

Default: 0

How much the item will grow relative to the rest of the items in the container if there is extra space.

#### flex-shrink

Default: 1

How much the item will shrink relative to the rest of the items in the container if there is not enough space.

#### flex-basis

Default: auto

Defines the starting size of the item before adjustments.

[Back](./index.md)
