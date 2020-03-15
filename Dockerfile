FROM alpine:3.11.3
LABEL maintainer="ulrich.hoelscher@outlook.com"

RUN apk update && apk add --no-cache jq lftp 

ADD . /usr/local/bin/
