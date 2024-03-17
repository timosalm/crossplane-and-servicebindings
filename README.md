# The Magic of Backing Service Provisioning and Consumption With Crossplane and ServiceBindings

## Prerequisites
- Docker
- Crossplane >=v1.13
- Crossplane Helm provider installed
- Knative Serving
- envsubst

Build and push a container image for the sample application
```
docker login <container-registry-hostname>
./build-and-push-app-container.sh
```

Create a namespace for the samples
```
kubectl create ns cloud-native-rejekts
kubectl config set-context --current --namespace=cloud-native-rejekts
```

## Providers and Managed Resources
```
cd 1-helm-provider
kubectl get providers
cat mr-helm-release-postgres.yaml
kubectl apply -f mr-helm-release-postgres.yaml
kubectl get release.helm.crossplane.io cnr-postgres
kubectl get pods
kubectl get secrets
./clean-up.sh
cd ..
```

## Providers and Managed Resources with connection secret
```
cd 2-helm-provider-connection-secret
cat mr-helm-release-postgres.yaml
kubectl apply -f mr-helm-release-postgres.yaml
kubectl get secrets
cat kservice-app.yaml
kubectl apply -f kservice-app.yaml
kubectl get route cnr-inclusion
./clean-up.sh
cd ..
```

## Composite Resouce (Definitions), Claims and Compositions
```
cd 3-claims
cat xrd-postgres.yaml
kubectl apply -f xrd-postgres.yaml
cat xrc-postgres.yaml 
cat composition-postgres.yaml
kubectl apply -f composition-postgres.yaml
kubectl apply -f xrc-postgres.yaml
kubectl apply -f kservice-app.yaml
kubectl get route cnr-inclusion
./clean-up.sh
cd ..
```

## ServiceBindings Direct Secret
```
cd 4-service-binding-direct-secret
kubectl apply -f xrd-postgres.yaml
cat composition-postgres.yaml
kubectl apply -f composition-postgres.yaml
kubectl apply -f xrc-postgres.yaml
kubectl apply -f kservice-app.yaml
kubectl get secret
cat service-binding.yaml
kubectl apply -f service-binding.yaml
kubectl get servicebinding
kubectl get route cnr-inclusion
./clean-up.sh
cd ..
```

## ServiceBindings Provisioned Service
```
cd 5-service-binding-provisioned-service
cat xrd-postgres.yaml
kubectl apply -f xrd-postgres.yaml
cat composition-postgres.yaml
kubectl apply -f composition-postgres.yaml
cat xrc-postgres.yaml
kubectl apply -f xrc-postgres.yaml
cat kservice-app.yaml
kubectl apply -f kservice-app.yaml
cat service-binding.yaml
kubectl apply -f service-binding.yaml
kubectl get servicebinding
kubectl get route cnr-inclusion
./clean-up.sh
cd ..
```

