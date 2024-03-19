#!/bin/bash
set -x

envsubst < kservice-app-in-memory.yaml | kubectl apply -f -
envsubst < mr-helm-release-postgres.yaml | kubectl apply -f -
envsubst < kservice-app.yaml | kubectl apply -f -