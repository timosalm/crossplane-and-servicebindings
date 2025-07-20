#!/bin/bash
set -x

kubectl create ns crossplane-and-servicebindings-2

kubectl apply -f deployment-app-in-memory.yaml
kubectl apply -f helm-release-postgres.yaml
kubectl apply -f deployment-app.yaml