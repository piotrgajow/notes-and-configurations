[Back](../../README.md)

## Commands

| Command                                           | Description                                                            |
|:--------------------------------------------------|:-----------------------------------------------------------------------|
| `docker buildx build [OPTS] <PATH>`               | Build docker image for Dockerfile in `PATH`                            |
| -> `-t <NAME>[:TAG]`                              | Tag the image with name `NAME` and version `TAG`                       |
| -> `--target <STAGE>`                             | Build given stage in multi-stage setup                                 |
| -> `--no-cache`                                   | Force ebuild all layers                                                |
| `docker push [OPTS] <NAME>[:TAG]`                 | Upload docker image given by `NAME` and `TAG` to the repository        |
| `docker login [OPTS] [SERVER]`                    | Log-in to the docker repository, can specify self-hosted repository    |
| -> `-u <USERNAME>`                                | Use given username                                                     |
| -> `--password-stdin`                             | Take password from stdin                                               |
| `docker run [OPTS] <IMG> [COMMAND] [ARGS]`        | Run `COMMAND` with `ARGS` using docker image `IMG`                     |
| -> `-d`                                           | Run in the background as daemon                                        |
| -> `-p <HOST>:<CONTAINER>`                        | Map `HOST` port to the `CONTAINER` port                                |
| -> `--rm`                                         | Automatically remove container after it exits                          |
| -> --mount type=bind,source=<SRC>,target=<TARGET> | Bind files or directories from host `SRC` (absolute) to image `TARGET` |
| -> `--name <NAME>`                                | Name container so it can be later references by that `NAME`            |
| -> `-it`                                          | Run container as interactive connecting terminal to its I/O            |
| -> `-e <NAME>:<VALUE>`                            | Set environment variable for the container                             |
| -> `-e <NAME>`                                    | Pass environment variable `<NAME>` value to the container              |
| -> `--network=<NAME>`                             | Connect the container to network by name `<NAME>`                      |
| `docker stop [OPTS] <CONTAINER>`                  | Stop running container                                                 |
| `docker ps`                                       | List running containers                                                |
| `docker network ls`                               | List existing networks                                                 |
| `docker network inspect <NAME>`                   | Inspect network e.g. to see which containers are attached to it        |

### Docker Compose

| Command                                   | Description                                                                                      |
|:------------------------------------------|:-------------------------------------------------------------------------------------------------|
| `docker compose up`                       | Starts all containers defined in docker-compose configuration; single process, aggregates output |
| -> `-d`                                   | Run containers detached in background                                                            |
| `docker compose exec [OPTS] <SRVC> <CMD>` | Run a command on a given container                                                               |
| e.g. `docker compose exec <SRVC> bash`    | Connect to a container and open bash terminal                                                    |

## Dockerfiles

| Dockerfile          | Description                |
|:--------------------|:---------------------------|
| [LaTeX](./latex.md) | Compile LaTeX to pdf files |

[Back](../../README.md)
