#!/bin/bash
kubectl create ns observability
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm install jaeger jaegertracing/jaeger --namespace observability