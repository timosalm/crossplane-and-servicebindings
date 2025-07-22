# The Magic of Backing Service Provisioning and Consumption With Crossplane and ServiceBindings

[Slides](slides.pdf)

## Prerequisites
- Docker
- Crossplane >= v1.13 < v.2.0
- Crossplane Helm provider installed
- [Service Binding for Kubernetes](https://github.com/servicebinding/runtime)
- For demo script: [Demo Magic](https://github.com/paxtonhare/demo-magic), [krew](https://krew.sigs.k8s.io), [kube-lineage installed via krew](https://github.com/tohjustin/kube-lineage), [kubectl-view-secret
installed via krew](https://github.com/tohjustin/kube-lineage)

## Demo

### With "Demo Magic"
```
./demo.sh
```

### Run Commands Manually

#### Providers and Managed Resources
```
(cd 1-helm-provider && ./apply.sh)
kubectl get providers
cat 1-helm-provider/helm-release-postgres.yaml
kubectl get release.helm.crossplane.io postgres-1 -n crossplane-and-servicebindings-1
kubectl get pods -n crossplane-and-servicebindings-1
kubectl get secrets -n crossplane-and-servicebindings-1
(cd 1-helm-provider && ./clean-up.sh)
```

#### Providers and Managed Resources with connection secret
```
(cd 2-helm-provider-connection-secret && ./apply.sh)
cat 2-helm-provider-connection-secret/helm-release-postgres.yaml
kubectl get secrets -n crossplane-and-servicebindings-2
cat 2-helm-provider-connection-secret/deployment-app-in-memory.yaml
kubectl port-forward pod/$(kubectl get pod -l app=inclusion-in-memory -o jsonpath='{.items[0].metadata.name}' -n crossplane-and-servicebindings-2) 8080:8080 -n crossplane-and-servicebindings-2

cat 2-helm-provider-connection-secret/deployment-app.yaml
kubectl port-forward pod/$(kubectl get pod -l app=inclusion -o jsonpath='{.items[0].metadata.name}' -n crossplane-and-servicebindings-2) 8080:8080 -n crossplane-and-servicebindings-2
(cd 2-helm-provider-connection-secret && ./clean-up.sh)
cd ..
```

#### Composite Resouce (Definitions), Claims and Compositions
```
(cd 3-claims && ./apply.sh)
cat 3-claims/xrc-postgres.yaml 
cat 3-claims/composition-postgres.yaml
cat 3-claims/xrd-postgres.yaml
kubectl get xPostgreSQLDatabase
kubectl port-forward pod/$(kubectl get pod -l app=inclusion -o jsonpath='{.items[0].metadata.name}' -n crossplane-and-servicebindings-3) 8080:8080 -n crossplane-and-servicebindings-3
(cd 3-claims && ./clean-up.sh)
```

#### ServiceBindings Direct Secret
```
(cd 4-service-binding-direct-secret && ./apply.sh)
cat 4-service-binding-direct-secret/composition-postgres.yaml
kubectl get secret -n crossplane-and-servicebindings-4
cat 4-service-binding-direct-secret/service-binding.yaml
kubectl get servicebinding -n crossplane-and-servicebindings-4
kubectl port-forward pod/$(kubectl get pod -l app=inclusion -o jsonpath='{.items[0].metadata.name}' -n crossplane-and-servicebindings-4) 8080:8080 -n crossplane-and-servicebindings-4
(cd 4-service-binding-direct-secret && ./clean-up.sh)
```

#### ServiceBindings Provisioned Service
```
(cd 5-service-binding-provisioned-service && ./apply.sh)
cat 5-service-binding-provisioned-service/xrd-postgres.yaml
cat 5-service-binding-provisioned-service/composition-postgres.yaml
cat 5-service-binding-provisioned-service/xrc-postgres.yaml
cat 5-service-binding-provisioned-service/deployment-app.yaml
cat 5-service-binding-provisioned-service/service-binding.yaml
kubectl get servicebinding -n crossplane-and-servicebindings-5
kubectl port-forward pod/$(kubectl get pod -l app=inclusion -o jsonpath='{.items[0].metadata.name}' -n crossplane-and-servicebindings-5) 8080:8080 -n crossplane-and-servicebindings-5
(cd 5-service-binding-provisioned-service && ./clean-up.sh)
```

