---
title: "CI - Setup"
---
Tekton is already installed on your Kubernetes cluster.

Along with some tasks, and a Pipeline.

To see the tasks installed run
```execute
kubectl get tasks
```
You should see
```
NAME        AGE
git-clone   24m
kaniko      24m
```

Git clone, clones a Git Repository, and Kanikp, build a container image, directly on your Kubernetes cluster.

To see the pipeline run
```execute
kubectl get pipeline
```
It shows
```
NAME               AGE
clone-build-push   26m
```
a single pipeline, with the name clone-build-push

To see the content of the pileline, open it in the editor
```editor:open-file
title: Open pipeline.yaml
file: ~/exercises/tekton/pipeline.yaml
```
The file should look like this

TODO: check if file has changed, when the course is finished.
```
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
  name: clone-build-push
spec:
  description: | 
    This pipeline clones a git repo, builds a Docker image with Kaniko and
    pushes it to a registry
  params:
  - name: repo-url
    type: string
  - name: image-reference
    type: string
  workspaces:
  - name: shared-data
  - name: git-credentials
    description: My git credentials
  - name: docker-credentials
  tasks:
  - name: fetch-source
    taskRef:
      name: git-clone
    workspaces:
    - name: output
      workspace: shared-data
    - name: basic-auth
      workspace: git-credentials
    params:
    - name: url
      value: $(params.repo-url)
  - name: build-push
    runAfter: ["fetch-source"]
    taskRef:
      name: kaniko
    workspaces:
    - name: source
      workspace: shared-data
    - name: dockerconfig
      workspace: docker-credentials
    params:
    - name: IMAGE
      value: $(params.image-reference)
```

TODO: Add text about the pipeline file.


```execute
kubectl create -f /home/eduk8s/exercises/tekton/pipelinerun.yaml
```