#!/bin/bash
set -e

. demo-magic.sh
export TYPE_SPEED=50
export DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

# 1 helm provider
if [[ -z "$1" || "$1" == "1" ]]; then
  pei "(cd 1-helm-provider && ./apply.sh)"
  wait
  pei "kubectl get providers"
  wait
  pei "kubectl lineage providers provider-helm"
  wait
  pei "kubectl get release.helm.crossplane.io postgres-1 -n crossplane-and-servicebindings-1"
  wait
  while [[ "$(kubectl get pod postgres-1-postgresql-0 -n crossplane-and-servicebindings-1 -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}' 2>/dev/null)" != "True" ]]; do
    sleep 1
  done
  pei "kubectl get pods -n crossplane-and-servicebindings-1"
  wait
  pei "kubectl get secrets -n crossplane-and-servicebindings-1"
  wait
  pei "kubectl view-secret postgres-1-postgresql -n crossplane-and-servicebindings-1"
  wait
  pei "(cd 1-helm-provider && ./clean-up.sh)"
fi

# 2 helm provider with connection secret
if [[ -z "$1" || "$1" == "2" ]]; then
  pei "(cd 2-helm-provider-connection-secret && ./apply.sh)"
  wait
  pei "kubectl get deployment -n crossplane-and-servicebindings-2"
  wait
  pei "kubectl get secrets -n crossplane-and-servicebindings-2"
  wait
  pei "kubectl view-secret postgres-connection-secrets -n crossplane-and-servicebindings-2"
  wait
  pei "(cd 2-helm-provider-connection-secret && ./clean-up.sh)"
fi

# 3 claims
if [[ -z "$1" || "$1" == "3" ]]; then
  pei "(cd 3-claims && ./apply.sh)"
  wait
  pei "kubectl get function"
  wait
  pei "kubectl get postgresqldatabase -n crossplane-and-servicebindings-3"
  wait
  pei "kubectl get xpostgresqldatabase -n crossplane-and-servicebindings-3"
  wait
  pei "kubectl get release.helm.crossplane.io"
  wait
  pei "(cd 3-claims && ./clean-up.sh)"
fi

# 4 service binding direct secret
if [[ -z "$1" || "$1" == "4" ]]; then
  pei "(cd 4-service-binding-direct-secret && ./apply.sh)"
  wait
  pei "kubectl get secret -n crossplane-and-servicebindings-4"
  wait
  pei "kubectl get servicebinding -n crossplane-and-servicebindings-4"
  wait
  pei "kubectl get deploy -n crossplane-and-servicebindings-4 -o yaml"
  wait
  pei "(cd 4-service-binding-direct-secret && ./clean-up.sh)"
fi

# 5 service binding provisioned service
if [[ -z "$1" || "$1" == "5" ]]; then
  pei "(cd 5-service-binding-provisioned-service && ./apply.sh)"
  wait
  pei "kubectl get postgresqldatabase -n crossplane-and-servicebindings-5"
  wait
  pei "kubectl get secret -n crossplane-and-servicebindings-5"
  wait
  pei "kubectl get postgresqldatabase -n crossplane-and-servicebindings-5 -o yaml"
  wait
  pei "kubectl get servicebinding -n crossplane-and-servicebindings-5"
  wait
  pei "(cd 5-service-binding-provisioned-service && ./clean-up.sh)"
fi
