#!/usr/bin/env sh

# copy om
echo "Copy om"
cp om-release/om-linux-$(cat om-release/version) releases/om

echo "Copy bosh-cli"
cp bosh-release/bosh-cli-$(cat bosh-release/version)-linux-amd64 releases/bosh

echo "pivnet-cli"
cp pivnet-release/pivnet-linux-amd64-$(cat pivnet-release/version) releases/pivnet

echo "unpack & copy helm"
tar zxf helm-release/helm-$(cat helm-release/version)-linux-amd64.tar.gz helm-release
cp helm-release/helm releases/helm

echo "download latest stable kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
cp kubectl releases/kubectl

# make everythin executable
chmod +x ./releases/*

echo "copy Dockerfile"
cp source/Dockerfile releases