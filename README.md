# The Magic of Backing Service Provisioning and Consumption With Crossplane and ServiceBindings

[Slides](slides.pdf)

## Prerequisites
- Docker
- Crossplane >= v1.13 < v.2.0
- Crossplane Helm provider installed
- [Service Binding for Kubernetes](https://github.com/servicebinding/runtime)
- For demo script: [Demo Magic](https://github.com/paxtonhare/demo-magic), [krew](https://krew.sigs.k8s.io), [kube-lineage installed via krew](https://github.com/tohjustin/kube-lineage), [kubectl-view-secret
installed via krew](https://github.com/tohjustin/kube-lineage)

## Setup
```
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane --namespace crossplane-system --create-namespace crossplane-stable/crossplane

# Install Crossplane Helm provider
kubectl apply -f https://raw.githubusercontent.com/crossplane-contrib/provider-helm/refs/heads/main/examples/provider-config/provider-incluster.yaml

# Install Crossplane Function Patch and Transform
kubectl apply -f function-patch-and-transform.yaml

# Install Service Binding for Kubernetes
kubectl apply -f https://github.com/servicebinding/runtime/releases/download/v1.0.0/servicebinding-runtime-v1.0.0.yaml
```

## Demo with "Demo Magic"
```
./demo.sh
```

