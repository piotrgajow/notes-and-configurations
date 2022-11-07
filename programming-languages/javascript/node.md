[Back](./index.md)

### Running process

```javascript
const { spawn } = require('node:child_process');

function runProcess(command, arguments, label) {
    return new Promise((resolve, reject) => {
        label = label ?? `${command} ${arguments.join(' ')}`;
        const proc = spawn(command, arguments);

        proc.stdout.on('data', (data) => {
            console.log(`[${label}] ${data}`);
        });

        proc.stderr.on('data', (data) => {
            console.error(`[${label}] ${data}`);
        });

        proc.on('close', (code) => {
            if (code === 0) {
                resolve();
            } else {
                reject(new Error(`[${label}] process failed with exit code ${code}`));
            }
        });

        proc.on('error', (err) => {
            reject(err);
        });
    });
}
```

[Back](./index.md)
