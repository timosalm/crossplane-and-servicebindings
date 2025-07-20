#!/bin/bash
set -x

kubectl delete namespace crossplane-and-servicebindings-5
kubectl delete -f composition-postgres.yaml
kubectl delete -f xrd-postgres.yaml