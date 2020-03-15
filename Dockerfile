FROM alpine:3.11.3

RUN apk update && apk add --no-cache jq lftp 

ADD releases/* /usr/local/bin/
