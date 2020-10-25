#!/usr/bin/env bash

set -e

CURRENT_NAMESPACE=$1
if [[ -z "$CURRENT_NAMESPACE" ]]
then
    CURRENT_NAMESPACE=$(kubectl config get-contexts $(kubectl config current-context) | tail -n 1 | awk '{print $NF}')
fi

find ./istio -type f -print0 | xargs -0 sed -i 's/<YOUR-NAME-HERE>\.sensedia\.com/'"$CURRENT_NAMESPACE"'.sensedia.com/g'
