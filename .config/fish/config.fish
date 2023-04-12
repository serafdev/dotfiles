set -gx GOPATH ~/go
set -gx GEM_HOME ~/gems
set -gx npm_config_prefix ~/.node_modules
set -gx XDG_CONFIG_HOME ~/.config

fish_add_path ~/bin
fish_add_path $GOPATH/bin
fish_add_path /var/lib/snapd/snap/bin
fish_add_path /.krew/bin
fish_add_path ~/.node_modules/bin
fish_add_path /.local/bin
fish_add_path /usr/local/kubebuilder/bin
fish_add_path ~/.emacs.d/bin
fish_add_path ~/.linuxbrew/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/gems/bin
fish_add_path ~/.screenlayout
fish_add_path /opt/platform-tools
# Make sure to clone flutter: git clone https://github.com/flutter/flutter.git -b stable
fish_add_path /opt/flutter/bin

alias k=kubectl
alias t=terraform

alias watch="watch -n 0.2 "
alias emacs="emacsclient -c -a 'emacs'"

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"
alias kwf="kubectl get workflows --sort-by=.metadata.creationTimestamp"
alias kp="kubectl get pods --sort-by=.metadata.creationTimestamp"

starship init fish | source

alias python=python3
fish_add_path ~/.poetry/bin

function zoomfix
    xcompmgr -c -l0 -t0 -r0 -o.00
end

function brightness
    xrandr --output (xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $argv[1]
end
function docker-interface
    ip l | grep (docker exec $argv cat /sys/class/net/eth0/iflink) | awk '{print $2}' | awk -F@ '{print $1}'
end


function jwt-decode
    echo -n $argv[1] | jq -R 'split(".") | .[1] | @base64d | fromjson'
end

function bluetooth-powerbeats-pro
    bluetoothctl connect A4:83:E7:E6:48:65
end

function displays-layout
  switch $argv[1]
    case help
      echo "Current configs: home"
    case home
      xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x180 \
        --output DP-1-2 --mode 2560x1440 --pos 1920x0
  end
  # Fix weird positioning after displays layout is changed
  feh --randomize --bg-fill ~/Pictures/Wallpapers/*
end

alias _c="xclip -selection clipboard"
alias _v="xclip -selection clipboard -o"

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

function kns
  kubectl config set-context $(kubectl config current-context) --namespace=$1
end


. $HOME/func/*.sh

