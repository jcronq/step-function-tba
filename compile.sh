#!/usr/local/bin/bash
declare -A varmap
varmap["print_console_queue_url"]="https:\/\/sqs.us-west-2.amazonaws.com\/755547719452\/step-function-tba.fifo"

mkdir -p build
cp ./state-machine.json ./build/state-machine.json
echo "${!varmap[@]}"

for var_name in "${!varmap[@]}"; do
    var="${varmap[$var_name]}"
    echo "$var_name $var"
    sed "s/<%$var_name%>/$var/g" ./build/state-machine.json > ./build/state-machine.json-new
    mv ./build/state-machine.json-new ./build/state-machine.json
done
