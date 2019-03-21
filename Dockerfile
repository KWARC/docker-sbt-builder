# Start from an OpenJDK on Alpine
FROM openjdk:jre-alpine

# The sbt versions to use
ARG SBT_URL=https://dl.bintray.com/sbt/native-packages/sbt
ARG SBT_RELEASE=0.13.15
ARG SBT_VERSION=1.1.1

# The path sbt will be installed into
ENV PATH=/opt/sbt/bin:${PATH}

# And the apk to install
RUN apk --no-cache --no-progress add bash git curl \
    && mkdir /opt && cd /opt \
    && (curl -jksSL "${SBT_URL}/${SBT_RELEASE}/sbt-${SBT_RELEASE}.tgz" | tar -xzf -) \
    && mkdir project \
    && (echo sbt.version="$SBT_VERSION" > project/build.properties) \
    && sbt sbtVersion \
    && rm -rf project