[Back](../../README.md)

[Mermaid](https://mermaid.js.org/) is a tool to generate diagrams and charts

## Generating diagrams offline

1. Create empty npm project
2. Install `@mermaid-js/mermaid-cli` package
3. Add `index.js` script to generate images from input file
    ```
    import { run } from "@mermaid-js/mermaid-cli"
    
    const input = process.argv[2];
    const path = input.split('/');
    const file = path.pop();
    const [name, ext] = file.split('.');
    path.push(`${name}.png`);
    const output = path.join('/');
    
    const options = undefined;
    
    await run(input, output, options);
    ```
4. Set start script in package json `"start": "node index.js"`
5. Run with `npm run start path/to/input-file.mmd`

## References

- Website - https://mermaid.js.org/intro/
- Cheat sheet - https://jojozhuang.github.io/tutorial/mermaid-cheat-sheet/
- Live playground - https://mermaid.live/
- Mermaid as CLI - https://github.com/mermaid-js/mermaid-cli

[Back](../../README.md)
