echo "k8s.fish module loaded."

alias k=kubectl

alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
alias kpr="kubectl get pods --field-selector=status.phase=Running"
alias kwf="kubectl get workflows --sort-by=.metadata.creationTimestamp"
alias kp="kubectl get pods --sort-by=.metadata.creationTimestamp"

function kns
  kubectl config set-context $(kubectl config current-context) --namespace=$1
end

kubectl completion fish | source
