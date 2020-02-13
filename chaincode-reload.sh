#!/usr/bin/env bash
source lib.sh
usageMsg="$0 channelName chaincodeName [init args='[]'] [path to chaincode=/opt/chaincode/node/<chaincodeName>] [privateCollectionPath] [lang=node]"
exampleMsg="$0 common reference"

IFS=
channelName=${1:?`printUsage "$usageMsg" "$exampleMsg"`}
chaincodeName=${2:?`printUsage "$usageMsg" "$exampleMsg"`}

channelName=$1
chaincodeName=$2
args=${3:-'[]'}
pathToChaincode=$4
privateCollectionPath=$5
language=$6
version="1.$RANDOM"

./chaincode-install.sh $chaincodeName $version $pathToChaincode $language
./chaincode-upgrade.sh $channelName $chaincodeName $args $version $privateCollectionPath

printInColor "1;32" "Upgraded to version $version"



