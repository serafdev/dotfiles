function bw_unlock
  set -xg BW_SESSION ( bw unlock --raw )
end

function bw_get_password_cp
  bw get item $argv[1] | jq -r .login.password | xclip -selection clipboard
  echo "Password copied to clipboard"
end

function bw_get_password
  bw get item $argv[1] | jq -r .login.password
end

function bw_get_linode_dev_pat
  bw get item linode | jq -r  .fields[0].value
end

function bw_get_gitlab_dev_pat
  bw get item gitlab_serafdev | jq -r  .fields[1].value
end

function bw_get_gh_token
  bw get item github_serafdev | jq -r  .fields[0].value
end
