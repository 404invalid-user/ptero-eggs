FROM        --platform=$TARGETOS/$TARGETARCH node:18-bullseye-slim

LABEL       author="404invalid-user" maintainer="invaliduser@bruvland.com"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 pkg-config libsqlite3-dev python3 python python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping \
            && useradd -m -d /home/container container

RUN         npm install npm@latest -g

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD         [ "/bin/bash", "/entrypoint.sh" ]
