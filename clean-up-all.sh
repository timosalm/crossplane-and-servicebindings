#!/bin/bash
set -x

kubectl delete ns crossplane-and-servicebindings-1
kubectl delete ns crossplane-and-servicebindings-2
kubectl delete ns crossplane-and-servicebindings-3
kubectl delete ns crossplane-and-servicebindings-4
kubectl delete ns crossplane-and-servicebindings-5
kubectl delete -f 5-service-binding-provisioned-service/composition-postgres.yaml
kubectl delete -f 5-service-binding-provisioned-service/xrd-postgres.yaml