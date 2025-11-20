#!/usr/local/bin/bash

function jwt-decode {
    echo -n $@ | jq -R 'split(".") | .[1] | @base64d | fromjson'
}
