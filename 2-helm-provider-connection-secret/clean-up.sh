#!/bin/bash
set -x

kubectl delete kservice cnr-inclusion
kubectl delete kservice cnr-inclusion-in-memory
kubectl delete releases.helm.crossplane.io csb-postgres-2
kubectl delete pvc data-csb-postgres-2-postgresql-0