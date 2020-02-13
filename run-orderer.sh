#!/usr/bin/env bash

./clean.sh

# export FABRIC_VERSION=1.4.0

./generate-orderer.sh
docker-compose -f docker-compose-orderer.yaml up