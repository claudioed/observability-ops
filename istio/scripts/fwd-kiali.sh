#!/usr/bin/env bash

set -e

CURRENT_NAMESPACE=$1
if [[ -z "$CURRENT_NAMESPACE" ]]
then
    CURRENT_NAMESPACE=$(kubectl config get-contexts $(kubectl config current-context) | tail -n 1 | awk '{print $NF}')
fi

echo "http://localhost:20001/kiali/console/graph/namespaces/?edges=noEdgeLabels&graphType=versionedApp&unusedNodes=false&injectServiceNodes=true&duration=60&refresh=15000&namespaces=${CURRENT_NAMESPACE}&layout=dagre"
kubectl port-forward svc/kiali 20001:20001 --namespace=istio-system
