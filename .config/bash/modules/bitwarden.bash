#!/usr/local/bin/bash

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
