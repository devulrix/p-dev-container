FROM alpine:3.11.3

RUN apk update && apk add --no-cache jq lftp 

ADD om-release/om-linux /usr/local/bin/om
#ADD pivnet-release/pivnet-linux-amd64 /usr/local/bin/pivnet
#ADD bosh-release/bosh-cli-6.2.1-linux-amd64 /usr/local/bin/bosh
