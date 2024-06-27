---
title: "CD Setup"
---
Now that we got ArgoCD working, let's setup the CD, so we can start to deploy our app.

The first thing we need to do, is to give ArgoCD access to our git repository.

It can be done usig UI, CLI or yaml. 

We will chose the last one.

Take a look at the argocd-repo.yaml file you have in your exercise folder.

```editor:open-file
title: Open argocd-repo.yaml
file: ~/exercises/argocd-repo.yaml
```
It should look something like this

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-repo
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repository
stringData:
  type: git
  url: http://git-educates-cli-w05-s003.192.168.50.243.nip.io/myapp.git
  password: IXcklS71Ag85ULYDhPFt6zpMwvnqWema
  username: educates-cli-w05-s003
```

All it does, is to tell ArgoCD that if it want's to connect to the url under Stringdata, then it need to use the suplied username and password.

Quite simple

This can also be done, for other types of repositories, where you need SSH keys etc. to access them.

