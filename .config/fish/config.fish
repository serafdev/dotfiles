function on_exit --on-event fish_exit
    echo Exiting Fish...
end

# PATH
set -gx PATH $PATH ~/bin
set -gx PATH $PATH $HOME/.krew/bin

# k8s
alias k=kubectl


# Linux tools
alias watch="watch -n 0.2 "
