# Docker-Sbt-Builder

This is a [Docker](https://www.docker.com) Image intended to build sbt-based projects. 
It can be found on [DockerHub](https://hub.docker.com) as the automated build [kwarc/sbt-builder](https://hub.docker.com/r/kwarc/sbt-builder/). 

It is intended to be as follows:

```Dockerfile
# Start from the sbt builder image
FROM kwarc/sbt-builder

# Add all code into /opt/src
ADD src/ /opt/src/
WORKDIR /opt/src

# Run some sbt commands
RUN sbt build

```

## Tags

This Image has two tags:

- `latest` which contains a cache for the newest SBT jar pre-downloaded
- `mmt-cache` which contains a cache for all dependencies used on the [MMT](https://github.com/UniFormal/MMT) master branch

These can be found on the `master` and `mmt-cache` branch respectively.

## License

The Unlicense, see [LICENSE](LICENSE). 