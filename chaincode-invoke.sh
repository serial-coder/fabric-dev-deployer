#!/usr/bin/env bash
source lib.sh
usageMsg="$0 channelName chaincodeName [args='[]'] [transientObj='{}']"
exampleMsg="$0 common chaincode1 '[\"invoke\",\"a\"]' {\"key\":\"\${VALUE}\"}"

IFS=
channelName=${1:?`printUsage "$usageMsg" "$exampleMsg"`}
chaincodeName=${2:?`printUsage "$usageMsg" "$exampleMsg"`}
arguments=${3-'[]'}
transientObj=${4-'{}'}

invokeChaincode "$channelName" "$chaincodeName" "$arguments" "$transientObj"