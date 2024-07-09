---
title: "CI - Dagger"
---
![dagger](dagger-logo.png)
For this workshop, we are using [Dagger](https://dagger.io) as our CI tool.

There are many options out there, each with their own pro's and cons.

Dagger works by creating pipelines as code, and running it in containers. 

It's big strength is that you can run and test it local and remote, and get the same results. 

This is usefull in our enviroment, where we have some restrictions, compared to a "real" enviroment.

We will be using it to build a container from our local Git Repository, and then push this container image, to our registry, and update our deployment manifest, in our remote git repository.

This i s bit different, from what you would probably do in your own enviroment, where a git commit, to a remote repository, triggers the pipeline. 

In our case, we don't have anything that can trigger this, so we have to do it manual, to start the pipeline, and build the container.

![flow](flow.png)

Note we have chosen to split up CI and CD, so that Dagger handles CI and ArgoCD handles CD. 

***
**Talk in class about**

- Benefits of splitting CI/CD up
- Benefits of keeping them togher
- Triggers
- Different tools (Dagger, Jenkins, Argo, Tekton, Github Actions, Gitlab etc.)
***