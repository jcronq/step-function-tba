#!/bin/bash
declare -A varmap
varmap["print_console_queue_url"]="astring"

cp ./state-machine.json ./build/state-machine.json

for var_name in "${!varmap[@]}"; do
    var="${varmap[$var_name]}"
    echo "$var_name $var"
    sed -i "s/<%$var_name%>/$var/g" ./build/state-machine.json
done