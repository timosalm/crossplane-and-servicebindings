#!/bin/bash
set -x

kubectl delete ns crossplane-and-servicebindings-4
kubectl delete -f composition-postgres.yaml
kubectl delete -f xrd-postgres.yaml