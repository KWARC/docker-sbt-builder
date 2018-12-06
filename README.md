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

## License

The Unlicense, see [LICENSE](LICENSE). 