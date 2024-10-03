[Back](../../README.md)

[Webpage](https://testcontainers.com/)

## Notes

- Startup
  - By default, the port for the container is checked using bash/sh
- Container communication
  - All containers have to be running on the same network
  - Compose environment is creating a shared network for its containers
    - Name of the network is environment `projetName` with suffix `_default`
  - By default, container is reached under hostname = service name
  - Network can be set by name using `withNetworkMode`
- Sending request for the container requires
  - Container has to expose ports with `withExposedPorts`
  - The ports are mapped and can be found with `getMappedPort` from running container

[Back](../../README.md)
