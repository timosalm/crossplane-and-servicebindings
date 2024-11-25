# The Magic of Backing Service Provisioning and Consumption With Crossplane and ServiceBindings

[Slides](slides.pdf)

## Prerequisites
- Docker
- Crossplane >=v1.13
- Crossplane Helm provider installed
- Knative Serving
- envsubst

Build and push a container image for the sample application
```
docker login <container-registry-hostname>
./build-and-push-app-container.sh <container-image-tag>
```

Create a namespace for the samples
```
kubectl create ns crossplane-and-servicebindings
kubectl config set-context --current --namespace=crossplane-and-servicebindings
export DEMO_NS=crossplane-and-servicebindings
```

## Providers and Managed Resources
```
(cd 1-helm-provider && ./apply.sh)
kubectl get providers
cat 1-helm-provider/mr-helm-release-postgres.yaml
kubectl get release.helm.crossplane.io csb-postgres-1
kubectl get pods
kubectl get secrets
(cd 1-helm-provider && ./clean-up.sh)
```

## Providers and Managed Resources with connection secret
```
(cd 2-helm-provider-connection-secret && ./apply.sh)
cat 2-helm-provider-connection-secret/mr-helm-release-postgres.yaml
kubectl get secrets
cat 2-helm-provider-connection-secret/kservice-app-in-memory.yaml
kubectl get route cnr-inclusion-in-memory
cat 2-helm-provider-connection-secret/kservice-app.yaml
kubectl get route csb-inclusion
(cd 2-helm-provider-connection-secret && ./clean-up.sh)
cd ..
```

## Composite Resouce (Definitions), Claims and Compositions
```
(cd 3-claims && ./apply.sh)
cat 3-claims/xrc-postgres.yaml 
cat 3-claims/composition-postgres.yaml
kubectl get route csb-inclusion
(cd 3-claims && ./clean-up.sh)
```

## ServiceBindings Direct Secret
```
(cd 4-service-binding-direct-secret && ./apply.sh)
cat 4-service-binding-direct-secret/composition-postgres.yaml
kubectl get secret
cat 4-service-binding-direct-secret/service-binding.yaml
kubectl get servicebinding
kubectl get route csb-inclusion
(cd 4-service-binding-direct-secret && ./clean-up.sh)
```

## ServiceBindings Provisioned Service
```
(cd 5-service-binding-provisioned-service && ./apply.sh)
cat 5-service-binding-provisioned-service/xrd-postgres.yaml
cat 5-service-binding-provisioned-service/composition-postgres.yaml
cat 5-service-binding-provisioned-service/xrc-postgres.yaml
cat 5-service-binding-provisioned-service/kservice-app.yaml
cat 5-service-binding-provisioned-service/service-binding.yaml
kubectl get servicebinding
kubectl get route csb-inclusion
(cd 5-service-binding-provisioned-service && ./clean-up.sh)
```

