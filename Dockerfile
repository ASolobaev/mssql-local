#-----------------------------------------------------------------------------
# base



#-----------------------------------------------------------------------------
# build

FROM base AS build
ENV ACCEPT_EULA=Y

COPY ./entrypoint/ /entrypoint
COPY ./migrations/ /var/migrations

ENTRYPOINT [ "sh", "/entrypoint/startup.sh" ]