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

# Configure gitsecret.yaml 
hostname=$GIT_HOST
username=$GIT_USERNAME
password=$GIT_PASSWORD
sed "s|<hostname>|$hostname|g; s|<user>|$username|g; s|<pass>|$password|g" templates/gitsecret.yaml > exercises/gitsecret.yaml

# Install Tekton and modules
mkdir /home/eduk8s/bin
tar xf /home/eduk8s/binary/tkn_0.37.0_Linux_x86_64.tar.gz -C /home/eduk8s/bin
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
kubectl apply -f /home/eduk8s/exercises/tektonui.yaml
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.6/git-clone.yaml
kubectl apply -f /home/eduk8s/exercises/gitsecret.yaml
kubectl apply -f /home/eduk8s/exercises/pipeline.yaml

# Install Tekton modules
#tkn hub install task git-clone

#tkn hub install task buildah

# Install Dagger
#mkdir $HOME/bin
#curl -L https://dl.dagger.io/dagger/install.sh | BIN_DIR=$HOME/bin sh

# Configure python
#cp /bin/python3 /home/eduk8s/bin/python


# Install pyenv
#curl https://pyenv.run | bash
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#echo export PATH="$PYENV_ROOT/bin:$PATH" >> ~/.bashrc

#exec "$SHELL"