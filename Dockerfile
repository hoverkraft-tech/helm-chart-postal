FROM ghcr.io/hoverkraft-tech/docker-base-images/super-linter:2.0.2@sha256:12dedee667b43856a9cc792628fecc4723fc0868bf8090d268981407a7402b2c

HEALTHCHECK --interval=5m --timeout=10s --start-period=30s --retries=3 CMD ["/bin/sh","-c","test -d /github/home"]
ARG UID=1000
ARG GID=1000
RUN chown -R ${UID}:${GID} /github/home
USER ${UID}:${GID}

ENV RUN_LOCAL=true
ENV USE_FIND_ALGORITHM=true
ENV LOG_LEVEL=WARN
ENV LOG_FILE="/github/home/logs"
