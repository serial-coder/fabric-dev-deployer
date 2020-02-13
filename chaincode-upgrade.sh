#!/usr/bin/env bash
source lib.sh
usageMsg="$0 channelName chaincodeName [init args='[]'] [version=1.0] [privateCollectionPath] [endorsementPolicy='ANY']"
exampleMsg="$0 common chaincode1 '[\"Init\",\"arg1\",\"val1\"]' 2.0 'path-to-project/collections_config.json' \"OR ('org1.member', 'org2.member')\""

IFS=
channelName=${1:?`printUsage "$usageMsg" "$exampleMsg"`}
chaincodeName=${2:?`printUsage "$usageMsg" "$exampleMsg"`}
initArguments=${3:-'[]'}
chaincodeVersion=${4}
privateCollectionPath=${5}
endorsementPolicy=${6}

upgradeChaincode "$channelName" "$chaincodeName" "$initArguments" "$chaincodeVersion" "$privateCollectionPath" "$endorsementPolicy"
