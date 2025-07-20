#!/bin/bash
set -x

kubectl delete ns crossplane-and-servicebindings-3
kubectl delete -f composition-postgres.yaml
kubectl delete -f xrd-postgres.yaml
