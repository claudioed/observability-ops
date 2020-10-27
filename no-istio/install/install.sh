#!/bin/sh

set -x
set -e

sh kind.sh

kubectl create ns monitoring
sh grafana.sh
sh prometheus.sh
sh jaeger.sh

kubectl apply -f ../namespace/ns.yaml
kubectl apply --recursive -n spring -f ../k8s
