[Back](../../README.md)

## Spring

### Logback configuration

Logs can be configured via `logback-spring.xml` file.

[Log format documentation](https://logback.qos.ch/manual/layouts.html)

Example
```xml
<configuration>
    <appender name="..." class="...">
        <layout>
            <pattern>
                [%thread %date{HH:mm:ss.SSS}] %highlight(%-5level) %green(%50logger{50}): %msg%n
            </pattern>
        </layout>
    </appender>
</configuration>
```

[Back](../../README.md)
