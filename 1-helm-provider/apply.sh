#!/bin/bash
set -x

kubectl create ns crossplane-and-servicebindings-1
kubectl apply -f helm-release-postgres.yaml