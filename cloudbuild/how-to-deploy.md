# GKE

Cloud Shell or your local machine which have installed gcloud and kubectl.

## Running all containers on 1 pod

Set project_id and compute/zone

```
gcloud config set project learninglocker-dev
gcloud config set compute/zone europe-west2-c
```

Create a k8s cluster

```
gcloud container clusters create learning-locker
```

Get credentials

```
gcloud container clusters get-credentials learning-locker
```

Create deployment and service

```
kubectl create -f https://storage.cloud.google.com/learninglocker-dev-k8s/deployment.yaml
kubectl create -f https://storage.cloud.google.com/learninglocker-dev-k8s/service.yaml
```

```
kubectl get service ll-service
```
