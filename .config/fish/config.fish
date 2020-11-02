# Set PATH variable
if status --is-login
    set -x PATH $PATH ~/bin
    
    # Kubernetes
    alias k=kubectl
    alias kpods="kubectl get pods"
    alias kcj="kubectl get cj"
    
    # Linux tools
    alias watch="watch -n 0.2"
end

function on_exit --on-event fish_exit
    echo Exiting Fish...
end
