#!/usr/local/bin/bash

#alias k=kubectl

#alias kev="oc get events --sort-by='.metadata.creationTimestamp'"
#alias kpr="kubectl get pods --field-selector=status.phase=Running"
#alias kwf="kubectl get workflows --sort-by=.metadata.creationTimestamp"
#alias kp="kubectl get pods --sort-by=.metadata.creationTimestamp"

function k {
    echo $1
    case $1 in
        s) kubectl get services ;;
        p) kubectl get pods --sort-by=.metadata.creationTimestamp ;;
        pr) kubectl get pods --field-selector=status.phase=Running ;;
        wf) kubectl get workflows --sort-by=.metadata.creationTimestamp ;;
        ev) kubectl get events --sort-by=.metadata.creationTimestamp ;;
        ns) kubectl config set-context $(k config current-context) --namespace=$2 ;;
    esac
}

function kns {
  kubectl config set-context $(kubectl config current-context) --namespace=$1
}

