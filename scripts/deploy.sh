#! /bin/bash
set -e

kubectl -f apply kube/deployment.yml
kubectl -f apply kube/service.yml