#!/bin/bash -e

# SOURCE
# https://github.com/geekman/mdns-repeater

# PLATFORM
# docker buildx ls

docker buildx build --no-cache --platform "linux/arm/v7" --output "type=docker" --tag "mdns" .
docker save mdns --output ../mdns_arm32.tar

docker buildx build --no-cache --platform "linux/arm64" --output "type=docker" --tag "mdns" .
docker save mdns --output ../mdns_arm64.tar
