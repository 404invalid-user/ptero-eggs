FROM golang:1.19-alpine

RUN adduser -D -h /home/container container
RUN apk add --update --no-cache ca-certificates tzdata

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/ash", "/entrypoint.sh" ]
