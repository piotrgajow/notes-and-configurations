[Back](./index.md)

```javascript
function rectangleRoundedPath(width: number, height: number, radius: number): Path2D {
  const path = new Path2D();
  path.moveTo(radius, 0);
  path.lineTo(width - radius, 0);
  path.arc(width - radius, radius, radius, - Math.PI / 2, 0);
  path.lineTo(width, height - radius);
  path.arc(width - radius, height - radius, radius, 0, Math.PI / 2);
  path.lineTo(radius, height);
  path.arc(radius, height - radius, radius, Math.PI / 2, Math.PI);
  path.lineTo(0, radius);
  path.arc(radius, radius, radius, -Math.PI, -Math.PI / 2);
  return path;
}
```

[Back](./index.md)