FROM golang:1.19-alpine

RUN adduser -D -h /home/container container
RUN apk add --update --no-cache ca-certificates tzdata bash

USER container
ENV USER container
ENV HOME /home/container
ENV GOMODCACHE /home/container/go/pkg/mod

# Create the directory for the Go module cache
RUN mkdir -p $GOMODCACHE

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/bash", "/entrypoint.sh" ]
