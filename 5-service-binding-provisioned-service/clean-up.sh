#!/bin/bash
set -x

kubectl delete ServiceBinding csb-inclusion-db
kubectl delete kservice csb-inclusion
kubectl delete PostgreSQLDatabase csb-postgres
kubectl delete Composition xpostgresqldatabases.timosalm.de
kubectl delete CompositeResourceDefinition xpostgresqldatabases.timosalm.de
kubectl delete pvc --all 
