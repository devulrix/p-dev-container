#!/usr/bin/env sh

# copy om
cp om-release/om-linux-$(cat om-release/version) releases/om

# make everythin executable
chmod +x releases/*