#!/bin/bash
set -x

kubectl create ns crossplane-and-servicebindings-4

kubectl apply -f xrd-postgres.yaml
kubectl apply -f composition-postgres.yaml
kubectl apply -f xrc-postgres.yaml
kubectl apply -f deployment-app.yaml
kubectl apply -f service-binding.yaml