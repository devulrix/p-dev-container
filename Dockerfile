FROM alpine:3.13.0
LABEL maintainer="ulrich.hoelscher@outlook.com"

RUN apk update && apk add --no-cache jq lftp curl

ADD . /usr/local/bin/
