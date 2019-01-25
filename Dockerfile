# Start building an sbt-base-image
FROM openjdk:jre-alpine as sbt-base-image

# The sbt versions to use
ARG SBT_URL=https://dl.bintray.com/sbt/native-packages/sbt
ARG SBT_RELEASE=0.13.15

# The path sbt will be installed into
ENV PATH=/opt/sbt/bin:${PATH}

# And the apk to install
RUN apk --no-cache --no-progress add bash git curl \
    && mkdir /opt && cd /opt \
    && (curl -jksSL "${SBT_URL}/${SBT_RELEASE}/sbt-${SBT_RELEASE}.tgz" | tar -xzf -)

# Build a cache for the MMT project
FROM sbt-base-image as cache

# Clone MMT into /build/MMT and cache everything
RUN mkdir -p /build/MMT
RUN git clone --depth 1 https://github.com/Uniformal/MMT /build/MMT/
RUN cd /build/MMT/src && sbt update

# Start again for the final image
FROM sbt-base-image

# Copy over the cache
COPY --from=cache /root/.ivy2 /root/.ivy2
COPY --from=cache /root/.sbt /root.sbt