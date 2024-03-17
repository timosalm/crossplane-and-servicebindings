#!/bin/bash
set -x

prev_dir () {
  cd ..
}

kubectl delete kservice cnr-inclusion
kubectl delete PostgreSQLDatabase cnr-postgres
kubectl delete Composition xpostgresqldatabases.timosalm.de
kubectl delete CompositeResourceDefinition xpostgresqldatabases.timosalm.de
