#!/usr/bin/env bash

set -e

CURRENT_NAMESPACE=$1
if [[ -z "$CURRENT_NAMESPACE" ]]
then
    CURRENT_NAMESPACE=$(kubectl config get-contexts $(kubectl config current-context) | tail -n 1 | awk '{print $NF}')
fi

kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 --namespace=monitoring
