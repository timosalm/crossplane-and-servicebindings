#!/bin/bash
set -x

kubectl delete kservice cnr-inclusion
kubectl delete PostgreSQLDatabase csb-postgres
kubectl delete Composition xpostgresqldatabases.timosalm.de
kubectl delete CompositeResourceDefinition xpostgresqldatabases.timosalm.de
kubectl delete pvc --all 