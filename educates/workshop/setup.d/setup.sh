#!/bin/bash

# Configure templates
ytt -f templates \
  -v SESSION_NAMESPACE=$SESSION_NAMESPACE \
  -v INGRESS_DOMAIN=$INGRESS_DOMAIN \
  -v POLICY_ENGINE=$POLICY_ENGINE \
  -v GIT_HOST=$GIT_HOST \
  -v GIT_USERNAME=$GIT_USERNAME \
  -v GIT_PASSWORD=$GIT_PASSWORD \
  -v REGISTRY_HOST=$REGISTRY_HOST \
  -v REGISTRY_PASSWORD=$REGISTRY_PASSWORD \
  -v REGISTRY_USERNAME=$REGISTRY_USERNAME \
  --output-files exercises

# Move files to cleanup env
mv /home/eduk8s/exercises/argocdui.yaml /home/eduk8s/install/argocdui.yaml
mv /home/eduk8s/exercises/argocd-values.yaml /home/eduk8s/install/argocd-values.yaml

# Install Dagger
mkdir /home/eduk8s/bin
curl -L https://dl.dagger.io/dagger/install.sh | BIN_DIR=/home/eduk8s/bin sh
dagger install github.com/matipan/daggerverse/image-updater@c3e082566aa7dc6f14de00d1241fceee8798bf3a

# Install ArgoCD etc.
curl -sLo /home/eduk8s/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.11.3/argocd-linux-amd64
chmod 755 /home/eduk8s/bin/argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd \
    --namespace argocd \
    --create-namespace \
    -f /home/eduk8s/install/argocd-values.yaml
kubectl wait --for=condition=Available deployment/argocd-server -n argocd

