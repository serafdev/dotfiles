echo "misc.fish module loaded."

function docker-interface
    ip l | grep (docker exec $argv cat /sys/class/net/eth0/iflink) | awk '{print $2}' | awk -F@ '{print $1}'
end

function jwt-decode
    echo -n $argv[1] | jq -R 'split(".") | .[1] | @base64d | fromjson'
end
