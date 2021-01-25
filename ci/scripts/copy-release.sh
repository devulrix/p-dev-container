#!/usr/bin/env sh

set -ue

# install curl
apk update && apk add --no-cache jq lftp curl

# copy om
echo "Copy om"
cp om-release/om-linux-$(cat om-release/version) releases/om

echo "Copy bosh-cli"
cp bosh-release/bosh-cli-$(cat bosh-release/version)-linux-amd64 releases/bosh

echo "pivnet-cli"
cp pivnet-release/pivnet-linux-amd64-$(cat pivnet-release/version) releases/pivnet

echo "get helm"
#curl -L0 https://get.helm.sh/helm-v"$(cat helm-release/version)"-linux-amd64.tar.gz --output helm.tar.gz
#tar zxf helm.tar.gz 
#cp linux-amd64/helm releases/helm
cp helm-release/helm-v"$(cat helm-release/version)"-linux-amd64.tar.gz releases/helm

echo "download latest stable kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
cp kubectl releases/kubectl

echo "Copy ytt-cli"
cp ytt-release/ytt-linux-amd64 releases/ytt

echo "Copy kapp-cli"
cp kapp-release/kapp-linux-amd64 releases/kapp

# make everythin executable
chmod +x ./releases/*

echo "copy Dockerfile"
cp source/Dockerfile releases