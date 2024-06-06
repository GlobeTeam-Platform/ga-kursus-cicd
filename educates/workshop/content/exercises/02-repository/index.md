---
title: "Repository"
---
Since the "Source of truth" is a Git repository, then we will start by comitting our code, to a new repository.

We already have some code in the `app`folder. 
To add this to a git repo, run the commands below.

```execute
cd app
git init
git remote add origin http://$GIT_HOST/myapp.git
git add .
git commit -m "first commit"
git push -u -f origin main
cd ..
```

If you want to see the new source location, then just run
```execute
cat app/.git/config
```

The output should be
```
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = http://git-educates-cli-w12-s001.192.168.50.243.nip.io/myapp.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
```

Where the `Remote Origin Url` is the path to your new repository.

Note yours will probably have a different url.


```execute
kubectl create -f /home/eduk8s/exercises/tekton/pipelinerun.yaml
```

