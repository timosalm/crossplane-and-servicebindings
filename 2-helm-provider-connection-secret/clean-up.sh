#!/bin/bash
set -x

kubectl delete kservice cnr-inclusion
kubectl delete releases.helm.crossplane.io cnr-postgres
kubectl delete pvc data-cnr-postgres-postgresql-0