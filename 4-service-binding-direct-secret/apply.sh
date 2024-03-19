#!/bin/bash
set -x

envsubst < kservice-app.yaml | kubectl apply -f -
kubectl apply -f xrd-postgres.yaml
kubectl apply -f composition-postgres.yaml
kubectl apply -f xrc-postgres.yaml
kubectl apply -f service-binding.yaml