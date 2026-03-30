[Back](../README.md)

## Web Dev topics

### Measure CLS (Cumulative Layout Shift)

```javascript
let clsScore = 0;
const observer = new PerformanceObserver((list) => {
    for (const entry of list.getEntries()) {
        if (!entry.hadRecentInput) {
            clsScore += entry.value;
            console.log('Detected CLS. Total value:', clsScore.toFixed(4));
        }
    }
});
observer.observe({ type: 'layout-shift', buffered: true });
```

### Test Image Generator

[HTML file](./test-image-generator.html)

Canvas-based web page that generates an image to test for distortions, blurs or color issues.

[Back](../README.md)
