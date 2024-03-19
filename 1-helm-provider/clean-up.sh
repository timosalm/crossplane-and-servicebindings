#!/bin/bash
set -x

kubectl delete releases.helm.crossplane.io csb-postgres-1
kubectl delete pvc data-csb-postgres-1-postgresql-0