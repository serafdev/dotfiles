#!/usr/local/bin/bash

alias _c="xclip -selection clipboard"
alias _v="xclip -selection clipboard -o"
alias t=terraform
alias watch="watch -n 0.2 "
alias emacs="emacsclient -c -a 'emacs'"
alias python=python3

export GOPATH=~/go
export GEM_HOME=~/gems
export npm_config_prefix=~/.node_modules
export XDG_CONFIG_HOME=~/.config

function zoomfix {
    xcompmgr -c -l0 -t0 -r0 -o.00
}

function bash_add_path {
    export PATH="$PATH:$1"
}

function brightness {
    xrandr --output $(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $1
}

function docker-interface {
    ip l | grep $(docker exec $@ cat /sys/class/net/eth0/iflink) | awk '{print $2}' | awk -F@ '{print $1}'
}

function jwt-decode {
    echo -n $@ | jq -R 'split(".") | .[1] | @base64d | fromjson'
}

# I lost these powerbeats-pro :cry:, if anyone finds them open an Issue on this repo
function bluetooth-powerbeats-pro {
    bluetoothctl connect A4:83:E7:E6:48:65
}

function bw_unlock {
  export BW_SESSION=$( bw unlock --raw )
}

function bw_get_password_cp {
  bw get item $1 | jq -r .login.password | xclip -selection clipboard
  echo "Password copied to clipboard"
}

function bw_get_password {
  bw get item $1 | jq -r .login.password
}

function bw_get_linode_dev_pat {
  bw get item linode | jq -r  .fields[0].value 
}

function bw_get_gitlab_dev_pat {
  bw get item gitlab_serafdev | jq -r  .fields[1].value 
}

function bw_get_gh_token {
  bw get item github_serafdev | jq -r  .fields[0].value 
}

