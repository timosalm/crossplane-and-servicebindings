#!/bin/bash
set -x

kubectl delete ServiceBinding cnr-inclusion-db
kubectl delete kservice cnr-inclusion
kubectl delete PostgreSQLDatabase cnr-postgres
kubectl delete Composition xpostgresqldatabases.timosalm.de
kubectl delete CompositeResourceDefinition xpostgresqldatabases.timosalm.de
