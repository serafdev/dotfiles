function on_exit --on-event fish_exit
    echo Exiting Fish...
end

# PATH
set -gx PATH $PATH ~/bin
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/.cargo/bin
# k8s
function k
    command kubectl $argv
end

# Linux tools
# alias watch="watch -n 0.2 -x fish -c "

function watch
    command watch -n 0.2 -x fish -c "$argv"
end

alias w=watch

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"

starship init fish | source

alias python=python3
