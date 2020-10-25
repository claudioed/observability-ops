#!/bin/bash
kind create cluster --name observability --config clusterconfig.yaml
kubectl cluster-info --context kind-observability