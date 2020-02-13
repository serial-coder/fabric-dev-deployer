#!/usr/bin/env bash
source lib.sh

# docker rm -f $(docker ps -aq)
#TODO [ "${DOCKER_MACHINE_NAME}" == "orderer" ]  && EXECUTE_BY_ORDERER=1 runCLIWithComposerOverrides down || runCLIWithComposerOverrides down

# docker rm -f $(docker ps -aq)
docker rm -f www.${DOMAIN:-example.com}
docker rm -f orderer.${DOMAIN:-example.com}
docker rm -f cli.${DOMAIN:-example.com}

docker rm -f cli.org1.${DOMAIN:-example.com}
docker rm -f ca.org1.${DOMAIN:-example.com}
docker rm -f www.org1.${DOMAIN:-example.com}
docker rm -f peer0.org1.${DOMAIN:-example.com}
docker rm -f couchdb.peer0.org1.${DOMAIN:-example.com}

docker rm -f api.org1.${DOMAIN:-example.com}
docker rm -f dev-peer0.org1.${DOMAIN:-example.com}-example02-1.0

docker volume prune -f
docker rmi -f $(docker images -q -f "reference=dev-*")

if [ -z "$DOCKER_HOST" ] ; then
    rm -rf crypto-config/
    rm -rf data/
else
    docker-machine ssh ${DOCKER_MACHINE_NAME} rm -rf crypto-config
    docker-machine ssh ${DOCKER_MACHINE_NAME} rm -rf data/
fi

#docker rmi -f $(docker images -q -f "reference=olegabu/fabric-starter-client")
#docker network rm `(docker network ls -q)`
