
ARG GOGS_VERSION

FROM gogs/gogs:${GOGS_VERSION}

ARG APP_TIMEZONE

# timezone
RUN ln -snf /usr/share/zoneinfo/${APP_TIMEZONE} /etc/localtime && echo ${APP_TIMEZONE} > /etc/timezone && \
    date
