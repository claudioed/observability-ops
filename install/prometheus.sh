#!/bin/bash
kubectl create ns monitoring
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install prometheus bitnami/kube-prometheus --namespace monitoring