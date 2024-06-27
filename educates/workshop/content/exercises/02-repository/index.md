---
title: "Repository"
---
Since the "Source of truth" is a Git repository, then we will start by comitting our code, to a new repository.

We already have all we need in the `app` folder.

So all we need is to push this to a Git repository, so we can start working on it. 

This is done, by running the commands below.

```terminal:execute
prefix: Run
title: Add folder to Git Repository
command: |
  cd app
  git init
  git remote add origin http://$GIT_HOST/myapp.git
  git add .
  git commit -m "first commit"
  git push -u -f origin main
  cd ..
```

If you want to see the new source location, then just run
```terminal:execute
prefix: Run
title: Get value from app/.git/config
command: |
  cat ~/exercises/app/.git/config
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

Note yours will have a different url.
