#!/bin/bash

# Configure templates
ytt -f templates \
  -v SESSION_NAMESPACE=$SESSION_NAMESPACE \
  -v INGRESS_DOMAIN=$INGRESS_DOMAIN \
  -v POLICY_ENGINE=$POLICY_ENGINE \
  -v GIT_HOST=$GIT_HOST \
  -v REGISTRY_HOST=$REGISTRY_HOST \
  -v REGISTRY_PASSWORD=$REGISTRY_PASSWORD \
  -v REGISTRY_USERNAME=$REGISTRY_USERNAME \
  --output-files exercises

# Move files to cleanup
mv /home/eduk8s/exercises/tektonui.yaml /home/eduk8s/exercises/tekton/tektonui.yaml

# Install Tekton and modules
mkdir /home/eduk8s/bin
tar xf /home/eduk8s/binary/tkn_0.37.0_Linux_x86_64.tar.gz -C /home/eduk8s/bin
kubectl apply -f /home/eduk8s/install/tekton_pipeline.yaml
kubectl apply -f /home/eduk8s/install/tekton_dashboard.yaml
kubectl wait --for=condition=Available deployment/tekton-pipelines-controller -n tekton-pipelines
kubectl wait --for=condition=Available deployment/tekton-pipelines-remote-resolvers -n tekton-pipelines-resolvers
kubectl wait --for=condition=Available deployment/tekton-events-controller -n tekton-pipelines
kubectl wait --for=condition=Available deployment/tekton-pipelines-webhook -n tekton-pipelines
kubectl apply -f /home/eduk8s/exercises/tekton/tektonui.yaml
kubectl apply -f /home/eduk8s/install/git-clone.yaml
kubectl apply -f /home/eduk8s/exercises/tekton/pipeline.yaml

