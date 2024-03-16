# The Magic of Backing Service Provisioning and Consumption With Crossplane and ServiceBindings

Log-in to you container registry via docker
```
docker login <m>
./build-and-push-app-container.sh
```

```
envsubst < kservice-app-v2.yaml | kubectl apply -f -
kn service describe cnr-inclusion -o url
```

