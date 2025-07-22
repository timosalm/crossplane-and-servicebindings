#!/bin/bash
set -x

kubectl delete -f helm-release-postgres.yaml
kubectl delete ns crossplane-and-servicebindings-2