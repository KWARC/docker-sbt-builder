# Start from an OpenJDK on Alpine
FROM openjdk:jre-alpine

# The sbt versions to use
ARG SBT_URL=https://dl.bintray.com/sbt/native-packages/sbt
ARG SBT_RELEASE=0.13.15

# Install dependencies and make /opt/
RUN apk --no-cache --no-progress add bash git curl wget
RUN mkdir -p /opt
WORKDIR /opt

# get sbt, add it to path, and run some caching
ENV PATH=/opt/sbt/bin:${PATH}
RUN curl -jksSL "${SBT_URL}/${SBT_RELEASE}/sbt-${SBT_RELEASE}.tgz" | tar -xzf -
RUN sbt sbtVersion