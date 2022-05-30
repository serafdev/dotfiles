function on_exit --on-event fish_exit
    echo Exiting Fish...
end

set -gx GOPATH ~/go
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

alias k=kubectl
alias t=terraform

alias watch="watch -n 0.2 "

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"
alias kw="kubectl get workflows --sort-by=.metadata.creationTimestamp"
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

function get-pass
  bw get item $argv[1] | jq -r .login.password | xclip -selection clipboard
  echo "Password copied to clipboard"
end

. $HOME/dotfiles-mariadb/.mariadb.profile
