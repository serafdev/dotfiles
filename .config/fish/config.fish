function on_exit --on-event fish_exit
    echo Exiting Fish...
end

set -gx GOPATH $HOME/go
set -gx npm_config_prefix $HOME/.node_modules

fish_add_path ~/bin
fish_add_path $GOPATH/bin
fish_add_path /var/lib/snapd/snap/bin
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.node_modules/bin
fish_add_path $HOME/.local/bin
fish_add_path /home/seraf/Downloads/google-cloud-sdk/pkg/google-cloud-sdk/opt/google-cloud-sdk/bin 
fish_add_path /usr/local/kubebuilder/bin

alias k=kubectl
alias t=terraform

alias watch="watch -n 0.2 "

# PATH
set -gx PATH $PATH ~/bin
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/.cargo/bin

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"

starship init fish | source

alias python=python3
