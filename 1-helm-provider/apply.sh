#!/bin/bash
set -x

envsubst < mr-helm-release-postgres.yaml | kubectl apply -f -