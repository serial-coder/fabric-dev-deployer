#!/usr/bin/env bash

./consortium-add-org.sh org1
./channel-create.sh common
./channel-join.sh common

./chaincode-install.sh example02 1.0 chaincode_example02 golang
./chaincode-instantiate.sh common example02 '["init","a","10","b","0"]'


# Call chaincode functions via the Fabric command line
# sleep 2
./chaincode-query.sh common example02 '["query","a"]'
# sleep 2
./chaincode-invoke.sh common example02 '["move","a","b","1"]'
# sleep 2
./chaincode-query.sh common example02 '["query","a"]'


# # Call chaincode functions via the API server
# JWT=`(curl -d '{"username":"user","password":"pass","attrs":"[]"}' \
#     --header "Content-Type: application/json" \
#     http://localhost:4000/users | tr -d '"')`
# printf "\n\n"

# # sleep 2
# printf " -- /query\n"
# curl -H "Authorization: Bearer $JWT" \
#     -H "Content-Type: application/json" \
#     'http://localhost:4000/query/a'
# printf "\n\n"

# # sleep 2
# printf " -- /move\n"
# curl -H "Authorization: Bearer $JWT" \
#     -H "Content-Type: application/json" \
#     -d '["a","b","1"]' \
#     'http://localhost:4000/move'
# printf "\n\n"

# # sleep 2
# printf " -- /query\n"
# curl -H "Authorization: Bearer $JWT" \
#     -H "Content-Type: application/json" \
#     'http://localhost:4000/query/a'
# printf "\n\n"