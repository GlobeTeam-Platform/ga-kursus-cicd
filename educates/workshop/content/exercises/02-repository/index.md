---
title: "Repository"
---


```execute
cd app
git init
git remote add origin http://$GIT_HOST/myapp.git
git add .
git commit -m "first commit"
git push -u -f origin main
```

```execute
kubectl create -f /home/eduk8s/exercises/pipelinerun.yaml
```