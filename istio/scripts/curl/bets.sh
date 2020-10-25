#!/usr/bin/env bash

set -e

CURRENT_NAMESPACE=$1
if [[ -z "$CURRENT_NAMESPACE" ]]
then
    CURRENT_NAMESPACE=$(kubectl config get-contexts $(kubectl config current-context) | tail -n 1 | awk '{print $NF}')
fi

INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
BETS_HOST="$CURRENT_NAMESPACE.sensedia.com"

watch -n 0,1 "curl -X POST 'http://$BETS_HOST/api/bets' \
    --resolve $BETS_HOST:80:$INGRESS_HOST \
    --header 'Content-Type: application/json' \
    --data-raw '{}' \
    -s -w '\n%{time_total}s %{http_code}\n' "