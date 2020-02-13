#!/usr/bin/env bash

export DEFAULT_NETWORK_NAME=fabric-dev-deployer
./generate-peer.sh
docker-compose up
