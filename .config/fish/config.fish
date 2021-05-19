function on_exit --on-event fish_exit
    echo Exiting Fish...
end

set -gx GOPATH /go
set -gx npm_config_prefix /.node_modules

fish_add_path ~/bin
fish_add_path $GOPATH/bin
fish_add_path /var/lib/snapd/snap/bin
fish_add_path /.krew/bin
fish_add_path /.node_modules/bin
fish_add_path /.local/bin
fish_add_path /usr/local/kubebuilder/bin
fish_add_path ~/.emacs.d/bin

alias k=kubectl
alias t=terraform

alias watch="watch -n 0.2 "

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"

starship init fish | source

alias python=python3
fish_add_path ~/.poetry/bin

function zoomfix
    xcompmgr -c -l0 -t0 -r0 -o.00
end

function brightness
    xrandr --output (xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1) --brightness $argv[1]
end
